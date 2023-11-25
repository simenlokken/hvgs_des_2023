library(rStrava)
library(tidyverse)
    
# Data from my personal Strava API
    
app_name <- "simenlok"
app_client_id <- "95182"
app_secret <- "c92193326f6371f97a585225d73e3c3b6ecf5959"
    
# The token that makes the connection to my Strava data
    
strava_token <- httr::config(token = strava_oauth(app_name,
                                                      app_client_id,
                                                      app_secret,
                                                      app_scope = "activity:read_all"))
    
# Accessing the data
    
my_acts <- get_activity_list(strava_token)
id <- {10209626518}
strava_data <- get_activity_streams(my_acts,
                                        strava_token,
                                        id = id,
                                        resolution = "high")
