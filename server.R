library(shiny)
library(RCurl)
library(plyr)
library(stringr)
library(Hmisc)

rekURL="http://rekognition.com/func/api/?api_key=Rcl2sf7etxRQSP99&api_secret=CviqfsiQ7AgjgaCb&jobs=face_gender_part_age_race_beard&urls="
  
shinyServer(function(input, output) {
facedata <- reactive({
  
  fullURL=paste(rekURL, input$url, sep="")
  faceData=getURL(fullURL)
  
  faceData=strsplit(faceData, '\"')

  #Beard

  Beard=faceData[[1]][[87]]
  Beard=substr(Beard, 2, 2)
  
  Beard=as.factor(ifelse(Beard=="0", "No", "Yes"))

  #Gender

  Gender=faceData[[1]][[91]]
  Gender=substr(Gender, 2, 2)
  
  Gender=as.factor(ifelse(Gender=="0", "Female", "Male"))

  #Age

  Age=faceData[[1]][[85]]
  Age=substr(Age, 2, 4)
  Age= as.numeric(Age)

  #Race
  Race=faceData[[1]][[76]]
  Race=substr(Race, 0, 6)
  Race=capitalize(Race)
 
  #noseX

  noseX= faceData[[1]][[39]]
  noseX=substr(noseX, 2, 5)
  
  noseY= faceData[[1]][[41]]
  noseY= substr(noseY, 2, 6)
  
  #Create Dataframe

  faceDatadf= data.frame(Gender, Beard, Age, Race, noseX, noseY)
}
)

output$test <- renderDataTable(faceDatadf())
})

