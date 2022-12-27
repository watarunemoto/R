N <- 10000000
x <- rnorm(N, mean=50, sd = 10)
y <- rnorm(N, mean=50, sd = 10)
mean(x)
sqrt(var(x) * (N - 1) / N)
mean(y)
sqrt(var(y) * (N - 1) / N)
z = x + y
mean(z)
sqrt(var(z) * (2 * N - 1) / (2 * N))