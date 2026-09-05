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

# The models the Harmony API knows about, and the framework each one belongs to.
# Used to fill in the framework when the user only names a model. The API is the
# authority on which of these are actually switched on for a given deployment,
# which is what list_models() reports.
harmony_model_frameworks <- c(
    "sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2" = "huggingface",
    "sentence-transformers/paraphrase-multilingual-mpnet-base-v2" = "huggingface",
    "harmonydata/mental_health_harmonisation_1" = "huggingface",
    "text-embedding-ada-002" = "openai",
    "text-embedding-3-large" = "openai",
    "textembedding-gecko@003" = "google",
    "textembedding-gecko-multilingual" = "google",
    "fds-text-embedding-3-large" = "azure_openai",
    "fds-text-embedding-ada-002" = "azure_openai"
)

#' List the Models Offered by the 'Harmony' API
#'
#' This function asks the 'Harmony' API which large language models it can use for
#' matching, and whether each one is currently available.
#'
#' @details
#' Availability is a property of the API you are talking to, not of this package.
#' The public 'Harmony' API only serves the open 'Hugging Face' models, because the
#' cloud-hosted models ('OpenAI', 'Google', 'Azure OpenAI') need API keys which the
#' deployment has to hold. To use those, run the
#' \href{https://github.com/harmonydata/harmonyapi}{'Harmony' API} yourself with the
#' relevant keys set (for example \code{OPENAI_API_KEY}) and point this package at
#' it with \code{\link{set_url}}. Models reported as available can be passed to
#' \code{\link{match_instruments}}.
#'
#' @return
#' A data frame with one row per model and the columns \code{framework},
#' \code{model} and \code{available}.
#'
#' @examples
#' \donttest{
#' models <- list_models()
#'
#' # the models you can actually match with right now
#' models[models$available, ]
#' }
#'
#' @importFrom httr GET add_headers content
#'
#' @export
#' @author Alex Nikic
list_models <- function() {
    headers <- c(
        `accept` = "application/json"
    )

    res <- httr::GET(url = paste0(pkg_globals$url, "/info/list-models"),
                     httr::add_headers(.headers = headers))

    harmony_stop_for_status(res)

    cont <- httr::content(res)

    data.frame(
        framework = vapply(cont, function(model) as.character(model$framework), character(1)),
        model = vapply(cont, function(model) as.character(model$model), character(1)),
        available = vapply(cont, function(model) isTRUE(model$available), logical(1)),
        stringsAsFactors = FALSE
    )
}

#' Work out Which Framework a Model Belongs To
#'
#' Returns the framework to send to the 'Harmony' API for a given model. An
#' explicit framework is always honoured; otherwise it is looked up from the
#' models the package knows about.
#'
#' @param model The name of the model.
#' @param framework The framework, or NULL to infer it from the model.
#' @keywords internal
#'
#' @return
#' A single character string naming the framework.
#'
#' @author Alex Nikic
resolve_framework <- function(model, framework = NULL) {
    if (!is.character(model) || length(model) != 1 || is.na(model) || !nzchar(model)) {
        stop("`model` must be a single non-empty character string.", call. = FALSE)
    }

    if (!is.null(framework)) {
        if (!is.character(framework) || length(framework) != 1 || is.na(framework) || !nzchar(framework)) {
            stop("`framework` must be a single non-empty character string, or NULL.", call. = FALSE)
        }
        return(framework)
    }

    known_framework <- unname(harmony_model_frameworks[model])
    if (!is.na(known_framework)) {
        return(known_framework)
    }

    warning(
        "Unknown model '", model, "', assuming it belongs to the 'huggingface' framework. ",
        "Pass `framework` explicitly if it does not, and see list_models() for the ",
        "models this API offers.",
        call. = FALSE
    )

    "huggingface"
}
