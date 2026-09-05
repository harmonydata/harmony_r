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


instrument <- create_instrument_from_list(list(
    "Feeling nervous, anxious, or on edge",
    "Trouble relaxing"
))

test_that("Framework is inferred from the model", {
    expect_equal(
        "huggingface",
        resolve_framework("sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2")
    )
    expect_equal("openai", resolve_framework("text-embedding-3-large"))
    expect_equal("google", resolve_framework("textembedding-gecko@003"))
    expect_equal("azure_openai", resolve_framework("fds-text-embedding-ada-002"))
})

test_that("An explicit framework overrides the inferred one", {
    expect_equal("openai", resolve_framework("my-own-deployment", framework = "openai"))
    expect_equal(
        "azure_openai",
        resolve_framework("text-embedding-3-large", framework = "azure_openai")
    )
})

test_that("An unknown model without a framework warns and falls back to huggingface", {
    expect_warning(framework <- resolve_framework("some/unlisted-model"), "Unknown model")
    expect_equal("huggingface", framework)
})

test_that("Invalid model and framework arguments are rejected", {
    expect_error(resolve_framework(NULL), "`model` must be")
    expect_error(resolve_framework(c("a", "b")), "`model` must be")
    expect_error(resolve_framework("text-embedding-3-large", framework = ""), "`framework` must be")
})

test_that("list_models reports the models the API offers", {
    skip_on_cran()

    models <- list_models()

    expect_s3_class(models, "data.frame")
    expect_equal(c("framework", "model", "available"), colnames(models))
    expect_lt(0, nrow(models))
    expect_type(models$available, "logical")

    # the default model of match_instruments has to be one the API can serve
    default_model <- models[
        models$model == "sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2",
    ]
    expect_equal(1, nrow(default_model))
    expect_true(default_model$available)
})

test_that("Matching with a non-default model works", {
    skip_on_cran()

    match <- match_instruments(
        instrument,
        model = "sentence-transformers/paraphrase-multilingual-mpnet-base-v2"
    )

    expect_equal(2, length(match$instruments[[1]]$questions))
    expect_equal(2, nrow(match$matches))
    expect_lt(0.99, match$matches[[1]][[1]])
    expect_lt(0.99, match$matches[[2]][[2]])
})

test_that("Asking for a model the API does not have raises an informative error", {
    skip_on_cran()

    expect_error(
        match_instruments(instrument, model = "not-a-real-model", framework = "huggingface"),
        "model"
    )
})
