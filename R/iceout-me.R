#' Read Maine Bureau of Parks & Lands State Ice-out Data for a Given Year
#'
#' The state of Maine maintains its own data (going back to 2003) of
#' ice-out data for inland lakes and ponds. Since the [USGS data](https://me.water.usgs.gov/iceout_data)
#' only goes up to 2005, we can use the Maine state data to retrieve  measurements
#' up to present year of available ice-out data.
#'
#' This function will pull data directly from the Maine Bureau of Parks & Lands
#' web pages (e.g. <https://www.maine.gov/dacf/parks/water_activities/boating/ice_out06.shtml>).
#'
#' @param year >= 2003 (defaults to 2003)
#' @return data frame (tibble) consisting of `state`, `town`, `body_name`, `date`,
#'         `year`, `doy`
#' @export
#' @family online readers
#' @examples
#' me_iceout <- read_maine_iceout_data(2003)
read_maine_iceout_data <- function(year = 2003) {

  sprintf(
    "https://www.maine.gov/dacf/parks/water_activities/boating/ice_out%02s.shtml",
    substr(as.character(year), 3, 4)
  ) -> yr_url

  res <- httr::HEAD(yr_url)
  if (httr::status_code(res) != 200) {
    stop("Year [", year, "] not available from the Maine state resource.", call.=FALSE)
  }

  doc <- xml2::read_html(yr_url)
  iceout_tbl_node <- rvest::html_node(doc, xpath=".//table[1]")
  xdf <- rvest::html_table(iceout_tbl_node, trim=TRUE)
  colnames(xdf) <- c("body_name", "town", "date")
  xdf[["date"]] <- as.Date(xdf[["date"]], format="%m/%d/%Y")
  xdf[,c("town", "body_name", "date")]

  xdf$state <- "Maine"
  xdf$year <- as.integer(year(xdf$date))
  xdf$doy <- as.integer(yday(xdf$date))

  class(xdf) <- c("tbl_df", "tbl", "data.frame")

  xdf

}

