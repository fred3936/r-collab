# Wrangling 2

# loading packages

library(tidyverse)
library(skimr)

coronavirus = read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv")

view(coronavirus)

# Exercise 1 
coronavirus %>%
  filter(type == "death", country =="US"|country =="Mexico"| country=="Canada")

coronavirus_na <-coronavirus %>%
  filter(type == "death", country %in% c("US","Mexico","Canada"))%>%
  select(country,date,cases)

vacc = read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/covid19_vaccine.csv")

max(vacc$date)

vacc %>%
  filter(date == max(vacc$date))%>%
  select(country_region:people_fully_vaccinated, population)%>%
  mutate(vaxx_rate = round((people_fully_vaccinated / population),4) )

vacc_doses <- vacc %>%
  filter(date == max(vacc$date))%>%
  select(country_region:people_fully_vaccinated, population)%>%
  mutate(average_dose_full = (doses_admin / people_fully_vaccinated)) %>%
  filter(!is.na(average_dose_full))

vacc_doses_2mil <- vacc %>%
  filter(date == max(vacc$date))%>%
  select(country_region:people_fully_vaccinated, population)%>%
  mutate(average_dose_full = (doses_admin / people_fully_vaccinated)) %>%
  filter(!is.na(average_dose_full))%>%
  filter(doses_admin > 2000000)


vacc %>%
  filter(date == max(vacc$date))%>%
  select(country_region:people_fully_vaccinated, population)%>%
  mutate(average_dose_full = (doses_admin / people_fully_vaccinated)) %>%
  filter(!is.na(average_dose_full))%>%
  filter(average_dose_full > 5)



vacc %>%
  filter(date == max(vacc$date))%>%
  select(country_region:people_fully_vaccinated, population)%>%
  mutate(average_dose_full = (doses_admin / people_fully_vaccinated)) %>%
  filter(!is.na(average_dose_full))%>%
  arrange(-average_dose_full)
  
ggplot(data = vacc_doses)+
  geom_histogram(mapping = aes(x=average_dose_full))

vacc %>%
  filter(date == max(vacc$date))%>%
  select(country_region:people_fully_vaccinated, population)%>%
  mutate(vaxx_rate = round((people_fully_vaccinated / population),4) )%>%
  filter(vaxx_rate>0.8)%>%
  arrange(-vaxx_rate)
  
coronavirus %>%
  filter(type =="confirmed") %>%
  group_by(country)%>%
  summarize(sum = sum(cases))

coronavirus %>%
  filter(type =="confirmed") %>%
  group_by(country)%>%
  summarize(n=n())##what does this mean?

coronavirus %>%
  group_by(country,type)%>%
  summarize(total = sum(cases))##what does this mean?
