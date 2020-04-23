#' Get top items
#'
#' @param n \# of top items (default 100)
#' @param host See [pi_host()]
#' @param api_key See [pi_key()]
#' @export
pi_top_items <- function(n = 100L, host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  n <- as.integer(n[1])

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "topItems", "=", n, "&", "auth=", api_key)
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  data.frame(
    kind = "query",
    domain = names(out$top_queries),
    ct = unlist(unname(out$top_queries)),
    stringsAsFactors = FALSE
  ) -> x1

  data.frame(
    kind = "ad",
    domain = names(out$top_ads),
    ct = unlist(unname(out$top_ads)),
    stringsAsFactors = FALSE
  ) -> x2

  out <- rbind.data.frame(x1, x2)

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}
