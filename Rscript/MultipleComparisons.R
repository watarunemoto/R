# 多重比較
# 参考
# https://qiita.com/yasainiki/items/b91366f7ee2824dd5828

# 対応の無いデータ
# 以下に示したのは、a1, a2, a3, a4の4群間の比較を行う場合です。
# 必要に応じて以下のデータa1, a2, a3, a4の要素を書き換えてください。
# 5群以上に増やすことも可能です。
a1<- c(63,58,64,58,77,66,52,64,49,66)
a2<- c(64,64,68,61,56,71,64,65,85,75)
a3<- c(59,87,79,71,65,65,65,71,74,58)
a4<- c(83,79,65,67,80,72,80,75,72,84)
bunsan1<- data.frame(A=factor(c(rep("a1",10),rep("a2",10),rep("a3",10),rep("a4",10))),X=c(a1,a2,a3,a4)) # 5群以上に増やす場合、この行の修正が少しわかりにくいかもしれません。別途、相談してください。
bunsan1 # 格納されているデータ構造を視認で確認するための一行

# データフレーム bunsan1 に格納されているa1, a2, a3, a4群ごとの箱ヒゲ図を描画する。
boxplot(X~A,data=bunsan1,col="lightblue")

# 総当たり補正無し
# 第一引数には値のデータを入れる
# 第二引数にはラベル（処理、群の名称）のデータを入れる
# 第三引数には、補正の方法を指定する
# 補正なしの場合を見たいので "none" を指定する
# noneを指定しないとHolm法というFamilywise error rate の補正方法が適用されるため要注意です
pairwise.t.test(bunsan1$X, bunsan1$A, p.adj = "none")
# 5%有意水準では、a1-a3, a1-a4, a2-a4の間でp < 0.05となる


# Tukey-Kramer法の場合
# 第一引数には値のデータを入れる
# 第二引数にはラベル（処理、群の名称）のデータを入れる
tukey_res <- TukeyHSD(aov(bunsan1$X ~ bunsan1$A))

# Bonferroni法
pairwise.t.test(data$yield, data$treatment, p.adj = "bonf")

# Benjamini and Hochberg法 (BH法)
pairwise.t.test(data$yield, data$treatment, p.adj = "BH")

# Bonferroni > Tukey-Kramer > BH の順となる。
# Tukey-Kramer法やBH法の検出力が高くなる。
# 例えばBonferroniでは有意差がなかった比較について、BH法では有意な結果になることがある。
# 一般に、Bonferroni法は有意になりにくいのであまり使われない。




# Tukey-Kramerの描画
#install.packages("multcomp")
library(multcomp)
res <- lm(X ~ A, data=bunsan1)
tukey_res <- glht(res, linfct=mcp(A="Tukey"))
summary(tukey_res)

mltv = cld(tukey_res, decreasing=F)
annos = mltv[["mcletters"]][["Letters"]]

g_data <- bunsan1 %>% 
  group_by(A) %>% 
  dplyr::summarise(average = mean(X), sd = sd(X))
# 以下2行が正常動作していない
g <- ggplot(g_data, aes(x = A, y = average, fill = A))+
  geom_bar(width = 0.5, stat = "identity", color = "black", show.legend = FALSE)+
  geom_errorbar(aes(ymax = average + sd, ymin = average - sd), width=0.1)+
  stat_summary(geom = 'text', label =annos,  vjust = -5)+
  scale_y_continuous(expand = c(0,0),limits = c(0,35))+
  labs(x = "横軸ラベル", y = "縦軸ラベル")+
  scale_fill_manual(values = rep("#999999", 5))+
  theme_classic()+
  theme(text = element_text(size=16))  
g
