# forの使い方
# 1から10まで足す。
# for(){
#   ここに記載された内容を繰り返し実施する。
# }

M <- 10
data <- 1:M
sum <- 0
for(i in 1:M){
  sum <- sum + data[i]
}
print(sum)

