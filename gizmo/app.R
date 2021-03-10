#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# install.packages('tidytuesdayR')
library(shiny)
library(tidyverse)
library(tidytuesdayR)

tuesdata <- tidytuesdayR::tt_load('2021-03-09')
bechdel <- tuesdata$raw_bechdel

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Bechdel data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("will_trefiak",
                        "Starting year:",
                        min = 1888,
                        max = 2020,
                        value = 1888)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({

        bechdel %>% 
            filter(year > input$will_trefiak) %>% 
            ggplot(aes(x = year, y = rating)) + 
            theme_minimal() + 
            geom_smooth() +
            labs(x = "Year",
                 y = "Bechdel") +
            ylim(0,3)
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
