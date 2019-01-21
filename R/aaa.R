utils::globalVariables(c("DOY", "Year", "Date", "doy"))

is.POSIXt <- function (x) inherits(x, "POSIXt")

tz <- function(x)  {
  tzone <- attr(x, "tzone")[[1]]
  if (is.null(tzone) && !is.POSIXt(x)) return("UTC")
  if (is.character(tzone) && nzchar(tzone)) return(tzone)
  tzone <- attr(as.POSIXlt(x[1]), "tzone")[[1]]
  if (is.null(tzone)) return("UTC")
  tzone
}

year <- function(x) { as.POSIXlt(x, tz = tz(x))$year + 1900 }

yday <- function(x) { as.POSIXlt(x, tz = tz(x))$yday + 1 }
