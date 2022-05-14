library(survival)

set.seed(123)
size <-  1000
deathtime <- rweibull(size, shape = 1, scale = 5)


survreg(Surv(deathtime) ~ 1, dist = "weibull")


