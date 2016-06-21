##This function is used to find the numbered hospital in the 
## specified category in that state.
rankhospital <- function(state, outcome, num = "best") {
  hData <- read.csv("outcome-of-care-measures.csv");
  states <- as.vector(unique(hData$State));
  if(!is.element(state, states)) {
    stop("invalid state");
  }
  outcomes <- cbind(c("heart attack", "heart failure", "pneumonia"), as.numeric(c(11,17,23)));
  if(!is.element(outcome, outcomes[,1])) {
    stop("invalid outcome");
  }
  colN <- as.numeric(outcomes[outcomes[,1] == outcome,2]);
  
  dataSet <- hData[hData$State == state, c(2,colN)];
  dataSet[,2] <- suppressWarnings(as.numeric(levels(dataSet[,2]))[dataSet[,2]]);
  dataSet <- dataSet[!is.na(dataSet[,2]),];
  dataSet;
  rows = nrow(dataSet);
  if(!is.numeric(num)) {
    if(num == "worst") {
      num = rows;
    } else {
      num = 1;
    }
  }
  
  if(num > rows) {
    NA;
  } else {
    dataSet <- dataSet[order(dataSet[,2],dataSet[,1]),];
    hospital <- as.vector(dataSet[num,1]);
    hospital;
  }
}

#rankhospital("TX", "heart attack");
#rankhospital("TX", "heart attack", 197);
#rankhospital("TX", "heart attack", "worst");
#rankhospital("TX", "heart failure", 4);
#rankhospital("MD", "heart attack", "worst");
#rankhospital("MN", "heart attack", 5000);