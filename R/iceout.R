#' Retrieve the URI for online data access
#'
#' @export
#' @return charcater uri
iceout_uri <- function(){"https://me.water.usgs.gov/iceout_data"}

#' Retrieve the data path for the package data
#'
#' @export
#' @return charcater uri
iceout_path <- function(...){
    path = system.file("data", package = "iceout")
    file.path(path, ...)
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
#' @param trend charcater, if 'loess' then draw a loess fit on the data. At this
#'    time any othe
plot_iceout <- function(x = parse_iceout(), trend = 'loess'){
	ggplot2::ggplot(x$data, aes(x = Date, y = DOY)) +
	    ggplot2::xlab('Year') +
	    ggplot2::geom_point(alpha = 0.2) +
	    ggplot2::geom_smooth(method = 'loess') +
	    ggplot2::ggtitle(sprintf("Iceout History for %s",x$longname)) +
	    ggplot2::scale_y_continuous(name = "Iceout day",
  			labels = function(b){ format(as.Date(paste("2018",b), format = "%Y %j"), "%b %d")})
}

#' Fetch all of the data
#' @param sites vector of site names (short names)
#' @return vector of 0 = success, !0 = failure
fetch_all <- function(sites = read_sites()$name){
    sapply(sites,
                 function(name) {
                     fname = sprintf("Data.%s.txt", name)
                     DST = file.path(PATH,fname)
                     SRC = file.path(URI, fname)
                     download.file(SRC, DST)
                 })
}

#' Parse one or more sites
#'
#' @param sites one or more site names (short name)
#' @param return list of iceout lists
parse_all <- function(sites = read_sites()$name){
    sapply(sites,
                 function(name){
                     parse_iceout(name)
                }, simplify = FALSE)
}


#' Parse a single iceout file
#'
#' @param name the site name
#' @param form either zoo or tibble (default)
#' @return list of iceout metadata and data in \code{form} form
parse_iceout <- function(name = "Auburn", form = c("tibble", "zoo")[1]){

	filename = file.path(PATH, sprintf("Data.%s.txt", name))
	txt <- readLines(filename, encoding = 'latin1')
	ix <- grep("YEAR", txt, fixed = TRUE)
	nhdr <- ix[1]-1
	hdr <- txt[seq_len(nhdr)]
	longname = gsub("Ice-out dates for ", "", hdr[1], fixed = TRUE)
	observer = gsub("Observers.—", "", hdr[3], fixed = TRUE)
	n1 <- "Location of Lake.—Lat. "
	n2 <- ", long. "
	ll <- sub(n2, "", sub(n1, "", hdr[2], fixed = TRUE), fixed = TRUE)
	lat <- as.numeric(substr(ll, 1,2)) +
		   as.numeric(substr(ll, 4,5))/60 +
		   as.numeric(substr(ll, 7,8))/3600
    lon <- 0 -
    	   as.numeric(substr(ll, 10,11)) +
		   as.numeric(substr(ll, 13,14))/60 +
		   as.numeric(substr(ll, 16,17))/3600
    d <- txt[-seq_len(nhdr+1)]
    ix <- !grepl("\t", d)
    if (any(ix)) d[ix] <- paste0(d[ix], "\t")
	dat <- readr::read_tsv(paste(d, collapse = "\n"), col_names = c("Year", "DOY"),
	                       na = c("", "NA", "NCIC")) %>%
		dplyr::filter(!is.na(DOY)) %>%
		dplyr::mutate(Date = as.Date(paste(Year, DOY), format = "%Y %j"))
	if(tolower(form[1])=='zoo') dat <- zoo::zoo(dat$DOY, dat$Date)
	list(name = name,
		longname = longname,
		observer = observer,
		lon = lon,
		lat = lat,
		data = dat)
}
