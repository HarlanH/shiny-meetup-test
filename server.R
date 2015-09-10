library(shiny)


source("auth.R")

securityCode <- createCode()

shinyServer(function(input, output, session) {
  AuthCode <- reactive({
    authReturnCode(session, securityCode)
    })
  
  appURL <- reactive({
    if (!is.null(session)) {
      ## build redirect URI
      paste0(session$clientData$url_protocol, "//", session$clientData$url_hostname, 
             ifelse(session$clientData$url_hostname == "127.0.0.1", 
                    ":", session$clientData$url_pathname), session$clientData$url_port)
    }
  })
  
  AccessToken <- reactive({
      validate(
        need(AuthCode(), "Authenticate To See")
      )
      access_token <- MeetupGetToken(code = AuthCode(), redirect.uri=appURL())
      token <- access_token$access_token
    })
    
  output$authCode <- renderText(AuthCode())
  output$accessToken <- renderText(AccessToken())
  
  #output$appurl <- renderText({appURL()})
  output$AuthMeetupURL <- renderUI({
      a("Log In With Meetup", 
        href=MeetupGetTokenURL(securityCode, redirect.uri=appURL()))
    })
})
