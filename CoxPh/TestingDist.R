library(MASS)
library(survival)
library(dplyr)
set.seed(123)
#Simulated Data ----
size <-  1000
rate = 1

deathtime <- rexp(size, rate = rate) #Random Exponential Time
death <- abs(rbinom(size, 1, .1) -1)  #Random Censoring

df <- data.frame(time = deathtime, death = death)

df <- df %>% 
  mutate(time = ifelse(death == 0, max(time), time)) #Censored observations survived till study ended

## Comparing Distributions Fit ----
MASS.cen.est <- fitdistr(df$time, "exponential")

MASS.nocen.est <- fitdistr(filter(df, death == 1)$time, "exponential")


exp.fit <- survreg(Surv(df$time, df$death) ~ 1, dist = "exponential")
survreg.estimate <- exp(exp.fit$icoef)

list(TrueRate = rate, MASS.censor = MASS.cen.est, MASS.nocensor = MASS.nocen.est, survreg.estimate = survreg.estimate)



test <- survreg(Surv(deathtime) ~1, dist = "exponential")
exp(test$icoef)
