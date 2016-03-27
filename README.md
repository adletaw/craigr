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

*craigr* will do an apartment search using the function `rentals`. You can supply almost any search parameters that are available on craiglist.

First you have to specify the location and area. The location works as the Craigslist subdomain, e.g. [seattle.craigslist.org](https://seattle.craigslist.org)

The area allows you to filter to a more specific location according to the pre-programmed options in Craigslist. Using `all` will search the entire location (in this case, the greater Seattle metro).

``` r
results <- craigr::rentals(location = "seattle", area = "all", 
                           max_results = 100)

head(results)
```

    ##                                                                 Title
    ## 1             ONE BEDROOM, ONE BATHROOM, WATER/SEWER/GARBAGE INCLUDED
    ## 2       Rent Your CLASSIC Home Today! Apply Now! Amazing Sweet Home!!
    ## 3           Premium Home!! Great Space,Great Rooms, Great Community!!
    ## 4                HAPPY EASTER!! COME BY AND SEE YOUR NEW HOME TODAY!!
    ## 5 Gorgeous Seattle Home Without Paying Seattle Prices #LiveAtLeilani2
    ## 6                     Updated 2 bedrm Duplex in Downtown Port Orchard
    ##   Price             Date
    ## 1   750 2016-03-27 12:17
    ## 2  1100 2016-03-27 12:17
    ## 3  1200 2016-03-27 12:16
    ## 4    NA 2016-03-27 12:15
    ## 5  1515 2016-03-27 12:14
    ## 6  1075 2016-03-27 12:13
    ##                                                      URL
    ## 1 https://seattle.craigslist.org/sno/apa/5507119189.html
    ## 2 https://seattle.craigslist.org/skc/apa/5510750745.html
    ## 3 https://seattle.craigslist.org/skc/apa/5510750045.html
    ## 4 https://seattle.craigslist.org/tac/apa/5510748933.html
    ## 5 https://seattle.craigslist.org/see/apa/5510747340.html
    ## 6 https://seattle.craigslist.org/kit/apa/5510746449.html

The listing title, price, data and url are provided. A list of available locations is stored in the [dictionary here](https://github.com/adletaw/craigr/blob/master/dictionary/places.csv). You can add your own location data and run [generate\_package\_data.R](https://github.com/adletaw/craigr/blob/master/dictionary/generate_package_data.R) if needed.
