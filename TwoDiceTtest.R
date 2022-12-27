data_dice <- floor(runif(10000,1,7))
hist(data_dice,breaks=c(0,1,2,3,4,5,6),probability=T,col="gray") # dice probability
mean(data_dice)
# http://takenaka-akio.org/doc/r_auto/series.html
dataX <- c(1,2,3,4,5,6)
dataX100 <- rep(dataX,100)
hist(dataX100,breaks=c(0,1,2,3,4,5,6),probability=T,col="gray") # dice probability
mean(dataX100)
var(dataX100)

dataY <- c(1,2,3,4,5)
dataY100 <- rep(dataY,100)
hist(dataY100,breaks=c(0,1,2,3,4,5,6),probability=T,col="gray") # dice probability
mean(dataY100)
var(dataY100)

t.test(dataX100,dataY100)