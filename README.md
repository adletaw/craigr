<!-- README.md is generated from README.Rmd. Please edit that file -->

**craigR is no longer under development. Feel free to fork, copy, use as desired. No attribution necessary.**

craigr: an R package to get data from craigslist
================================================

The purpose of this package is to obtain data from any section of craigslist and load it into a clean `data.frame` within R. Currently this only works with apartment searches. See the "Package status" below.

Install
-------

`devtools::install_github("adletaw/craigr")`

Note that the package depends on: `rvest`, `stringr`, `xml2`, `RCurl` and `magrittr`

Package status
--------------

This package is under passive development. Currently, you can download housing rental data only.

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

    ##                                                                   Title
    ## 1              Get Cozy at Cora || Open House Saturday || FREE 6 WEEKS!
    ## 2     Rare Top Floor Opening at Belroy with City Views from Every Room!
    ## 3                                     Love the comfort of your new home
    ## 4           Spacious Exterior Entry Condo Steps from West Sea Junction!
    ## 5 Top Floor Condo Apartment - 3 blocks from UW - Spacious & Beautiful -
    ## 6                                                        Handsome Henry
    ##               Date Price Bedrooms SqFt
    ## 1 2017-09-20 11:23  2525        1  630
    ## 2 2017-09-20 11:23  3095        1  808
    ## 3 2017-09-20 11:22  1825        3 1090
    ## 4 2017-09-20 11:22  1950        1  884
    ## 5 2017-09-20 11:21  2450        2 1000
    ## 6 2017-09-20 11:20  2295        1  610
    ##                                           Location
    ## 1                        Schedule your Tour Today!
    ## 2                               North Capitol Hill
    ## 3  31224 Pete von Reichbauer Way S Federal Way, WA
    ## 4                                     West Seattle
    ## 5              Seattle  / University District / UW
    ## 6                               Fremont/Queen Anne
    ##                                                                                      URL
    ## 1   https://seattle.craigslist.org/see/apa/d/get-cozy-at-cora-open-house/6313956317.html
    ## 2     https://seattle.craigslist.org/see/apa/d/rare-top-floor-opening-at/6313955932.html
    ## 3  https://seattle.craigslist.org/see/apa/d/love-the-comfort-of-your-new/6313954876.html
    ## 4 https://seattle.craigslist.org/see/apa/d/spacious-exterior-entry-condo/6313954753.html
    ## 5   https://seattle.craigslist.org/see/apa/d/top-floor-condo-apartment-3/6309805820.html
    ## 6                https://seattle.craigslist.org/see/apa/d/handsome-henry/6313952181.html

The listing title, price, data and url are provided. Check [craigslist](https://craigslist.org) to find the location subdomain and three-letter area code.
