data300<-floor(runif(300,1,7))
hist(data300,breaks=c(0,1,2,3,4,5,6),probability=T,col="gray")

data_average_data3 <- NULL
for(i in 1:300){
  data_average_data3[i] <- mean(floor(runif(3,1,7)))
}
hist(data_average_data3,breaks=c(0,1,2,3,4,5,6),probability=T,col="gray")
