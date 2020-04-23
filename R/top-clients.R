#' Get top clients
#'
#' @param n \# of top clients (default 100)
#' @param host See [pi_host()]
#' @param api_key See [pi_key()]
#' @export
pi_top_clients <- function(n = 100, host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  n <- as.integer(n[1])

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "topClients", "=", n, "&", "auth", "=", api_key)
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  out <- out$top_sources

  data.frame(
    client = names(out),
    ct = unlist(unname(out)),
    stringsAsFactors = FALSE
  ) ->  out

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}
