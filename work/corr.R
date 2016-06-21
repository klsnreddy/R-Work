corr <- function(directory, threshold = 0) {
  options("digits"=4);
  fileNames <- list.files(path = directory, full.names=T);
  s <- vector("numeric");
  n <- vector("numeric");
  for (i in fileNames) { 
    initial <- read.csv(i, nrows = 2);
    d <- as.matrix(read.csv(i));
    cc <- complete.cases(d);
    
    if(length(cc[cc == TRUE]) > threshold) {
      d <- d[cc,];
      s <- c(s, cor(as.numeric(d[,"sulfate"]), as.numeric(d[,"nitrate"]), use = "all.obs"));
    }
    
  }
  #print(head(s));
  #head(n);
  
  s;
}

#cr <- corr("specdata", 5000)
#print(summary(cr));
#print(head(cr));
#print(length(cr));