data1 <- rep(1,26000)
data2 <- rep(2,66300)
data3 <- rep(3,7700)
data <- append(append(data1,data2),data3)
shuffle <- sample(data,length(data))
data300 <- sample(shuffle, 300, replace = T)
hist(data300)
#plot(density(data300))

data_average_data3 <- NULL
for (i in 1:300){
  average_data3 <- mean(sample(shuffle, 3, replace = T))
  data_average_data3[i] <- average_data3
}
hist(data_average_data3)
#plot(density(data_average_data3))
mean(data_average_data3)
