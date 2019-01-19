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
#' @note You get _all_ historical records for a given MDNR id. Identifiers can
#'       begin with a `0` so make sure this is a character.
#' @param id `<chr>` the MDNR identifier of the body of water. See [read_mdnr_metadata()].
#' @return data frame
#' @family online readers
#' @export
#' @examples
#' read_minnesota_iceout_data("11030500")
read_minnesota_iceout_data <- function(id) {

  httr::GET(
    url = "https://maps1.dnr.state.mn.us/cgi-bin/climatology/ice_out_by_lake.cgi",
    query = list(
      id = as.character(id)
    )
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  out

  vals <- out[["result"]][["values"]]
  vals[["body_name"]] <- out[["result"]][["name"]]
  vals[["lat"]] <- as.numeric(out[["result"]][["lat"]])
  vals[["lon"]] <- as.numeric(out[["result"]][["lon"]])
  vals[["id"]] <- out[["result"]][["id"]]
  # vals[["sentinel_lake"]] <- out[["result"]][["sentinel_lake"]]
  vals[["state"]] <- "Minnesota"
  vals[["date"]] <- as.Date(vals[["date"]])

  vals$year <- as.integer(year(vals$date))
  vals$doy <- as.integer(yday(vals$date))

  vals <- vals[,c("body_name", "date", "state", "year", "doy",
                  "lon", "lat", "id", "source", "comments")]

  class(vals) <- c("tbl_df", "tbl", "data.frame")

  vals

}

#' Retrieves metadata on all available Minnesota Lakes.
#'
#' Use this to get the `id` for [read_minnesota_iceout_data()]
#'
#' @return data frame
#' @export
#' @family online readers
#' @examples
#' meta <- read_mdnr_metadata()
#' meta_u <- meta[, c("name", "lat", "lon", "id")]
#' meta_u <- meta_u[!duplicated(meta_u),]
#' meta_u <- meta_u[order(meta_u$name),]
#'
#' \dontrun{
#' # tidyverse
#' library(dplyr)
#' select(meta, name, lat, lon, id) %>%
#'   arrange(name)
#' }
read_mdnr_metadata <- function() {

  httr::GET(
    url = "https://maps1.dnr.state.mn.us/cgi-bin/climatology/ice_out_by_year.cgi",
    query = list(
      callback = NULL,
      year = as.integer(year(Sys.Date()-180)),
      `_` = as.numeric(Sys.time())*1000
    )
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  if (out$status != "OK") {

    httr::GET(
      url = "https://maps1.dnr.state.mn.us/cgi-bin/climatology/ice_out_by_year.cgi",
      query = list(
        callback = NULL,
        year = as.integer(year(Sys.Date()-360)),
        `_` = as.numeric(Sys.time())*1000
      )
    ) -> res

    httr::stop_for_status(res)

    out <- httr::content(res, as = "text")
    out <- jsonlite::fromJSON(out)

  }

  if (out$status != "OK") stop(out$message, call.=FALSE)

  out <- suppressMessages(readr::type_convert(out$results))

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}
