library(stringi)
library(hrbrthemes)
library(tidyverse)

xdf <- read_csv("~/Data/liag_freeze_thaw_table.csv", na = c("-999"))
cdf <- read_csv("~/Data/liag_physical_character_table.csv", na = c("-999"))

left_join(
  rename(xdf, obs_comments = comments),
  select(
    cdf, lakecode, area_drained, bow_comments=comments, conductivity_us,
    elevation, filename, initials, inlet_streams, landuse_code,
    largest_city_population, max_depth, mean_depth, median_depth,
    power_plant_discharge, secchi_depth, shoreline, surface_area, state
  ),
  "lakecode"
) %>%
  mutate(lakename = stri_trans_totitle(lakename)) %>%
  mutate(country = stri_trans_totitle(country)) %>%
  mutate(state = ifelse(state == "WISCONSIN", "WI", state)) %>%
  mutate(state = case_when(
    is.na(state) ~ NA_character_,
    nchar(state) == 2 ~ state,
    TRUE ~ stri_trans_totitle(state)
  )) %>%
  mutate(iceon_date = as.Date(case_when(
    !is.na(iceon_year) ~ sprintf("%s-%s-%s", iceon_year, iceon_month, iceon_day),
    TRUE ~ NA_character_
  ))) %>%
  mutate(iceon_doy = lubridate::yday(iceon_date)) %>%
  mutate(iceout_date = as.Date(case_when(
    !is.na(iceoff_year) ~ sprintf("%s-%s-%s", iceoff_year, iceoff_month, iceoff_day),
    TRUE ~ NA_character_
  ))) %>%
  mutate(iceout_doy = lubridate::yday(iceout_date)) %>%
  mutate(froze = case_when(
    froze == "Y" ~ TRUE,
    froze == "N" ~ FALSE,
    froze == "U" ~ NA
  )) %>%
  mutate(power_plant_discharge = case_when(
    power_plant_discharge == "Y" ~ TRUE,
    power_plant_discharge == "N" ~ FALSE,
    power_plant_discharge == "-" ~ NA
  )) %>%
  mutate_at(
    .vars = vars(
      latitude, longitude, area_drained, elevation, largest_city_population,
      max_depth, mean_depth, median_depth, secchi_depth, shoreline, surface_area
    ),
    .funs = function(x) { x[x == -999] <- NA }
  ) %>%
  glimpse() -> nsidc_iceout

usethis::use_data(nsidc_iceout, overwrite = TRUE)

