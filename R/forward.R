#' Get forward destinations (i.e. upstream DNS)
#'
#' @param host See [pi_host()]
#' @param api_key See [pi_key()]
#' @export
pi_fwd_dest <- function(host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "getForwardDestinations", "&", "auth", "=", api_key)
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  out <- out$forward_destinations

  data.frame(
    dest = names(out),
    ct = unlist(unname(out)),
    stringsAsFactors = FALSE
  ) ->  out

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}
