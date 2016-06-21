x <- list(a=1:5, b=rnorm(10));
lapply(x, mean);

x <- list(a=1:5, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5));
lapply(x, mean);
sapply(x, mean);

x <- 1:4;
lapply(x, runif, min=0, max=10);

x <- list(a=matrix(1:4, 2, 2), b = matrix(1:6, 3, 2));
x;
lapply(x, function(etl) { etl[,1] });
