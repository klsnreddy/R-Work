##This function is used to find the numbered hospital in the 
## specified category.
rankall <- function(outcome, num = "best") {
  hData <- read.csv("outcome-of-care-measures.csv");
  outcomes <- cbind(c("heart attack", "heart failure", "pneumonia"), as.numeric(c(11,17,23)));
  if(!is.element(outcome, outcomes[,1])) {
    stop("invalid outcome");
  }
  colN <- as.numeric(outcomes[outcomes[,1] == outcome,2]);
  if(num == "best") {
    num = 1;
  }
  
  states = c();
  hospitals = c();
  
  getHospital <- function(ele) {
    rNum = num;
    rows = nrow(ele);
    if(rNum == "worst") {
      rNum = rows;
    }
    if(rNum > rows) {
      NA;
    } else {
      ele <- ele[order(ele[,2],ele[,1]),];
      hospital <- as.vector(ele[rNum,1]);
      hospital;
    }
  }
  
  outData <- function(oData) {
    oData <- as.data.frame(oData);
    dataSet <- oData[, c(2,colN)];
    dataSet[,2] <- suppressWarnings(as.numeric(levels(dataSet[,2]))[dataSet[,2]]);
    dataSet <- dataSet[!is.na(dataSet[,2]),];
    hos = getHospital(dataSet);
    states <<- c(states, as.character(oData[1,7]));
    hospitals <<- c(hospitals, hos);
  }
  
  sData <- split(hData, hData$State);
  lapply(sData, outData);
  result <- data.frame(hospital=hospitals, state=states);
  result;
}

#head(rankall("heart attack", 20), 10);
#rankall("pneumonia", "worst");