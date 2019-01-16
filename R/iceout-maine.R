#' Read Maine Bureau of Parks & Lands State Ice-out Data
#'
#' The state of Maine maintains its own data (going back to 2003) of
#' ice-out data for inland lakes and ponds. Since the [USGS data](https://me.water.usgs.gov/iceout_data)
#' only goes up to 2005, we can use this data to extend the measurement period
#' to present year.
#'
#' This function will pull data directly from the Maine Bureau of Parks & Lands
#' web pages (e.g. <https://www.maine.gov/dacf/parks/water_activities/boating/ice_out06.shtml>)
#' and there is a current hardcoded "end year" of 2017.
#'
#' @note this takes a while and you are better off using `data(me_icout)` since
#'       it will be updated each season. Only use this if you're impatient.
#' @return data frame (tibble) consisting of `state`, `town`, `body_name`, `date`,
#'         `year`, `doy`
#' @export
#' @examples \dontrun{
#' me_iceout <- read_maine_iceout_data()
#' }
read_maine_iceout_data <- function() {

  sprintf(
    "https://www.maine.gov/dacf/parks/water_activities/boating/ice_out%02s.shtml", 3:17
  ) -> yrs

  do.call(
    rbind.data.frame,
    lapply(yrs, function(URL) {
      doc <- xml2::read_html(URL)
      iceout_tbl_node <- rvest::html_node(doc, xpath=".//table[1]")
      xdf <- rvest::html_table(iceout_tbl_node, trim=TRUE)
      colnames(xdf) <- c("body_name", "town", "date")
      xdf[["date"]] <- as.Date(xdf[["date"]], format="%m/%d/%Y")
      xdf[,c("town", "body_name", "date")]
    })
  ) -> xdf

  xdf$state <- "Maine"
  xdf$year <- as.integer(lubridate::year(xdf$date))
  xdf$doy <- as.integer(lubridate::yday(xdf$date))

  class(xdf) <- c("tbl_df", "tbl", "data.frame")

  xdf

}

# usethis::use_data(me_iceout, internal=FALSE, overwrite=TRUE)
