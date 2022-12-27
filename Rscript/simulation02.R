# forの使い方
# 1を10回足し、最後に平均する。
# for(){
#   ここに記載された内容を繰り返し実施する。
# }

M <- 10
sum <- 0
for(i in 1:M){
  sum <- sum + 1
}
average <- sum/M
print(average)

