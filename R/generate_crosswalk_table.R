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

#' Generate Crosswalk Table Function
#'
#' This function takes a matched instruments object from the match_instruments function, and a similarity threshold,
#' and returns a list of all questions with similarity greather than the threshold.
#'
#' @param match A matched instruments object.
#' @param threshold A similarity threshold.
#' @param within_instrument_matches A boolean indicating whether to include matches within the same instrument.
#' @return A list of all questions with similarity greather than the threshold.'.
#'
#' @examples
#' \donttest{
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
#' crosswalk_table = generate_crosswalk_table(matched_instruments, 0.7)
#' }
#'
#'
#' @references
#' For more information about the 'Harmony Data API', visit: \url{https://api.harmonydata.org/docs}
#'
#' @export
#' @author Alex Nikic

library(assertthat)

generate_crosswalk_table = function(match, threshold, within_instrument_matches=TRUE) {
    # match$questions are the questions
    # match$matches is the similarity matrix

    matching_pairs = data.frame(
        pair_name = character(),        # Name of the survey pair
        question1_no = character(),     # ID of question from first survey
        question1_text = character(),   # Text of question from first survey
        question2_no = character(),     # ID of question from second survey
        question2_text = character(),   # Text of question from second survey
        match_score = numeric()         # Similarity score between the questions
    )

    # iterate through all pairs of questions
    for (i in seq_along(match$questions)) {
        for (j in seq_along(match$questions)) {
            # check for non-dupe and similarity above threshold # nolint
            if (j > i & match$matches[[i]][[j]] > threshold) {

                # if within_instrument_matches is FALSE, skip if the questions are from the same instrument
                if (!within_instrument_matches) {
                    # ensure instrument_ids are not NULL
                    assert_that(!is.null(match$questions[[i]]$instrument_id))
                    assert_that(!is.null(match$questions[[j]]$instrument_id))

                    if(match$questions[[i]]$instrument_id == match$questions[[j]]$instrument_id) {
                        next
                    }
                }

                # append to dataframe
                matching_pairs = rbind(matching_pairs, data.frame(
                    pair_name = paste(i, j, sep="_"),
                    question1_no = match$questions[[i]]$question_no,
                    question1_text =match$questions[[i]]$question_text,
                    question2_no = match$questions[[j]]$question_no,   
                    question2_text = match$questions[[j]]$question_text,
                    match_score = as.numeric(match$matches[[i]][[j]])
                ))
            }
        }
    }

    matching_pairs
}