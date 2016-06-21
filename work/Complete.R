complete <- function(directory, id = 1:332) {
  fileNames <- list.files(path = directory, full.names=T);
  v <- vector();
  fileNames <- paste("specdata", formatC(id, width=3, flag="0"), sep="/");

  for (i in seq_along(id)) { 
    #initial <- read.csv(paste(i, "csv", sep="."), nrows = 2);
    #if(is.element(initial[[2,4, exact=T]], id)) {
      #print(i);
      d <- as.matrix(read.csv(paste(fileNames[i], "csv", sep=".")));
      cc <- complete.cases(d);
      l <- length(cc[cc == TRUE]);
      #v <- c(v, c(initial[[2,4, exact=T]], length(cc[cc == TRUE])));
      v <- c(v, c(id[i], length(cc[cc == TRUE])));
      
    #}
  }
  m <- matrix(v, ncol=2, byrow=T);
  colnames(m) <- c("id", "nobs");
  rownames(m) <- rownames(m, do.NULL = FALSE, prefix="");
  data.frame(m);
}

#h <- complete("specdata", 1);
#h$nobs;
#  id nobs
#1  1  117

#complete("specdata", c(2, 4, 8, 10, 12));
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96

#complete("specdata", 30:25);
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463

#complete("specdata", 3);
##   id nobs
## 1  3  243