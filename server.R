#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)

# Define server logic for random distribution application
shinyServer(function(input, output) {

  
  # Simulate random numbers and generate a histograms of the data
  output$plot <- renderPlot({

    mean <- input$mean
    sd <- input$sd
    n <- input$n
    size <- input$size
    prob <- input$prob
    rate <- input$rate
    min <- input$min
    max <- input$max
    switch(input$dist, "norm"= hist(rnorm(n,mean,sd),main = paste("Histogram of Normal Distribution")),
                       "binom" = hist(rbinom(n,size,prob),main = paste("Histogram of Binomial Distribution")),
                       "exp" = hist(rexp(n,rate),main = paste("Histogram of Exponential Distribution")),
                       "unif" = hist(runif(n,min,max),main = paste("Histogram of Uniform Distribution")))

  })
 
  
})
