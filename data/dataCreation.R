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


### Animal Rescues in London 
### Raw data found at https://data.london.gov.uk/dataset/animal-rescue-incidents-attended-by-lfb
### Licensed by UK Open Government License 
lfd_raw <- read_csv(here("data/raw_data/lfd_raw.csv"))

animals <- lfd_raw %>%
  select(IncidentNumber, Year = CalYear, Ward, Borough, 
         PumpCount, PumpHoursTotal, Type = AnimalGroupParent, 
         PropertyCategory, RescueType = SpecialServiceTypeCategory,
         RescueCost = `IncidentNotionalCost(£)`)%>%
  mutate(Type = case_when(
    str_detect(Type, "Unknown")~"Unknown",
    str_detect(Type, "Budgie|Pigeon")~"Bird",
    str_detect(Type, "cat")~"Cat",
    str_detect(Type, "Bull")~"Cow",
    TRUE~Type),
    Borough = str_to_title(Borough),
    Ward = str_to_title(Ward),
    RescueCost = if_else(RescueCost == "NULL", NA_character_, RescueCost),
    RescueCost = as.numeric(RescueCost))%>%
  filter(!is.na(Borough))

#write.csv(animals, file = "data/animalRescue.csv", row.names = F)
