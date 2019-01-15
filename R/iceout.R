#' Retrieve the URI for online data access
#'
#' @export
#' @return charcater uri
iceout_uri <- function(){"https://me.water.usgs.gov/iceout_data"}

#' Retrieve the data path for the package data
#'
#' @param ... path elements
#' @return charcater path
#' @export
iceout_path <- function(...){
    system.file("extdata", ..., package = "iceout")
}

#' Read the iceout_sites file that provides name, longname and location data
#'
#' @export
#' @param filename the fully qualified filename
#' @return tibble of site data
read_sites <- function(filename = iceout_path('iceout_sites.csv')){
	readr::read_csv(filename)
}

#' Plot a single iceout dataset
#'
#' @export
#' @param x a list of iceout data
#' @param trend charcater, if 'loess' then draw a loess fit on the data;
#'     other values are ignored for now.
#' @return ggplot2 object
plot_iceout <- function(x = read_iceout()[[1]], trend = 'loess'){
	ggplot2::ggplot(x$data, ggplot2::aes(x = Date, y = DOY)) +
	    ggplot2::xlab('Year') +
	    ggplot2::geom_point(alpha = 0.2) +
	    ggplot2::geom_smooth(method = 'loess') +
	    ggplot2::ggtitle(sprintf("Iceout History for %s",x$longname)) +
	    ggplot2::scale_y_continuous(name = "<<< earlier          Iceout Day          later >>>",
  			labels = function(b){ format(as.Date(paste("2018",b), format = "%Y %j"), "%b %d")})
}

#' Fetch all of the data
#'
#' @export
#' @param sites vector of site names (short names)
#' @param dst_path the destuntion path to save the files
#' @return vector of 0 = success, !0 = failure
fetch_all <- function(sites = read_sites()$name,
                      dst_path = "."){
    sapply(sites,
                 function(name) {
                     fname = sprintf("Data.%s.txt", name)
                     DST = file.path(dst_path,fname)
                     SRC = file.path(iceout_uri(), fname)
                     download.file(SRC, DST)
                 })
}

#' Parse one or more sites
#'
#' @export
#' @param sites one or more site names (short name)
#' @return list of iceout lists
parse_all <- function(sites = read_sites()$name){
    sapply(sites,
                 function(name){
                     parse_iceout(name)
                }, simplify = FALSE)
}

#' Parse a single iceout file
#'
#' @export
#' @param name the site name
#' @param form character, just 'tibble' for now but possibly 'sf' in future
#' @return list of iceout metadata and data in \code{form} form
parse_iceout <- function(name = "Auburn", form = "tibble"){

	filename = iceout_path(sprintf("Data.%s.txt", name))
	txt <- readLines(filename, encoding = 'latin1')
	ix <- grep("YEAR", txt, fixed = TRUE)
	nhdr <- ix[1]-1
	hdr <- txt[seq_len(nhdr)]
	longname = gsub("Ice-out dates for ", "", hdr[1], fixed = TRUE)
	observer = gsub("Observers.-", "", hdr[3], fixed = TRUE)
	n1 <- "Location of Lake.-Lat. "
	n2 <- ", long. "
	ll <- sub(n2, "", sub(n1, "", hdr[2], fixed = TRUE), fixed = TRUE)
	lat <- as.numeric(substr(ll, 1,2)) +
		   as.numeric(substr(ll, 4,5))/60 +
		   as.numeric(substr(ll, 7,8))/3600
    lon <- 0 -
    	   (as.numeric(substr(ll, 10,11)) +
		   as.numeric(substr(ll, 13,14))/60 +
		   as.numeric(substr(ll, 16,17))/3600)
    d <- txt[-seq_len(nhdr+1)]
    ix <- !grepl("\t", d)
    if (any(ix)) d[ix] <- paste0(d[ix], "\t")
	dat <- readr::read_tsv(paste(d, collapse = "\n"), col_names = c("Year", "DOY"),
	                       na = c("", "NA", "NCIC")) %>%
		dplyr::filter(!is.na(DOY)) %>%
		dplyr::mutate(Date = as.Date(paste(Year, DOY), format = "%Y %j"))
	list(name = name,
		longname = longname,
		observer = observer,
		lon = lon,
		lat = lat,
		data = dat)
}


#' Read the prepared iceout data
#'
#' @export
#' @param filename the name of the iceout_data.rds file
#' @return a list of parsed iceout datasets
read_iceout <- function(filename = iceout_path("iceout_data.rds")){
    readRDS(filename)
}
