#' Get summary stats
#'
#' @param host See [pi_host()]
#' @param api_key See [pi_key()]
#' @export
pi_summary <- function(host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "summaryRaw", "&", "auth=", api_key)
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  out

}
