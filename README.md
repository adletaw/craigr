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
craigr::list_housing(location = "seattle", area = "all", max_results = 100)
```

    ## Loading required package: rvest

    ## Loading required package: xml2

    ## Loading required package: magrittr

    ##                                                                               Title
    ## 1            Washer & Dryer Included in EVERY unit, Gated Community, Pet Friendly!!
    ## 2                              Live in the center of Capitol Hill. Hollywood Lofts!
    ## 3                                           2 Bedrooms 2 Bath Apartment in Kent, WA
    ## 4                 Plenty of Windows, Plenty of Natural Light! @ Latitude Apartments
    ## 5                                         Reserve this large 2 bedroom for April!!!
    ## 6                       It's Time for a Selfie, bacause You've Found Your New Home!
    ## 7                     Choose Your View at The Post Seattle! 360 breathtaking views!
    ## 8                                         OPEN One Bedroom #238*****Move-in Now****
    ## 9                              Great 2 Bedroom Apartment in Nice 4-Plex in Auburn!!
    ## 10             OPEN HOUSE @ HAWTHORNE! LAST STUDIO AND 1 BEDROOM AVAILABLE NOW!!!!!
    ## 11                                      Large 1 Bedroom Apartment Available TODAY!!
    ## 12                                  ≧'◡'≦ Stunning Apartment Home Available Now '◡'
    ## 13                             Great Location, Renovated Apartment, Washer & Dryer!
    ## 14                          Look-and-Lease Special! Receive $200 towards your rent!
    ## 15               In-Home Washer and Dryer, Electric Fireplace *, Carports Available
    ## 16              Relax in our Year-round Hot tub, Recently Resurfaced with the Pool!
    ## 17                                                 Bright One Bedroom with Balcony!
    ## 18                                       Great one bedroom for rent in a beautiful,
    ## 19                                            3 bedroom available for May move-in!!
    ## 20                FEBRUARY MOVE IN PACKAGE, One bed One Bath Available For Move In*
    ## 21                                                          Fully Loaded!! Townhome
    ## 22                                                         We Love Your Pets Too!!!
    ## 23                                                          This duplex is amazing!
    ## 24                 Very spacious 1Bedroom, 1Bathroom. Fitness Center, Pool, & MORE!
    ## 25                 3 Bedroom 2 Bath In Beautiful Renton Highlands near new Safeway!
    ## 26                   Brand new finishes..... 2x2 w/ washer & dryer. ONE MONTH FREE!
    ## 27                                       Spacious Urban One Bedroom with a balcony!
    ## 28                                                                 1 BEDROOM 1 BATH
    ## 29              Beautifully maintained, light, bright one bedroom plus a den/office
    ## 30                    Eclectic Style, Modern Finishes, Large Windows, 2 Weeks Free!
    ## 31           SPECIAL PRICE!!!!! Get it while it LASTS!! 2 bed / 2.5 bath w/ A VIEW!
    ## 32                                *1BED W/ WALK IN CLOSET! W/D*STAINLESS*FIREPLACE*
    ## 33            Move In Today To This Picturesque 1BD Home! Top Floor Tree Top Views!
    ## 34                                                     1 bedroom + Den in Downtown!
    ## 35                           2 BED*APPLY TODAY**FREE GARAGE**W/D IN HOME**FIREPLACE
    ## 36                                Amazing Lake Washington View | First month on us!
    ## 37            D/T SEATTLE:STUDIO CONDO-$1200/month Convenient Location!Close to bus
    ## 38                             Gorgeous 1 Bedroom with High End Finishes RIGHT NOW!
    ## 39                 Playground NEW, Fitness Center NEW, Ample Storage, Deck or Patio
    ## 40                    Ready Next Week! Gorgeous Top Floor Two Bedroom One Bath Home
    ## 41                          2 BED**GARAGE INCL**3RD FLOOR*PATIO*STAINLESS*FIREPLACE
    ## 42              Year Round Spa, Newly Renovated, Great Location!!! Only one left!!!
    ## 43                 Exceptional 3 bedroom home! Pet Friendly too! Renovated kitchen!
    ## 44                                Gorgeous and Spacious 2 Bedrooms at U District!!!
    ## 45           Our 2 Bedrooms are More than Just a Song...They're a Whole Mixed Tape!
    ## 46                               Beautiful 2 story LOFT apartment at a great price!
    ## 47              Minutes From I-5 and Hwy 99, Dishwasher & Garbage Disposal, Storage
    ## 48             LEASING * ONE BEDROOM * TWO BEDROOM * & * STUDIOS AT MAPLEWOOD PARK!
    ## 49                             Got Pets - Pacific Walk Loves Pets!! *MOVE IN READY!
    ## 50                                Convenient Location, Spa Hot Tub Area, Dishwasher
    ## 51                                              1 Bedroom, 1.5 Bath with Den & View
    ## 52                                    Moving to JBLM? We are only 20 minutes away!!
    ## 53                                   Come check out these 1 bedroom homes Saturday!
    ## 54                           Now Available, On Site Maintenance, Expansive Ceilings
    ## 55             Open House at Zephyr Saturday/Sunday from 10-2pm. Come in for a tour
    ## 56                                         Stylish Features, Bike Racks, Playground
    ## 57                              Stop looking!! We have what you are looking for!!!!
    ## 58                             Got Pets - Pacific Walk Loves Pets!! *MOVE IN READY!
    ## 59                                   Brand new fitness center! Remodeled 1 bedroom.
    ## 60                                AMAZING FLOOR PLANS! WASHER AND DRYER! FREE RENT!
    ## 61                All Wood Floors on this Studio, Perfect for Pet Lovers - Only One
    ## 62                   3 months free! Brand New 62+ Senior Affordable Apartment Homes
    ## 63                               3 bedroom, 2 bath new doublewide manufactured home
    ## 64                                                Basketball Court, Garage, Carport
    ## 65                                                              Studio in Downtown!
    ## 66             3 Mo. Free w/ B-325! Brand New 62+ Senior Affordable Apartment Homes
    ## 67                               Spacious 3 Bedroom Floor Plan with Walk-in Closet!
    ## 68                     Corner 2-bedroom with amazing views off the private terrace!
    ## 69                                     Bellevue + Kirkland luxury 3 story townhouse
    ## 70                       Need a One Bedroom for April 1st Move In? Look No Further!
    ## 71                               Be in the center of the city without the high rent
    ## 72                 Sunny Corner 1x1 with huge fenced patio! No March Rent Pro-Rate!
    ## 73                          Our Largest 1 Bedroom 2 Bathroom Loft is Now Available!
    ## 74                                    Two bedroom/One Bath House with fenced yard!!
    ## 75            On-site laundry, Theatre/conference center, Storage space, Dishwasher
    ## 76             Spring Has Sprung! Visit Us Today! Spacious One Bedroom One Bathroom
    ## 77                           Spacious 1 bedroom with Shoji doors and all the charm!
    ## 78                                                                 Townhouse Duplex
    ## 79             Close to LK WA Tech, Cascadia, and UW Bothell, Clubhouse, Playground
    ## 80                                           Watch the sunset from your living room
    ## 81                       Top Floor 1 Bedroom In Capitol Hill. Huge Open Floor Plan!
    ## 82                                                           2 bedroom in Downtown!
    ## 83                                              Deluxe 1 bedroom with huge balcony!
    ## 84                                 Gorgeous 4 Bedroom Home with Beautiful Finishes!
    ## 85                                                    NEED TO MOVE TODAY? CALL NOW!
    ## 86                                                    Hurry! This One Will Go Fast!
    ## 87  Roomy 2/1 Apartment Home - This Wallingford/Fremont condo is available for rent
    ## 88                                        2BR 2 Bed 2 Bedroom 2-bedroom two bedroom
    ## 89                                             Carve Out a Great Life at The (104)!
    ## 90               Northwest facing 1 Bedroom+ Den. Enjoy the Sunset over Elliot Bay!
    ## 91                    Free Coffee And A Tour With Me! 1 Month Free On Select Homes!
    ## 92                                   Private entrance, nice neighborhood east of UW
    ## 93               Walk-in closet, Central heat, Garbage disposal, Additional storage
    ## 94                                        3 BR, 3 Baths, Three to Six months Rental
    ## 95                                     HUGE 2 Bedroom 2.5 Bath Ready For You Today!
    ## 96                                           ☘ Spring Ready☘Fireplace☘W/D Included☘
    ## 97                                                    Luxury living on Capitol Hill
    ## 98                              Spacious Homes! Walk Score of 92! Live In Bellevue!
    ## 99                                                       Help save the environment.
    ## 100                       Lovely Furnished Home in Edmonds Bowl available June 15th
    ##     Price             Date                      URL
    ## 1    1249 2016-03-25 17:44 /tac/apa/5508546994.html
    ## 2    2450 2016-03-25 17:44 /see/apa/5508556381.html
    ## 3    1305 2016-03-25 17:44 /skc/apa/5508510980.html
    ## 4    2995 2016-03-25 17:44 /see/apa/5508550133.html
    ## 5     960 2016-03-25 17:44 /kit/apa/5504903501.html
    ## 6    1519 2016-03-25 17:43 /skc/apa/5508545139.html
    ## 7    2648 2016-03-25 17:43 /see/apa/5508554477.html
    ## 8    1563 2016-03-25 17:42 /est/apa/5508553942.html
    ## 9     950 2016-03-25 17:41 /skc/apa/5508553071.html
    ## 10   1699 2016-03-25 17:41 /see/apa/5508553044.html
    ## 11    915 2016-03-25 17:41 /oly/apa/5508541280.html
    ## 12   1249 2016-03-25 17:41 /see/apa/5508552871.html
    ## 13   1175 2016-03-25 17:41 /skc/apa/5474573279.html
    ## 14   1485 2016-03-25 17:41 /est/apa/5508552191.html
    ## 15   1121 2016-03-25 17:40 /sno/apa/5482558633.html
    ## 16   2155 2016-03-25 17:40 /est/apa/5508551495.html
    ## 17   1909 2016-03-25 17:40 /see/apa/5508551437.html
    ## 18    660 2016-03-25 17:40 /sno/apa/5508551374.html
    ## 19   1450 2016-03-25 17:40 /skc/apa/5508551281.html
    ## 20   1105 2016-03-25 17:40 /tac/apa/5465644066.html
    ## 21   2185 2016-03-25 17:40 /est/apa/5508526358.html
    ## 22   1301 2016-03-25 17:40 /sno/apa/5508522480.html
    ## 23   1225 2016-03-25 17:40 /sno/apa/5508452162.html
    ## 24   1030 2016-03-25 17:40 /tac/apa/5508550830.html
    ## 25   1975 2016-03-25 17:39 /est/apa/5508550606.html
    ## 26   2095 2016-03-25 17:39 /est/apa/5508550397.html
    ## 27   2375 2016-03-25 17:39 /see/apa/5508549609.html
    ## 28    800 2016-03-25 17:38 /sno/apa/5508549476.html
    ## 29   1445 2016-03-25 17:38 /see/apa/5508489503.html
    ## 30   2170 2016-03-25 17:38 /see/apa/5508549248.html
    ## 31   1445 2016-03-25 17:38 /tac/apa/5495791486.html
    ## 32   1340 2016-03-25 17:37 /see/apa/5508547965.html
    ## 33   1466 2016-03-25 17:37 /est/apa/5508547745.html
    ## 34   2325 2016-03-25 17:37 /est/apa/5508521523.html
    ## 35   1605 2016-03-25 17:36 /sno/apa/5508546876.html
    ## 36   2665 2016-03-25 17:36 /see/apa/5508539620.html
    ## 37   1200 2016-03-25 17:36 /see/apa/5502148982.html
    ## 38   1719 2016-03-25 17:36 /see/apa/5508546300.html
    ## 39   2410 2016-03-25 17:35 /est/apa/5508546062.html
    ## 40   1924 2016-03-25 17:35 /est/apa/5508545980.html
    ## 41   1840 2016-03-25 17:35 /sno/apa/5508545872.html
    ## 42   1165 2016-03-25 17:35 /tac/apa/5490606700.html
    ## 43   2092 2016-03-25 17:35 /sno/apa/5508536539.html
    ## 44   2885 2016-03-25 17:35 /see/apa/5508545666.html
    ## 45   2890 2016-03-25 17:35 /see/apa/5508536058.html
    ## 46   2050 2016-03-25 17:35 /see/apa/5508533506.html
    ## 47   1635 2016-03-25 17:35 /sno/apa/5508544987.html
    ## 48     NA 2016-03-25 17:34 /see/apa/5508544310.html
    ## 49    950 2016-03-25 17:33 /tac/apa/5508543611.html
    ## 50   1453 2016-03-25 17:33 /sno/apa/5508532051.html
    ## 51   1750 2016-03-25 17:33 /see/apa/5508543549.html
    ## 52    950 2016-03-25 17:33 /tac/apa/5508542775.html
    ## 53   1500 2016-03-25 17:33 /sno/apa/5508524707.html
    ## 54   2502 2016-03-25 17:32 /est/apa/5508542261.html
    ## 55   2695 2016-03-25 17:32 /see/apa/5508542149.html
    ## 56    969 2016-03-25 17:32 /sno/apa/5508534105.html
    ## 57   1295 2016-03-25 17:32 /skc/apa/5508542041.html
    ## 58    950 2016-03-25 17:32 /tac/apa/5508541738.html
    ## 59   1350 2016-03-25 17:32 /tac/apa/5465778104.html
    ## 60   1595 2016-03-25 17:32 /see/apa/5508541670.html
    ## 61   1650 2016-03-25 17:32 /see/apa/5508517438.html
    ## 62    913 2016-03-25 17:32 /oly/apa/5494515537.html
    ## 63   1850 2016-03-25 17:32 /tac/apa/5498297605.html
    ## 64   1150 2016-03-25 17:31 /skc/apa/5508541444.html
    ## 65   1757 2016-03-25 17:31 /est/apa/5508523278.html
    ## 66    782 2016-03-25 17:31 /oly/apa/5464930790.html
    ## 67   1585 2016-03-25 17:30 /sno/apa/5508539930.html
    ## 68   3450 2016-03-25 17:30 /see/apa/5508529282.html
    ## 69   2750 2016-03-25 17:30 /est/apa/5508539783.html
    ## 70   1378 2016-03-25 17:30 /est/apa/5508539710.html
    ## 71   1095 2016-03-25 17:30 /see/apa/5508539446.html
    ## 72   1040 2016-03-25 17:30 /sno/apa/5508539175.html
    ## 73   2495 2016-03-25 17:29 /see/apa/5508532159.html
    ## 74    800 2016-03-25 17:29 /sno/apa/5508538730.html
    ## 75   2033 2016-03-25 17:29 /skc/apa/5508538686.html
    ## 76   1328 2016-03-25 17:29 /see/apa/5508538397.html
    ## 77   1995 2016-03-25 17:28 /see/apa/5508530913.html
    ## 78   1450 2016-03-25 17:28 /sno/apa/5471432444.html
    ## 79   1767 2016-03-25 17:28 /est/apa/5493969145.html
    ## 80   3200 2016-03-25 17:27 /est/apa/5508519815.html
    ## 81   1795 2016-03-25 17:26 /see/apa/5508524615.html
    ## 82   2697 2016-03-25 17:26 /est/apa/5508526986.html
    ## 83   1514 2016-03-25 17:26 /skc/apa/5508535228.html
    ## 84   1400 2016-03-25 17:26 /tac/apa/5508499392.html
    ## 85   1280 2016-03-25 17:26 /skc/apa/5508534643.html
    ## 86   1847 2016-03-25 17:25 /sno/apa/5508534312.html
    ## 87   1750 2016-03-25 17:25 /see/apa/5508441760.html
    ## 88   2640 2016-03-25 17:25 /see/apa/5508522909.html
    ## 89   1395 2016-03-25 17:25 /est/apa/5508521469.html
    ## 90   2425 2016-03-25 17:25 /see/apa/5508519928.html
    ## 91   1875 2016-03-25 17:24 /see/apa/5508533279.html
    ## 92   1095 2016-03-25 17:24 /see/apa/5508533160.html
    ## 93   1500 2016-03-25 17:24 /tac/apa/5508532502.html
    ## 94   1550 2016-03-25 17:24 /skc/apa/5505032331.html
    ## 95   1541 2016-03-25 17:24 /skc/apa/5508519798.html
    ## 96   1136 2016-03-25 17:24 /sno/apa/5495780288.html
    ## 97   2050 2016-03-25 17:24 /see/apa/5508532201.html
    ## 98   1799 2016-03-25 17:24 /see/apa/5508532176.html
    ## 99   1550 2016-03-25 17:23 /see/apa/5508494256.html
    ## 100  4500 2016-03-25 17:23 /sno/apa/5508530993.html
