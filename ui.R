library(shiny)
shinyUI(fluidPage(
  fluidRow(
    textInput("url", "Enter URL:", "http://www.luggageonline.com/lolnews/wp-content/uploads/2015/03/Clinton4.jpg")),
    uiOutput("myImage"),
    tableOutput("test")
  ))
