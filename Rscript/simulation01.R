# サイコロをM回振る ver1
# 参考資料 https://www1.doshisha.ac.jp/~mjin/R/Chap_10/10.html
# 
M <- 10
data <- runif(M,1,7) # 最小値1, 最大値7未満の乱数をM個発生させdataに格納する。
data # dataに格納された値を出力してみる。
floor(data) # 発生させた乱数の小数点以下を切り捨てる。

# サイコロをM回振る ver2
M <- 10
floor(runif(M,1,7))

# サイコロをM回振り、ヒストグラムを描く(区間幅設定はお任せ)
M <- 10
hist(floor(runif(M,1,7)))

# サイコロをM回振り、ヒストグラムを描く(区間幅を1, X軸範囲を0から6とする, Y軸範囲を0から5とする)
M <- 10
hist(floor(runif(M,1,7)),breaks=c(0,1,2,3,4,5,6),xlim = c(0,6))

