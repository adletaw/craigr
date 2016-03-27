<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/adletaw/craigr.svg?branch=master)](https://travis-ci.org/adletaw/craigr)

craigr: an R package to get data from craigslist
================================================

The purpose of this package is to obtain data from any section of craigslist and load it into a clean `data.frame` within R. Currently this only works with apartment searches. See the "Package status" below.

Install
-------

`devtools::install_github("adletaw/craigr")`

Package status
--------------

This package is under active develpment. Currently, you can download housing rental data only.

Usage
-----

### Finding available rentals

*craigr* will do an apartment search using the function `rentals`. You can supply almost any search parameters that are available on craiglist. See the help page for `rentals` to get the full parameter list.

First you have to specify the location and area. The location works as the Craigslist subdomain, e.g. [seattle.craigslist.org](https://seattle.craigslist.org). The area allows you to filter to a more specific location according to the pre-programmed three-letter codes in Craigslist. For example, using `see` limits the search to the Seattle city limits only. The default is `all`.

``` r
results <- craigr::rentals(location = "seattle", area = "see", 
                           max_results = 100)

head(results)
```

    ##                                                                Title Price
    ## 1                                    One Bed in Brand New Building!!  1895
    ## 2                        *5902* Micro Studios in Ballard NOW LEASING   950
    ## 3                 // BALLARD MICRO STUDIOS // All utilities included   950
    ## 4      NEW Contemporary Homes in West Seattle, Vibrant Neighborhood!  1950
    ## 5 One Bed - New Building - One Block From New Sound Transit Station!  1895
    ## 6                   Ballard *2418* Micro Studios available APRIL 1st   950
    ##               Date                                                    URL
    ## 1 2016-03-27 12:24 https://seattle.craigslist.org/see/apa/5510759291.html
    ## 2 2016-03-27 12:23 https://seattle.craigslist.org/see/apa/5486712510.html
    ## 3 2016-03-27 12:23 https://seattle.craigslist.org/see/apa/5480062055.html
    ## 4 2016-03-27 12:23 https://seattle.craigslist.org/see/apa/5510751064.html
    ## 5 2016-03-27 12:23 https://seattle.craigslist.org/see/apa/5510752083.html
    ## 6 2016-03-27 12:23 https://seattle.craigslist.org/see/apa/5489862949.html

The listing title, price, data and url are provided. Check [craigslist](https://craigslist.org) to find the location subdomain and three-letter area code.
