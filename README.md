
<!-- README.md is generated from README.Rmd. Please edit that file -->

# harmonydata

## Getting started with the Harmony R library

### Installing R library

You can install the development version of harmonydata from
[GitHub](https://github.com/harmonydata/harmony_r) with:

``` r
#install.packages("devtools") # If you don't have devtools installed already.
library(devtools)
#> Warning: package 'devtools' was built under R version 4.3.1
#> Loading required package: usethis
#> Warning: package 'usethis' was built under R version 4.3.1
devtools::install_github("harmonydata/harmony_r")
#> Downloading GitHub repo harmonydata/harmony_r@HEAD
#> curl (5.0.1 -> 5.1.0) [CRAN]
#> uuid (1.1-0 -> 1.1-1) [CRAN]
#> Installing 2 packages: curl, uuid
#> Installing packages into 'C:/Users/User/AppData/Local/Temp/RtmpSayLpV/temp_libpath46f41b34616d'
#> (as 'lib' is unspecified)
#> package 'curl' successfully unpacked and MD5 sums checked
#> package 'uuid' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\User\AppData\Local\Temp\Rtmp2B8YOS\downloaded_packages
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>          checking for file 'C:\Users\User\AppData\Local\Temp\Rtmp2B8YOS\remotes10e0572c1eef\harmonydata-harmony_r-9d0467a/DESCRIPTION' ...     checking for file 'C:\Users\User\AppData\Local\Temp\Rtmp2B8YOS\remotes10e0572c1eef\harmonydata-harmony_r-9d0467a/DESCRIPTION' ...   ✔  checking for file 'C:\Users\User\AppData\Local\Temp\Rtmp2B8YOS\remotes10e0572c1eef\harmonydata-harmony_r-9d0467a/DESCRIPTION'
#>       ─  preparing 'harmonydata':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>      Omitted 'LazyData' from DESCRIPTION
#>       ─  building 'harmonydata_0.1.1.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/User/AppData/Local/Temp/RtmpSayLpV/temp_libpath46f41b34616d'
#> (as 'lib' is unspecified)
```

## Setting up domain

Before starting, you can set up the domain for harmony. Using this
function. By default it uses <https://api.harmonydata.ac.uk>

``` r
harmonydata::set_url()
```

## Parsing a raw file into an Instrument

If you want to read in a raw (unstructured) PDF or Excel file, you can
do this via a POST request to the REST API. This will convert the file
into an Instrument object in JSON.It returns the instrument as a list.

``` r
library(harmonydata)
instrument = load_instruments_from_file(path = "examples/GAD-7.pdf")
names(instrument[[1]])
#>  [1] "file_id"         "instrument_id"   "instrument_name" "file_name"      
#>  [5] "file_type"       "file_section"    "study"           "sweep"          
#>  [9] "metadata"        "language"        "questions"
```

You can also input a url containing the questionnaire.

``` r
instrument_2 = load_instruments_from_file("https://medfam.umontreal.ca/wp-content/uploads/sites/16/GAD-7-fran%C3%A7ais.pdf") 
names(instrument_2[[1]])
#>  [1] "file_id"         "instrument_id"   "instrument_name" "file_name"      
#>  [5] "file_type"       "file_section"    "study"           "sweep"          
#>  [9] "metadata"        "language"        "questions"
```

## Matching instruments

You can get a list containing the results of the match.Here we can see a
list of similarity score for each question comapred to all the other
questions in th other questionaire.

``` r
instruments = append(instrument, instrument_2)
match = match_instruments(instruments)
names(match)
#> [1] "questions"        "matches"          "query_similarity"
```

Here is how the matches look like.

``` r

match$matches
#> [[1]]
#> [[1]][[1]]
#> [1] 1
#> 
#> [[1]][[2]]
#> [1] 0.5830622
#> 
#> [[1]][[3]]
#> [1] 0.6179736
#> 
#> [[1]][[4]]
#> [1] 0.4357673
#> 
#> [[1]][[5]]
#> [1] 0.4945896
#> 
#> [[1]][[6]]
#> [1] 0.5529693
#> 
#> [[1]][[7]]
#> [1] 0.7089151
#> 
#> [[1]][[8]]
#> [1] 0.2380927
#> 
#> [[1]][[9]]
#> [1] 0.894249
#> 
#> [[1]][[10]]
#> [1] 0.66348
#> 
#> [[1]][[11]]
#> [1] 0.520991
#> 
#> [[1]][[12]]
#> [1] 0.5109949
#> 
#> [[1]][[13]]
#> [1] 0.5931827
#> 
#> [[1]][[14]]
#> [1] 0.4505575
#> 
#> 
#> [[2]]
#> [[2]][[1]]
#> [1] 0.5830622
#> 
#> [[2]][[2]]
#> [1] 1
#> 
#> [[2]][[3]]
#> [1] 0.7629658
#> 
#> [[2]][[4]]
#> [1] 0.4594003
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
#> [1] -0.2566256
#> 
#> [[2]][[9]]
#> [1] 0.6049301
#> 
#> [[2]][[10]]
#> [1] 0.8852125
#> 
#> [[2]][[11]]
#> [1] 0.6571534
#> 
#> [[2]][[12]]
#> [1] 0.5615149
#> 
#> [[2]][[13]]
#> [1] -0.4793222
#> 
#> [[2]][[14]]
#> [1] -0.4719153
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
#> [1] 0.3895613
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
#> [1] 0.6280157
#> 
#> [[3]][[10]]
#> [1] 0.7662809
#> 
#> [[3]][[11]]
#> [1] 0.7426492
#> 
#> [[3]][[12]]
#> [1] 0.5106027
#> 
#> [[3]][[13]]
#> [1] 0.4637057
#> 
#> [[3]][[14]]
#> [1] 0.5593852
#> 
#> 
#> [[4]]
#> [[4]][[1]]
#> [1] 0.4357673
#> 
#> [[4]][[2]]
#> [1] 0.4594003
#> 
#> [[4]][[3]]
#> [1] 0.3895613
#> 
#> [[4]][[4]]
#> [1] 1
#> 
#> [[4]][[5]]
#> [1] 0.6178266
#> 
#> [[4]][[6]]
#> [1] 0.3250092
#> 
#> [[4]][[7]]
#> [1] 0.3117915
#> 
#> [[4]][[8]]
#> [1] 0.1839352
#> 
#> [[4]][[9]]
#> [1] 0.4527453
#> 
#> [[4]][[10]]
#> [1] 0.4667661
#> 
#> [[4]][[11]]
#> [1] 0.4177579
#> 
#> [[4]][[12]]
#> [1] 0.5440194
#> 
#> [[4]][[13]]
#> [1] 0.3540848
#> 
#> [[4]][[14]]
#> [1] 0.2137842
#> 
#> 
#> [[5]]
#> [[5]][[1]]
#> [1] 0.4945896
#> 
#> [[5]][[2]]
#> [1] 0.4558097
#> 
#> [[5]][[3]]
#> [1] 0.3963558
#> 
#> [[5]][[4]]
#> [1] 0.6178266
#> 
#> [[5]][[5]]
#> [1] 1
#> 
#> [[5]][[6]]
#> [1] 0.3895387
#> 
#> [[5]][[7]]
#> [1] 0.4360376
#> 
#> [[5]][[8]]
#> [1] 0.2008711
#> 
#> [[5]][[9]]
#> [1] 0.4596621
#> 
#> [[5]][[10]]
#> [1] 0.4473514
#> 
#> [[5]][[11]]
#> [1] 0.3133177
#> 
#> [[5]][[12]]
#> [1] 0.6250209
#> 
#> [[5]][[13]]
#> [1] 0.4114663
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
#> [1] 0.3250092
#> 
#> [[6]][[5]]
#> [1] 0.3895387
#> 
#> [[6]][[6]]
#> [1] 1
#> 
#> [[6]][[7]]
#> [1] 0.4438163
#> 
#> [[6]][[8]]
#> [1] 0.3468708
#> 
#> [[6]][[9]]
#> [1] 0.5644367
#> 
#> [[6]][[10]]
#> [1] 0.5049124
#> 
#> [[6]][[11]]
#> [1] 0.4382445
#> 
#> [[6]][[12]]
#> [1] 0.5719854
#> 
#> [[6]][[13]]
#> [1] 0.9502258
#> 
#> [[6]][[14]]
#> [1] 0.3653328
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
#> [1] 0.3117915
#> 
#> [[7]][[5]]
#> [1] 0.4360376
#> 
#> [[7]][[6]]
#> [1] 0.4438163
#> 
#> [[7]][[7]]
#> [1] 1
#> 
#> [[7]][[8]]
#> [1] -0.1535626
#> 
#> [[7]][[9]]
#> [1] 0.612879
#> 
#> [[7]][[10]]
#> [1] 0.5411659
#> 
#> [[7]][[11]]
#> [1] 0.4984144
#> 
#> [[7]][[12]]
#> [1] 0.5295711
#> 
#> [[7]][[13]]
#> [1] 0.5013312
#> 
#> [[7]][[14]]
#> [1] 0.8445889
#> 
#> 
#> [[8]]
#> [[8]][[1]]
#> [1] 0.2380927
#> 
#> [[8]][[2]]
#> [1] -0.2566256
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
#> [1] -0.1535626
#> 
#> [[8]][[8]]
#> [1] 1
#> 
#> [[8]][[9]]
#> [1] 0.2341753
#> 
#> [[8]][[10]]
#> [1] 0.3289152
#> 
#> [[8]][[11]]
#> [1] 0.3063853
#> 
#> [[8]][[12]]
#> [1] 0.3237803
#> 
#> [[8]][[13]]
#> [1] 0.3217045
#> 
#> [[8]][[14]]
#> [1] 0.1625244
#> 
#> 
#> [[9]]
#> [[9]][[1]]
#> [1] 0.894249
#> 
#> [[9]][[2]]
#> [1] 0.6049301
#> 
#> [[9]][[3]]
#> [1] 0.6280157
#> 
#> [[9]][[4]]
#> [1] 0.4527453
#> 
#> [[9]][[5]]
#> [1] 0.4596621
#> 
#> [[9]][[6]]
#> [1] 0.5644367
#> 
#> [[9]][[7]]
#> [1] 0.612879
#> 
#> [[9]][[8]]
#> [1] 0.2341753
#> 
#> [[9]][[9]]
#> [1] 1
#> 
#> [[9]][[10]]
#> [1] 0.7126289
#> 
#> [[9]][[11]]
#> [1] 0.6125201
#> 
#> [[9]][[12]]
#> [1] 0.5177428
#> 
#> [[9]][[13]]
#> [1] 0.6094119
#> 
#> [[9]][[14]]
#> [1] 0.4456488
#> 
#> 
#> [[10]]
#> [[10]][[1]]
#> [1] 0.66348
#> 
#> [[10]][[2]]
#> [1] 0.8852125
#> 
#> [[10]][[3]]
#> [1] 0.7662809
#> 
#> [[10]][[4]]
#> [1] 0.4667661
#> 
#> [[10]][[5]]
#> [1] 0.4473514
#> 
#> [[10]][[6]]
#> [1] 0.5049124
#> 
#> [[10]][[7]]
#> [1] 0.5411659
#> 
#> [[10]][[8]]
#> [1] 0.3289152
#> 
#> [[10]][[9]]
#> [1] 0.7126289
#> 
#> [[10]][[10]]
#> [1] 1
#> 
#> [[10]][[11]]
#> [1] 0.7615881
#> 
#> [[10]][[12]]
#> [1] 0.6538956
#> 
#> [[10]][[13]]
#> [1] 0.5488659
#> 
#> [[10]][[14]]
#> [1] 0.5390011
#> 
#> 
#> [[11]]
#> [[11]][[1]]
#> [1] 0.520991
#> 
#> [[11]][[2]]
#> [1] 0.6571534
#> 
#> [[11]][[3]]
#> [1] 0.7426492
#> 
#> [[11]][[4]]
#> [1] 0.4177579
#> 
#> [[11]][[5]]
#> [1] 0.3133177
#> 
#> [[11]][[6]]
#> [1] 0.4382445
#> 
#> [[11]][[7]]
#> [1] 0.4984144
#> 
#> [[11]][[8]]
#> [1] 0.3063853
#> 
#> [[11]][[9]]
#> [1] 0.6125201
#> 
#> [[11]][[10]]
#> [1] 0.7615881
#> 
#> [[11]][[11]]
#> [1] 1
#> 
#> [[11]][[12]]
#> [1] 0.5298004
#> 
#> [[11]][[13]]
#> [1] 0.4493773
#> 
#> [[11]][[14]]
#> [1] 0.5469122
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
#> [1] 0.6250209
#> 
#> [[12]][[6]]
#> [1] 0.5719854
#> 
#> [[12]][[7]]
#> [1] 0.5295711
#> 
#> [[12]][[8]]
#> [1] 0.3237803
#> 
#> [[12]][[9]]
#> [1] 0.5177428
#> 
#> [[12]][[10]]
#> [1] 0.6538956
#> 
#> [[12]][[11]]
#> [1] 0.5298004
#> 
#> [[12]][[12]]
#> [1] 1
#> 
#> [[12]][[13]]
#> [1] 0.6412412
#> 
#> [[12]][[14]]
#> [1] 0.4908774
#> 
#> 
#> [[13]]
#> [[13]][[1]]
#> [1] 0.5931827
#> 
#> [[13]][[2]]
#> [1] -0.4793222
#> 
#> [[13]][[3]]
#> [1] 0.4637057
#> 
#> [[13]][[4]]
#> [1] 0.3540848
#> 
#> [[13]][[5]]
#> [1] 0.4114663
#> 
#> [[13]][[6]]
#> [1] 0.9502258
#> 
#> [[13]][[7]]
#> [1] 0.5013312
#> 
#> [[13]][[8]]
#> [1] 0.3217045
#> 
#> [[13]][[9]]
#> [1] 0.6094119
#> 
#> [[13]][[10]]
#> [1] 0.5488659
#> 
#> [[13]][[11]]
#> [1] 0.4493773
#> 
#> [[13]][[12]]
#> [1] 0.6412412
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
#> [1] 0.4505575
#> 
#> [[14]][[2]]
#> [1] -0.4719153
#> 
#> [[14]][[3]]
#> [1] 0.5593852
#> 
#> [[14]][[4]]
#> [1] 0.2137842
#> 
#> [[14]][[5]]
#> [1] 0.2880645
#> 
#> [[14]][[6]]
#> [1] 0.3653328
#> 
#> [[14]][[7]]
#> [1] 0.8445889
#> 
#> [[14]][[8]]
#> [1] 0.1625244
#> 
#> [[14]][[9]]
#> [1] 0.4456488
#> 
#> [[14]][[10]]
#> [1] 0.5390011
#> 
#> [[14]][[11]]
#> [1] 0.5469122
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

``` shell
docker pull harmonydata/harmonyapi
```

## 2. Run docker image

``` shell
docker run -p 8000:80 harmonyapi
```

## 3. Configure harmonydata to run locally

Set url to use localhost. Don’t forget to expose port 8000:

``` r
set_url(harmony_url = "http://localhost:8000")
```
