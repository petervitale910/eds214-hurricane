pacman::p_load("tidyverse","janitor","here", "zoo", "slider", "forecast")

q1dat <- read_csv(here::here("data","QuebradaCuenca1-Bisley.csv")) %>% 
  clean_names() %>% 
  select(c("sample_id", "sample_date", "k","nh4_n","no3_n","mg","ca")) %>%
  na.omit()

q2dat <- read_csv(here::here("data","QuebradaCuenca2-Bisley.csv")) %>% 
  clean_names() %>% 
  select(c("sample_id", "sample_date", "k","nh4_n","no3_n","mg","ca")) %>%
  na.omit()

q3dat <- read_csv(here::here("data","QuebradaCuenca3-Bisley.csv")) %>% 
  clean_names() %>% 
  select(c("sample_id", "sample_date", "k","nh4_n","no3_n","mg","ca")) %>%
  na.omit()

mprdat <- read_csv(here::here("data","RioMameyesPuenteRoto.csv")) %>% 
  clean_names() %>% 
  select(c("sample_id", "sample_date", "k","nh4_n","no3_n","mg","ca")) %>%
  na.omit()


allsitedf <- rbind(mprdat, q1dat, q2dat, q3dat)

subset_allsite <- allsitedf %>% 
  group_by(sample_date) %>% 
  ungroup()

average_subset_allsite <- subset_allsite %>%
  #arrange(sample_date) %>% 
  slice_head(n=27) %>% 
  #group_by(sample_date) %>% 
  mutate(no3_n_ave = rollmean(no3_n, k=9, fill = NA)) 


average_allsite <- allsitedf %>% 
  rename("potassium" = k) %>% 
  mutate(no3_n_mean = rollmean(no3_n, k=9, fill = NA),
         potassium_mean = rollmean(potassium, k=9, fill = NA),
         nh4_mean = rollmean(nh4_n, k=9, fill = NA),
         mg_mean = rollmean(mg, k=9, fill = NA),
         ca_mean = rollmean(ca, k=9, fill = NA)
  )
  