data <- c(16.5, 12.8, 14.4, 15.0, 18.2, 17.5, 16.0, 15.5)
se <- sd(data)/sqrt(length(data))
se
std_mean <- function(data) sd(data)/sqrt(length(data))
std_mean(data)