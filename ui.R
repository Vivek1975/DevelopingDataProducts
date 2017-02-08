#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Choose Distribution and Change Parameters"),
  fluidRow(column(4,
                  includeText("Inculde.txt"))),
  # Sidebar with controls to select the random distribution type
  # and change parameters. 
  sidebarLayout(
    sidebarPanel(
      radioButtons("dist", "Distribution type:",
                   c("Normal" = "norm",
                     "Binomial" = "binom",
                     "Uniform" = "unif",
                     "Exponential" = "exp")),
      br(),
      sliderInput("n", 
                  "Number of observations:", 
                  value = 500,
                  min = 1, 
                  max = 1000),
      br(),
      conditionalPanel(
                  "input.dist == 'norm'",
                  sliderInput("mean", 
                  "Mean:", 
                  value = 0,
                  min = -10, 
                  max = 10),
                  br(),
                  sliderInput("sd", 
                  "Standard Deviation", 
                  value = 1,
                  min = 0, 
                  max = 10)),
      conditionalPanel(
        "input.dist == 'binom'",
        
        sliderInput("size", 
                    "Number of Trials:", 
                    value = 1,
                    min = 0, 
                    max = 1000),
        br(),
        sliderInput("prob", 
                    "Probability:", 
                    value = 0.5,
                    min = 0, 
                    max = 1)),
      conditionalPanel(
        "input.dist == 'unif'",
       
        sliderInput("min", 
                    "Minimum:", 
                    value = 0,
                    min = 0, 
                    max = 1000),
        br(),
        sliderInput("max", 
                    "Maximum:", 
                    value = 1,
                    min = 0, 
                    max = 1000)),
      conditionalPanel(
        "input.dist == 'exp'",
        
        sliderInput("rate", 
                    "Rate:", 
                    value = 1,
                    min = 0, 
                    max = 1000))
      
    ),
    
    # Show a tabset that includes a plot
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot", plotOutput("plot"))
                
      )
    )
  )
))
