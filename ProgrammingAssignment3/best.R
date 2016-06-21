##This function is used to find the best hospital in the 
## specified category in that state.
best <- function(state, outcome) {
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
  
  dataSet <- dataSet[order(dataSet[,2],dataSet[,1]),];
  hospital <- as.vector(dataSet[1,1]);
  hospital;
}

#best("TX", "heart attack");
#best("TX", "heart failure");
#best("MD", "heart attack");
#best("MD", "pneumonia");
#best("BB", "heart attack");
#best("NY", "hert attack");