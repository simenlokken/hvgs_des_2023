## Generate Strava session data function

# This function retrieves a training session from my Strava

# It needs a a session id, data resolution ("low", "medium" or "high"),
# the columns I like from the data and the new name of the data frame

library(rStrava)

generate_strava_session_data <- function(id = NULL, resolution = NULL){
    
    # The token that makes the connection to my Strava data
    
    strava_token <- httr::config(
      token = strava_oauth(
        Sys.getenv("STRAVA_API_NAME"),
        Sys.getenv("STRAVA_API_CLIENT_ID"),
        Sys.getenv("STRAVA_API_SECRET_KEY"),
        app_scope = "activity:read_all",
        cache = TRUE))
                                                      
    
    # Accessing the data
    
    my_acts <- get_activity_list(strava_token)
    strava_data <<- get_activity_streams(my_acts, # To use a double assign operator is sub-otimal
                                        stoken = strava_token,
                                        id = id,
                                        resolution = resolution)
    
                         
    
    return(strava_data)
    
}