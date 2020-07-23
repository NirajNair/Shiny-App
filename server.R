#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$Bmi <- reactive({
        if (input$weightIp==0 | input$heightIp==0) return(NA) 
        else  return(round(input$weightIp/(input$heightIp/100)^2,1))
        
    })
    output$oBMIclass<-reactive({
        if (input$weightIp==0 | input$heightIp==0) return(NA) 
        else {
            bmi <- round(input$weightIp/(input$heightIp/100)^2,1)
        }  
        if (is.na(bmi)) return ("")
        else {
            if (bmi<18.5) return("Your BMI is less than 18.5 you are considered UNDERWEIGHT") 
            if (bmi>=8.5 & bmi<24.9) return("Your BMI is in range 18.5 to 24.9 you are in HEALTHY WEIGHT RANGE")
            if (bmi>=25 & bmi<29.9) return("Your BMI is in range 25 to 29.9 you are OVERWEIGHT")
            if (bmi>=30) return("Your BMI is higher than 30 you are OBESE")
        }
    })

})
