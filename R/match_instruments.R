#source("./R/globals.R")

#' Match Instruments Function
#'
#' This function takes a list of instruments, converts it to a format acceptable by the database,
#' and matches the instruments using the Harmony Data API. It returns the matched instruments.
#'
#' @param instruments A list of instruments to be matched.
#'
#' @return A list of matched instruments.
#'
#' @examples
#' instruments_list <- list(
#'   list(
#'     instrument_id = "id1",
#'     instrument_name = "Instrument A",
#'     questions = list(
#'       list(
#'         question_text = "How old are you?",
#'         topics = c("Age", "Demographics"),
#'         source_page = "https://example.com/instrumentA"
#'       ),
#'       list(
#'         question_text = "What is your gender?",
#'         topics = c("Gender", "Demographics"),
#'         source_page = "https://example.com/instrumentA"
#'       )
#'     )
#'   ),
#'   list(
#'     instrument_id = "id2",
#'     instrument_name = "Instrument B",
#'     questions = list(
#'       list(
#'         question_text = "Do you smoke?",
#'         topics = c("Smoking", "Health"),
#'         source_page = "https://example.com/instrumentB"
#'       )
#'     )
#'   )
#' )
#' matched_instruments <- match_instruments(instruments_list)
#'
#' @import jsonlite
#' @import httr
#'
#' @references
#' For more information about the Harmony Data API, visit: \url{https://api.harmonydata.org}
#'
#' @export
match_instruments <- function(instruments){
#most of the work is simply creating the body
  #steps to create the body
  #take a list of instruments and convert it to a format that is acceptable by the databse
  headers = c(
    `accept` = "application/json",
    `Content-Type` = "application/json"
  )
  instruments = list(instruments)
  names(instruments) = "instruments"
  for (i in 1:length(instruments[["instruments"]])){
    instruments[["instruments"]][[i]][["study"]] = NULL
    instruments[["instruments"]][[i]][["sweep"]] = NULL
    instruments[["instruments"]][[i]][["metadata"]] = NULL
    #now clean the questions
    for (j in 1:length(instruments[["instruments"]][[i]][["questions"]])){
      instruments[["instruments"]][[i]][["questions"]][[j]][["instrument_id"]] = NULL
      instruments[["instruments"]][[i]][["questions"]][[j]][["instrument_name"]] = NULL
      instruments[["instruments"]][[i]][["questions"]][[j]][["topics_auto"]] = NULL
      instruments[["instruments"]][[i]][["questions"]][[j]][["nearest_match_from_mhc_auto"]] = NULL
    }
  }


  #from questions u need to delete anything after source page
  bod = jsonlite::toJSON(instruments, pretty=TRUE,auto_unbox=TRUE)
  res <- httr::POST(url = paste0(pkg.globals$url,'/text/match'), httr::add_headers(.headers=headers), body = bod, encode = "json")
  #contents
  conten = content(res)
  return(conten)
}

