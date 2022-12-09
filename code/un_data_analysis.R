library(tidyverse)

gapminder_data <- read.csv("data/gapminder_data.csv")
view(gapminder_data)

summarize(gapminder_data, averageLifeExp = mean(lifeExp))
gapminder_data %>% summarize(averageLifeExp = mean(lifeExp))
gapminder_data_summarized <- gapminder_data %>%
  summarize(averageLifeExp = mean(lifeExp))
help.search("arithmetic", package = "base")
gapminder_data %>% summarize(year_range=base::range(year))
gapminder_data %>% 
  filter(year==2007) %>%
  summarize(average=mean(lifeExp))
?max
gapminder_data %>% 
  filter(year==1952) %>%
  summarize(average=max(gdpPercap))

gapminder_data %>% 
  filter(continent=="Africa") %>%
  summarize(average=mean(lifeExp))

gapminder_data %>%
  select(country, continent, year, lifeExp) %>%
  pivot_wider(names_from = year, values_from = lifeExp)
gapminder_data_2007 <- read_csv("data/gapminder_data.csv") %>%
  filter(year == 2007 & continent == "Americas") %>%
  select(-year, -continent)



co2_emission_dirty <- read.csv("data/co2-un-data.csv", skip=2,
         colnames=c("region", "country", "year", "series", "value", "footnotes", "source"))


co2_emissions_dirty <- read_csv("data/co2-un-data.csv", skip=2,
                                col_names=c("region", "country", "year", "series", "value", "footnotes", "source"))


co2_emissions_dirty %>%
  select(country, year, series, value) %>% # This step not in data demonstration
  mutate(series = recode(series, 
                         "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions", 
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions")) %>%
  pivot_wider(names_from=series, values_from=value)



co2_emissions <- read_csv("data/co2-un-data.csv", skip=2,
                                col_names=c("region", "country", "year", "series", "value", "footnotes", "source")) %>%
  select(country, year, series, value) %>% # This step not in data demonstration
  mutate(series = recode(series, 
                         "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions", 
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions")) %>%
  pivot_wider(names_from=series, values_from=value) %>%
  filter(year == 2005) %>%
  select(year)

inner_join(gapminder_data, co2_emissions)


gapminder_data_2007 <- read_csv("data/gapminder_data.csv") %>%
  filter(year == 2007, continent == "Americas") %>%
  select(-year, -continent)

# Clean up data ----

#read_csv("data/co2-un-data.csv")
co2_emissions <- read_csv("data/co2-un-data.csv", skip = 2,
                          col_names = c("region", "country", "year", "series", "value",
                                        "footnotes", "source")) %>%
  # Shorten series variables Emissions (...) and Emissions per capita (...)
  mutate(series = recode(series,
                         "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions",
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions")) %>%
  pivot_wider(names_from = series,
              values_from = value) %>%
  #count(year)
  filter(year == 2005) %>%
  select(-year)

# Joining data frames ----
gapminder_data_2007 <- read_csv("data/gapminder_data.csv") %>%
  filter(year == 2007, continent == "Americas") %>%
  select(-year, -continent)

View(gapminder_data_2007)
View(co2_emissions)

inner_join(gapminder_data_2007, co2_emissions, by = "country")

anti_join(gapminder_data_2007, co2_emissions, by = "country")