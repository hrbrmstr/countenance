#' Get query types distribution
#'
#' @param host See [pi_host()]
#' @param api_key See [pi_key()]
#' @export
pi_query_types <- function(host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "getQueryTypes", "&", "auth", "=", api_key)
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  out <- out$querytypes

  data.frame(
    type = names(out),
    pct = unlist(unname(out))/100,
    stringsAsFactors = FALSE
  ) ->  out

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}
