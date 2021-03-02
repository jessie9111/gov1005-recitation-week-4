#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(tidycensus)

# Define UI for application
ui <- navbarPage(
    "Final Project Title",
    tabPanel("Model",
             fluidPage(
                 titlePanel("Model Title"),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput(
                             "plot_type",
                             "Plot Type",
                             c("Option A" = "a", "Option B" = "b")
                         )),
                     mainPanel(imageOutput("map")))
             )),
    tabPanel("Discussion",
             titlePanel("Discussion Title"),
             p("Tour of the modeling choices you made and 
              an explanation of why you made them")),
    tabPanel("About", 
             titlePanel("About"),
             h3("Project Background and Motivations"),
             p("Hello, this is where I talk about my project."),
             h3("About Me"),
             p("My name is ______ and I study ______. 
             You can reach me at ______@college.harvard.edu."),
             p(tags$a(href="https://www.linkedin.com/in/jessicasedwards/", "Connect with me on LinkedIn")))
    )

# Define server logic required 
server <- function(input, output) {
    
    output$map <- renderImage({
        if(input$plot_type == "a"){            
            list(
                        src = "map.png",
                        width = 500,
                        height = 500,
                        alt = "Harris County Map")
        }                                        
        else if(input$plot_type == "b"){
            list(
                src = "map_2.png",
                width = 500,
                height = 500,
                alt = "Fairfax County Map")
        }
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
