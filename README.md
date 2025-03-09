
<!-- README.md is generated from README.Rmd. Please edit that file -->

![](https://raw.githubusercontent.com/harmonydata/brand/main/Logo/PNG/%D0%BB%D0%BE%D0%B3%D0%BE%20%D1%84%D1%83%D0%BB-05.png)

# Harmony R library: harmonydata

You can also **join our [Discord
server](https://discord.gg/harmonydata)!**  
If you found Harmony helpful, you can [leave us a
review](https://g.page/r/CaRWc2ViO653EBM/review)!

## 🧠 What Does Harmony Do?

Psychologists and social scientists often have to **match items** in
different questionnaires, such as:

> *“I often feel anxious”*  
> *“Feeling nervous, anxious or afraid”*

This process is called **harmonisation**.

### 🔹 The Problem

- Harmonisation is a **time-consuming** and **subjective** process.  
- Researchers have to **manually go through long PDFs** of
  questionnaires.  
- Extracting questions and putting them into **Excel** is tedious.

### 🔹 The Solution: Harmony

🚀 **Harmony** uses **natural language processing (NLP)** and
**generative AI models** to: - Automatically **match similar
questionnaire items**.  
- Help researchers work across **multiple languages**.  
- Save **time** and **effort** in data harmonisation.

## 📂 Looking for Examples?

Check out our **[examples
repository](https://github.com/harmonydata/harmony_examples)** for
hands-on demonstrations. \## 🌍 The Harmony Project

**Harmony** is an **AI-powered tool** that helps researchers **compare
items from questionnaires** and **identify similar content**.

🔹 **Try Harmony:** [Harmony Web App](https://harmonydata.ac.uk/app)  
🔹 **Read our blog:** [Harmony Blog](https://harmonydata.ac.uk/blog/)

## 📞 Who to Contact?

🔹 **Harmony Team:** [harmonydata.ac.uk](https://harmonydata.ac.uk/)  
🔹 **Thomas Wood:** [fastdatascience.com](https://fastdatascience.com/)

## Getting started with the Harmony R library

- Check out [this video
  walkthrough](https://www.youtube.com/watch?v=hFqg6T_BqZc&t=1s)
  installing and running R on Windows 10.

- You can run the walkthrough Python notebook in [Google
  Colab](https://colab.research.google.com/github/harmonydata/harmony/blob/main/Harmony_example_walkthrough.ipynb)
  with a single click:
  <a href="https://colab.research.google.com/github/harmonydata/harmony/blob/main/Harmony_example_walkthrough.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

- You can also download an R markdown notebook to run in R Studio:
  <a href="https://harmonydata.ac.uk/harmony_r_example.nb.html" target="_parent"><img src="https://img.shields.io/badge/RStudio-4285F4" alt="Open In R Studio"/></a>

- You can run the walkthrough R notebook in Google Colab with a single
  click:
  <a href="https://colab.research.google.com/github/harmonydata/experiments/blob/main/Harmony_R_example.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

- [View the PDF documentation of the R package on
  CRAN](https://cran.r-project.org/web/packages/harmonydata/harmonydata.pdf)

### Installing R library

You can install the development version of harmonydata from
[GitHub](https://github.com/harmonydata/harmony_r) with:

``` r
#install.packages("devtools") # If you don't have devtools installed already.
library(devtools)
#> Loading required package: usethis
```

``` r
devtools::install_github("harmonydata/harmony_r")
#> Using GitHub PAT from the git credential store.
#> Skipping install of 'harmonydata' from a github remote, the SHA1 (5104e35b) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

or you can install it via [CRAN](https://cran.r-project.org/):

``` r
install.packages("harmonydata")
```

## Setting up domain

Before starting, you can set up the remote API endpoint for harmony
using this function. By default it uses the remote Harmony API
<https://api.harmonydata.ac.uk>

``` r
harmonydata::set_url()
```

For example, if you want to use Harmony locally, you can run the
[Harmony API as a Docker
container](https://github.com/harmonydata/harmonyapi). By default it
runs on localhost at port 8000. In this case you can run this command to
run it locally:

``` bash
docker run -p 8000:8000 harmonydata/harmonylocal
```

Now in R you can set the R library to point to your local Harmony on
Docker.

``` r
harmonydata::set_url("http://localhost:8000")
```

## Parsing a raw file into an Instrument

If you want to read in a raw (unstructured) PDF or Excel file, you can
do this via a POST request to the REST API. This will convert the file
into an Instrument object in JSON. It returns the instrument as a list.

``` r
library(harmonydata)
instrument = load_instruments_from_file(path = "examples/GAD-7.pdf")
names(instrument[[1]])
#> [1] "file_id"         "instrument_id"   "instrument_name" "file_name"      
#> [5] "language"        "questions"
```

You can also input a url containing the questionnaire.

``` r
instrument_2 = load_instruments_from_file("https://medfam.umontreal.ca/wp-content/uploads/sites/16/GAD-7-fran%C3%A7ais.pdf") 
names(instrument_2[[1]])
#> [1] "file_id"         "instrument_id"   "instrument_name" "file_name"      
#> [5] "language"        "questions"
```

## Matching instruments

You can get a list containing the results of the match. Here we can see
a list of similarity score for each question comapred to all the other
questions in th other questionaire.

``` r
instruments = append(instrument, instrument_2)
match = match_instruments(instruments)
names(match)
#> [1] "instruments"                          
#> [2] "questions"                            
#> [3] "matches"                              
#> [4] "query_similarity"                     
#> [5] "closest_catalogue_instrument_matches" 
#> [6] "instrument_to_instrument_similarities"
#> [7] "clusters"
```

Here is how the matches look like.

``` r

match$matches
#> [[1]]
#> [[1]][[1]]
#> [1] 1
#> 
#> [[1]][[2]]
#> [1] 0.5830621
#> 
#> [[1]][[3]]
#> [1] 0.6179736
#> 
#> [[1]][[4]]
#> [1] 0.4357673
#> 
#> [[1]][[5]]
#> [1] 0.4945895
#> 
#> [[1]][[6]]
#> [1] 0.5529693
#> 
#> [[1]][[7]]
#> [1] 0.7089151
#> 
#> [[1]][[8]]
#> [1] 0.2380928
#> 
#> [[1]][[9]]
#> [1] 0.2814474
#> 
#> [[1]][[10]]
#> [1] 0.894249
#> 
#> [[1]][[11]]
#> [1] 0.6634801
#> 
#> [[1]][[12]]
#> [1] 0.5109949
#> 
#> [[1]][[13]]
#> [1] 0.5931828
#> 
#> [[1]][[14]]
#> [1] 0.4505574
#> 
#> 
#> [[2]]
#> [[2]][[1]]
#> [1] 0.5830621
#> 
#> [[2]][[2]]
#> [1] 1
#> 
#> [[2]][[3]]
#> [1] 0.7629658
#> 
#> [[2]][[4]]
#> [1] 0.4594004
#> 
#> [[2]][[5]]
#> [1] 0.4558097
#> 
#> [[2]][[6]]
#> [1] -0.4613766
#> 
#> [[2]][[7]]
#> [1] 0.5173815
#> 
#> [[2]][[8]]
#> [1] -0.2566257
#> 
#> [[2]][[9]]
#> [1] -0.2383574
#> 
#> [[2]][[10]]
#> [1] 0.60493
#> 
#> [[2]][[11]]
#> [1] 0.8852125
#> 
#> [[2]][[12]]
#> [1] 0.5615149
#> 
#> [[2]][[13]]
#> [1] -0.4793222
#> 
#> [[2]][[14]]
#> [1] -0.4719152
#> 
#> 
#> [[3]]
#> [[3]][[1]]
#> [1] 0.6179736
#> 
#> [[3]][[2]]
#> [1] 0.7629658
#> 
#> [[3]][[3]]
#> [1] 1
#> 
#> [[3]][[4]]
#> [1] 0.3895614
#> 
#> [[3]][[5]]
#> [1] 0.3963558
#> 
#> [[3]][[6]]
#> [1] 0.4716267
#> 
#> [[3]][[7]]
#> [1] 0.6041647
#> 
#> [[3]][[8]]
#> [1] 0.2892596
#> 
#> [[3]][[9]]
#> [1] 0.2572643
#> 
#> [[3]][[10]]
#> [1] 0.6280157
#> 
#> [[3]][[11]]
#> [1] 0.7662809
#> 
#> [[3]][[12]]
#> [1] 0.5106027
#> 
#> [[3]][[13]]
#> [1] 0.4637058
#> 
#> [[3]][[14]]
#> [1] 0.5593851
#> 
#> 
#> [[4]]
#> [[4]][[1]]
#> [1] 0.4357673
#> 
#> [[4]][[2]]
#> [1] 0.4594004
#> 
#> [[4]][[3]]
#> [1] 0.3895614
#> 
#> [[4]][[4]]
#> [1] 1
#> 
#> [[4]][[5]]
#> [1] 0.6178267
#> 
#> [[4]][[6]]
#> [1] 0.3250091
#> 
#> [[4]][[7]]
#> [1] 0.3117914
#> 
#> [[4]][[8]]
#> [1] 0.1839352
#> 
#> [[4]][[9]]
#> [1] 0.2985738
#> 
#> [[4]][[10]]
#> [1] 0.4527453
#> 
#> [[4]][[11]]
#> [1] 0.4667662
#> 
#> [[4]][[12]]
#> [1] 0.5440194
#> 
#> [[4]][[13]]
#> [1] 0.3540848
#> 
#> [[4]][[14]]
#> [1] 0.2137841
#> 
#> 
#> [[5]]
#> [[5]][[1]]
#> [1] 0.4945895
#> 
#> [[5]][[2]]
#> [1] 0.4558097
#> 
#> [[5]][[3]]
#> [1] 0.3963558
#> 
#> [[5]][[4]]
#> [1] 0.6178267
#> 
#> [[5]][[5]]
#> [1] 1
#> 
#> [[5]][[6]]
#> [1] 0.3895386
#> 
#> [[5]][[7]]
#> [1] 0.4360376
#> 
#> [[5]][[8]]
#> [1] 0.2008711
#> 
#> [[5]][[9]]
#> [1] 0.2626984
#> 
#> [[5]][[10]]
#> [1] 0.4596621
#> 
#> [[5]][[11]]
#> [1] 0.4473513
#> 
#> [[5]][[12]]
#> [1] 0.6250208
#> 
#> [[5]][[13]]
#> [1] 0.4114662
#> 
#> [[5]][[14]]
#> [1] 0.2880645
#> 
#> 
#> [[6]]
#> [[6]][[1]]
#> [1] 0.5529693
#> 
#> [[6]][[2]]
#> [1] -0.4613766
#> 
#> [[6]][[3]]
#> [1] 0.4716267
#> 
#> [[6]][[4]]
#> [1] 0.3250091
#> 
#> [[6]][[5]]
#> [1] 0.3895386
#> 
#> [[6]][[6]]
#> [1] 1
#> 
#> [[6]][[7]]
#> [1] 0.4438164
#> 
#> [[6]][[8]]
#> [1] 0.3468708
#> 
#> [[6]][[9]]
#> [1] 0.3111583
#> 
#> [[6]][[10]]
#> [1] 0.5644366
#> 
#> [[6]][[11]]
#> [1] 0.5049124
#> 
#> [[6]][[12]]
#> [1] 0.5719854
#> 
#> [[6]][[13]]
#> [1] 0.9502258
#> 
#> [[6]][[14]]
#> [1] 0.3653329
#> 
#> 
#> [[7]]
#> [[7]][[1]]
#> [1] 0.7089151
#> 
#> [[7]][[2]]
#> [1] 0.5173815
#> 
#> [[7]][[3]]
#> [1] 0.6041647
#> 
#> [[7]][[4]]
#> [1] 0.3117914
#> 
#> [[7]][[5]]
#> [1] 0.4360376
#> 
#> [[7]][[6]]
#> [1] 0.4438164
#> 
#> [[7]][[7]]
#> [1] 1
#> 
#> [[7]][[8]]
#> [1] -0.1535627
#> 
#> [[7]][[9]]
#> [1] -0.153154
#> 
#> [[7]][[10]]
#> [1] 0.612879
#> 
#> [[7]][[11]]
#> [1] 0.541166
#> 
#> [[7]][[12]]
#> [1] 0.5295712
#> 
#> [[7]][[13]]
#> [1] 0.5013311
#> 
#> [[7]][[14]]
#> [1] 0.8445888
#> 
#> 
#> [[8]]
#> [[8]][[1]]
#> [1] 0.2380928
#> 
#> [[8]][[2]]
#> [1] -0.2566257
#> 
#> [[8]][[3]]
#> [1] 0.2892596
#> 
#> [[8]][[4]]
#> [1] 0.1839352
#> 
#> [[8]][[5]]
#> [1] 0.2008711
#> 
#> [[8]][[6]]
#> [1] 0.3468708
#> 
#> [[8]][[7]]
#> [1] -0.1535627
#> 
#> [[8]][[8]]
#> [1] 1
#> 
#> [[8]][[9]]
#> [1] 0.5548581
#> 
#> [[8]][[10]]
#> [1] 0.2341754
#> 
#> [[8]][[11]]
#> [1] 0.3289153
#> 
#> [[8]][[12]]
#> [1] 0.3237803
#> 
#> [[8]][[13]]
#> [1] 0.3217046
#> 
#> [[8]][[14]]
#> [1] 0.1625244
#> 
#> 
#> [[9]]
#> [[9]][[1]]
#> [1] 0.2814474
#> 
#> [[9]][[2]]
#> [1] -0.2383574
#> 
#> [[9]][[3]]
#> [1] 0.2572643
#> 
#> [[9]][[4]]
#> [1] 0.2985738
#> 
#> [[9]][[5]]
#> [1] 0.2626984
#> 
#> [[9]][[6]]
#> [1] 0.3111583
#> 
#> [[9]][[7]]
#> [1] -0.153154
#> 
#> [[9]][[8]]
#> [1] 0.5548581
#> 
#> [[9]][[9]]
#> [1] 1
#> 
#> [[9]][[10]]
#> [1] 0.3128226
#> 
#> [[9]][[11]]
#> [1] -0.3486197
#> 
#> [[9]][[12]]
#> [1] 0.2828471
#> 
#> [[9]][[13]]
#> [1] 0.3370971
#> 
#> [[9]][[14]]
#> [1] -0.217787
#> 
#> 
#> [[10]]
#> [[10]][[1]]
#> [1] 0.894249
#> 
#> [[10]][[2]]
#> [1] 0.60493
#> 
#> [[10]][[3]]
#> [1] 0.6280157
#> 
#> [[10]][[4]]
#> [1] 0.4527453
#> 
#> [[10]][[5]]
#> [1] 0.4596621
#> 
#> [[10]][[6]]
#> [1] 0.5644366
#> 
#> [[10]][[7]]
#> [1] 0.612879
#> 
#> [[10]][[8]]
#> [1] 0.2341754
#> 
#> [[10]][[9]]
#> [1] 0.3128226
#> 
#> [[10]][[10]]
#> [1] 1
#> 
#> [[10]][[11]]
#> [1] 0.712629
#> 
#> [[10]][[12]]
#> [1] 0.5177428
#> 
#> [[10]][[13]]
#> [1] 0.6094118
#> 
#> [[10]][[14]]
#> [1] 0.4456488
#> 
#> 
#> [[11]]
#> [[11]][[1]]
#> [1] 0.6634801
#> 
#> [[11]][[2]]
#> [1] 0.8852125
#> 
#> [[11]][[3]]
#> [1] 0.7662809
#> 
#> [[11]][[4]]
#> [1] 0.4667662
#> 
#> [[11]][[5]]
#> [1] 0.4473513
#> 
#> [[11]][[6]]
#> [1] 0.5049124
#> 
#> [[11]][[7]]
#> [1] 0.541166
#> 
#> [[11]][[8]]
#> [1] 0.3289153
#> 
#> [[11]][[9]]
#> [1] -0.3486197
#> 
#> [[11]][[10]]
#> [1] 0.712629
#> 
#> [[11]][[11]]
#> [1] 1
#> 
#> [[11]][[12]]
#> [1] 0.6538957
#> 
#> [[11]][[13]]
#> [1] 0.5488661
#> 
#> [[11]][[14]]
#> [1] 0.539001
#> 
#> 
#> [[12]]
#> [[12]][[1]]
#> [1] 0.5109949
#> 
#> [[12]][[2]]
#> [1] 0.5615149
#> 
#> [[12]][[3]]
#> [1] 0.5106027
#> 
#> [[12]][[4]]
#> [1] 0.5440194
#> 
#> [[12]][[5]]
#> [1] 0.6250208
#> 
#> [[12]][[6]]
#> [1] 0.5719854
#> 
#> [[12]][[7]]
#> [1] 0.5295712
#> 
#> [[12]][[8]]
#> [1] 0.3237803
#> 
#> [[12]][[9]]
#> [1] 0.2828471
#> 
#> [[12]][[10]]
#> [1] 0.5177428
#> 
#> [[12]][[11]]
#> [1] 0.6538957
#> 
#> [[12]][[12]]
#> [1] 1
#> 
#> [[12]][[13]]
#> [1] 0.6412413
#> 
#> [[12]][[14]]
#> [1] 0.4908774
#> 
#> 
#> [[13]]
#> [[13]][[1]]
#> [1] 0.5931828
#> 
#> [[13]][[2]]
#> [1] -0.4793222
#> 
#> [[13]][[3]]
#> [1] 0.4637058
#> 
#> [[13]][[4]]
#> [1] 0.3540848
#> 
#> [[13]][[5]]
#> [1] 0.4114662
#> 
#> [[13]][[6]]
#> [1] 0.9502258
#> 
#> [[13]][[7]]
#> [1] 0.5013311
#> 
#> [[13]][[8]]
#> [1] 0.3217046
#> 
#> [[13]][[9]]
#> [1] 0.3370971
#> 
#> [[13]][[10]]
#> [1] 0.6094118
#> 
#> [[13]][[11]]
#> [1] 0.5488661
#> 
#> [[13]][[12]]
#> [1] 0.6412413
#> 
#> [[13]][[13]]
#> [1] 1
#> 
#> [[13]][[14]]
#> [1] 0.4567534
#> 
#> 
#> [[14]]
#> [[14]][[1]]
#> [1] 0.4505574
#> 
#> [[14]][[2]]
#> [1] -0.4719152
#> 
#> [[14]][[3]]
#> [1] 0.5593851
#> 
#> [[14]][[4]]
#> [1] 0.2137841
#> 
#> [[14]][[5]]
#> [1] 0.2880645
#> 
#> [[14]][[6]]
#> [1] 0.3653329
#> 
#> [[14]][[7]]
#> [1] 0.8445888
#> 
#> [[14]][[8]]
#> [1] 0.1625244
#> 
#> [[14]][[9]]
#> [1] -0.217787
#> 
#> [[14]][[10]]
#> [1] 0.4456488
#> 
#> [[14]][[11]]
#> [1] 0.539001
#> 
#> [[14]][[12]]
#> [1] 0.4908774
#> 
#> [[14]][[13]]
#> [1] 0.4567534
#> 
#> [[14]][[14]]
#> [1] 1
```

# Running harmonydata locally from a docker image

To run harmonydata locally, first you need to pull the docker image
using the terminal.

## 1. Pull docker image

``` bash
docker pull harmonydata/harmonyapi
```

## 2. Run docker image

``` bash
docker run -p 8000:80 harmonyapi
```

## 3. Configure harmonydata to run locally

Set url to use localhost. Don’t forget to expose port 8000:

``` r
set_url(harmony_url = "http://localhost:8000")
```

## 📜 How do I cite Harmony?

You can cite our validation paper:

McElroy, Wood, Bond, Mulvenna, Shevlin, Ploubidis, Scopel Hoffmann,
Moltrecht, [Using natural language processing to facilitate the
harmonisation of mental health questionnaires: a validation study using
real-world
data](https://bmcpsychiatry.biomedcentral.com/articles/10.1186/s12888-024-05954-2#citeas).
BMC Psychiatry 24, 530 (2024),
<https://doi.org/10.1186/s12888-024-05954-2>

A BibTeX entry for LaTeX users is

``` bibtex
@article{mcelroy2024using,
  title={Using natural language processing to facilitate the harmonisation of mental health questionnaires: a validation study using real-world data},
  author={McElroy, Eoin and Wood, Thomas and Bond, Raymond and Mulvenna, Maurice and Shevlin, Mark and Ploubidis, George B and Hoffmann, Mauricio Scopel and Moltrecht, Bettina},
  journal={BMC Psychiatry},
  volume={24},
  number={1},
  pages={530},
  year={2024},
  publisher={Springer}
}
```
