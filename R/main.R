#' Test connectivity to/get info about a Pi-Hole
#'
#' @param host See [pi_host()]
#' @param api_key See [pi_key()]
#' @export
pi_test <- function(host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = pi_hole_api_url,
    query = list(
      auth = api_key
    )
  ) -> res

  httr::stop_for_status(res)

  h <- httr::headers(res)

  any(grepl("working", tolower(h[["x-pi-hole"]])))

}

#' @rdname pi_test
#' @export
pi_type <- function(host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "type")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  out$type

}

#' @rdname pi_test
#' @export
pi_version <- function(host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "version")
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  out$version

}

#' @rdname pi_test
#' @export
pi_enable <- function(host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "enable")
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  out$version

}

#' @rdname pi_test
#' @export
pi_disable <- function(host = pi_host(), api_key = pi_key()) {

  pi_hole_api_url <- paste0("http://", host, "/admin/api.php")

  httr::GET(
    url = paste0(pi_hole_api_url, "?", "disable")
  )  -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  out$version

}
