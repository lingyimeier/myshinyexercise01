library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  output$caption <- renderText({
    input$caption
  })
  
  # The output$summary depends on the datasetInput reactive
  # expression, so will be re-executed whenever datasetInput is
  # invalidated
  # (i.e. whenever the input$dataset changes)
  output$summary <- renderPrint({
    #dataset <- datasetInput()
    summary(iris)
  })
  
  # The output$view depends on both the databaseInput reactive
  # expression and input$obs, so will be re-executed whenever
  # input$dataset or input$obs is changed. 
  output$view <- renderTable({iris
    #head(iris(), n = input$obs)
  })
  
  output$plot <- reactivePlot(function() {
    
    p <- ggplot(iris, aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$color != 'None')
      p <- p + 
        aes_string(color=input$color) + 
        theme(legend.position="top")
    
    if (input$smooth)
      p <- p + 
        geom_smooth() + 
        theme(legend.position="top")
    
    print(p)
    
  }, height=400)
  
})
