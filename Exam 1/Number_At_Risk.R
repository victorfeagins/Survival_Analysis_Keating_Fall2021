set.seed(123)
library(survival)

# Continuous Time ----
size = 10

deathtime <- seq(1, size)
death = rep(1, size)
df <- data.frame(deathtime, death)

surv.obj<- Surv(df$deathtime, df$death)

summary(survfit(surv.obj ~ 1))

# Interval Time ----
start <- seq(0, size - 1)
end <- seq(1,size)
death <- rep(1, size)

df.i <- data.frame(start, end, death)

surv.obj.i <- Surv(time = df.i$start,
                   time2 = df.i$end,
                   event = df.i$death,
                   type = "interval")

summary(survfit(surv.obj.i ~ 1))
