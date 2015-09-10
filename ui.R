
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Shiny Meetup Test App"),
  
  fluidRow(
    htmlOutput("AuthMeetupURL"),
    textOutput("authCode"),
    textOutput("accessToken")
  )
))
