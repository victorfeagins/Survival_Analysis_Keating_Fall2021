#Probability PLot
library(ggplot2)
library(survival)
set.seed(123)
size = 100
df <- data.frame(deathtime = rweibull(size, shape = 1, scale = 2))
wei.fit <- survreg(Surv(df$deathtime) ~ 1, dist = "weibull")


shape.est <- 1/exp(wei.fit$icoef[2])
scale.est <- exp(wei.fit$icoef[1]) #The intercept

n <- nrow(df)
p <- (1 : n) / n - 0.5 / n

ggplot(df) + 
  geom_point(aes(x = p, y = sort(pweibull(deathtime, shape.est, scale.est))))+
  geom_abline(intercept = 0, slope = 1, color = "red")


m = mean(df$deathtime)
sd = sd(df$deathtime)

ggplot(df) + 
  geom_point(aes(x = p, y = sort(pnorm(deathtime, m, sd)))) +
  geom_abline(intercept = 0, slope = 1, color = "red")
  

             