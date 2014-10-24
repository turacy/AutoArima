library(shiny)
library(datasets)
require(forecast)

shinyServer(function(input, output) {
  model<-reactive({
    Time.Series<-switch(input$data,
                        "AirPassengers" = AirPassengers,
                        "Nile" = Nile)
    auto.arima(Time.Series)
    
  })
  
  
  output$model<-renderPrint({
    model()
  })
  
  output$Plot<-renderPlot({
    plot(forecast(model(),h=10))
  })
  
  
  
  
}
)

