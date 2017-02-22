##
# author Huber Flores
#
# simple CPU count
##

carat = read.csv("high-cpu-app-counts-rep.csv", sep=";")

colnames(carat) <- c("CPU","app","id")

#colnames(carat)
#[1] "CPU" "app" "id" 

#summary(carat)
#  CPU                          app                id         
# 100.0  : 179487                     : 172613   1      :1332895  
# 99.0   : 117311   1                 :  33076   2      : 475845  
# 97.0   : 113521   com.opera.browser :    986   4      : 184019  
# 96.0   : 112167   com.android.chrome:    984          : 174937  
# 95.0   : 110492   com.chrome.beta   :    984   5      : 136877  
# (Other):3582489   (Other)           :4122243   (Other):1754353  

#class(carat$CPU)

apps <- subset(carat, (CPU == "60.0") | (CPU == "61.0"))

#summary(apps)

write.csv(apps, "cpu-load.csv")

