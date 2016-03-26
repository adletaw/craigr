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

`list_housing(bedrooms = 2, bathrooms = 1)`
