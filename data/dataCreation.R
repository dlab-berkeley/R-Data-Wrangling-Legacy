# Fake Data Set Creation 
library(wakefield)

## Jobs Example 
occupations <- c(rep(times = 1000,"Farmer"), rep(times = 1000,"Marketer"), rep(times = 1000,"Data Scientist"), rep(times = 1000,"Construction"), rep(times = 1000,"Unemployed"), rep(times = 1000,"Teacher"), rep(times = 1000,"Doctor"), rep(times = 1000,"Lawyer"))

## Get a random sample of occupations 
set.seed(1218)
occupation <- sample(occupations, 1000, replace = F)
jobs <- r_data_frame(n = 1000, age, state, income, education, employment, marital, smokes, political, name)%>% 
  mutate(Occupation = occupation,
         across(where(is.factor), as.character))
