
library(survival)
library(dplyr)
library(broom)
size = 10
deathtime <- seq(1, size)
death = rep(1, size)
df <- data.frame(deathtime, death)

surv.obj<- Surv(df$deathtime, df$death)

surv.fit <- survfit(surv.obj ~ 1, robust = TRUE)

df.fit <- tidy(surv.fit)


df.fit %>% 
  mutate(var.hand = estimate^2 * cumsum(n.event/(n.risk * (n.risk - n.event))), # Green Wood
         var.robust = std.error^2) #Robust 

         