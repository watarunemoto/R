# 2021.11.23 
# 豊島岡女子キャップ投げ
M <- 300 # the number of samples
N <- 10  # sample size

data1 <- rep(1,26000) # 表
data2 <- rep(2,7700)  # 立
data3 <- rep(3,66300) # 裏

data <- append(append(data1,data2),data3)
shuffle <- sample(data,length(data))
data300 <- sample(shuffle, M, replace = T)
hist(data300, xlim = c(1,3), ylim = c(0,250), main = "", xlab = "", ylab = "", col="#FF00007F", breaks = seq(1,3,0.25))
#plot(density(data300))

par(new=T)

data_average_data3 <- NULL
for (i in 1:M){
  average_data3 <- mean(sample(shuffle, N, replace = T))
  data_average_data3[i] <- average_data3
}
hist(data_average_data3, xlim = c(1,3), ylim = c(0,250), main = "", xlab = "", ylab = "", col="#0000FF7F", breaks = seq(1,3,0.25))
#plot(density(data_average_data3))
mean(data_average_data3)
