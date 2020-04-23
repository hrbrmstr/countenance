#' Get PIHOLE_API_KEY value
#'
#' Can be non-existant or blank ("")
#'
#' @md
#' @return atomic character vector containing the Pi-Hole API key
#' @export
pi_key <- function() { Sys.getenv('PIHOLE_API_KEY') }
