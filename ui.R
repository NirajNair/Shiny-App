#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    pageWithSidebar(
        headerPanel("Body Mass Index Classification in Adults"),
        sidebarPanel(
            numericInput(inputId="heightIp", label="Your height in cm", value= 0,
                         min=0),
            numericInput(inputId="weightIp", label="Your weight in kg", value= 0,
                         min=0),
            br(),
            p(strong(em("Github repository:",a("Developing Data Products - Peer Assessment Project; Shiny App",href="https://github.com/CrazyFarang/DevelopingDataProducts"))))
        ),
        mainPanel(
            tabsetPanel(
                tabPanel('Your results',
                         h5('Your BMI coefficient kg/m^2'),
                         verbatimTextOutput("Bmi"),
                         verbatimTextOutput("oBMIclass"),
                         
                )
            )
        )
    )
))

