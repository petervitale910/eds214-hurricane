pacman::p_load("tidyverse","janitor","here", "zoo", "patchwork", "ggthemes")

q1dat <- read_csv(here::here("data","QuebradaCuenca1-Bisley.csv")) %>% 
  clean_names() %>% 
  select(c("sample_id", "sample_date", "k","nh4_n","no3_n","mg","ca")) 

q2dat <- read_csv(here::here("data","QuebradaCuenca2-Bisley.csv")) %>% 
  clean_names() %>% 
  select(c("sample_id", "sample_date", "k","nh4_n","no3_n","mg","ca")) 

q3dat <- read_csv(here::here("data","QuebradaCuenca3-Bisley.csv")) %>% 
  clean_names() %>% 
  select(c("sample_id", "sample_date", "k","nh4_n","no3_n","mg","ca")) 

mprdat <- read_csv(here::here("data","RioMameyesPuenteRoto.csv")) %>% 
  clean_names() %>% 
  select(c("sample_id", "sample_date", "k","nh4_n","no3_n","mg","ca")) 


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
  arrange(sample_date) %>% 
  rename("potassium" = k) %>% 
  mutate(no3_n_mean = rollmean(no3_n, k=9, fill = NA),
         potassium_mean = rollmean(potassium, k=9, fill = NA),
         nh4_mean = rollmean(nh4_n, k=9, fill = NA),
         mg_mean = rollmean(mg, k=9, fill = NA),
         ca_mean = rollmean(ca, k=9, fill = NA)
  ) %>% 
  filter(year(sample_date) <= 1994) %>% 
  select(-c(potassium, nh4_n, no3_n, mg, ca))

k <- ggplot(average_allsite, aes(x = sample_date, 
                                 y = potassium_mean))+
              geom_line(aes(color = sample_id))+
  theme_few()

no3 <- ggplot(average_allsite, aes(x = sample_date, 
                                 y = no3_n_mean))+
  geom_line(aes(color = sample_id))+
  theme_few()

nh4 <- ggplot(average_allsite, aes(x = sample_date, 
                                   y = nh4_mean))+
  geom_line(aes(color = sample_id))+
  theme_few()

mg <-  ggplot(average_allsite, aes(x = sample_date, 
                                   y = mg_mean))+
  geom_line(aes(color = sample_id))+
  theme(axis.text.x = element_blank(), legend.position = "none")+
  theme_few()

ca <- ggplot(average_allsite, aes(x = sample_date, 
                                  y = ca_mean))+
  geom_line(aes(color = sample_id))+
  theme_few()

k/no3/nh4/mg/ca
  
