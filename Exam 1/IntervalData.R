

library(survival)

start_interval <-  seq(0, 13)
end_interval <-  seq(1, 14)
living_at_start <- round(seq(1000, 0, length.out = 14))
dead_in_interval <- c(abs(diff(living_at_start)), 0)
df <- data.frame(start_interval, end_interval, living_at_start, dead_in_interval)

duptimes <- df$dead_in_interval
rid <- rep(1:nrow(df), duptimes)

df.t <- df[rid,]


test <- Surv(time = df.t$start_interval,
     time2 = df.t$end_interval,
     event = rep(1, nrow(df.t)), #Every Observation is a death
     type = "interval")


summary(survfit(test ~ 1))

df$living_at_start/max(df$living_at_start)

length(test)
