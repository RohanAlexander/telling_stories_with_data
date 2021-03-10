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

tuesdata <- tidytuesdayR::tt_load('2021-03-09')
dataa <- tuesdata$raw_bechdel

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Man Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("min_year_of_interest",
                        "Earliest year of interest:",
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
        # generate bins based on input$bins from ui.R
        # x    <- faithful[, 2]
        
        min_year <- input$min_year_of_interest
        # max_year <- input$max_year_of_interest
        # binss <- seq(min(x), max(x), length.out = input$binsss + 1)
        
        # dataa %>% 
        #     filter(year > min_year) %>% 
        #     # filter(year < max_year) %>% 
        #     ggplot() +
        #     geom_histogram(aes(x = year, fill = rating, group = rating))
        
        dataa %>% 
            mutate(year = as.integer(year),
                   rating = forcats::as_factor(rating)
            ) %>% 
            filter(year > min_year) %>% 
            ggplot() +
            geom_jitter(aes(x = year, y= rating), alpha = 0.1, width = 0) +
            theme_classic() +
            labs(y = "Rating",
                 x = "Year")

        # draw the histogram with the specified number of bins
        # hist(x, breaks = binss, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
