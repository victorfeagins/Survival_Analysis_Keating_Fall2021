#Plotting 

library(survival)

set.seed(123)
size <-  1000
deathtime <- rexp(size, rate = 1)


exp.fit <- survreg(Surv(deathtime) ~ 1, dist = "exponential")
exp(exp.fit$icoef)


set.seed(123)
size <-  1000
deathtime <- rweibull(size, shape = 3, scale = 2)


wei.fit <- survreg(Surv(deathtime) ~ 1, dist = "weibull")
wei.fit$icoef

exp(wei.fit$icoef[1]) # weibull scale, beta
1/exp(wei.fit$icoef[2]) #weibull shape, alpha



loglog.fit <- survreg(Surv(deathtime) ~ 1, dist = "loglogistic")
