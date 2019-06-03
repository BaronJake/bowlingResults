require("zoo")

read.bowling <- function(){
  #Read Score Data
  scores <- read.csv(file.choose())
  #Remove the last few lines of N/A data
  scores <- scores[1:30,]
  #Transform the first column to dates
  scores[,1] <- as.Date(scores[,1], format = "%m/%d/%Y")
  scores
}

plot.games <- function(scores){
  for(i in 2:5){
    if(i < 5){
      plot(scores[,1], scores[,i], main=paste("Game ",i-1," Over Time", sep = ""))
      lines(scores[5:nrow(scores),1],rollapply(scores[,i],5,mean), col = "red")
    }else{
      plot(scores[,1], scores[,i], main="Series Over Time")
      lines(scores[5:lnrow(scores),1],rollapply(scores[,i],5,mean), col = "red")
    }
  }
}

scores.1 <- read.bowling()
scores.2 <- read.bowling()
scores.3 <- read.bowling()

scores.2 <- scores.2[2:30,]

#get descriptive statistics about the games/series
aves.1 = lapply(scores.1[,2:5],mean)
aves.2 = lapply(scores.2[,2:5],mean)
aves.3 = lapply(scores.3[,2:5],mean)
sds.1 = lapply(scores.1[,2:5],sd)
sds.2 = lapply(scores.2[,2:5],sd)
sds.3 = lapply(scores.3[,2:5],sd)

#scatter plots and rolling averages of games and series
#could put in a for loop
par(mfrow=c(3,4))

plot.games(scores.1)
plot.games(scores.2)
plot.games(scores.3)

#creat hisograms and boxplots of games/series
lapply(scores.1[,2:5],hist)
lapply(scores.2[,2:5],hist)
lapply(scores.3[,2:5],hist)

lapply(scores.1[,2:5],boxplot)
lapply(scores.2[,2:5],boxplot)
lapply(scores.3[,2:5],boxplot)

#check for normality
norm.test.1 <- lapply(scores.1[,2:5],function (x) shapiro.test(x)$p.value)
norm.test.2 <- lapply(scores.2[,2:5],function (x) shapiro.test(x)$p.value)
norm.test.3 <- lapply(scores.3[,2:5],function (x) shapiro.test(x)$p.value)

#test whether games for bowler 1 have different distibutions
#probablhy could have put into for loop or defined a function
#but it was easy enough to copy and paste
#may cause trouble if updating variable names
pval12.1 <- wilcox.test(scores.1[,2],scores.1[,3], exact = F)$p.value
pval13.1 <- wilcox.test(scores.1[,2],scores.1[,4], exact = F)$p.value
pval23.1 <- wilcox.test(scores.1[,3],scores.1[,4], exact = F)$p.value

#test whether games bowler 2 have different distributions
pval12.2 <- wilcox.test(scores.2[,2],scores.2[,3], exact = F)$p.value
pval13.2 <- wilcox.test(scores.2[,2],scores.2[,4], exact = F)$p.value
pval23.2 <- wilcox.test(scores.2[,3],scores.2[,4], exact = F)$p.value

#test whether games for bowler 3 have different distributions
pval12.3 <- wilcox.test(scores.3[,2],scores.3[,3], exact = F)$p.value
pval13.3 <- wilcox.test(scores.3[,2],scores.3[,4], exact = F)$p.value
pval23.3 <- wilcox.test(scores.3[,3],scores.3[,4], exact = F)$p.value

#test whether bowler #1's games and bowler #2's games are from a different distribution
pval1.1.2 <- wilcox.test(scores.1$Game.1, scores.2$Game.1, exact = F)$p.value
pval2.1.2 <- wilcox.test(scores.1$Game.2, scores.2$Game.2, exact = F)$p.value
pval3.1.2 <- wilcox.test(scores.1$Game.3, scores.2$Game.3, exact = F)$p.value
pvalS.1.2 <- wilcox.test(scores.1$Series, scores.2$Series, exact = F)$p.value

#test whether bowler #1's games and bowler #3's games are from a different distribution
pval1.1.3 <- wilcox.test(scores.1$Game.1, scores.3$Game.1, exact = F)$p.value
pval2.1.3 <- wilcox.test(scores.1$Game.2, scores.3$Game.2, exact = F)$p.value
pval3.1.3 <- wilcox.test(scores.1$Game.3, scores.3$Game.3, exact = F)$p.value
pvalS.1.3 <- wilcox.test(scores.1$Series, scores.3$Series, exact = F)$p.value

#test whether bowler #2's games and bowler #3's games are from a different distribution
pval1.2.3 <- wilcox.test(scores.2$Game.1, scores.3$Game.1, exact = F)$p.value
pval2.2.3 <- wilcox.test(scores.2$Game.2, scores.3$Game.2, exact = F)$p.value
pval3.2.3 <- wilcox.test(scores.2$Game.3, scores.3$Game.3, exact = F)$p.value
pvalS.2.3 <- wilcox.test(scores.2$Series, scores.3$Series, exact = F)$p.value
