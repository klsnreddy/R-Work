pollutantmean <- function(directory, pollutant, id = 1:332) {
  fileNames <- list.files(path = directory, full.names=T);
  v <- vector("numeric");
  for (i in fileNames) { 
      initial <- read.csv(i, nrows = 2);
      if(is.element(initial[[2,4, exact=T]], id)) {
        #print(i);
        d <- as.matrix(read.csv(i));
        #print(class(d));
        iv <- as.numeric(d[,pollutant]);
        iv <- iv[!is.na(iv)];
        v <- c(v, iv);
      }
    }
  round(mean(v), digits = 3);
}

#pollutantmean("specdata", "sulfate", 1:10)
#[1] 4.064128

#pollutantmean("specdata", "nitrate", 70:72);
#[1] 1.706047

#pollutantmean("specdata", "nitrate", 23);
#[1] 1.280833