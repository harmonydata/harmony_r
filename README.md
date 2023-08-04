
<!-- README.md is generated from README.Rmd. Please edit that file -->

# harmonydata

<!-- badges: start -->
<!-- badges: end -->

The goal of harmonydata is to …

## Getting started with the Harmony R library

### Installing R library

You can install the development version of harmonydata from
[GitHub](https://github.com/harmonydata/harmony_r) with:

``` r
# install.packages("devtools")
devtools::install_github("harmonydata/harmony_r")
```

## Parsing a raw file into an Instrument

If you want to read in a raw (unstructured) PDF or Excel file, you can
do this via a POST request to the REST API. This will convert the file
into an Instrument object in JSON.It returns the instrument as a list.

``` r
library(harmonydata)
instrument = load_instruments_from_file(path = "examples/GAD-7.pdf")
instrument
#> [[1]]
#> [[1]]$file_id
#> [1] "d39f31718513413fbfc620c6b6135d0c"
#> 
#> [[1]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> [[1]]$instrument_name
#> [1] "GAD-7_Anxiety-updated_0.pdf"
#> 
#> [[1]]$file_name
#> [1] "GAD-7_Anxiety-updated_0.pdf"
#> 
#> [[1]]$file_type
#> [1] "pdf"
#> 
#> [[1]]$file_section
#> [1] ""
#> 
#> [[1]]$study
#> NULL
#> 
#> [[1]]$sweep
#> NULL
#> 
#> [[1]]$metadata
#> NULL
#> 
#> [[1]]$language
#> [1] "en"
#> 
#> [[1]]$questions
#> [[1]]$questions[[1]]
#> [[1]]$questions[[1]]$question_no
#> [1] "1"
#> 
#> [[1]]$questions[[1]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[1]]$question_text
#> [1] "Feeling nervous, anxious, or on edge"
#> 
#> [[1]]$questions[[1]]$options
#> list()
#> 
#> [[1]]$questions[[1]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[1]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[1]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[1]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[1]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[2]]
#> [[1]]$questions[[2]]$question_no
#> [1] "2"
#> 
#> [[1]]$questions[[2]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[2]]$question_text
#> [1] "Not being able to stop or control worrying"
#> 
#> [[1]]$questions[[2]]$options
#> list()
#> 
#> [[1]]$questions[[2]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[2]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[2]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[2]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[2]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[3]]
#> [[1]]$questions[[3]]$question_no
#> [1] "3"
#> 
#> [[1]]$questions[[3]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[3]]$question_text
#> [1] "Worrying too much about different things"
#> 
#> [[1]]$questions[[3]]$options
#> list()
#> 
#> [[1]]$questions[[3]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[3]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[3]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[3]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[3]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[4]]
#> [[1]]$questions[[4]]$question_no
#> [1] "4"
#> 
#> [[1]]$questions[[4]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[4]]$question_text
#> [1] "Trouble relaxing"
#> 
#> [[1]]$questions[[4]]$options
#> list()
#> 
#> [[1]]$questions[[4]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[4]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[4]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[4]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[4]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[5]]
#> [[1]]$questions[[5]]$question_no
#> [1] "5"
#> 
#> [[1]]$questions[[5]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[5]]$question_text
#> [1] "Being so restless that it is hard to sit still"
#> 
#> [[1]]$questions[[5]]$options
#> list()
#> 
#> [[1]]$questions[[5]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[5]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[5]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[5]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[5]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[6]]
#> [[1]]$questions[[6]]$question_no
#> [1] "6"
#> 
#> [[1]]$questions[[6]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[6]]$question_text
#> [1] "Becoming easily annoyed or irritable"
#> 
#> [[1]]$questions[[6]]$options
#> list()
#> 
#> [[1]]$questions[[6]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[6]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[6]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[6]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[6]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[7]]
#> [[1]]$questions[[7]]$question_no
#> [1] "7"
#> 
#> [[1]]$questions[[7]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[7]]$question_text
#> [1] "Feeling afraid, as if something awful might happen"
#> 
#> [[1]]$questions[[7]]$options
#> list()
#> 
#> [[1]]$questions[[7]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[7]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[7]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[7]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[7]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[8]]
#> [[1]]$questions[[8]]$question_no
#> [1] "8"
#> 
#> [[1]]$questions[[8]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[8]]$question_text
#> [1] "If you checked any problems, how difficult have they made it for you to do your work, take care of things at home, or get along with other people?"
#> 
#> [[1]]$questions[[8]]$options
#> list()
#> 
#> [[1]]$questions[[8]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[8]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[8]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[8]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[8]]$nearest_match_from_mhc_auto
#> NULL
```

You can also input a url containing the questionnaire.

``` r
instrument_2 = load_instruments_from_file("https://medfam.umontreal.ca/wp-content/uploads/sites/16/GAD-7-fran%C3%A7ais.pdf") 
instrument_2
#> [[1]]
#> [[1]]$file_id
#> [1] "d39f31718513413fbfc620c6b6135d0c"
#> 
#> [[1]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> [[1]]$instrument_name
#> [1] "GAD-7.pdf"
#> 
#> [[1]]$file_name
#> [1] "GAD-7.pdf"
#> 
#> [[1]]$file_type
#> [1] "pdf"
#> 
#> [[1]]$file_section
#> [1] ""
#> 
#> [[1]]$study
#> NULL
#> 
#> [[1]]$sweep
#> NULL
#> 
#> [[1]]$metadata
#> NULL
#> 
#> [[1]]$language
#> [1] "fr"
#> 
#> [[1]]$questions
#> [[1]]$questions[[1]]
#> [[1]]$questions[[1]]$question_no
#> [1] "1"
#> 
#> [[1]]$questions[[1]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[1]]$question_text
#> [1] "Sentiment de nervosité, d’anxiété ou de tension"
#> 
#> [[1]]$questions[[1]]$options
#> list()
#> 
#> [[1]]$questions[[1]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[1]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[1]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[1]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[1]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[2]]
#> [[1]]$questions[[2]]$question_no
#> [1] "2"
#> 
#> [[1]]$questions[[2]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[2]]$question_text
#> [1] "Incapable d’arrêter de vous inquiéter ou de contrôler vos inquiétudes"
#> 
#> [[1]]$questions[[2]]$options
#> list()
#> 
#> [[1]]$questions[[2]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[2]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[2]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[2]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[2]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[3]]
#> [[1]]$questions[[3]]$question_no
#> [1] "3"
#> 
#> [[1]]$questions[[3]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[3]]$question_text
#> [1] "Inquiétudes excessives à propos de tout et de rien"
#> 
#> [[1]]$questions[[3]]$options
#> list()
#> 
#> [[1]]$questions[[3]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[3]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[3]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[3]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[3]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[4]]
#> [[1]]$questions[[4]]$question_no
#> [1] "5"
#> 
#> [[1]]$questions[[4]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[4]]$question_text
#> [1] "Agitation telle qu’il est difficile de rester tranquille"
#> 
#> [[1]]$questions[[4]]$options
#> list()
#> 
#> [[1]]$questions[[4]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[4]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[4]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[4]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[4]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[5]]
#> [[1]]$questions[[5]]$question_no
#> [1] "6"
#> 
#> [[1]]$questions[[5]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[5]]$question_text
#> [1] "Devenir facilement contrarié(e) ou irritable"
#> 
#> [[1]]$questions[[5]]$options
#> list()
#> 
#> [[1]]$questions[[5]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[5]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[5]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[5]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[5]]$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> [[1]]$questions[[6]]
#> [[1]]$questions[[6]]$question_no
#> [1] "7"
#> 
#> [[1]]$questions[[6]]$question_intro
#> [1] ""
#> 
#> [[1]]$questions[[6]]$question_text
#> [1] "Avoir peur que quelque chose d’épouvantable puisse arriver"
#> 
#> [[1]]$questions[[6]]$options
#> list()
#> 
#> [[1]]$questions[[6]]$source_page
#> [1] 0
#> 
#> [[1]]$questions[[6]]$instrument_id
#> NULL
#> 
#> [[1]]$questions[[6]]$instrument_name
#> NULL
#> 
#> [[1]]$questions[[6]]$topics_auto
#> NULL
#> 
#> [[1]]$questions[[6]]$nearest_match_from_mhc_auto
#> NULL
```

## Matching instruments

You can get a list containing the results of the match.

``` r
instruments = append(instrument, instrument_2)
match = match_instruments(instruments)
match
#> $questions
#> $questions[[1]]
#> $questions[[1]]$question_no
#> [1] "1"
#> 
#> $questions[[1]]$question_intro
#> [1] ""
#> 
#> $questions[[1]]$question_text
#> [1] "Feeling nervous, anxious, or on edge"
#> 
#> $questions[[1]]$options
#> list()
#> 
#> $questions[[1]]$source_page
#> [1] 0
#> 
#> $questions[[1]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[1]]$instrument_name
#> NULL
#> 
#> $questions[[1]]$topics_auto
#> $questions[[1]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto
#> $questions[[1]]$nearest_match_from_mhc_auto$question_no
#> [1] "1"
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$question_text
#> [1] "Feeling nervous, anxious or on edge"
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$options
#> $questions[[1]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "GAD-7 Generalised Anxiety Disorder Assessment (7-item) (GAD-7)"
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[1]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[2]]
#> $questions[[2]]$question_no
#> [1] "2"
#> 
#> $questions[[2]]$question_intro
#> [1] ""
#> 
#> $questions[[2]]$question_text
#> [1] "Not being able to stop or control worrying"
#> 
#> $questions[[2]]$options
#> list()
#> 
#> $questions[[2]]$source_page
#> [1] 0
#> 
#> $questions[[2]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[2]]$instrument_name
#> NULL
#> 
#> $questions[[2]]$topics_auto
#> $questions[[2]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto
#> $questions[[2]]$nearest_match_from_mhc_auto$question_no
#> [1] "2"
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$question_text
#> [1] "Not being able to stop or control worrying"
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$options
#> $questions[[2]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "Generalized Anxiety Disorder 2-item (GAD-2)"
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[2]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[3]]
#> $questions[[3]]$question_no
#> [1] "3"
#> 
#> $questions[[3]]$question_intro
#> [1] ""
#> 
#> $questions[[3]]$question_text
#> [1] "Worrying too much about different things"
#> 
#> $questions[[3]]$options
#> list()
#> 
#> $questions[[3]]$source_page
#> [1] 0
#> 
#> $questions[[3]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[3]]$instrument_name
#> NULL
#> 
#> $questions[[3]]$topics_auto
#> $questions[[3]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto
#> $questions[[3]]$nearest_match_from_mhc_auto$question_no
#> [1] "3"
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$question_text
#> [1] "Worrying too much about different things"
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$options
#> $questions[[3]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "GAD-7 Generalised Anxiety Disorder Assessment (7-item) (GAD-7)"
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[3]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[4]]
#> $questions[[4]]$question_no
#> [1] "4"
#> 
#> $questions[[4]]$question_intro
#> [1] ""
#> 
#> $questions[[4]]$question_text
#> [1] "Trouble relaxing"
#> 
#> $questions[[4]]$options
#> list()
#> 
#> $questions[[4]]$source_page
#> [1] 0
#> 
#> $questions[[4]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[4]]$instrument_name
#> NULL
#> 
#> $questions[[4]]$topics_auto
#> $questions[[4]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto
#> $questions[[4]]$nearest_match_from_mhc_auto$question_no
#> [1] "4"
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$question_text
#> [1] "Trouble relaxing"
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$options
#> $questions[[4]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "GAD-7 Generalised Anxiety Disorder Assessment (7-item) (GAD-7)"
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[4]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[5]]
#> $questions[[5]]$question_no
#> [1] "5"
#> 
#> $questions[[5]]$question_intro
#> [1] ""
#> 
#> $questions[[5]]$question_text
#> [1] "Being so restless that it is hard to sit still"
#> 
#> $questions[[5]]$options
#> list()
#> 
#> $questions[[5]]$source_page
#> [1] 0
#> 
#> $questions[[5]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[5]]$instrument_name
#> NULL
#> 
#> $questions[[5]]$topics_auto
#> $questions[[5]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto
#> $questions[[5]]$nearest_match_from_mhc_auto$question_no
#> [1] "5"
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$question_text
#> [1] "Being so restless that it is hard to sit still"
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$options
#> $questions[[5]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "GAD-7 Generalised Anxiety Disorder Assessment (7-item) (GAD-7)"
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[5]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[6]]
#> $questions[[6]]$question_no
#> [1] "6"
#> 
#> $questions[[6]]$question_intro
#> [1] ""
#> 
#> $questions[[6]]$question_text
#> [1] "Becoming easily annoyed or irritable"
#> 
#> $questions[[6]]$options
#> list()
#> 
#> $questions[[6]]$source_page
#> [1] 0
#> 
#> $questions[[6]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[6]]$instrument_name
#> NULL
#> 
#> $questions[[6]]$topics_auto
#> $questions[[6]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto
#> $questions[[6]]$nearest_match_from_mhc_auto$question_no
#> [1] "6"
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$question_text
#> [1] "Becoming easily annoyed or irritable"
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$options
#> $questions[[6]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "GAD-7 Generalised Anxiety Disorder Assessment (7-item) (GAD-7)"
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[6]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[7]]
#> $questions[[7]]$question_no
#> [1] "7"
#> 
#> $questions[[7]]$question_intro
#> [1] ""
#> 
#> $questions[[7]]$question_text
#> [1] "Feeling afraid, as if something awful might happen"
#> 
#> $questions[[7]]$options
#> list()
#> 
#> $questions[[7]]$source_page
#> [1] 0
#> 
#> $questions[[7]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[7]]$instrument_name
#> NULL
#> 
#> $questions[[7]]$topics_auto
#> $questions[[7]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto
#> $questions[[7]]$nearest_match_from_mhc_auto$question_no
#> [1] "7"
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$question_text
#> [1] "Feeling afraid as if something awful might happen"
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$options
#> $questions[[7]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "GAD-7 Generalised Anxiety Disorder Assessment (7-item) (GAD-7)"
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[7]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[8]]
#> $questions[[8]]$question_no
#> [1] "8"
#> 
#> $questions[[8]]$question_intro
#> [1] ""
#> 
#> $questions[[8]]$question_text
#> [1] "If you checked any problems, how difficult have they made it for you to do your work, take care of things at home, or get along with other people?"
#> 
#> $questions[[8]]$options
#> list()
#> 
#> $questions[[8]]$source_page
#> [1] 0
#> 
#> $questions[[8]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[8]]$instrument_name
#> NULL
#> 
#> $questions[[8]]$topics_auto
#> $questions[[8]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto
#> $questions[[8]]$nearest_match_from_mhc_auto$question_no
#> [1] "9"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$question_text
#> [1] "How difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$options
#> $questions[[8]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Q1-8"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Not at all"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "Several days"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "More than half the days"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$options[[5]]
#> [1] "Nearly every day"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$options[[6]]
#> [1] "Q9"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$options[[7]]
#> [1] "Not difficult at all"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$options[[8]]
#> [1] "Somewhat difficult"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$options[[9]]
#> [1] "Very difficult"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$options[[10]]
#> [1] "Extremely difficult"
#> 
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "Patient Health Questionnaire (8-item + impact question) (PHQ-8)"
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[8]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[9]]
#> $questions[[9]]$question_no
#> [1] "1"
#> 
#> $questions[[9]]$question_intro
#> [1] ""
#> 
#> $questions[[9]]$question_text
#> [1] "Sentiment de nervosité, d’anxiété ou de tension"
#> 
#> $questions[[9]]$options
#> list()
#> 
#> $questions[[9]]$source_page
#> [1] 0
#> 
#> $questions[[9]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[9]]$instrument_name
#> NULL
#> 
#> $questions[[9]]$topics_auto
#> $questions[[9]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto
#> $questions[[9]]$nearest_match_from_mhc_auto$question_no
#> [1] "1"
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$question_text
#> [1] "Feeling nervous, anxious or on edge"
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$options
#> $questions[[9]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "GAD-7 Generalised Anxiety Disorder Assessment (7-item) (GAD-7)"
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[9]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[10]]
#> $questions[[10]]$question_no
#> [1] "2"
#> 
#> $questions[[10]]$question_intro
#> [1] ""
#> 
#> $questions[[10]]$question_text
#> [1] "Incapable d’arrêter de vous inquiéter ou de contrôler vos inquiétudes"
#> 
#> $questions[[10]]$options
#> list()
#> 
#> $questions[[10]]$source_page
#> [1] 0
#> 
#> $questions[[10]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[10]]$instrument_name
#> NULL
#> 
#> $questions[[10]]$topics_auto
#> $questions[[10]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto
#> $questions[[10]]$nearest_match_from_mhc_auto$question_no
#> [1] "2"
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$question_text
#> [1] "Not being able to stop or control worrying"
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$options
#> $questions[[10]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "Generalized Anxiety Disorder 2-item (GAD-2)"
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[10]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[11]]
#> $questions[[11]]$question_no
#> [1] "3"
#> 
#> $questions[[11]]$question_intro
#> [1] ""
#> 
#> $questions[[11]]$question_text
#> [1] "Inquiétudes excessives à propos de tout et de rien"
#> 
#> $questions[[11]]$options
#> list()
#> 
#> $questions[[11]]$source_page
#> [1] 0
#> 
#> $questions[[11]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[11]]$instrument_name
#> NULL
#> 
#> $questions[[11]]$topics_auto
#> $questions[[11]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto
#> $questions[[11]]$nearest_match_from_mhc_auto$question_no
#> [1] "7"
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$question_text
#> [1] "Worries about many things"
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$options
#> $questions[[11]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Q1-14"
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Never"
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "Sometimes"
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Frequently"
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$options[[5]]
#> [1] "Q15, 16"
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$options[[6]]
#> [1] "Yes/No items"
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$options[[7]]
#> [1] "Q15a, 16a"
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$options[[8]]
#> [1] "Free response text"
#> 
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "Rutter Parent Questionnaire (14-item + history questions)"
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[11]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[12]]
#> $questions[[12]]$question_no
#> [1] "5"
#> 
#> $questions[[12]]$question_intro
#> [1] ""
#> 
#> $questions[[12]]$question_text
#> [1] "Agitation telle qu’il est difficile de rester tranquille"
#> 
#> $questions[[12]]$options
#> list()
#> 
#> $questions[[12]]$source_page
#> [1] 0
#> 
#> $questions[[12]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[12]]$instrument_name
#> NULL
#> 
#> $questions[[12]]$topics_auto
#> $questions[[12]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto
#> $questions[[12]]$nearest_match_from_mhc_auto$question_no
#> [1] "14"
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$question_text
#> [1] "Feel indecisive"
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$options
#> $questions[[12]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Somewhat"
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "Moderately so"
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Very much so"
#> 
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "State Trait Anxiety Index (20 items) (STAI) (State items only)"
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[12]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[13]]
#> $questions[[13]]$question_no
#> [1] "6"
#> 
#> $questions[[13]]$question_intro
#> [1] ""
#> 
#> $questions[[13]]$question_text
#> [1] "Devenir facilement contrarié(e) ou irritable"
#> 
#> $questions[[13]]$options
#> list()
#> 
#> $questions[[13]]$source_page
#> [1] 0
#> 
#> $questions[[13]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[13]]$instrument_name
#> NULL
#> 
#> $questions[[13]]$topics_auto
#> $questions[[13]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto
#> $questions[[13]]$nearest_match_from_mhc_auto$question_no
#> [1] "6"
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$question_text
#> [1] "Becoming easily annoyed or irritable"
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$options
#> $questions[[13]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "GAD-7 Generalised Anxiety Disorder Assessment (7-item) (GAD-7)"
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[13]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> $questions[[14]]
#> $questions[[14]]$question_no
#> [1] "7"
#> 
#> $questions[[14]]$question_intro
#> [1] ""
#> 
#> $questions[[14]]$question_text
#> [1] "Avoir peur que quelque chose d’épouvantable puisse arriver"
#> 
#> $questions[[14]]$options
#> list()
#> 
#> $questions[[14]]$source_page
#> [1] 0
#> 
#> $questions[[14]]$instrument_id
#> [1] "d39f31718513413fbfc620c6b6135d0c_0"
#> 
#> $questions[[14]]$instrument_name
#> NULL
#> 
#> $questions[[14]]$topics_auto
#> $questions[[14]]$topics_auto[[1]]
#> [1] "anxiety"
#> 
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto
#> $questions[[14]]$nearest_match_from_mhc_auto$question_no
#> [1] "7"
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$question_intro
#> NULL
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$question_text
#> [1] "Feeling afraid as if something awful might happen"
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$options
#> $questions[[14]]$nearest_match_from_mhc_auto$options[[1]]
#> [1] "Not at all"
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$options[[2]]
#> [1] "Several days"
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$options[[3]]
#> [1] "More than half the days"
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$options[[4]]
#> [1] "Nearly every day"
#> 
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$source_page
#> [1] 0
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$instrument_id
#> NULL
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$instrument_name
#> [1] "GAD-7 Generalised Anxiety Disorder Assessment (7-item) (GAD-7)"
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$topics_auto
#> NULL
#> 
#> $questions[[14]]$nearest_match_from_mhc_auto$nearest_match_from_mhc_auto
#> NULL
#> 
#> 
#> 
#> 
#> $matches
#> $matches[[1]]
#> $matches[[1]][[1]]
#> [1] 1
#> 
#> $matches[[1]][[2]]
#> [1] 0.5830622
#> 
#> $matches[[1]][[3]]
#> [1] 0.6179736
#> 
#> $matches[[1]][[4]]
#> [1] 0.4357673
#> 
#> $matches[[1]][[5]]
#> [1] 0.4945896
#> 
#> $matches[[1]][[6]]
#> [1] 0.5529693
#> 
#> $matches[[1]][[7]]
#> [1] 0.7089151
#> 
#> $matches[[1]][[8]]
#> [1] 0.2380927
#> 
#> $matches[[1]][[9]]
#> [1] 0.894249
#> 
#> $matches[[1]][[10]]
#> [1] 0.66348
#> 
#> $matches[[1]][[11]]
#> [1] 0.520991
#> 
#> $matches[[1]][[12]]
#> [1] 0.5109949
#> 
#> $matches[[1]][[13]]
#> [1] 0.5931827
#> 
#> $matches[[1]][[14]]
#> [1] 0.4505575
#> 
#> 
#> $matches[[2]]
#> $matches[[2]][[1]]
#> [1] 0.5830622
#> 
#> $matches[[2]][[2]]
#> [1] 1
#> 
#> $matches[[2]][[3]]
#> [1] 0.7629658
#> 
#> $matches[[2]][[4]]
#> [1] 0.4594004
#> 
#> $matches[[2]][[5]]
#> [1] 0.4558097
#> 
#> $matches[[2]][[6]]
#> [1] -0.4613766
#> 
#> $matches[[2]][[7]]
#> [1] 0.5173815
#> 
#> $matches[[2]][[8]]
#> [1] -0.2566256
#> 
#> $matches[[2]][[9]]
#> [1] 0.6049301
#> 
#> $matches[[2]][[10]]
#> [1] 0.8852125
#> 
#> $matches[[2]][[11]]
#> [1] 0.6571534
#> 
#> $matches[[2]][[12]]
#> [1] 0.5615149
#> 
#> $matches[[2]][[13]]
#> [1] -0.4793222
#> 
#> $matches[[2]][[14]]
#> [1] -0.4719153
#> 
#> 
#> $matches[[3]]
#> $matches[[3]][[1]]
#> [1] 0.6179736
#> 
#> $matches[[3]][[2]]
#> [1] 0.7629658
#> 
#> $matches[[3]][[3]]
#> [1] 1
#> 
#> $matches[[3]][[4]]
#> [1] 0.3895614
#> 
#> $matches[[3]][[5]]
#> [1] 0.3963558
#> 
#> $matches[[3]][[6]]
#> [1] 0.4716267
#> 
#> $matches[[3]][[7]]
#> [1] 0.6041647
#> 
#> $matches[[3]][[8]]
#> [1] 0.2892596
#> 
#> $matches[[3]][[9]]
#> [1] 0.6280157
#> 
#> $matches[[3]][[10]]
#> [1] 0.7662809
#> 
#> $matches[[3]][[11]]
#> [1] 0.7426492
#> 
#> $matches[[3]][[12]]
#> [1] 0.5106027
#> 
#> $matches[[3]][[13]]
#> [1] 0.4637057
#> 
#> $matches[[3]][[14]]
#> [1] 0.5593852
#> 
#> 
#> $matches[[4]]
#> $matches[[4]][[1]]
#> [1] 0.4357673
#> 
#> $matches[[4]][[2]]
#> [1] 0.4594004
#> 
#> $matches[[4]][[3]]
#> [1] 0.3895614
#> 
#> $matches[[4]][[4]]
#> [1] 1
#> 
#> $matches[[4]][[5]]
#> [1] 0.6178266
#> 
#> $matches[[4]][[6]]
#> [1] 0.3250092
#> 
#> $matches[[4]][[7]]
#> [1] 0.3117915
#> 
#> $matches[[4]][[8]]
#> [1] 0.1839352
#> 
#> $matches[[4]][[9]]
#> [1] 0.4527453
#> 
#> $matches[[4]][[10]]
#> [1] 0.4667662
#> 
#> $matches[[4]][[11]]
#> [1] 0.4177579
#> 
#> $matches[[4]][[12]]
#> [1] 0.5440194
#> 
#> $matches[[4]][[13]]
#> [1] 0.3540848
#> 
#> $matches[[4]][[14]]
#> [1] 0.2137842
#> 
#> 
#> $matches[[5]]
#> $matches[[5]][[1]]
#> [1] 0.4945896
#> 
#> $matches[[5]][[2]]
#> [1] 0.4558097
#> 
#> $matches[[5]][[3]]
#> [1] 0.3963558
#> 
#> $matches[[5]][[4]]
#> [1] 0.6178266
#> 
#> $matches[[5]][[5]]
#> [1] 1
#> 
#> $matches[[5]][[6]]
#> [1] 0.3895387
#> 
#> $matches[[5]][[7]]
#> [1] 0.4360376
#> 
#> $matches[[5]][[8]]
#> [1] 0.2008711
#> 
#> $matches[[5]][[9]]
#> [1] 0.4596621
#> 
#> $matches[[5]][[10]]
#> [1] 0.4473514
#> 
#> $matches[[5]][[11]]
#> [1] 0.3133177
#> 
#> $matches[[5]][[12]]
#> [1] 0.6250209
#> 
#> $matches[[5]][[13]]
#> [1] 0.4114663
#> 
#> $matches[[5]][[14]]
#> [1] 0.2880645
#> 
#> 
#> $matches[[6]]
#> $matches[[6]][[1]]
#> [1] 0.5529693
#> 
#> $matches[[6]][[2]]
#> [1] -0.4613766
#> 
#> $matches[[6]][[3]]
#> [1] 0.4716267
#> 
#> $matches[[6]][[4]]
#> [1] 0.3250092
#> 
#> $matches[[6]][[5]]
#> [1] 0.3895387
#> 
#> $matches[[6]][[6]]
#> [1] 1
#> 
#> $matches[[6]][[7]]
#> [1] 0.4438163
#> 
#> $matches[[6]][[8]]
#> [1] 0.3468708
#> 
#> $matches[[6]][[9]]
#> [1] 0.5644367
#> 
#> $matches[[6]][[10]]
#> [1] 0.5049124
#> 
#> $matches[[6]][[11]]
#> [1] 0.4382445
#> 
#> $matches[[6]][[12]]
#> [1] 0.5719854
#> 
#> $matches[[6]][[13]]
#> [1] 0.9502258
#> 
#> $matches[[6]][[14]]
#> [1] 0.3653328
#> 
#> 
#> $matches[[7]]
#> $matches[[7]][[1]]
#> [1] 0.7089151
#> 
#> $matches[[7]][[2]]
#> [1] 0.5173815
#> 
#> $matches[[7]][[3]]
#> [1] 0.6041647
#> 
#> $matches[[7]][[4]]
#> [1] 0.3117915
#> 
#> $matches[[7]][[5]]
#> [1] 0.4360376
#> 
#> $matches[[7]][[6]]
#> [1] 0.4438163
#> 
#> $matches[[7]][[7]]
#> [1] 1
#> 
#> $matches[[7]][[8]]
#> [1] -0.1535626
#> 
#> $matches[[7]][[9]]
#> [1] 0.612879
#> 
#> $matches[[7]][[10]]
#> [1] 0.5411659
#> 
#> $matches[[7]][[11]]
#> [1] 0.4984144
#> 
#> $matches[[7]][[12]]
#> [1] 0.5295711
#> 
#> $matches[[7]][[13]]
#> [1] 0.5013312
#> 
#> $matches[[7]][[14]]
#> [1] 0.8445889
#> 
#> 
#> $matches[[8]]
#> $matches[[8]][[1]]
#> [1] 0.2380927
#> 
#> $matches[[8]][[2]]
#> [1] -0.2566256
#> 
#> $matches[[8]][[3]]
#> [1] 0.2892596
#> 
#> $matches[[8]][[4]]
#> [1] 0.1839352
#> 
#> $matches[[8]][[5]]
#> [1] 0.2008711
#> 
#> $matches[[8]][[6]]
#> [1] 0.3468708
#> 
#> $matches[[8]][[7]]
#> [1] -0.1535626
#> 
#> $matches[[8]][[8]]
#> [1] 1
#> 
#> $matches[[8]][[9]]
#> [1] 0.2341753
#> 
#> $matches[[8]][[10]]
#> [1] 0.3289152
#> 
#> $matches[[8]][[11]]
#> [1] 0.3063853
#> 
#> $matches[[8]][[12]]
#> [1] 0.3237803
#> 
#> $matches[[8]][[13]]
#> [1] 0.3217045
#> 
#> $matches[[8]][[14]]
#> [1] 0.1625244
#> 
#> 
#> $matches[[9]]
#> $matches[[9]][[1]]
#> [1] 0.894249
#> 
#> $matches[[9]][[2]]
#> [1] 0.6049301
#> 
#> $matches[[9]][[3]]
#> [1] 0.6280157
#> 
#> $matches[[9]][[4]]
#> [1] 0.4527453
#> 
#> $matches[[9]][[5]]
#> [1] 0.4596621
#> 
#> $matches[[9]][[6]]
#> [1] 0.5644367
#> 
#> $matches[[9]][[7]]
#> [1] 0.612879
#> 
#> $matches[[9]][[8]]
#> [1] 0.2341753
#> 
#> $matches[[9]][[9]]
#> [1] 1
#> 
#> $matches[[9]][[10]]
#> [1] 0.7126289
#> 
#> $matches[[9]][[11]]
#> [1] 0.6125201
#> 
#> $matches[[9]][[12]]
#> [1] 0.5177428
#> 
#> $matches[[9]][[13]]
#> [1] 0.6094119
#> 
#> $matches[[9]][[14]]
#> [1] 0.4456488
#> 
#> 
#> $matches[[10]]
#> $matches[[10]][[1]]
#> [1] 0.66348
#> 
#> $matches[[10]][[2]]
#> [1] 0.8852125
#> 
#> $matches[[10]][[3]]
#> [1] 0.7662809
#> 
#> $matches[[10]][[4]]
#> [1] 0.4667662
#> 
#> $matches[[10]][[5]]
#> [1] 0.4473514
#> 
#> $matches[[10]][[6]]
#> [1] 0.5049124
#> 
#> $matches[[10]][[7]]
#> [1] 0.5411659
#> 
#> $matches[[10]][[8]]
#> [1] 0.3289152
#> 
#> $matches[[10]][[9]]
#> [1] 0.7126289
#> 
#> $matches[[10]][[10]]
#> [1] 1
#> 
#> $matches[[10]][[11]]
#> [1] 0.7615881
#> 
#> $matches[[10]][[12]]
#> [1] 0.6538956
#> 
#> $matches[[10]][[13]]
#> [1] 0.5488659
#> 
#> $matches[[10]][[14]]
#> [1] 0.5390011
#> 
#> 
#> $matches[[11]]
#> $matches[[11]][[1]]
#> [1] 0.520991
#> 
#> $matches[[11]][[2]]
#> [1] 0.6571534
#> 
#> $matches[[11]][[3]]
#> [1] 0.7426492
#> 
#> $matches[[11]][[4]]
#> [1] 0.4177579
#> 
#> $matches[[11]][[5]]
#> [1] 0.3133177
#> 
#> $matches[[11]][[6]]
#> [1] 0.4382445
#> 
#> $matches[[11]][[7]]
#> [1] 0.4984144
#> 
#> $matches[[11]][[8]]
#> [1] 0.3063853
#> 
#> $matches[[11]][[9]]
#> [1] 0.6125201
#> 
#> $matches[[11]][[10]]
#> [1] 0.7615881
#> 
#> $matches[[11]][[11]]
#> [1] 1
#> 
#> $matches[[11]][[12]]
#> [1] 0.5298004
#> 
#> $matches[[11]][[13]]
#> [1] 0.4493773
#> 
#> $matches[[11]][[14]]
#> [1] 0.5469122
#> 
#> 
#> $matches[[12]]
#> $matches[[12]][[1]]
#> [1] 0.5109949
#> 
#> $matches[[12]][[2]]
#> [1] 0.5615149
#> 
#> $matches[[12]][[3]]
#> [1] 0.5106027
#> 
#> $matches[[12]][[4]]
#> [1] 0.5440194
#> 
#> $matches[[12]][[5]]
#> [1] 0.6250209
#> 
#> $matches[[12]][[6]]
#> [1] 0.5719854
#> 
#> $matches[[12]][[7]]
#> [1] 0.5295711
#> 
#> $matches[[12]][[8]]
#> [1] 0.3237803
#> 
#> $matches[[12]][[9]]
#> [1] 0.5177428
#> 
#> $matches[[12]][[10]]
#> [1] 0.6538956
#> 
#> $matches[[12]][[11]]
#> [1] 0.5298004
#> 
#> $matches[[12]][[12]]
#> [1] 1
#> 
#> $matches[[12]][[13]]
#> [1] 0.6412412
#> 
#> $matches[[12]][[14]]
#> [1] 0.4908774
#> 
#> 
#> $matches[[13]]
#> $matches[[13]][[1]]
#> [1] 0.5931827
#> 
#> $matches[[13]][[2]]
#> [1] -0.4793222
#> 
#> $matches[[13]][[3]]
#> [1] 0.4637057
#> 
#> $matches[[13]][[4]]
#> [1] 0.3540848
#> 
#> $matches[[13]][[5]]
#> [1] 0.4114663
#> 
#> $matches[[13]][[6]]
#> [1] 0.9502258
#> 
#> $matches[[13]][[7]]
#> [1] 0.5013312
#> 
#> $matches[[13]][[8]]
#> [1] 0.3217045
#> 
#> $matches[[13]][[9]]
#> [1] 0.6094119
#> 
#> $matches[[13]][[10]]
#> [1] 0.5488659
#> 
#> $matches[[13]][[11]]
#> [1] 0.4493773
#> 
#> $matches[[13]][[12]]
#> [1] 0.6412412
#> 
#> $matches[[13]][[13]]
#> [1] 1
#> 
#> $matches[[13]][[14]]
#> [1] 0.4567534
#> 
#> 
#> $matches[[14]]
#> $matches[[14]][[1]]
#> [1] 0.4505575
#> 
#> $matches[[14]][[2]]
#> [1] -0.4719153
#> 
#> $matches[[14]][[3]]
#> [1] 0.5593852
#> 
#> $matches[[14]][[4]]
#> [1] 0.2137842
#> 
#> $matches[[14]][[5]]
#> [1] 0.2880645
#> 
#> $matches[[14]][[6]]
#> [1] 0.3653328
#> 
#> $matches[[14]][[7]]
#> [1] 0.8445889
#> 
#> $matches[[14]][[8]]
#> [1] 0.1625244
#> 
#> $matches[[14]][[9]]
#> [1] 0.4456488
#> 
#> $matches[[14]][[10]]
#> [1] 0.5390011
#> 
#> $matches[[14]][[11]]
#> [1] 0.5469122
#> 
#> $matches[[14]][[12]]
#> [1] 0.4908774
#> 
#> $matches[[14]][[13]]
#> [1] 0.4567534
#> 
#> $matches[[14]][[14]]
#> [1] 1
#> 
#> 
#> 
#> $query_similarity
#> list()
```
