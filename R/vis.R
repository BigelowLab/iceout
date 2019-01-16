#' Plot a single iceout dataset
#'
#' @export
#' @param dataset one of "`usgs`" for the core USGS data, "`me`" for the Maine
#'        state curated data, or "`mn`" for the Minnesota state curated data.
#' @param state a valid state name for `dataset`
#' @param body_name a valid inland body of water name for the `dataset` and
#'        `state` combination.
#' @param town the Maine state curated data includes ponds and pond names are
#'        not unique across the state so if specifying "`me`" for `dataset`
#'        this parameter must be specified.
#' @param method,formula,... see [ggplot2::geom_smooth()]
#' @return ggplot2 object
#' @examples
#' plot_iceout("usgs", "New Hampshire", "First.Conn")
#' plot_iceout("me", "Maine", "Long Pond", town = "Belgrade")
#' plot_iceout("mn", "Minnesota", "Minnewaska")
plot_iceout <- function(dataset = c("usgs", "me", "mn"),
                        state = "Maine", body_name = "Auburn", town = NULL,
                        method = 'loess', formula = y ~ x, ...) {

  dataset <- match.arg(dataset[1], c("usgs", "me", "mn"))

  tmpenv <- new.env()

  switch(
    dataset,
    usgs = data("usgs_iceout", package = "iceout", envir = tmpenv),
    me = data("me_iceout", package = "iceout", envir = tmpenv),
    mn = data("mn_iceout", package = "iceout", envir = tmpenv)
  ) -> set_name

  dat <- tmpenv[[set_name]]

  dat[
    dat[["state"]] == state &
    dat[["body_name"]] == body_name,
  ] -> dat

  if (dataset == "me") {
    if (is.null(town)) stop(
      "You chose 'me' for 'dataset' but did not specify then-required ",
      "parameter 'town'.", call. = FALSE
    )
    dat <- dat[ dat[["town"]] == town, ]
  }

  if (nrow(dat) > 0) {

    ggplot2::ggplot(data = dat, ggplot2::aes(x = date, y = doy)) +
      ggplot2::geom_point(alpha = 0.2) +
      ggplot2::geom_smooth(method = method, formula = formula, ...) +
      ggplot2::labs(
        x = 'Year',
        title = sprintf("Iceout History for %s", gsub(".", " ", body_name, fixed=TRUE))
      ) +
      ggplot2::scale_y_continuous(
        name = "<<< earlier          Iceout Day          later >>>",
        labels = function(b){
          format(as.Date(paste("2018",b), format = "%Y %j"), "%b %d")
        }
      )

  } else {

    stop(
      "The combination of data set, state and inland body of water name ",
      "not found in the included data sets.", call.=FALSE
    )

  }

}
