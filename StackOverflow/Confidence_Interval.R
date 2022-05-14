set.seed(123)
library(survival)
size <-  100

deathtime <- rexp(size, rate = 1)
censor <- abs(rbinom(size, 1, .1) -1)



df <- data.frame(deathtime, censor)
#write.csv(df, "TestData.csv") #For uses in SAS

surv.obj <- Surv(df$deathtime, df$censor)

survfit(surv.obj ~ 1, conf.type = "log-log") #log log is what SAS uses

