#split.R
# function (x, f, drop = FALSE, ...)
# x - vector, list or data frame.
# f - factor or list of factors.
# drop - flag to drop the empty factors.
x <- c(rnorm(10), runif(10), rnorm(10, 1));
f <- gl(3, 10);
split(x, f);