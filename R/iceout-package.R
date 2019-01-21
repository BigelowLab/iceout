#' Freeze/Thaw Phenology Data of Global Lake and River Ice
#'
#' \if{html}{
#' \figure{iceout-logo.png}{options: width="25\%" valign="top" align="right" style="padding-left:10px" alt="Figure: iceout logo"}
#' }
#' \if{latex}{
#' \figure{iceout-logo.png}{options: width=10cm}
#' }
#' The term phenology in the data set title refers to the seasonal phenomenon of
#' the freezing and thawing of lake and river ice (also known as 'ice-in'/'ice-out' and
#' 'ice-on'/'ice-off' data. Ice-out dates, or the dates of ice break-up, are the
#' annual dates in spring when winter ice cover leaves an inland body of water.
#' Methods are provides to enable convenient access to New England iceout data from
#' the [USGS](https://me.water.usgs.gov/iceout_data) and Minnesota iceout data from
#' the [MDNR](https://www.dnr.state.mn.us/ice_out/index.html?year=1843) along with
#' extra Maine state data from
#' [MDACF](https://www.maine.gov/dacf/parks/water_activities/boating/ice_out06.shtml)
#' and a comprehensive global dataset (to 2014) from the
#' [NSIDC](http://nsidc.org/data/lake_river_ice/).
#'
#' @seealso
#' - <https://me.water.usgs.gov/iceout_data>;
#' - <https://www.dnr.state.mn.us/ice_out/index.html?year=1843>;
#' - <https://www.maine.gov/dacf/parks/water_activities/boating/ice_out06.shtml>
#' - <http://nsidc.org/data/lake_river_ice/>
#' @name iceout
#' @keywords internal
#' @aliases iceout-package
#' @importFrom magrittr %>%
#' @importFrom ggplot2 ggplot xlab geom_point geom_smooth ggtitle scale_y_continuous aes labs
#' @importFrom utils download.file globalVariables
#' @importFrom xml2 read_html
#' @importFrom rvest html_node html_table
#' @importFrom httr GET content stop_for_status
#' @importFrom jsonlite fromJSON
#' @importFrom utils data
NULL
