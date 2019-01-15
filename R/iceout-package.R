#' Retrieve and Process 'Ice-out' Data for New England and Minnesota Inland Bodies of Water
#'
#' @seealso <https://me.water.usgs.gov/iceout_data>
#' @description Provides convenient access to New England iceout data from
#' <https://me.water.usgs.gov/iceout_data> and Minnesota iceout data from
#' <https://www.dnr.state.mn.us/ice_out/index.html?year=1843> along with
#' extra Maine state data from <https://www.maine.gov/dacf/parks/water_activities/boating/ice_out06.shtml>.
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
