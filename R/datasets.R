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
#' generated via the dataset builders. The dataset builder source can be
#' found at the `URL` in the package `DESCRIPTION`.
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
#' for New England generated via the dataset builders. The dataset builder source can be
#' found at the `URL` in the package `DESCRIPTION`.
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
#' This dataset was generated via the dataset builders. The dataset builder source can be
#' found at the `URL` in the package `DESCRIPTION`.
#'
#' \if{html}{
#' \figure{README-ns-idc-coverage-1.png}{options: width="100\%" style="padding-left:10px" alt="Figure: nsidc map"}
#' }
#' \if{latex}{
#' \figure{README-ns-idc-coverage-1.png}{options: width=10cm}
#' }
#'
#' Full descriptions for the following fields can be found at the
#' [NSIDC](https://nsidc.org/data/g01377?qt-data_set_tabs=2#qt-data_set_tabs).
#'
#' - `lakecode` <chr> (NSIDC lake code)
#' - `lakename` <chr> (NSIDC lake name)
#' - `lakeorriver` <chr> (`L` for lake)
#' - `season` <chr> (season identifier)
#' - `iceon_year` <dbl> (ice-on year)
#' - `iceon_month` <dbl> (ice-on month)
#' - `iceon_day` <dbl> (ice-on day)
#' - `iceoff_year` <dbl> (ice-off year)
#' - `iceoff_month` <dbl> (ice-off month)
#' - `iceoff_day` <dbl> (ice-off day)
#' - `duration` <dbl> (duration of ice-cover indays)
#' - `latitude` <dbl> (latitude in decimal degrees.)
#' - `longitude` <dbl> (longitude in decimal degrees.)
#' - `country` <chr> (me of the country in which the lake or river resides; Possible values
#'    include `Canada`, `China`, `Finland`, `Germany`, `Hungary`, `Japan`, `Norway`, `Russia`,
#'    `Russia-Estonia`, `Sweden`, `Switzerland`, and `United States`)
#' - `froze` <lgl> (did the body of water freeze this season?)
#' - `obs_comments` <chr> (comments by the observer)
#' - `area_drained` <lgl> (has the area been drained)
#' - `bow_comments` <chr> (additional comments about this body of water)
#' - `conductivity_us` <dbl> (conductivity of the water in microsiemens per centimeter)
#' - `elevation` <dbl> (elevation of lake or river above sea level in meters)
#' - `filename` <chr> (source filename)
#' - `initials` <chr> (observer intials)
#' - `inlet_streams` <lgl> (does the lake have an inlet stream?)
#' - `landuse_code` <chr> (landuse code of the area surrounding the lake or river. e
#'    very code that applies to a lake or river is listed in this field.)
#' - `largest_city_population` <dbl> (population of largest city on lake)
#' - `max_depth` <dbl> (aximum depth of lake or river in meters)
#' - `mean_depth` <dbl> (mean depth of lake or river in meters)
#' - `median_depth` <dbl> (median depth of lake or river in meters)
#' - `power_plant_discharge` <lgl> (does a power plant discharges into the lake or river?)
#' - `secchi_depth` <dbl> (depth the [secchi disk](https://en.wikipedia.org/wiki/Secchi_disk) reached in meters)
#' - `shoreline` <dbl> (shoreline length of lake in kilometers)
#' - `surface_area` <dbl> (surface area of lake or river in square kilometers)
#' - `state` <chr> (nName of the state in which the lake or river resides, if applicable.)
#' - `iceon_date` <Date> (ice-on date)
#' - `iceon_doy` <dbl> (ice-on day of year)
#' - `iceout_date` <Date> (ice-out date)
#' - `iceout_doy` <dbl> (ice-out day of year)
#'
#' @docType data
#' @keywords datasets
#' @name nsidc_iceout
#' @references <http://nsidc.org/data/lake_river_ice/>
#' @usage data(nsidc_iceout)
#' @note Last updated 2019-01-18.
#' @format A data frame with 35,918 rows and 37 variables
NULL
