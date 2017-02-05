#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny) 

shinyUI(fluidPage(
  titlePanel("Tiny Calculator"),
  sidebarLayout(
    sidebarPanel(
      textInput("box1", "Enter first number:", value = 0), 
      textInput("box2", "Enter second number:", value = 0),
      submitButton("Submit")
     ),
    mainPanel(
      h3("Addition:"),
      textOutput("out1"),
      h3("Subtraction:"),
      textOutput("out2"),
      h3("Multiplication:"),
      textOutput("out3"),
      h3("Division:"),
      textOutput("out4"),
      tabsetPanel(
        tabPanel("Application Documentation", htmlOutput("report"))
    #    tabPanel("Shiny User Interface", htmlOutput("ui")), 
    #    tabPanel("Shiny Server", htmlOutput("server"))
      ),
      p(strong(em("Github repository Link:",a("Developing Data Products - Link to Code",href="https://github.com/Vivek1975/DevelopingDataProducts"))))
      )
    )
  )
)
