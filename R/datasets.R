#' @title Maine Bureau of Parks & Lands State Ice-out Data
#' @description This dataset contains the Maine state-level historical data
#' generated via [read_maine_iceout_data()].
#'
#' - `state` <chr> (always Maine)
#' - `town` <chr> (town name)
#' - `body_name` <chr> (inland body of water name)
#' - `date` <Date> (iceout date)
#' - `year` <int> (ice-out year)
#' - `doy` <int> (ice-out day of year)
#'
#' @docType data
#' @keywords datasets
#' @name me_iceout
#' @references <https://www.maine.gov/dacf/parks/water_activities/boating/ice_out06.shtml>
#' @usage data(me_iceout)
#' @note Last updated 2019-01-15.
#' @format A data frame with 1,131 rows and 6 variables
NULL

#' @title Minnesota Department of Natural Resources State Ice-out Data
#' @description This dataset contains the Minnesota state-level historical data
#' generated via [read_mn_iceout_data()].
#'
#' - `state` <chr> (always Minnesota)
#' - `body_name` <chr> (inland body of water name)
#' - `date` <Date> (ice-out date)
#' - `year` <int> (ice-out year)
#' - `doy` <int> (ice-out day of year)
#' - `lat`/`lon` <dbl> (coordinates)
#' - `id` <chr> (MDNR resource id)
#' - `comments` <chr> (field notes)
#' - `source` <chr> (recording person/institution)
#'
#' @docType data
#' @keywords datasets
#' @name mn_iceout
#' @references <https://www.dnr.state.mn.us/ice_out/index.html?year=1843>
#' @usage data(mn_iceout)
#' @note Last updated 2019-01-15.
#' @format A data frame with 19,261 rows and 10 variables
NULL

#' @title USGS Lake Ice-Out Data for New England
#' @description This dataset contains the USGS historical ice-out data
#' for New England
#'
#' - `state` <chr> (state lake is in)
#' - `body_name` <chr> (short lake namne)
#' - `long_name` <chr> (long lake name)
#' - `lat`/`lon` <dbl> (coordinates)
#' - `year` <int> (ice-out year)
#' - `doy` <int> (ice-out day of year)
#' - `date` <Date> (ice-out date)
#' - `observer` <chr> (recording person/institution)
#'
#' @docType data
#' @note Umbagog lake spans New Hampshire & Maine and is in the data
#'       frame under both states.
#' @keywords datasets
#' @name usgs_iceout
#' @references <https://me.water.usgs.gov/iceout_data/>;
#'             <https://me.water.usgs.gov/iceout.html>
#' @usage data(usgs_iceout)
#' @note Last updated 2019-01-15.
#' @format A data frame with 3,372 rows and 9 variables
NULL

#' @title NSIDC Global Lake and River Ice Phenology Database, Version 1
#' @description The Global Lake and River Ice Phenology Database contains
#' freeze and thaw/breakup dates as well as other descriptive ice cover data
#' for 865 lakes and rivers in the Northern Hemisphere. Of the 542 water
#' bodies that have records longer than 19 years, 370 of them are in North
#' America and 172 are in Eurasia. 249 lakes and rivers have records longer
#' than 50 years, and 66 have records longer than 100 years. A few water
#' bodies have data available prior to 1845. This database, with water
#' bodies distributed around the Northern Hemisphere, allows for the
#' analysis of broad spatial patterns as well as long-term temporal patterns.
#'
#' - `lakecode` <chr> ()
#' - `lakename` <chr> ()
#' - `lakeorriver` <chr> ()
#' - `season` <chr> ()
#' - `iceon_year` <dbl> ()
#' - `iceon_month` <dbl> ()
#' - `iceon_day` <dbl> ()
#' - `iceoff_year` <dbl> ()
#' - `iceoff_month` <dbl> ()
#' - `iceoff_day` <dbl> ()
#' - `duration` <dbl> ()
#' - `latitude` <lgl> ()
#' - `longitude` <lgl> ()
#' - `country` <chr> ()
#' - `froze` <lgl> ()
#' - `obs_comments` <chr> ()
#' - `area_drained` <lgl> ()
#' - `bow_comments` <chr> ()
#' - `conductivity_us` <dbl> ()
#' - `elevation` <lgl> ()
#' - `filename` <chr> ()
#' - `initials` <chr> ()
#' - `inlet_streams` <chr> ()
#' - `landuse_code` <chr> ()
#' - `largest_city_population` <lgl> ()
#' - `max_depth` <lgl> ()
#' - `mean_depth` <lgl> ()
#' - `median_depth` <lgl> ()
#' - `power_plant_discharge` <lgl> ()
#' - `secchi_depth` <lgl> ()
#' - `shoreline` <lgl> ()
#' - `surface_area` <lgl> ()
#' - `state` <chr> ()
#' - `iceon_date` <date ()
#' - `iceon_doy` <dbl> ()
#' - `iceout_date` <date ()
#' - `iceout_doy` <dbl> ()
#'
#' @docType data
#' @keywords datasets
#' @name nsidc_iceout
#' @references <http://nsidc.org/data/lake_river_ice/>
#' @usage data(nsidc_iceout)
#' @note Last updated 2019-01-18.
#' @format A data frame with 35,918 rows and 37 variables
NULL
