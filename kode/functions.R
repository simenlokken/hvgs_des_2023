# Denne funksjonen henter data fra Strava og lagrer det i et objekt

library(rStrava)

generate_strava_session <- function(id = NULL, resolution = NULL) {
    
    strava_token <- httr::config(
      token = strava_oauth(
        Sys.getenv("STRAVA_API_NAME"),
        Sys.getenv("STRAVA_API_CLIENT_ID"),
        Sys.getenv("STRAVA_API_SECRET_KEY"),
        app_scope = "activity:read_all",
        cache = TRUE)
      )
                                
    my_acts <- get_activity_list(strava_token)
    strava_data <<- get_activity_streams(
      my_acts, 
      stoken = strava_token,
      id = id,
      resolution = resolution
    )
    
}
