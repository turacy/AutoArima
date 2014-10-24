library(shiny)

# package (which generally comes preloaded).
library(datasets)

shinyUI(
  
  
  fluidPage(    
    
    # Page a title
    titlePanel("Automatic ARIMA Model Identification"),
    # Brief explanation
    h5("This application estimates ARIMA model of given time series and draws a plot for forecasts."),
    helpText(a("Click here for documentation",href="https://github.com/turacy/AutoArima/blob/master/README.md")),
    
    
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("data", "Data Set:", 
                    choices=c("AirPassengers","Nile")),
        hr(),
        helpText("Available Data Sets for Modelling")
        
      ),
      
     
      mainPanel(
        # Create a time series the plot
        h4("Plot of Time Series"),
        plotOutput("Plot"),
        # ARIMA model order and coefficients
        h4("Model Output"),
        verbatimTextOutput("model")
      )
    )))
