library(shiny)
library(ggplot2)

#dataset<-iris
shinyUI(pageWithSidebar(headerPanel("The display of iris"),
                       sidebarPanel(
                         
                         textInput("caption", "Caption:", "Data Summary"),
                         numericInput("obs", "Number of observations to view:", 10),
                         
                         selectInput('x','X',names(iris)),
                         selectInput('y','Y',names(iris)[2]),
                         selectInput('color','Color',c('None',names(iris))),
                         
                         
                         
                         checkboxInput('smooth','Smooth')
                       ),
                       
                       mainPanel(plotOutput('plot'),
                                 
                                 
                                 
                                 h3(textOutput("caption", container = span)),
                                 
                                 verbatimTextOutput("summary"), 
                                 
                                 tableOutput("view")
                                 
                                 
                                 
                                 
                                 )
                       
                       
                       
                       
                       
                       
                       
                       ))



