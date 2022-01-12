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

## Part 2 
## Moving out of California 
## Data from IGS Poll 2019-08 https://escholarship.org/uc/item/96j2704t
cal_housing <- tibble(
  leaving = c("Serious",
               "Some", 
               "Within Cal",
               "None"),
  `18-29` = c(23,29,20,28),
  `30-39` = c(25, 34, 8, 23),
  `40-49` = c(28,33,8,31),
  `50-64` = c(26, 27, 8, 39),
  `65+` = c(17,23, 8, 52)
)

#write.csv(cal_housing, file = "data/cal_housing.csv", row.names = F)

cal_region <- tibble(
  leaving = c("Serious",
              "Some", 
              "Within Cal",
              "None"),
  la = c(23,26,12,38),
  sd_orange = c(23,27,7, 43),
  other_sc = c(25,31,10, 34),
  central_valley = c(27,29, 10, 34),
  sf_bay = c(20,30, 10, 40),
  other_nc = c(26,22,13,39)
)

# write.csv(cal_region, file = "data/cal_region.csv", row.names = F)

birds <- tibble(
  county = c("Alameda", "Contra Cost", "Marin", "SF"),
  year = c(rep(2020,4)),
  eagleNest = c(0,0,1,0),
  eagleAir = c(2,5,3,4),
  warblerNest = c(4,2,7,3),
  warblerAir = c(30, 27, 45, 20)
)

# write.csv(birds, file = "data/birds.csv", row.names = F)


testing <- tibble(
  patient_id = c(rep("X12",14)),
  year = c(rep(2021, 14)),
  week = c(1,1,2,2,3,3,4,4,5,5,6,6,7,7),
  test = c("pcr", "rapid","pcr", "rapid","pcr", "rapid","pcr", "rapid",
           "pcr", "rapid","pcr", "rapid","pcr", "rapid"),
  d1 = c(rep(0,14)),
  d2 = c(rep(0, 10), 1, 0,0,0),
  d3 = c(rep(0,10),1, 0, 0, 0),
  d4 = c(rep(0,10),1,0,0,0),
  d5 = c(rep(0,14)),
  d6 = c(rep(0,12), 1,1),
  d7 = c(rep(0,12),1,1)
)

#write.csv(testing, file = "data/testing.csv", row.names = F)


## Underscore data 
underscore <- tibble(
  id = c("A", "B", "C"),
  val1_year = c(2020,2020,2020),
  val1_result = c(1,1,0),
  val2_year = c(2021, 2021, 2021),
  val2_result = c(1,1,1)
)

write.csv(underscore, file = "data/underscore.csv", row.names = F)
