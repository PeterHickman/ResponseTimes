#Repsonse Times

Parse Rails 3 production logs and report response times for each controller and action

#Example report

    FeedController#sports_competitions : Requests .:    83324
                                       : Overall ..:    46.00   436.59  7939.00
                                       : View .....:     1.90    50.28  2134.60
                                       : AR .......:     8.30    72.29  2387.30

     FeedController#sports_competitors : Requests .:        2
                                       : Overall ..:  1086.00  1632.50  2179.00
                                       : View .....:   683.10  1135.30  1587.50
                                       : AR .......:   161.60   199.75   237.90

                FeedController#updates : Requests .:   848298
                                       : Overall ..:    39.00   371.19 57240.00
                                       : View .....:     1.10     6.88  8502.80
                                       : AR .......:     6.90   310.44 54328.10

          OverviewController#dashboard : Requests .:      364
                                       : Overall ..:  1242.00  3938.09 18825.00
                                       : View .....:   373.30  1725.20 10334.20
                                       : AR .......:   715.90  1979.74 14443.70

    OverviewController#results_pending : Requests .:    11429
                                       : Overall ..:   182.00  1339.55 16970.00
                                       : View .....:    28.90   592.18  9340.30
                                       : AR .......:    87.30   614.89  7710.40

           OverviewController#schedule : Requests .:      116
                                       : Overall ..:   183.00  1377.92  7683.00
                                       : View .....:    43.50   521.89  2491.30
                                       : AR .......:    68.50   742.21  6331.00

             OverviewController#search : Requests .:       27
                                       : Overall ..:  3479.00  5169.26  9821.00
                                       : View .....:    42.60   378.65  1770.80
                                       : AR .......:   893.00  2062.29  4114.70
