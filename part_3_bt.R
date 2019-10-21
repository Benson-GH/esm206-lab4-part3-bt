###########
# Benson Truong
###########

library(tidyverse)
library(janitor)
library(here)

# Read in data:
db <- read_csv(here("data", "disease_burden.csv")) %>% 
  clean_names() %>% 
  rename(deaths_per_100K = death_rate_per_100_000)

# Create a subset, then graph:
db_sub <- db %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia"),
         age_group == "0-6 days",
         sex == "Both")
  
# Create a basic line graph:
ggplot(data = db_sub, aes(x = year, y = deaths_per_100K))+
  geom_line(aes(color = country_name))
