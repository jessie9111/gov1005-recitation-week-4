library(tidyverse)
library(tidycensus)

racevars <- c(White = "B02001_002", 
              Black = "B02001_003", 
              Asian = "B02001_005",
              Hispanic = "B03003_003")
harris <- get_acs(geography = "tract",
                  variables = racevars, 
                  year = 2018,
                  state = "TX",
                  county = "Harris County",
                  geometry = TRUE,
                  summary_var = "B02001_001") 

map <- harris %>%
    mutate(Percent = 100 * (estimate / summary_est)) %>%
    ggplot(aes(fill = Percent, color = Percent)) +
    facet_wrap(~ variable) +
    geom_sf() +
    scale_fill_viridis_c(direction = -1) +
    scale_color_viridis_c(direction = -1) +
    labs(title = "Racial geography of Harris County, Texas",
         caption = "Source: American Community Survey 2014-2018") +
    theme_void()

ggsave("map.png", map)

fairfax <- get_acs(geography = "tract",
                  variables = racevars, 
                  year = 2018,
                  state = "VA",
                  county = "Fairfax County",
                  geometry = TRUE,
                  summary_var = "B02001_001") 

map_2 <- fairfax %>%
    mutate(Percent = 100 * (estimate / summary_est)) %>%
    ggplot(aes(fill = Percent, color = Percent)) +
    facet_wrap(~ variable) +
    geom_sf() +
    scale_fill_viridis_c(direction = -1) +
    scale_color_viridis_c(direction = -1) +
    labs(title = "Racial geography of Fairfax County, Virginia",
         caption = "Source: American Community Survey 2014-2018") +
    theme_void()

ggsave("map_2.png", map_2)