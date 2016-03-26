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

This package is under active develpment. Currently, you can download housing rental data only for Seattle or Houston only.

Usage
-----

*craigr* will do an apartment search using the function `list_housing`. You can supply almost any search parameters that are available on craiglist.

First you have to specify the location and area. The location works as the Craigslist subdomain, e.g. [seattle.craigslist.org](https://seattle.craigslist.org)

The area allows you to filter to a more specific location according to the pre-programmed options in Craigslist. Using `all` will search the entire location (in this case, the greater Seattle metro).

``` r
results <- craigr::list_housing(location = "seattle", area = "all", 
                                max_results = 100)

head(results)
```

    ##                                                                 Title
    ## 1    Spring Into This Gorgeous Studio Coming Available In April! *105
    ## 2      3 Bedroom Washer/Dryer, Patio, Extra Storage! Come Tour Today!
    ## 3 Got a tattoo you regret?! This apartment will help the pain go away
    ## 4                                   Welcome Home to One Canyon Place!
    ## 5       The Only One Left! A Beautiful 2 Bedroom, One Bath Ready Now!
    ## 6                                          OBR/1 BA 1100FT2 SANDPOINT
    ##   Price             Date                      URL
    ## 1  1492 2016-03-26 14:16 /see/apa/5509745151.html
    ## 2  1740 2016-03-26 14:16 /sno/apa/5509744977.html
    ## 3  1813 2016-03-26 14:16 /see/apa/5509744936.html
    ## 4  1040 2016-03-26 14:16 /tac/apa/5509744744.html
    ## 5  1265 2016-03-26 14:15 /tac/apa/5509744390.html
    ## 6  1650 2016-03-26 14:15 /see/apa/5499049406.html

The listing title, price, data and url are provided.
