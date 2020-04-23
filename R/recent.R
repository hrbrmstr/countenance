#' Get recent blocked
#'
#' @param host See [pi_host()]
#' @param api_key See [pi_key()]
#' @export
pi_recent <- function(host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "recentBlocked", "&", "auth=", api_key)
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out

}
