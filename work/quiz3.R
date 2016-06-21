cc <- iris[,5] == 'virginica'
mean(iris[cc, 1])

data(mtcars)
mtcars
split(mtcars, mtcars$cyl)
lapply(mtcars, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
apply(mtcars, 2, mean)

v <- sapply(split(mtcars$hp, mtcars$cyl), mean)
v
v["4"] - v["8"]

debug(ls)
ls

tapply(mtcars$mpg, mtcars$cyl, mean)
