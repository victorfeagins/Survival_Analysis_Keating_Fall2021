library(survival)
library(dplyr)


size = 1000

dec.fail <- rweibull(size, shape = .5) %>% #Shape less then 1 means decreasing failure rate
  sort()

cons.fail <- rweibull(size, shape = 1) %>% #Constant Failure rate
  sort()

inc.fail <- rweibull(size,shape = 2) %>%  #Shape greater then 1 means increasing failure rate
  sort()


survfit(Surv(dec.fail)~1) %>% 
  plot(cumhaz = TRUE)

survfit(Surv(cons.fail)~1) %>% 
  plot(cumhaz = TRUE)

survfit(Surv(inc.fail)~1) %>% 
  plot(cumhaz = TRUE)

#Yep it works