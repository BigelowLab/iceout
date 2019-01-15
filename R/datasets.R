#' @title Maine Bureau of Parks & Lands State Ice-out Data
#' @description This dataset contains the Maine state-level historical data
#' generated via [read_maine_iceout_data()].
#'
#' - `town` <chr>
#' - `body_name` <chr>
#' - `iceout_date` <Date>
#'
#' @docType data
#' @keywords datasets
#' @name me_iceout
#' @references <https://www.maine.gov/dacf/parks/water_activities/boating/ice_out06.shtml>
#' @usage data(me_iceout)
#' @note Last updated 2019-01-15.
#' @format A data frame with 1,131 rows and 3 variables
NULL

#' @title Minnesota Department of Natural Resources State Ice-out Data
#' @description This dataset contains the Minnesota state-level historical data
#' generated via [read_mn_iceout_data()].
#'
#' - `source` <chr> (recording person/institution)
#' - `name` <chr> (inland body of water name)
#' - `date` <Date> (ice-out date)
#' - `comments` <chr> (field notes)
#' - `lat`/`lon` <dbl> (coordinates)
#' - `sentinel_lake` <int> (see site)
#' - `state` <chr> (always Minnesota)
#'
#' @docType data
#' @keywords datasets
#' @name mn_iceout
#' @references <https://www.dnr.state.mn.us/ice_out/index.html?year=1843>
#' @usage data(mn_iceout)
#' @note Last updated 2019-01-15.
#' @format A data frame with 19,261 rows and 9 variables
NULL
