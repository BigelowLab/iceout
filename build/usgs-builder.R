usgs_iceout <- read_iceout()

map_df(usgs_iceout, ~{

  .x$data %>%
    mutate(
      name = .x$name,
      long_name = .x$longname,
      lon = .x$lon,
      lat = .x$lat,
      observer = .x$observer
    )

}) %>%
  janitor::clean_names() %>%
  mutate(state = stri_match_last_regex(long_name, ", (.*)$")[,2]) %>%
  separate_rows(state, sep="/") %>%
  select(state, name, long_name, lon, lat, year, doy, date, observer) -> usgs_iceout

usethis::use_data(usgs_iceout, overwrite = TRUE)

