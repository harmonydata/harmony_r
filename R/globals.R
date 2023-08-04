pkg.globals <- new.env()
pkg.globals$url <- "https://api.harmonydata.org"
#' Set Harmony URL
#'
#' This function sets the Harmony API URL to be used in the package. By default,
#' it uses the production Harmony API (https://api.harmonydata.org), but you can
#' override it by providing a different URL.
#'
#' @param harmony_url The Harmony API URL to be set. (default: "https://api.harmonydata.org")
#' @keywords internal
#'
#' @details
#' The `pkg.globals$url` variable is a global variable that holds the Harmony API URL
#' to be used in the package. Once you set the URL using this function, it will be
#' used in all the relevant functions within the package.
#'
#' @examples
#' set_url("https://staging.harmonydata.org")
#' set_url() # Will set the URL back to the default "https://api.harmonydata.org"
#'
#' @export
set_url <- function(harmony_url = "https://api.harmonydata.org") {
  pkg.globals$url <- harmony_url
}
