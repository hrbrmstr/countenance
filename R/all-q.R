#' Get query types distribution
#'
#' @param q query
#' @param host See [pi_host()]
#' @param api_key See [pi_key()]
#' @export
pi_queries<- function(q = NULL, host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "getAllQueries", "&", "auth", "=", api_key)
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  out <- out[["data"]]

  out <- as.data.frame(out, stringsAsFactors = FALSE)

  set_names(
    out,
    c("ts", "query_type", "domain", "client", "answer_type", "X1", "X2", "X3")
  ) -> out

  out$ts <- .POSIXct(as.numeric(out$ts))

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}