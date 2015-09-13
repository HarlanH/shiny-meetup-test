
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(shinydashboard)

shinyUI(dashboardPage(
  dashboardHeader(title="Shiny Meetup Test App"),
  dashboardSidebar(
    htmlOutput("AuthMeetupURL")
  ),
  dashboardBody(
    htmlOutput("yourmeetups")
  )
))
