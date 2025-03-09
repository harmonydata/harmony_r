# MIT License
#
# Copyright (c) 2023 Ulster University (https://www.ulster.ac.uk)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
#   The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#' Match Instruments Function
#'
#' This function takes a list of instruments, converts it to a format acceptable by the database,
#' and matches the instruments using the 'Harmony Data API'. It returns the matched instruments.
#'
#' @param instruments A list of instruments to be matched.
#' @param is_negate A boolean value to toggle question negation. Default is TRUE.
#' @return A list of matched instruments returned from the 'Harmony Data API'.
#'
#' @examples
#' \donttest{
#'
#'
#'
#' instrument_A <- create_instrument_from_list(list(
#'   "How old are you?",
#'   "What is your gender?"
#' ))
#'
#' instrument_B <- create_instrument_from_list(list(
#'   "Do you smoke?"
#' ))
#'
#' instruments <- list(instrument_A, instrument_B)
#'
#' matched_instruments <- match_instruments(instruments)
#' }
#'
#' @import jsonlite
#' @import httr
#'
#'
#' @export
#' @author Ulster University [cph]


match_instruments <- function(instruments, is_negate = TRUE) {
    #most of the work is simply creating the body
    #steps to create the body
    #take a list of instruments and convert it to a format that is acceptable by the databse
    headers <- c(
        `accept` = "application/json",
        `Content-Type` = "application/json"
    )

    if (! is.null(names(instruments))) { # the case where only one instrument is passed but not enclosed as a list
        instruments <- list("instruments" = list(instruments))
    } else { # the case where a list is passed
        instruments <- list("instruments" = instruments)
    }

    for (i in seq_along(instruments[["instruments"]])){
        instruments[["instruments"]][[i]][["study"]] <- NULL
        instruments[["instruments"]][[i]][["sweep"]] <- NULL
        instruments[["instruments"]][[i]][["metadata"]] <- NULL
        #now clean the questions
        for (j in seq_along(instruments[["instruments"]][[i]][["questions"]])) {
            instruments[["instruments"]][[i]][["questions"]][[j]][["instrument_name"]] <- NULL
            instruments[["instruments"]][[i]][["questions"]][[j]][["topics_auto"]] <- NULL
            instruments[["instruments"]][[i]][["questions"]][[j]][["nearest_match_from_mhc_auto"]] <- NULL
        }
    }


    #from questions u need to delete anything after source page
    bod <- jsonlite::toJSON(instruments, pretty = TRUE, auto_unbox = TRUE)
    res <- httr::POST(url = paste0(pkg_globals$url, "/text/match?is_negate=", is_negate),
                      httr::add_headers(.headers = headers), body = bod, encode = "json")
    #contents
    conten <- content(res)

    # for the clusters, we need to add 1 to the item_ids since R indexes from 1 (whereas python indexes from 0)
    for (i in seq_along(conten$clusters)) {
        for (j in seq_along(conten$clusters[[i]]$item_ids)) {
            conten$clusters[[i]]$item_ids[[j]] <- conten$clusters[[i]]$item_ids[[j]] + 1
        }

        # we also add 1 to each cluster_id
        conten$clusters[[i]]$cluster_id <- conten$clusters[[i]]$cluster_id + 1
    }

    return(conten)
}
