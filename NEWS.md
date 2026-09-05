# harmonydata 0.3.3

## New Features
* `match_instruments()` gains `model` and `framework` arguments, so the LLM used
  for matching can be switched to any model the Harmony API offers, including the
  cloud-hosted OpenAI, Google and Azure OpenAI models (#22). `model` was
  previously only reachable through `...` and was always sent as a Hugging Face
  model
* The framework is inferred from the model name, so switching LLM usually only
  needs `model`
* New `list_models()` function, which reports the models the Harmony API you are
  connected to knows about and whether each one is available

## Improvements
* Failed API requests now raise an R error carrying the message returned by the
  API, instead of failing later with an unrelated error about the response

# harmonydata 0.3.2

## Bug Fixes
* Fixed error when matching an instrument against itself caused by 
  duplicate row names in the matches data frame (#22)

## Improvements
* Match matrix is now returned as a data frame instead of a list
* Response options similarity matrix is now returned as a data frame
* Added check for empty response options matrix to ensure stability
* Added warning for image compression when generating heatmaps
* Added supermarket data clustering example

## New Features
* Users can now select the LLM model used for matching via the `model` 
  parameter in `match_instruments()`
* Added support for additional clustering algorithms: `kmeans`, 
  `deterministic`, `hdbscan` in addition to the default 
  `affinity_propagation`

# harmonydata 0.3.1

* Previous CRAN release
