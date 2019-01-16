# get individual inland water historical iceout data
.mn_get_iceout_dates <- function(downum) {

  httr::GET(
    url = "https://maps1.dnr.state.mn.us/cgi-bin/climatology/ice_out_by_lake.cgi",
    query = list(
      id = downum
    )
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  out

  vals <- out[["result"]][["values"]]
  vals[["name"]] <- out[["result"]][["name"]]
  vals[["lat"]] <- as.numeric(out[["result"]][["lat"]])
  vals[["lon"]] <- as.numeric(out[["result"]][["lon"]])
  vals[["id"]] <- out[["result"]][["id"]]
  # vals[["sentinel_lake"]] <- out[["result"]][["sentinel_lake"]]
  vals[["state"]] <- "Minnesota"
  vals[["date"]] <- as.Date(vals[["date"]])

  vals$year <- as.integer(lubridate::year(vals$date))
  vals$doy <- as.integer(lubridate::yday(vals$date))

  vals <- vals[,c("state", "body_name", "date", "year",
                  "doy", "lat", "lon", "id", "comments", "source")]


  class(vals) <- c("tbl_df", "tbl", "data.frame")

  vals

}

mn_get_iceout_dates <- safely(.mn_get_iceout_dates)

#' Read Minnesota Department of Natural Resources State Ice-out Data
#'
#' The state of Minnesota maintains its own data (going back to 1843 and up to present-day) of
#' ice-out data for inland lakes and ponds. Since the [USGS data](https://me.water.usgs.gov/iceout_data)
#' only covers New England ice-outs, we can use this site to gather data
#' for Minnesota to supplement analyses.
#'
#' This function will pull data directly from the Minnesota Department of Natural Resources
#' web pages (e.g. <https://www.dnr.state.mn.us/ice_out/index.html?year=1843>) to
#' find generate the data links to retrieve the data.
#'
#' @note this is really for bootstrapping the built-in data set. You are
#'       better off doing `data(mn_iceout)` vs hitting up the MDNR servers.
#' @return data frame (tibble) consisting of `source`, `body_name` and `iceout_date`
#' @export
#' @examples \dontrun{
#' mn_iceout <- read_mn_iceout_data()
#' }
read_mn_iceout_data <- function() {

  # get index of lakes
  #pg <- xml2::read_html("https://www.dnr.state.mn.us/ice_out/index.html")

  # get overview of the inland bodies of water
  httr::GET(
    url = "https://maps1.dnr.state.mn.us/cgi-bin/climatology/ice_out_by_year.cgi",
    query = list(
      callback = NULL,
      year = 2018L,
      `_` = as.numeric(Sys.time())*1000
    )
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  # get all the inland bodies of watter ids
  downums <- unique(out[["results"]][["id"]])

  # get the historical data for each of them
  lapply(downums, function(.x) {
    message(.x)
    idf <- mn_get_iceout_dates(.x)
    if (length(idf$result)) {
      saveRDS(idf$result, file.path("~/Data/mn/", sprintf("%s.rds", .x)))
      idf$result
    } else {
      # should never get here
      warning("ERROR DOWNLOADING")
      NULL
    }
  }) -> lk_dat


  xdf <- do.call(rbind.data.frame, lk_dat)

  class(xdf) <- c("tbl_df", "tbl", "data.frame")

  colnames(xdf) <- c("source", "iceout_date", "comments", "body_name", "lat", "lon", "id", "sentinel_lake")

  xdf[, c("body_name", "iceout_date", "source", "comments", "lat", "lon", "id", "sentinel_lake")]

  xdf

}


# usethis::use_data(mn_iceout, internal=FALSE, overwrite=TRUE)



