
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
    htmlOutput("AuthMeetupURL"),
    sidebarMenu(
      menuItem("Meetups", tabName="meetups", icon=icon("smile-o")),
      menuItem("About", tabName="about", icon=icon("question-circle"))
    )
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tabItems(
      tabItem("meetups",
              htmlOutput("yourmeetups")),
      tabItem("about",
              a(href="https://github.com/HarlanH/shiny-meetup-test/", 
                        "Source on Github"))
    )
    
  )
))
