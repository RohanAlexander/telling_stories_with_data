
# Interactive communication

**Required material**

- Read *M-F-E-O: postcards + distill*, [@hillpostcards].
- Read *Building a blog with distill*, [@citemockblog].
- Read *Geocomputation with R*, Chapter 2 'Geographic data in R', [@lovelace2019geocomputation].
- Read *Mastering Shiny*, Chaper 1 'Your first Shiny app', [@wickham2021mastering].


<!-- **Required viewing** -->

<!-- - Kuriwaki, Shiro, 2020, 'Making maps in R with sf', 1 March, https://vimeo.com/394800836. -->

<!-- **Recommended reading** -->

<!-- - Cooley, David, 2020, 'mapdeck', https://symbolixau.github.io/mapdeck/index.html. -->
<!-- - Gabrielle, 2019, 'Visualising spatial data using sf and mapdeck - part one', 4 December, https://resources.symbolix.com.au/2019/12/04/mapdeck-1/. -->
<!-- - Kolb, Jan-Philipp, 2019, 'Using Web Services to Work with Geodata in R', *The R Journal*, 11:2, pages 6-23, https://journal.r-project.org/archive/2019/RJ-2019-041/index.html. -->
<!-- - 'Leaflet for R', https://rstudio.github.io/leaflet/. -->
<!-- - Xie, Yihui, Amber Thomas, and Alison Presmanes Hill, 2020, *blogdown: Creating Websites with R Markdown*, https://bookdown.org/yihui/blogdown/. -->



**Key concepts and skills**

- Building a website using within the R environment using: `postcards` [@citepostcards], `distill` [@citedistill], and `blogdown` [@citeblogdown].
- Adding interaction to maps, using `leaflet` [@ChengKarambelkarXie2017] and `mapdeck` [@citemapdeck]. 
- Adding interaction to graphs, using `Shiny` [@citeshiny].

**Key libraries**

- `blogdown` [@citeblogdown]
- `distill` [@citedistill]
- `leaflet` [@ChengKarambelkarXie2017]
- `mapdeck` [@citemapdeck]
- `postcards` [@citepostcards]
- `tidyverse` [@citetidyverse]
- `usethis` [@citeusethis]

**Key functions**

- `blogdown::serve_site()`
- `distill::create_article()`
- `leaflet::addCircleMarkers()`
- `leaflet::addLegend()`
- `leaflet::addMarkers()`
- `leaflet::addTiles()`
- `leaflet::leaflet()`
- `mapdeck:::add_scatterplot()`
- `mapdeck::mapdeck()`
- `mapdeck::mapdeck_style()`
- `shiny::fluidPage()`
- `shiny::mainPanel()`
- `shiny::plotOutput()`
- `shiny::renderPlot()`
- `shiny::shinyApp()`
- `usethis::edit_r_environ()`
- `usethis::use_git()`
- `usethis::use_github()`

## Introduction

Books and papers have been the primary mediums for communication for thousands of years. But with the rise of computers, and especially the internet, in recent decades, these static approaches have been complemented with interactive approaches. Fundamentally, the internet is about making files available others. If we additionally allow them to do something with what we make available, then we need to take a variety of additional aspects into consideration. 

In this chapter we begin by covering how to create and publish a website. This serves as a place to host a portfolio of work. After that we cover adding interaction to maps and graphs, which are two that nicely lend themselves to this.

## Making a website

A website is a critical part of communication. For instance, it is a place to make a portfolio of work publicly available. One way to make a website is to use `blogdown` [@citeblogdown]. `blogdown` is a package that allows you to make websites, not just blogs, notwithstanding its name, largely within R Studio. It builds on 'Hugo', which is a popular general framework for making websites. `blogdown` enables us to freely and quickly get a website up-and-running. It is easy to add content from time-to-time. And it integrates with R Markdown, which makes it easy to share work. But `blogdown` is brittle. Because it is so dependent on Hugo, features that work today may not work tomorrow. Also, owners of Hugo templates can update them at any time, without thought to existing users. `blogdown` is a good option if we know what we are doing, or have a specific use-case, or style, in mind. But two other alternatives are better starting points. 

The first is `distill` [@citedistill]. Again, this is an R package that wraps around another framework, in this case 'Distill'. But in contrast to Hugo, Distill is more focused on common needs in data science, and is also only maintained by one group, so it may be considered a more stable choice. That said, the default `distill` site is a little plain looking. As such, following @hillpostcards, we will pair it with a third option, `postcards` [@citepostcards].

The third option, and the one that we will start with, is `postcards` [@citepostcards]. This is a tailored solution that creates simple biographical websites that look great. Having set-up GitHub in R Studio, it is literally possible to have a `postcards` website online in five minutes.


### Postcards

Begin by installing `postcards`, with `install.packages('postcards')` and then creating a new project for the website ('File' -> 'New Project' -> 'New Directory' -> 'Postcards Website'). We can then pick a name and location for the project, and select a postcards theme. In this case, we can start with 'trestles' but this can be changed later. Click the option to 'Open in new session' and then create the project.

That will open a new file and we can now build the site by clicking 'Knit'. This will result in a one-page website (Figure \@ref(fig:trestles))/

\begin{figure}
\includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/trestles} \caption{Example of a website made with `postcards` using the 'trestles' theme}(\#fig:trestles)
\end{figure}

We can now update the basic content to match our own (Figure \@ref(fig:trestlesredux)).

\begin{figure}
\includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/trestlesredux} \caption{Example of Trestles website with updated details}(\#fig:trestlesredux)
\end{figure}

Once the details are personalized, then we push it to GitHub. GitHub would try to build the site, which we do not want, so we first add a hidden file to turn that off, by running this in the console:


```r
file.create('.nojekyll')
```

Then, assuming GitHub was set-up in Chapter \@ref(reproducible-workflows), we can use `usethis` [@citeusethis] to get it onto GitHub. We use `use_git()` to initialize a Git repository, and then `use_github()` pushes it to GitHub.


```r
library(usethis)
use_git()
use_github()
```

The project will then be on GitHub. We can use GitHub pages to host it: 'Settings -> Pages' and then change the source to 'main' or 'master', depending on your settings. GitHub will let you know the address that you can share to visit your site.

### Distill

We will now use `distill` [@citedistill] to build additional infrastructure around our `postcards` site, following @hillpostcards. After that we will explore some of the aspects of `distill` that make it a nice choice, and mention some of the trade-offs. First, we install `distill` with `install.packages('distill')`, and again, create a new project for the website ('File' -> 'New Project' -> 'New Directory' -> 'Distill Blog').

We can then pick a name and location for the project, and set a title. Select 'Configure for GitHub Pages' and also 'Open in a new session'. These options can be changed *ex post*. It should look something like Figure \@ref(fig:distillone).

\begin{figure}
\includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/distill_one} \caption{Example settings for setting up `distill`}(\#fig:distillone)
\end{figure}

At this point we can click 'Build Website' in the Build tab, and we should see the default website (Figure \@ref(fig:distilltwo)).

\begin{figure}
\includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/distill_two} \caption{Example of default `distill` website}(\#fig:distilltwo)
\end{figure}

Again, now we need to update it to reflect our own details. The default for a 'Distill Blog' is that the blog is the homepage. We can change that to use the `postcards` page as the homepage. First we change the name of 'index.Rmd' to 'blog.Rmd' and then create a new 'trestles' page:


```r
postcards::create_postcard(file = "index.Rmd", template = "trestles")
```

The trestles page will open, and we need to add the following line in the yaml file: `site: distill::distill_website`. In Figure \@ref(fig:distillthree) it was added at line 16, and then we can rebuild the website.

\begin{figure}
\includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/distill_three} \caption{Updating the yaml to change the homepage}(\#fig:distillthree)
\end{figure}

We can make the same changes to the default content as earlier, updating the links, image, and bio. The advantage of using `distill` is that we now have additional pages, not just a one-page website, and we also have a blog. By default, we have an 'about' page, but some other pages that may be useful, depending on the particular use-case, include: 'research', 'teaching', 'talks', 'projects', 'software', 'datasets'. As an example, we will add and edit a page called 'software' using `distill::create_article(file = 'software')`.

That will create and open an R Markdown document. To add it to the website, open '_site.yml' and then add a line to the 'navbar' (Figure \@ref(fig:distillfour). After this is done then we can rebuild the website, and the 'software' page will have been added.

\begin{figure}
\includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/distill_four} \caption{Adding another page to the website}(\#fig:distillfour)
\end{figure}

We can continue with this process until we are happy with the website. For instance, we may want to add a blog. To do this we follow the same pattern as before, but with 'blog' instead of 'software'.

When we are happy with our website, we can push it to GitHub and then use GitHub Pages to host it, in the same way that we did with the `postcards` site.

Using the `distill` is a good option when we need a multi-page website, but still want a fairly controlled environment. There are many options that can be changed, and @hillpostcards is a good starting point, in addition to the `distill` homepage: https://rstudio.github.io/distill/.

That said, `distill` is opinionated. While it is a great option, if we want something a little more flexible then `blogdown` might be a better option.







### Blogdown

Using `blogdown` [@citeblogdown] is more work than Google sites or Squarespace. It requires a little more knowledge than using a basic Wordpress site. And if you want to customize absolutely every aspect of your website, or need everything to be 'just so' then `blogdown` may not be a good option. Further, `blogdown` is still under active development and various aspects may break in future releases. However, `blogdown` allows a variety and level of expression that is not possible with `distill`. @citealisonhillblogdown and @blogdownbook are excellent options for learning more about `blogdown`.

First we will need to install `blogdown` `install.packages("blogdown")`. And then create a new project for the website ('File' -> 'New Project' -> 'New Directory' -> 'Website using blogdown'). At this point you can set a name and location, and also select 'Open in a new session' (Figure \@ref(fig:blogdownone)).

\begin{figure}
\includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/blogdown_one} \caption{Example settings for setting up blogdown}(\#fig:blogdownone)
\end{figure}

We can click 'Build Website' from the 'Build' pane, but then an extra step is needed; we need to serve the site `blogdown:::serve_site()`. After this, the site will show in the 'Viewer' pane (Figure \@ref(fig:blogdowntwo)).

\begin{figure}
\includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/blogdown_two} \caption{Serving default blogdown site}(\#fig:blogdowntwo)
\end{figure}

At this point, the default website is being 'served' locally. This means that changes we make will be reflected in the website that we see in the Viewer pane. To see the website in a web browser, click 'Show in new window' on the top left of the Viewer. That will open the website using the address that the R Studio also tells you.

We now want to update the content, starting with the 'About' section. To do that go to 'content -> about.md' and add your own content. One nice aspect of `blogdown` is that it will automatically re-load the content when you save, so you should see your changes immediately show up. You may also like to change the logo. You could do this by adding a square image to 'public/images/' and then changing the call to 'logo.png' in 'config.yaml'. When we are happy with it, we can make our website public in the same way as we did for `postcards`.

One advantage of using `blogdown` is that it allows us to use Hugo templates. This provides a large number of beautifully crafted websites. To pick a theme we go to the Hugo themes page: https://themes.gohugo.io. There are hundreds of different themes. In general, most of them can be made to work with `blogdown`, but sometimes it can be a bit of a hassle to get them working. 

One nice option is Apéro: https://hugo-apero-docs.netlify.app. We can specify the use of this them as part of creating a new site ('File -> New Project -> New Directory -> Website using blogdown'). At this point, in addition to setting the name and location, we can specify a theme. Specifically, in 'Hugo theme' field, we specify a GitHub username and repository, which in this case is 'hugo-apero/apero' (Figure \@ref(fig:blogdownthree)).

\begin{figure}
\includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/blogdown_three} \caption{Using the Apéro theme}(\#fig:blogdownthree)
\end{figure}






## Interactive maps

The nice thing about interactive maps is that we can let our user decide what they are interested in. For instance, in the case of Canadian politics, some people will be interested in Toronto ridings, while others will be interested in Manitoba, etc. But it would be difficult to present a map that focuses on both of those, so an interactive map is a great option for allowing users to focus on what they want.

That said, it is important to be cognizant of what we are doing when we build maps, and more broadly, what is being done at scale to enable us to be able to build our own maps. For instance, with regard to Google, @mcquire2019one says:

> Google began life in 1998 as a company famously dedicated to organising the vast amounts of data on the Internet. But over the last two decades its ambitions have changed in a crucial way. Extracting data such as words and numbers from the physical world is now merely a stepping-stone towards apprehending and organizing the physical world as data. Perhaps this shift is not surprising at a moment when it has become possible to comprehend human identity as a form of (genetic) 'code'. However, apprehending and organizing the world as data under current settings is likely to take us well beyond Heidegger's 'standing reserve' in which modern technology enframed 'nature' as productive resource. In the 21st century, it is the stuff of human life itself—from genetics to bodily appearances, mobility, gestures, speech, and behaviour---that is being progressively rendered as productive resource that can not only be harvested continuously but subject to modulation over time.

Does this mean that we should not use or build interactive maps? Of course not. But it is important to be aware of the fact that this is a frontier, and the boundaries of appropriate use are still being determined. Indeed, the literal boundaries of the maps themselves are being consistently determined and updated. The move to digital maps, compared with physical printed maps, means that it is actually possible for different users to be presented with different realities. For instance, '...Google routinely takes sides in border disputes. Take, for instance, the representation of the border between Ukraine and Russia. In Russia, the Crimean Peninsula is represented with a hard-line border as Russian-controlled, whereas Ukrainians and others see a dotted-line border. The strategically important peninsula is claimed by both nations and was violently seized by Russia in 2014, one of many skirmishes over control' @washingtonpostmaps.


### Leaflet

We can use `leaflet` [@ChengKarambelkarXie2017] to make interactive maps. The essentials are similar to `ggmap` [@KahleWickham2013], but there are many additional aspects beyond that. We can redo the bike map from Chapter \@ref(static-communication).

In the same way as a graph in `ggplot2` begins with `ggplot()`, a map in `leaflet` begins with `leaflet()`. Here we can specify data, and other options such as width and height. After this, we add 'layers' in the same way that we added them in `ggplot2`. The first layer that we add is a tile, using `addTiles()`. In this case, the default is from OpenStreeMap. After that we add markers with `addMarkers()` to show the location of each bike parking spot. 


```r
library(leaflet)
library(tidyverse)

bike_data <- read_csv("outputs/data/bikes.csv")

leaflet(data = bike_data) |>
  addTiles() |>  # Add default OpenStreetMap map tiles
  addMarkers(lng = bike_data$longitude, 
             lat = bike_data$latitude, 
             popup = bike_data$street_address,
             label = ~as.character(bike_data$number_of_spots))
```

![](12-interactive_communication_files/figure-latex/unnamed-chunk-4-1.png)<!-- --> 

There are two new arguments. The first is 'popup', which is what happens when the user clicks on the marker. Here the address will be provided. The second is 'label', which is what happens when the user hovers on the marker. Here the number of parking spots is specified.

We can try another example, this time of the fire stations in Toronto. We can use data from Open Data Toronto using `opendatatoronto` [@citeSharla].


```r
library(opendatatoronto)
# Get starter code from: https://open.toronto.ca/dataset/fire-station-locations/
fire_stations_locations <- get_resource('9d1b7352-32ce-4af2-8681-595ce9e47b6e')
# Grab the lat and long - thanks https://stackoverflow.com/questions/47661354/converting-geometry-to-longitude-latitude-coordinates-in-r
fire_stations_locations <- 
  fire_stations_locations |> 
  tidyr::extract(geometry, c('lon', 'lat'), '\\((.*), (.*)\\)', convert = TRUE)
```





```r
head(fire_stations_locations)
#> # A tibble: 6 x 26
#>   `_id`    ID NAME     ADDRESS   ADDRESS_POINT_ID ADDRESS_ID
#>   <dbl> <dbl> <chr>    <chr>                <dbl>      <dbl>
#> 1     1    21 FIRE ST~ 900 TAPS~          4236992     363382
#> 2     2    60 FIRE ST~ 106 ASCO~           764237      70190
#> 3     3    61 FIRE ST~ 65 HENDR~           819425     127148
#> 4     4    55 FIRE ST~ 260 ADEL~         12763904     484214
#> 5     5    24 FIRE ST~ 745 MEAD~          6349868     357277
#> 6     6    74 FIRE ST~ 140 LANS~         10757599     157562
#> # ... with 20 more variables: CENTRELINE_ID <dbl>,
#> #   MAINT_STAGE <chr>, ADDRESS_NUMBER <dbl>,
#> #   LINEAR_NAME_FULL <chr>, POSTAL_CODE <chr>,
#> #   GENERAL_USE <chr>, CLASS_FAMILY_DESC <chr>,
#> #   ADDRESS_ID_LINK <dbl>, PLACE_NAME <chr>, X <lgl>,
#> #   Y <lgl>, LATITUDE <lgl>, LONGITUDE <lgl>,
#> #   WARD_NAME <chr>, MUNICIPALITY_NAME <chr>, ...
```

There is a lot of information here, but we will just plot the location of each fire station along with their name and address. 

We will introduce a different type of marker here, which is circles. This will allow us to use different colors for the outcomes of each type. There are four possible outcomes: "Fire/Ambulance Stations", "Fire Station", "Restaurant", "Unknown". 


```r
library(leaflet)

pal <-
  colorFactor("Dark2", domain = fire_stations_locations$GENERAL_USE |> unique())

leaflet() |>
  addTiles() |>  # Add default OpenStreetMap map tiles
  addCircleMarkers(
    data = fire_stations_locations,
    lng = fire_stations_locations$lon,
    lat = fire_stations_locations$lat,
    color = pal(fire_stations_locations$GENERAL_USE),
    popup = paste(
      "<b>Name:</b>",
      as.character(fire_stations_locations$NAME),
      "<br>",
      "<b>Address:</b>",
      as.character(fire_stations_locations$ADDRESS),
      "<br>"
    )
  ) |>
  addLegend(
    "bottomright",
    pal = pal,
    values = fire_stations_locations$GENERAL_USE |> unique(),
    title = "Type",
    opacity = 1
  )
```

![](12-interactive_communication_files/figure-latex/unnamed-chunk-8-1.png)<!-- --> 



### Mapdeck

`mapdeck` [@citemapdeck] is based on WebGL. This means the web browser will do a lot of work for us. This enables us to accomplish things with `mapdeck` that `leaflet` struggles with, such as larger datasets. 

To this point we have used 'stamen maps' as our underlying tile, but `mapdeck` uses 'Mapbox': https://www.mapbox.com/. This requires registering an account and obtaining a token. This is free and only needs to be done once. Once we have that token we add it to our R environment (the details of this process are covered in Chapter \@ref(gather-data)) by running `usethis::edit_r_environ()`, which will open a text file. There we can add our Mapbox secret token.


```r
MAPBOX_TOKEN = 'PUT_YOUR_MAPBOX_SECRET_HERE'
```

We then save this '.Renviron' file, and restart R ('Session' -> 'Restart R').

Having obtained a token, we can create a plot of our firefighters data from earlier.


```r
library(mapdeck)
#> 
#> Attaching package: 'mapdeck'
#> The following object is masked from 'package:tibble':
#> 
#>     add_column

mapdeck(style = mapdeck_style('dark')
        ) |>
  add_scatterplot(
    data = fire_stations_locations, 
    lat = "lat", 
    lon = "lon", 
    layer_id = 'scatter_layer',
    radius = 10,
    radius_min_pixels = 5,
    radius_max_pixels = 100,
    tooltip = "ADDRESS"
  )
#> Registered S3 method overwritten by 'jsonify':
#>   method     from    
#>   print.json jsonlite
```

![](12-interactive_communication_files/figure-latex/unnamed-chunk-10-1.png)<!-- --> 





## Shiny

`shiny` [@citeshiny] is a way of making interactive web applications using R. It is fun, but fiddly. Here we are going to step through one way to take advantage of `shiny`. Which is to quickly add some interactivity to our graphs. We will return to `shiny` in more detail in Chapter \@ref(deploying-models).

We are going to make an interactive graph based on the 'babynames' dataset from `babynames` [@citebabynames]. First, we will build a static version (Figure \@ref(fig:babynames)).


```r
library(babynames)
library(tidyverse)

top_five_names_by_year <-
  babynames |>
  group_by(year, sex) |>
  arrange(desc(n)) |>
  slice_head(n = 5)

top_five_names_by_year |>
  ggplot(aes(x = n, fill = sex)) +
  geom_histogram(position = "dodge") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1") +
  labs(x = "Babies with that name",
       y = "Occurances",
       fill = "Sex")
```

![(\#fig:babynames)Popular baby names](12-interactive_communication_files/figure-latex/babynames-1.pdf) 

We can see the most popular boys names tend to be more clustered, compared with the most-popular girls names, which may be more spread out. However, one thing that we might be interested in is how the effect of the 'bins' parameter shapes what we see. We might like to use interactivity to explore different values.

To get started, create a new `shiny` app ('File -> New File -> Shiny Web App'). Give it a name, such as 'not_my_first_shiny' and then leave all the other options as the default. A new file 'app.R' will open and we click 'Run app' to see what it looks like.

Now replace the content in that file, 'app.R', with the content below, and then again click 'Run app'


```r
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("Count of names for five most popular names each year."),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(sidebarPanel(
    sliderInput(
      inputId = "number_of_bins",
      label = "Number of bins:",
      min = 1,
      max = 50,
      value = 30
    )
  ),
  
  # Show a plot of the generated distribution
  mainPanel(plotOutput("distPlot")))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$distPlot <- renderPlot({
    # Draw the histogram with the specified number of bins
    top_five_names_by_year |>
      ggplot(aes(x = n, fill = sex)) +
      geom_histogram(position = "dodge", bins = input$number_of_bins) +
      theme_minimal() +
      scale_fill_brewer(palette = "Set1") +
      labs(x = "Babies with that name",
           y = "Occurances",
           fill = "Sex")
  })
}

# Run the application
shinyApp(ui = ui, server = server)
```

You should find that you are served an interactive graph where you can change the number of bins and it should look like Figure \@ref(fig:shinyone).

\begin{figure}
\includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/shiny_one} \caption{Example of Shiny app where the user controls the number of bins}(\#fig:shinyone)
\end{figure}






## Exercises and tutorial




### Exercises



### Tutorial



### Paper

At about this point, Paper 2 (Appendix \@ref(paper-2)) would be appropriate.


