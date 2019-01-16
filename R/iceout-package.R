#' Retrieve and Process 'Ice-out' Data for New England and Minnesota Inland Bodies of Water
#'
#' \if{html}{
#' \figure{iceout-logo.png}{options: width="25\%" valign="top" align="right" style="padding-left:10px" alt="Figurre: iceout logo"}
#' }
#' \if{latex}{
#' \figure{iceout-logo.png}{options: width=10cm}
#' }
#' Lake ice-out dates, or the dates of ice break-up, are the annual dates in spring
#' when winter ice cover leaves a lake. Methods are provides to enable convenient access to
#' New England iceout data from the [USGS](https://me.water.usgs.gov/iceout_data>) and Minnesota iceout data from
#' the [MDNR](https://www.dnr.state.mn.us/ice_out/index.html?year=1843) along with
#' extra Maine state data from [MDACF](https://www.maine.gov/dacf/parks/water_activities/boating/ice_out06.shtml).
#'
#' @seealso <https://me.water.usgs.gov/iceout_data>
#' @name iceout
#' @aliases umoos iceout-package
#' @importFrom magrittr %>%
#' @importFrom readr read_csv
#' @importFrom ggplot2 ggplot xlab geom_point geom_smooth ggtitle scale_y_continuous aes
#' @importFrom dplyr filter mutate
#' @importFrom utils download.file globalVariables
#' @importFrom xml2 read_html
#' @importFrom rvest html_node html_table
#' @importFrom httr GET content stop_for_status
#' @importFrom jsonlite fromJSON
NULL
