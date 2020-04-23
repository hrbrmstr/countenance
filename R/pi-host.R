#' Get or set PIHOLE_HOST value
#'
#' @md
#' @param force Force setting a new Pi-Hole host[:port] the current environment?
#' @return atomic character vector containing the Pi-Hole host[:port]
#' @export
pi_host <- function(force = FALSE) {

  env <- Sys.getenv('PIHOLE_HOST')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var PIHOLE_HOST to your Pi-Hole host[:port]",
         call. = FALSE)
  }

  message("Couldn't find env var PIHOLE_HOST See ?pi_host for more details.")
  message("Please enter your Pi-Hole host[:port]:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("Pi-Hole host[:port] entry failed", call. = FALSE)
  }

  message("Updating PIHOLE_HOST env var")
  Sys.setenv(PIHOLE_HOST = pat)

  pat

}
