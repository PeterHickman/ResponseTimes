#Repsonse Times

Parse Rails 3 production logs and report response times for each controller and action

#Example report

    FeedController#scores_updates : Requests .:     3626
                                  : Overall ..:    22.00  1475.11 41105.00
                                  : View .....:     2.90   387.92 31096.10
                                  : AR .......:     0.00   151.91 15606.00

       FeedController#stats_match : Requests .:        2
                                  : Overall ..:    40.00   128.50   217.00
                                  : View .....:     2.80   103.15   203.50
                                  : AR .......:     0.00     4.50     9.00

     FeedController#stats_updates : Requests .:     4103
                                  : Overall ..:    21.00  1960.44 45682.00
                                  : View .....:     2.90   461.44 30558.70
                                  : AR .......:     0.00   227.81 12359.40

           SessionsController#new : Requests .:        2
                                  : Overall ..:     5.00    21.50    38.00
                                  : View .....:     4.80    21.25    37.70
                                  : AR .......:     0.00     0.00     0.00

           SportsController#index : Requests .:        3
                                  : Overall ..:   874.00  1380.00  2090.00
                                  : View .....:   224.80   289.53   407.90
                                  : AR .......:     0.00   460.33   831.20

        SuppliersController#index : Requests .:        1
                                  : Overall ..:   209.00   209.00   209.00
                                  : View .....:   202.70   202.70   202.70
                                  : AR .......:     0.00     0.00     0.00
