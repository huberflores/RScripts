##
# author Huber Flores
#
# estimation of 95% confidence intervals 
##

carat = read.csv("app-stats.csv", sep=";", header=FALSE)

#colnames(carat) 
#[1] "V1" "V2" "V3" "V4" "V5"
carat$ID<-seq.int(nrow(carat))

#head(carat, 5)
#tail(carat, 5)


colnames(carat) <- c("key","ev","err","samples","users", "index")

#colnames(carat)
#community <- mean(carat$ev, na.rm=TRUE)

ci <- function(v){
  
  a <- mean(carat$ev[1:carat$index[v]], na.rm=TRUE)
  s <- sd(carat$ev[1:carat$index[v]], na.rm=TRUE)
  n <- length(carat$ev[1:carat$index[v]])
  samples <- sum(carat$samples[1:carat$index[v]], na.rm = TRUE)
  error <- qt(0.975, df=n-1)*s/sqrt(n)
  left <- a-error
  right <- a+error
  result <- paste(a, s, samples, error, left, right, sep=",")
  
}


A = matrix(lapply(carat$index, ci), ncol=1)

write.table(A, "confidence-intervals.csv")






