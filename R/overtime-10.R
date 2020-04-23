#' Get recent 10 min time series counts
#'
#' @param host See [pi_host()]
#' @param api_key See [pi_key()]
#' @export
pi_over_time_10m <- function(host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "overTimeData10mins", "&", "auth=", api_key)
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  data.frame(
    kind = "query",
    ts = names(out$domains_over_time),
    ct = unlist(unname(out$domains_over_time)),
    stringsAsFactors = FALSE
  ) -> x1

  x1$ts <- .POSIXct(as.numeric(x1$ts))

  data.frame(
    kind = "ad",
    ts = names(out$ads_over_time),
    ct = unlist(unname(out$ads_over_time)),
    stringsAsFactors = FALSE
  ) -> x2

  x2$ts <- .POSIXct(as.numeric(x2$ts))

  out <- rbind.data.frame(x1, x2)

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}
