library(survival)
library(survminer)
set.seed(123)
size <-  30
treatment <- c(rep(1, size),
               rep(2, size),
               rep(3, size))
deathtime <- c(rexp(size, rate = 1),
               rexp(size, rate = 2),
               rexp(size, rate = 3))
censor <- c(rbinom(size, 1, .1),
            rbinom(size, 1, .1),
            rbinom(size, 1, .1))


df <- data.frame(treatment = as.factor(treatment), deathtime, censor= abs(df$censor -1))


surv.obj<- Surv(df$deathtime, df$censor)

survdiff(surv.obj ~ treatment, data = df)

pairwise_survdiff(Surv(deathtime, abs(censor -1)) ~ treatment, data = df) # doesn't like the predefined surv.obj
