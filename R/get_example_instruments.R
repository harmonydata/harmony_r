#source("./R/globals.R")
#' Retrieve Example Instruments from Harmony Data API
#'
#' This function retrieves example instruments from the Harmony Data API
#' using an HTTP POST request.
#'
#' @usage
#' get_example_instruments()
#'
#' @return
#' A JSON-formatted content representing example instruments retrieved
#' from the Harmony Data API.
#'
#' @examples
#' \dontrun{
#' # Load required libraries (httr) and call the function
#' require(httr)
#' instruments <- get_example_instruments()
#'
#' # Print the retrieved JSON content
#' print(instruments)
#' }
#'
#' @importFrom httr POST content
#'
#' @export
get_example_instruments <- function() {

  headers = c(
    `accept` = 'application/json',
    `content-type` = 'application/x-www-form-urlencoded'
  )

  res <- httr::POST(url = paste0(pkg.globals$url, '/text/examples'), httr::add_headers(.headers=headers))

  cont <- content(res)

  return(cont)
}
