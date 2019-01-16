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
#' - `name` <chr> (short lake namne)
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
