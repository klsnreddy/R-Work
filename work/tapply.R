#tapply.R
# function (X, INDEX, FUN = NULL, ..., simplify = TRUE)
# X - vector
# INDEX - factor or a list of factors (or else they are coerced of factors)
# FUN - function
# simplify - flag to simplification
x <- c(rnorm(10), runif(10), rnorm(10, 1));
f <- gl(3, 10);
tapply(x, f, mean);
tapply(x, f, mean, simplify=FALSE);
tapply(x, f, range);