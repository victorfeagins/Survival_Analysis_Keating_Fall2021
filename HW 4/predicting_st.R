# Predicting Survival regression on time
library(survival)
library(ggplot2)

## Simulated Data ----
set.seed(123)
size <-  100
deathtime <- rexp(size, rate = 1)

df <- data.frame(deathtime)


## Fitting Survival curve
surv.1 <- Surv(df$deathtime)

exp.fit<- survreg(surv.1 ~ 1, dist = "exponential")


#Predicting Values
prob = 1:98/100
time = seq(0, max(deathtime), by = .01)

# Using the Predict Function spits out survival times
survivaltimes.predict <- predict(exp.fit, type = "quantile", p = prob) #Survival times for all observations given probability

#They are all the same survival times since we don't have any covariates so we just need the first row
survivaltimes.predict.df <- data.frame(x = survivaltimes.predict[1,], y = 1 - prob, type = "predict.given.prob")

gg <- ggplot(survivaltimes.predict.df, mapping = aes(x, y, col = type))+
  geom_line() +
  labs(
    x = "Time",
    y = "S(t)"
  )
gg
# Predicting Values given time: done by hand

haz <- exp(exp.fit$coefficients)

survival = exp(- haz * time) #Using time

survivaltimes.predict.hand.df <- data.frame(y = survival, x = time, type = "by_hand")


gg +
  geom_line(survivaltimes.predict.hand.df, mapping = aes(x, y, col = type))












