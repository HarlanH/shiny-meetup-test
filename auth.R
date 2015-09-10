auth_endpoint <- "https://secure.meetup.com/oauth2/authorize"
access_endpoint <- "https://secure.meetup.com/oauth2/access"

MeetupGetToken <- function(code,
                           client.id     = getOption("shiny_meetup_test.client_id"),
                           client.secret = getOption("shiny_meetup_test.client_secret"),
                           redirect.uri  = getOption("shiny_meetup_test.redirect_uri")
                           ){
  message("MeetupGetToken")
  raw.data <- httr::POST(access_endpoint,
                         encode = "form",
                         body = list(code = code,
                                     client_id = client.id,
                                     client_secret = client.secret,
                                     redirect_uri = redirect.uri,
                                     grant_type = 'authorization_code')
  )
  
  token.data <- httr::content(raw.data)
  now        <- as.numeric(Sys.time())
  token      <- c(token.data, timestamp = c('first'=now, 'refresh'=now))
  print(token)
  # environment to store credentials
  # a better way, integrate with future integrations
  .state <- new.env(parent = emptyenv())
  .state$token <- token
  
  return(token)
}

createCode <- function(seed=NULL, num=20){
  if (!is.null(seed)) set.seed(seed)
  
  paste0(sample(c(1:9, LETTERS, letters), num, replace = T), collapse='')
} 

MeetupGetTokenURL <-  function(state, ## state can be anything, used to check return is legit. 
                               client.id     = getOption("shiny_meetup_test.client_id"),
                               client.secret = getOption("shiny_meetup_test.client_secret"),
                               redirect.uri  = getOption("shiny_meetup_test.redirect_uri"),
                               scope         = c("https://www.googleapis.com/auth/analytics",
                                                 "https://www.googleapis.com/auth/analytics.readonly")) {
  message("MeetupGetTokenURL")
  ## build auth URL
  url <- paste0(auth_endpoint, '?',
                'client_id=', client.id, '&',
                'state=', state, '&',
                'response_type=code&',
                'redirect_uri=', redirect.uri)
  return(url)
}

authReturnCode <- function(session, securityCode){    
  message("authReturnCode")
  pars <- parseQueryString(session$clientData$url_search)
  
  if(length(pars$state) > 0){ 
    if(pars$state != securityCode){
      warning("securityCode check failed in Authentication! Code:", 
              pars$state, 
              " Expected:", 
              securityCode)
      return()
    } else {
      if(length(pars$code) > 0){
        return(pars$code)
      }
    }
  }
}

