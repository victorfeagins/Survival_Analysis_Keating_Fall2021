library(dplyr)

df <- data.frame(Numbers = seq(1,10))

df %>% 
  mutate(Numbers.Noise = Numbers + runif(1, 0, 1)) %>% 
  mutate(Noise.Amount =  Numbers.Noise - Numbers)


df %>% 
  mutate(Numbers.Noise = Numbers + runif(length(Numbers), 0, 1)) %>% 
  mutate(Noise.Amount =  Numbers.Noise - Numbers)
