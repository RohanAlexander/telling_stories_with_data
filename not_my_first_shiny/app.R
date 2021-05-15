library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Count of names for five most popular names each year."),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "number_of_bins",
                        label = "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
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

        # Draw the histogram with the specified number of bins
        top_five_names_by_year %>% 
            ggplot(aes(x = n, fill = sex)) +
            geom_histogram(position = "dodge", bins = input$number_of_bins) +
            theme_minimal() +
            scale_fill_brewer(palette = "Set1") +
            labs(x = "Babies with that name",
                 y = "Occurances",
                 fill = "Sex"
                 )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
