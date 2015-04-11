library(shiny)


# Define UI for miles per gallon application
shinyUI(fluidPage(
   titlePanel("Facial Recognition App"),
  sidebarLayout(
    sidebarPanel(("Provide A Face for Recognition"),
               textInput("url", "Enter URL:", "")),

  mainPanel(("Output"),
  tableOutput("test")
)
)))
