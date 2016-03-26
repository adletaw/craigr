<!-- README.md is generated from README.Rmd. Please edit that file -->
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

    ##                                                                    Title
    ## 1                                                     Seatac Duplex 2b2b
    ## 2        1 Bedroom Available April 17th! W/S/G included & Pet Friendly!!
    ## 3 Washer & Dryer Included in EVERY unit, Gated Community, Pet Friendly!!
    ## 4                   Live in the center of Capitol Hill. Hollywood Lofts!
    ## 5                                2 Bedrooms 2 Bath Apartment in Kent, WA
    ## 6      Plenty of Windows, Plenty of Natural Light! @ Latitude Apartments
    ##   Price             Date                      URL
    ## 1  1450 2016-03-25 17:45 /skc/apa/5508557352.html
    ## 2   968 2016-03-25 17:44 /see/apa/5508544898.html
    ## 3  1249 2016-03-25 17:44 /tac/apa/5508546994.html
    ## 4  2450 2016-03-25 17:44 /see/apa/5508556381.html
    ## 5  1305 2016-03-25 17:44 /skc/apa/5508510980.html
    ## 6  2995 2016-03-25 17:44 /see/apa/5508550133.html

The listing title, price, data and url are provided.
