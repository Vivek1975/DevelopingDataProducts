#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

generateReport <- function(par) {
  out.markdown <- ''
  withProgress(message = 'Generating Report',
               value = 0, {
                 out.markdown <- rmarkdown::render(
                   input = par,
                   output_format = "html_document")
                 
                 setProgress(1)
               })
  readr::read_file(out.markdown)
}

shinyServer(function(input, output) {
  output$out1 <- renderText(as.numeric(input$box1) + as.numeric(input$box2))
  output$out2 <- renderText(as.numeric(input$box1) - as.numeric(input$box2))
  output$out3 <- renderText(as.numeric(input$box1) * as.numeric(input$box2))
  output$out4 <- renderText(as.numeric(input$box1) / as.numeric(input$box2))
  output$report <- renderText({ HTML(generateReport("Week4ProjectDocumentation.Rmd")) })
#  output$ui <- renderText({ HTML(generateReport("UI.Rmd")) })
#  output$server <- renderText({ HTML(generateReport("Server.Rmd")) })
})

