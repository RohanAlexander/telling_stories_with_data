



# Static communication

**Required material**

- Read *R for Data Science*, Chapter 28 'Graphics for communication', [@r4ds].
- Read *Data Visualization: A Practical Introduction*, Chapters 3 'Make a plot', 4 'Show the right numbers', and 5 'Graph tables, add labels, make notes', [@healyviz].
- Read *Testing Statistical Charts: What Makes a Good Graph?*, [@vanderplas2020testing].
- Read *Data Feminism*, Chapter 3 'On Rational, Scientific, Objective Viewpoints from Mythical, Imaginary, Impossible Standpoints', [@datafeminism2020].

<!-- - Kuriwaki, Shiro, 2020, 'Making maps in R with sf', 1 March, freely available at: https://vimeo.com/394800836. -->
<!-- - Hodgetts, Paul, 2020, 'The ggfortify Package', 31 December, https://www.hodgettsp.com/posts/r-ggfortify/.  -->
<!-- - Engel, Claudia A, 2019, *Using Spatial Data with R*, 11 February, Chapter 3 Making Maps in R, freely available at: https://cengel.github.io/R-spatial/mapping.html. -->
<!-- - Lovelace, Robin, Jakub Nowosad, Jannes Muenchow, 2020, *Geocomputation with R*, 29 March, Chapter 8, Making maps with R, freely available at: https://geocompr.robinlovelace.net/adv-map.html. -->
<!-- - Patrick, Cameron, 2019, 'Plotting multiple variables at once using ggplot2 and tidyr', 26 November, https://cameronpatrick.com/post/2019/11/plotting-multiple-variables-ggplot2-tidyr/. -->
<!-- - Patrick, Cameron, 2020, 'Making beautiful bar charts with ggplot', 15 March, https://cameronpatrick.com/post/2020/03/beautiful-bar-charts-ggplot/. -->



**Key concepts and skills**

- Knowing the importance of showing the reader the actual dataset, or as close as is possible.
- Using a variety of different graph options, including bar charts, scatterplots, line plots, and histograms.
- Knowing how to use tables to show part of a dataset, communicate summary statistics, and display regression results.
- Approaching maps as a type of a graph.
- Comfort with geocoding places.


**Key libraries**

- `datasauRus` [@citedatasauRus]
- `ggmap` [@KahleWickham2013]
- `kableExtra` [@citekableextra]
- `knitr` [@citeknitr]
- `maps`
- `modelsummary` [@citemodelsummary]
- `opendatatoronto` [@citeSharla]
- `patchwork` [@citepatchwork]
- `tidyverse` [@citetidyverse]
- `viridis` [@viridis]
- `WDI` [@WDI]


**Key functions**

- `ggmap::get_googlemap()`
- `ggmap::get_stamenmap()`
- `ggmap::ggmap()`
- `ggplot2::coord_map()`
- `ggplot2::facet_wrap()`
- `ggplot2::geom_abline()`
- `ggplot2::geom_bar()`
- `ggplot2::geom_boxplot()`
- `ggplot2::geom_dotplot()`
- `ggplot2::geom_freqpoly()`
- `ggplot2::geom_histogram()`
- `ggplot2::geom_jitter()`
- `ggplot2::geom_line()`
- `ggplot2::geom_path()`
- `ggplot2::geom_point()`
- `ggplot2::geom_polygon()`
- `ggplot2::geom_smooth()`
- `ggplot2::geom_step()`
- `ggplot2::ggplot()`
- `ggplot2::ggsave()`
- `ggplot2::labeller()`
- `ggplot2::labs()`
- `ggplot2::map_data()`
- `ggplot2::scale_color_brewer()`
- `ggplot2::scale_colour_viridis_d()`
- `ggplot2::scale_fill_brewer()`
- `ggplot2::scale_fill_viridis()`
- `ggplot2::stat_qq()`
- `ggplot2::stat_qq_line()`
- `ggplot2::theme()`
- `ggplot2::theme_bw()`
- `ggplot2::theme_classic()`
- `ggplot2::theme_linedraw()`
- `ggplot2::theme_minimal()`
- `kableExtra::add_header_above()`
- `knitr::kable()`
- `lm()`
- `maps::map()`
- `modelsummary::datasummary()`
- `modelsummary::datasummary_balance()`
- `modelsummary::datasummary_correlation()`
- `modelsummary::datasummary_skim()`
- `modelsummary::modelsummary()`
- `WDI::WDI()`
- `WDI::WDIsearch()`


## Introduction

When telling stories with data, we would like the data to do much of the work of convincing our reader. The paper is the medium, and the data are the message. To that end, we want to try to show our reader the data that allowed us to come to our understanding of the story. We use graphs, tables, and maps to help achieve this. 

The critical task is to show the actual data that underpin our analysis, or as close to it as we can. For instance, if our dataset consists of 2,500 responses to a survey, then at some point in our paper we would expect a graph that contains 2,500 points. To do this we build graphs using `ggplot2` [@citeggplot]. We will go through a variety of different options here including bar charts, scatterplots, line plots, and histograms.

In contrast to the role of graphs, which is to show the actual data, or as close to it as possible, the role of tables is typically to show an extract of the dataset or convey various summary statistics. We will build tables using `knitr` [@citeknitr] and `kableExtra` [@citekableextra] initially, and then `modelsummary` [@citemodelsummary]. 

Finally, we cover maps as a variant of graphs that are used to show a particular type of data. We will build static maps using `ggmap` [@KahleWickham2013], having obtained the geocoded data that we need using `tidygeocoder` [@citetidygeocoder].


## Graphs

Graphs are a critical aspect of compelling stories told with data.

> Graphs allow us to explore data to see overall patterns and to see detailed behavior; no other approach can compete in revealing the structure of data so thoroughly. Graphs allow us to view complex mathematical models fitted to data, and they allow us to assess the validity of such models.
>
> @elementsofgraphingdata [p. 5]

In a way, the graphing of data is an information coding process where we create a glyph, or purposeful mark, that we mean to convey information to our audience. The audience must decode our glyph. The success of our graph turns on how much information is lost in this process. It is the decoding that is the critical aspect [@elementsofgraphingdata, p. 221], which means that we are creating graphs for the audience. If nothing else is possible, the most important feature is to convey as much of the actual data as possible.

To see why this is important we begin by using the dataset 'datasaurus_dozen' from `datasauRus` [@citedatasauRus]. After installing and loading the necessary packages, we can take a quick look at the dataset.


```r
install.packages('datasauRus')
```


```r
library(tidyverse)
library(datasauRus)

head(datasaurus_dozen)
#> # A tibble: 6 × 3
#>   dataset     x     y
#>   <chr>   <dbl> <dbl>
#> 1 dino     55.4  97.2
#> 2 dino     51.5  96.0
#> 3 dino     46.2  94.5
#> 4 dino     42.8  91.4
#> 5 dino     40.8  88.3
#> 6 dino     38.7  84.9
datasaurus_dozen |> 
  count(dataset)
#> # A tibble: 13 × 2
#>    dataset        n
#>    <chr>      <int>
#>  1 away         142
#>  2 bullseye     142
#>  3 circle       142
#>  4 dino         142
#>  5 dots         142
#>  6 h_lines      142
#>  7 high_lines   142
#>  8 slant_down   142
#>  9 slant_up     142
#> 10 star         142
#> 11 v_lines      142
#> 12 wide_lines   142
#> 13 x_shape      142
```

We can see that the dataset consists of values for 'x' and 'y', which should be plotted on the x-axis and y-axis, respectively. We can further see that there are thirteen different values in the variable 'dataset' including: "dino", "star", "away", and "bullseye". We will focus on those four and generate summary statistics for each (Table \@ref(tab:datasaurussummarystats)).


```r
# From Julia Silge: 
# https://juliasilge.com/blog/datasaurus-multiclass/
datasaurus_dozen |>
  filter(dataset %in% c("dino", "star", "away", "bullseye")) |>
  group_by(dataset) |>
  summarise(across(c(x, y),
                   list(mean = mean,
                        sd = sd)),
            x_y_cor = cor(x, y)) |>
  knitr::kable(
    caption = 
      "Mean and standard deviation for four 'datasaurus' datasets",
    col.names = c("Dataset", 
                  "x mean", 
                  "x sd", 
                  "y mean", 
                  "y sd", 
                  "correlation"),
    digits = 1,
    booktabs = TRUE,
    linesep = ""
  )
```



Table: (\#tab:datasaurussummarystats)Mean and standard deviation for four 'datasaurus' datasets

|Dataset  | x mean| x sd| y mean| y sd| correlation|
|:--------|------:|----:|------:|----:|-----------:|
|away     |   54.3| 16.8|   47.8| 26.9|        -0.1|
|bullseye |   54.3| 16.8|   47.8| 26.9|        -0.1|
|dino     |   54.3| 16.8|   47.8| 26.9|        -0.1|
|star     |   54.3| 16.8|   47.8| 26.9|        -0.1|

Despite the similarities of the summary statistics, it turns out the different 'datasets' are actually very different beasts when we graph the actual data (Figure \@ref(fig:datasaurusgraph)).


```r
datasaurus_dozen |> 
  filter(dataset %in% c("dino", "star", "away", "bullseye")) |>
  ggplot(aes(x=x, y=y, colour=dataset)) +
  geom_point() +
  theme_minimal() +
  facet_wrap(vars(dataset), nrow = 2, ncol = 2) +
  labs(colour = "Dataset")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/datasaurusgraph-1.png" alt="Graph of four 'datasaurus' datasets" width="672" />
<p class="caption">(\#fig:datasaurusgraph)Graph of four 'datasaurus' datasets</p>
</div>

This is a variant of the famous 'Anscombe's Quartet'. The key takeaway is that it is important to plot the actual data and not rely on summary statistics. The 'anscombe' dataset is built into R.


```r
head(anscombe)
#>   x1 x2 x3 x4   y1   y2    y3   y4
#> 1 10 10 10  8 8.04 9.14  7.46 6.58
#> 2  8  8  8  8 6.95 8.14  6.77 5.76
#> 3 13 13 13  8 7.58 8.74 12.74 7.71
#> 4  9  9  9  8 8.81 8.77  7.11 8.84
#> 5 11 11 11  8 8.33 9.26  7.81 8.47
#> 6 14 14 14  8 9.96 8.10  8.84 7.04
```

It consists of six observations for four different datasets, again with x and y values for each observation. We need to manipulate this dataset with `pivot_longer()` to get it into a 'tidy format'. 


```r
# From Nick Tierney: 
# https://www.njtierney.com/post/2020/06/01/tidy-anscombe/
# Code from pivot_longer() vignette.
tidy_anscombe <- 
  anscombe |>
  pivot_longer(everything(),
               names_to = c(".value", "set"),
               names_pattern = "(.)(.)"
               )
```

We can again first create some summary statistics (Table \@ref(tab:anscombesummarystats)) and then graph the data (Figure \@ref(fig:anscombegraph)). And we again see the importance of graphing the actual data, rather than relying on summary statistics.


```r
tidy_anscombe |>
  group_by(set) |>
  summarise(across(c(x, y),
                   list(mean = mean, sd = sd)),
            x_y_cor = cor(x, y)) |>
  knitr::kable(
    caption = "Mean and standard deviation for Anscombe",
    col.names = c("Dataset", 
                  "x mean", 
                  "x sd", 
                  "y mean", 
                  "y sd", 
                  "correlation"),
    digits = 1,
    booktabs = TRUE,
    linesep = ""
  )
```



Table: (\#tab:anscombesummarystats)Mean and standard deviation for Anscombe

|Dataset | x mean| x sd| y mean| y sd| correlation|
|:-------|------:|----:|------:|----:|-----------:|
|1       |      9|  3.3|    7.5|    2|         0.8|
|2       |      9|  3.3|    7.5|    2|         0.8|
|3       |      9|  3.3|    7.5|    2|         0.8|
|4       |      9|  3.3|    7.5|    2|         0.8|



```r
tidy_anscombe |> 
  ggplot(aes(x = x, y = y, colour = set)) +
  geom_point() +
  theme_minimal() +
  facet_wrap(vars(set), nrow = 2, ncol = 2) +
  labs(colour = "Dataset")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/anscombegraph-1.png" alt="Recreation of Anscombe's Quartet" width="672" />
<p class="caption">(\#fig:anscombegraph)Recreation of Anscombe's Quartet</p>
</div>


<!-- Figure \@ref(fig:thomowillrose) provides invaluable advice (thank you to Thomas William Rosenthal). -->

<!-- ```{r thomowillrose, echo=FALSE, fig.cap = "How do we get started with our data?", out.width = '90%'} -->
<!-- knitr::include_graphics(here::here("figures/thomowillrose.png")) -->




### Bar charts

We typically use a bar chart when we have a categorical variable that we want to focus on. We saw an example of this in Chapter \@ref(drinking-from-a-fire-hose) where we constructed a graph of the number of occupied beds. The geom that we primarily use is `geom_bar()`, but there are many variants to cater for specific situations. 

We will use a dataset from the 1997-2001 British Election Panel Study that was put together by @fox2006effect.


```r
# Vincent Arel Bundock provides access to this dataset.
beps <- 
  read_csv(
    file = 
    "https://vincentarelbundock.github.io/Rdatasets/csv/carData/BEPS.csv"
    )
```






```r
head(beps)
#> # A tibble: 6 × 11
#>    ...1 vote     age economic.cond.n… economic.cond.h… Blair
#>   <dbl> <chr>  <dbl>            <dbl>            <dbl> <dbl>
#> 1     1 Liber…    43                3                3     4
#> 2     2 Labour    36                4                4     4
#> 3     3 Labour    35                4                4     5
#> 4     4 Labour    24                4                2     2
#> 5     5 Labour    41                2                2     1
#> 6     6 Labour    47                3                4     4
#> # … with 5 more variables: Hague <dbl>, Kennedy <dbl>,
#> #   Europe <dbl>, political.knowledge <dbl>, gender <chr>
```

The dataset consists of which party the person supports, along with various demographic, economic, and political variables. In particular, we have the age of the respondents. We could begin by making a graph of this age distribution using `geom_bar()` (Figure \@ref(fig:bepfitst)).


```r
beps |> 
  ggplot(mapping = aes(x = age)) +
  geom_bar()
```

<div class="figure">
<img src="11-static_communication_files/figure-html/bepfitst-1.png" alt="Distribution of ages in the 1997-2001 British Election Panel Study" width="672" />
<p class="caption">(\#fig:bepfitst)Distribution of ages in the 1997-2001 British Election Panel Study</p>
</div>

By default, `geom_bar()` has created a count of the number of times each age appears in the dataset. It does this because the default 'stat' for `geom_bar()` is 'count'. This saves us from having to create that statistic ourselves. But if we had already constructed a count (for instance, with `beps |> count(age)`), then we could also specify a column of values for the y-axis and then use `stat = "identity"`.

We may also like to consider different groupings of the data, for instance, looking at age-groups by which party the respondent supports (Figure \@ref(fig:bepsecond)).


```r
beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar()
```

<div class="figure">
<img src="11-static_communication_files/figure-html/bepsecond-1.png" alt="Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study" width="672" />
<p class="caption">(\#fig:bepsecond)Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study</p>
</div>

The default is that these different groups are stacked, but they can be placed side-by-side with `position = "dodge"` (Figure \@ref(fig:bepthird)).


```r
beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar(position = "dodge")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/bepthird-1.png" alt="Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study" width="672" />
<p class="caption">(\#fig:bepthird)Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study</p>
</div>

At this point, we may like to address the general look of the graph. There are various themes that are built into `ggplot2`. Some of these include `theme_bw()`, `theme_classic()`, `theme_dark()`, and `theme_minimal()`. A full list is available at the `ggplot2` [cheatsheet](https://github.com/rstudio/cheatsheets/blob/main/data-visualization.pdf). We can use these themes by adding them as a layer (Figure \@ref(fig:bepthemes)). Here we can use `patchwork` [@citepatchwork] to bring together multiple graphs. To do this we assign the graph to a name, and then use '+' to signal which should be next to each other, '/' to signal which would be on top, and brackets for precedence.


```r
library(patchwork)

theme_bw <- 
  beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar(position = "dodge") +
  theme_bw()

theme_classic <- 
  beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar(position = "dodge") +
  theme_classic()

theme_dark <- 
  beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar(position = "dodge") +
  theme_dark()

theme_minimal <- 
  beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar(position = "dodge") +
  theme_minimal()

(theme_bw + theme_classic) / (theme_dark + theme_minimal)
```

<div class="figure">
<img src="11-static_communication_files/figure-html/bepthemes-1.png" alt="Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study, illustrating different themes" width="672" />
<p class="caption">(\#fig:bepthemes)Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study, illustrating different themes</p>
</div>

We can install themes from other packages, including `ggthemes` [@ggthemes], and `hrbrthemes` [@hrbrthemes]. And we can also build our own.

The default labels use dby `ggplot2` are from the name of the relevant variable, and it is often useful to add more detail. We could add a title and caption at this point. A caption can be useful to add information about the source of the dataset. A title can be useful when the graph is going to be considered outside of the context of our paper. But in the case of a graph that will be included in a paper, the need to cross-reference all graphs that are in a paper means that included a title within `labs()` is unnecessary (Figure \@ref(fig:withnicelabels)).


```r
beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Age of respondent",
       y = "Number of respondents",
       fill = "Voted for",
       title = "Distribution of ages, and vote preference, in
       the 1997-2001 British Election Panel Study",
       caption = "Source: 1997-2001 British Election Panel Study.")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/withnicelabels-1.png" alt="Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study" width="672" />
<p class="caption">(\#fig:withnicelabels)Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study</p>
</div>

We use facets to create 'many little graphics that are variations of a single graphic' [@grammarofgraphics, p. 219]. They are especially useful when we want to specifically compare across some variable, but have already used color. For instance, we may be interested to explain vote, by age and gender (Figure \@ref(fig:facets)).


```r
beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Age of respondent",
       y = "Number of respondents",
       fill = "Voted for") +
  facet_wrap(vars(gender))
```

<div class="figure">
<img src="11-static_communication_files/figure-html/facets-1.png" alt="Distribution of age by gender, and vote preference, in the 1997-2001 British Election Panel Study" width="672" />
<p class="caption">(\#fig:facets)Distribution of age by gender, and vote preference, in the 1997-2001 British Election Panel Study</p>
</div>

We could change `facet_wrap()` to wrap vertically instead of horizontally with `dir = "v"`. Alternatively, we could specify a number of rows, say `nrow = 2`, or a number of columns, say `ncol = 2`. Additionally, by default, both facets will have the same scales. We could enable both facets to have different scales with `scales = "free"`, or just the x-axis `scales = "free_x"`, or just the y-axis `scales = "free_y"` (Figure \@ref(fig:facetsfancy)). 


```r
beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Age of respondent",
       y = "Number of respondents",
       fill = "Voted for") +
  facet_wrap(vars(gender),
             dir = "v",
             scales = "free")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/facetsfancy-1.png" alt="Distribution of age by gender, and vote preference, in the 1997-2001 British Election Panel Study" width="672" />
<p class="caption">(\#fig:facetsfancy)Distribution of age by gender, and vote preference, in the 1997-2001 British Election Panel Study</p>
</div>

Finally, we can change the labels of the facets using `labeller()` (Figure \@ref(fig:facetsfancylabels)). 


```r
new_labels <- c(female = "Female", male = "Male")

beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Age of respondent",
       y = "Number of respondents",
       fill = "Voted for") +
  facet_wrap(vars(gender),
             dir = "v",
             scales = "free",
             labeller = labeller(gender = new_labels))
```

<div class="figure">
<img src="11-static_communication_files/figure-html/facetsfancylabels-1.png" alt="Distribution of age by gender, and vote preference, in the 1997-2001 British Election Panel Study" width="672" />
<p class="caption">(\#fig:facetsfancylabels)Distribution of age by gender, and vote preference, in the 1997-2001 British Election Panel Study</p>
</div>

There are a variety of different ways to change the colors, and many palettes are available including from `RColorBrewer` [@RColorBrewer], which we specify with `scale_fill_brewer()`, and `viridis` [@viridis], which we specify with `scale_fill_viridis()` and is particularly focused on color-blind palettes (Figure \@ref(fig:usecolor)). 


```r
library(viridis)
library(patchwork)

RColorBrewerBrBG <- 
  beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Age of respondent",
       y = "Number of respondents",
       fill = "Voted for") + 
  scale_fill_brewer(palette = "Blues")

RColorBrewerSet2 <- 
  beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Age of respondent",
       y = "Number of respondents",
       fill = "Voted for") +
  scale_fill_brewer(palette = "Set1")

viridis <- 
  beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Age of respondent",
       y = "Number of respondents",
       fill = "Voted for") + 
  scale_fill_viridis(discrete = TRUE)

viridismagma <- 
  beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Age of respondent",
       y = "Number",
       fill = "Voted for") +
   scale_fill_viridis(discrete = TRUE, 
                      option = "magma")

(RColorBrewerBrBG + RColorBrewerSet2) /
  (viridis + viridismagma)
```

<div class="figure">
<img src="11-static_communication_files/figure-html/usecolor-1.png" alt="Distribution of age and vote preference, in the 1997-2001 British Election Panel Study" width="672" />
<p class="caption">(\#fig:usecolor)Distribution of age and vote preference, in the 1997-2001 British Election Panel Study</p>
</div>

Details of the variety of palettes available in `RColorBrewer` and `viridis` are available in their help files. Many different palettes are available, and we can also build our own. That said, color is something to be considered with a great deal of care and it should only be added to increase the amount of information that is communicated [@elementsofgraphingdata]. Colors should not be added to graphs unnecessarily---that is to say, they must play some role. Typically, that role is to distinguish different groups, and that implies making the colors dissimilar. Colors may also be appropriate if there is some relationship between the color and the variable, for instance if making a graph of sales of, say, mangoes and raspberries, it could help the reader if the colors were yellow and red, respectively [@franconeri2021science, p. 121].


### Scatterplots

We are often interested in the relationship between two variables. We can use scatterplots to show this information. Unless there is a good reason to move to a different option, a scatterplot is almost always the best choice [@weissgerber2015beyond]. Indeed, 'among all forms of statistical graphics, the scatterplot may be considered the most versatile and generally useful invention in the entire history of statistical graphics.' [@historyofdataviz, p. 121] To illustrate scatterplots, we use `WDI` [@WDI] to download some economic indicators from the World Bank, and in particular `WDIsearch()` to find the unique key that need to pass to `WDI()` to facilitate the download.

> **Oh, you think we have good data on that!** Gross Domestic Product (GDP) 'combines in a single figure, and with no double counting, all the output (or production) carried out by all the firms, non-profit institutions, government bodies and households in a given country during a given period, regardless of the type of goods and services produced, provided that the production takes place within the country's economic territory' (@EssentialMacroAggregates, p. 15). The modern concept was developed by Simon Kuznets and is widely used and reported. There is a certain comfort in having a definitive and concrete single number to describe something as complicated as the entire economic activity of a country. And it is crucial that we have such summary statistics. But as with any summary statistic, its strength is also its weakness. A single number necessarily loses information about constituent components, and these distributional differences are critical. It highlights short term economic progress over longer term improvements. And 'the quantitative definiteness of the estimates makes it easy to forget their dependence upon imperfect data and the consequently wide margins of possible error to which both totals and components are liable' [@NationalIncomeAndItsComposition, p. xxvi]. Reliance on any one summary measure of economic performance presents a misguided picture not only of a country's economy, but also of its peoples.


```r
install.packages('WDI')
```


```r
library(tidyverse)
library(WDI)
WDIsearch("gdp growth")
#>      indicator             
#> [1,] "5.51.01.10.gdp"      
#> [2,] "6.0.GDP_growth"      
#> [3,] "NV.AGR.TOTL.ZG"      
#> [4,] "NY.GDP.MKTP.KD.ZG"   
#> [5,] "NY.GDP.MKTP.KN.87.ZG"
#>      name                                    
#> [1,] "Per capita GDP growth"                 
#> [2,] "GDP growth (annual %)"                 
#> [3,] "Real agricultural GDP growth rates (%)"
#> [4,] "GDP growth (annual %)"                 
#> [5,] "GDP growth (annual %)"
WDIsearch("inflation")
#>      indicator             
#> [1,] "FP.CPI.TOTL.ZG"      
#> [2,] "FP.FPI.TOTL.ZG"      
#> [3,] "FP.WPI.TOTL.ZG"      
#> [4,] "NY.GDP.DEFL.87.ZG"   
#> [5,] "NY.GDP.DEFL.KD.ZG"   
#> [6,] "NY.GDP.DEFL.KD.ZG.AD"
#>      name                                               
#> [1,] "Inflation, consumer prices (annual %)"            
#> [2,] "Inflation, food prices (annual %)"                
#> [3,] "Inflation, wholesale prices (annual %)"           
#> [4,] "Inflation, GDP deflator (annual %)"               
#> [5,] "Inflation, GDP deflator (annual %)"               
#> [6,] "Inflation, GDP deflator: linked series (annual %)"
WDIsearch("population, total")
#>           indicator                name 
#>       "SP.POP.TOTL" "Population, total"
WDIsearch("Unemployment, total")
#>      indicator          
#> [1,] "SL.UEM.TOTL.NE.ZS"
#> [2,] "SL.UEM.TOTL.ZS"   
#>      name                                                                 
#> [1,] "Unemployment, total (% of total labor force) (national estimate)"   
#> [2,] "Unemployment, total (% of total labor force) (modeled ILO estimate)"
```


```r
world_bank_data <- 
  WDI(indicator = c("FP.CPI.TOTL.ZG",
                    "NY.GDP.MKTP.KD.ZG",
                    "SP.POP.TOTL",
                    "SL.UEM.TOTL.NE.ZS"
                    ),
      country = c("AU", "ET", "IN", "US")
      )
```





We may like to change the names to be more meaningful, and only keep the columns that we need.


```r
world_bank_data <- 
  world_bank_data |> 
  rename(inflation = FP.CPI.TOTL.ZG,
         gdp_growth = NY.GDP.MKTP.KD.ZG,
         population = SP.POP.TOTL,
         unemployment_rate = SL.UEM.TOTL.NE.ZS
         ) |> 
  select(-iso2c)

head(world_bank_data)
#> # A tibble: 6 × 6
#>   country    year inflation gdp_growth population
#>   <chr>     <dbl>     <dbl>      <dbl>      <dbl>
#> 1 Australia  1960     3.73       NA      10276477
#> 2 Australia  1961     2.29        2.48   10483000
#> 3 Australia  1962    -0.319       1.29   10742000
#> 4 Australia  1963     0.641       6.21   10950000
#> 5 Australia  1964     2.87        6.98   11167000
#> 6 Australia  1965     3.41        5.98   11388000
#> # … with 1 more variable: unemployment_rate <dbl>
```

To get started we can use `geom_point()` to make a scatterplot showing GDP growth and inflation, by country (Figure \@ref(fig:scattorplot)).


```r
world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_point()
```

<div class="figure">
<img src="11-static_communication_files/figure-html/scattorplot-1.png" alt="Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US" width="672" />
<p class="caption">(\#fig:scattorplot)Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US</p>
</div>

As with bar charts, we change the theme, and update the labels (Figure \@ref(fig:scatterplotnicer)), although again, we would normally not need both a caption and a title and would just use one.


```r
world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       title = "Relationship between inflation and GDP growth",
       caption = "Data source: World Bank.")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/scatterplotnicer-1.png" alt="Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US" width="672" />
<p class="caption">(\#fig:scatterplotnicer)Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US</p>
</div>

Here we use 'color' instead of 'fill' because we are using dots rather than bars. This also then slightly affects how we change the palette (Figure \@ref(fig:scatterplotnicercolor)). 


```r
library(patchwork)

RColorBrewerBrBG <-
  world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       caption = "Data source: World Bank.") +
  scale_color_brewer(palette = "Blues")

RColorBrewerSet2 <- 
  world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       caption = "Data source: World Bank.") +
  scale_color_brewer(palette = "Set1")

viridis <- 
  world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       caption = "Data source: World Bank.") +
  scale_colour_viridis_d()

viridismagma <- 
  world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       caption = "Data source: World Bank.") +
  scale_colour_viridis_d(option = "magma")

RColorBrewerBrBG / 
  RColorBrewerSet2 /
  viridis /
  viridismagma
```

<div class="figure">
<img src="11-static_communication_files/figure-html/scatterplotnicercolor-1.png" alt="Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US" width="672" />
<p class="caption">(\#fig:scatterplotnicercolor)Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US</p>
</div>

The points of a scatterplot sometimes overlap. We can address this situation in one of two ways: 

1) Adding a degree of transparency to our dots with 'alpha' (Figure \@ref(fig:alphaplot)). The value for 'alpha' can vary between 0, which is fully transparent, and 1, which is completely opaque. 
2) Adding a small about of noise, which slightly moves the points, using `geom_jitter()` (Figure \@ref(fig:jitterplot)). By default, the movement is uniform in both directions, but we can specify which direction movement occurs with 'width' or 'height'. The decision between these two options turns on the degree to which exact accuracy matters, and the number of points.


```r
world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_point(alpha = 0.5) +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       caption = "Data source: World Bank.")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/alphaplot-1.png" alt="Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US" width="672" />
<p class="caption">(\#fig:alphaplot)Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US</p>
</div>


```r
world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_jitter() +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       caption = "Data source: World Bank.")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/jitterplot-1.png" alt="Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US" width="672" />
<p class="caption">(\#fig:jitterplot)Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US</p>
</div>

A common use case for a scatterplot is to illustrate a relationship between two variables. It can be useful to add a line of best fit using `geom_smooth()` (Figure \@ref(fig:scattorplottwo)). By default, `geom_smooth()` will use LOESS smoothing is used for datasets with less than 1,000 observations, but we can specify the relationship using 'method', change the color with 'color' and remove standard errors with 'se'. Using `geom_smooth()` adds a layer to the graph, and so it inherits aesthetics from `ggplot()`. For instance, that is why we initially have one line for each country in Figure \@ref(fig:scattorplottwo). We could overwrite that by specifying a particular color, which we do in the third graph of Figure \@ref(fig:scattorplottwo).


```r
defaults <- 
  world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_jitter() +
  geom_smooth() +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       caption = "Data source: World Bank.")

straightline <- 
  world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_jitter() +
  geom_smooth(method = lm, se = FALSE) +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       caption = "Data source: World Bank.")

onestraightline <- 
  world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_jitter() +
  geom_smooth(method = lm, color = "black", se = FALSE) +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       caption = "Data source: World Bank.")

defaults / 
  straightline /
  onestraightline
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
#> `geom_smooth()` using formula 'y ~ x'
#> `geom_smooth()` using formula 'y ~ x'
```

<div class="figure">
<img src="11-static_communication_files/figure-html/scattorplottwo-1.png" alt="Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US" width="672" />
<p class="caption">(\#fig:scattorplottwo)Relationship between inflation and GDP growth for Australia, Ethiopia, India, and the US</p>
</div>


### Line plots

We can use a line plot when we have variables that should be joined together, for instance, an economic time series. We will continue with the dataset from the World Bank and focus on US GDP growth using `geom_line()` (Figure \@ref(fig:lineplot)). 


```r
world_bank_data |>
  filter(country == "United States") |>
  ggplot(mapping = aes(x = year, y = gdp_growth)) +
  geom_line()
```

<div class="figure">
<img src="11-static_communication_files/figure-html/lineplot-1.png" alt="US GDP growth (1961-2020)" width="672" />
<p class="caption">(\#fig:lineplot)US GDP growth (1961-2020)</p>
</div>

As before, we can adjust the theme, say with `theme_minimal()` and labels with `labs()` (Figure \@ref(fig:lineplottwo)).


```r
world_bank_data |>
  filter(country == "United States") |>
  ggplot(mapping = aes(x = year, y = gdp_growth)) +
  geom_line() +
  theme_minimal() +
  labs(x = "Year",
       y = "GDP growth",
       caption = "Data source: World Bank.")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/lineplottwo-1.png" alt="US GDP growth (1961-2020)" width="672" />
<p class="caption">(\#fig:lineplottwo)US GDP growth (1961-2020)</p>
</div>

We can use a slight variant of `geom_line()`, `geom_step()` to focus attention on the change from year to year (Figure \@ref(fig:stepplot)).


```r
world_bank_data |>
  filter(country == "United States") |>
  ggplot(mapping = aes(x = year, y = gdp_growth)) +
  geom_step() +
  theme_minimal() +
  labs(x = "Year",
       y = "GDP growth",
       caption = "Data source: World Bank.")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/stepplot-1.png" alt="US GDP growth (1961-2020)" width="672" />
<p class="caption">(\#fig:stepplot)US GDP growth (1961-2020)</p>
</div>

The Phillips curve is the name given to plot of the relationship between unemployment and inflation over time. An inverse relationship is sometimes found in the data, for instance in the UK between 1861 and 1957 [@phillips1958relation]. We have a variety of ways to investigate this including:

1) Adding a second line to our graph. For instance, we could add inflation (Figure \@ref(fig:notphillips)). This may require use to use `pivot_longer()` to ensure that the data are in tidy format.
2) Using `geom_path()` to links values in the order they appear in the dataset. In Figure \@ref(fig:phillipsmyboy) we show a Phillips curve for the US between 1960 and 2020. Figure \@ref(fig:phillipsmyboy) does not appear to show any clear relationship between unemployment and inflation.


```r
world_bank_data |>
  filter(country == "United States") |>
  select(-population, -gdp_growth) |>
  pivot_longer(cols = c("inflation", "unemployment_rate"),
               names_to = "series",
               values_to = "value"
               ) |>
  ggplot(mapping = aes(x = year, y = value, color = series)) +
  geom_line() +
  theme_minimal() +
  labs(x = "Year",
       y = "Value",
       color = "Economic indicator",
       caption = "Data source: World Bank.") +
  scale_color_brewer(palette = "Set1", labels = c("Inflation", "Unemployment")) +
  theme(legend.position = "bottom")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/notphillips-1.png" alt="Unemployment and inflation for the US (1960-2020)" width="672" />
<p class="caption">(\#fig:notphillips)Unemployment and inflation for the US (1960-2020)</p>
</div>



```r
world_bank_data |>
  filter(country == "United States") |>
  ggplot(mapping = aes(x = unemployment_rate, y = inflation)) +
  geom_path() +
  theme_minimal() +
  labs(x = "Unemployment rate",
       y = "Inflation",
       caption = "Data source: World Bank.")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/phillipsmyboy-1.png" alt="Phillips curve for the US (1960-2020)" width="672" />
<p class="caption">(\#fig:phillipsmyboy)Phillips curve for the US (1960-2020)</p>
</div>

<!-- One of the issues with Figure \@ref(fig:phillipsmyboy) is that we do not have a good sense of the passage of time. Here, color could be useful (Figure \@ref(fig:phillipsmyboycolor)). -->

<!-- ```{r phillipsmyboycolor, fig.cap = "Phillips curve for the US (1960-2020)"} -->
<!-- world_bank_data |> -->
<!--   filter(country == "United States") |> -->
<!--   ggplot(mapping = aes(x = unemployment_rate,  -->
<!--                        y = inflation, -->
<!--                        colour = year), -->
<!--          show.legend = F) + -->
<!--   geom_path() + -->
<!--   theme_minimal() + -->
<!--   labs(x = "Unemployment rate", -->
<!--        y = "Inflation", -->
<!--        caption = "Data source: World Bank.") -->
<!-- ``` -->


### Histograms

A histogram is useful to show the shape of a continuous variable and works by constructing counts of the number of observations in different subsets of the support, called 'bins'. In Figure \@ref(fig:hisogramone) we examine the distribution of GDP in Ethiopia.


```r
world_bank_data |> 
  filter(country == "Ethiopia") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram()
```

<div class="figure">
<img src="11-static_communication_files/figure-html/hisogramone-1.png" alt="Distribution of GDP in Ethiopia (1960-2020)" width="672" />
<p class="caption">(\#fig:hisogramone)Distribution of GDP in Ethiopia (1960-2020)</p>
</div>

And again we can add a theme and labels (Figure \@ref(fig:hisogramtwo).


```r
world_bank_data |> 
  filter(country == "Ethiopia") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram() +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")
#> `stat_bin()` using `bins = 30`. Pick better value with
#> `binwidth`.
```

<div class="figure">
<img src="11-static_communication_files/figure-html/hisogramtwo-1.png" alt="Distribution of GDP in Ethiopia (1960-2020)" width="672" />
<p class="caption">(\#fig:hisogramtwo)Distribution of GDP in Ethiopia (1960-2020)</p>
</div>

The key component determining the shape of a histogram is the number of bins. This can be specified in one of two ways (Figure \@ref(fig:hisogrambins)): 

1) specifying the number of 'bins' to include, or 
2) specifying how wide they should be with 'binwidth'.


```r

twobins <- 
  world_bank_data |> 
  filter(country == "Ethiopia") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(bins = 2) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

fivebins <- 
  world_bank_data |> 
  filter(country == "Ethiopia") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(bins = 5) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

twentybins <- 
  world_bank_data |> 
  filter(country == "Ethiopia") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(bins = 20) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

halfbinwidth <- 
  world_bank_data |> 
  filter(country == "Ethiopia") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(binwidth = 0.5) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

twobinwidth <- 
  world_bank_data |> 
  filter(country == "Ethiopia") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(binwidth = 2) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

fivebinwidth <- 
  world_bank_data |> 
  filter(country == "Ethiopia") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(binwidth = 5) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

(twobins + fivebins + twentybins) / 
  (halfbinwidth + twobinwidth + fivebinwidth)
```

<div class="figure">
<img src="11-static_communication_files/figure-html/hisogrambins-1.png" alt="Distribution of GDP in Ethiopia (1960-2020)" width="672" />
<p class="caption">(\#fig:hisogrambins)Distribution of GDP in Ethiopia (1960-2020)</p>
</div>

The histogram is smoothing the data, and the number of bins affects how much smoothing occurs. When there are only two bins then the data are very smooth, but we have lost a great deal of accuracy. More specifically, 'the histogram estimator is a piecewise constant function where the height of the function is proportional to the number of observations in each bin' [@wasserman, p. 303]. Too few bins result in a biased estimator, while too many bins results in an estimator with high variance. Our decision as to the number of bins, or their width, is concerned with trying to balance bias and variance. This will depend on a variety of concerns including the subject matter and the goal [@elementsofgraphingdata, p. 135].

Finally, while we can use 'fill' to distinguish between different types of observations, it can get quite messy. It is usually better to give away showing the distribution with columns and instead trace the outline of the distribution, using `geom_freqpoly()` (Figure \@ref(fig:freq)) or to build it up using dots with `geom_dotplot()` (Figure \@ref(fig:dotplot)) .


```r
world_bank_data |> 
  ggplot(mapping = aes(x = gdp_growth, color = country)) +
  geom_freqpoly() +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       color = "Country",
       caption = "Data source: World Bank.") +
  scale_color_brewer(palette = "Set1") 
```

<div class="figure">
<img src="11-static_communication_files/figure-html/freq-1.png" alt="Distribution of GDP in four countries (1960-2020)" width="672" />
<p class="caption">(\#fig:freq)Distribution of GDP in four countries (1960-2020)</p>
</div>



```r
world_bank_data |> 
  ggplot(mapping = aes(x = gdp_growth, group = country, fill = country)) +
  geom_dotplot(method = 'histodot', alpha = 0.4) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       fill = "Country",
       caption = "Data source: World Bank.") +
  scale_color_brewer(palette = "Set1") 
```

<div class="figure">
<img src="11-static_communication_files/figure-html/dotplot-1.png" alt="Distribution of GDP in four countries (1960-2020)" width="672" />
<p class="caption">(\#fig:dotplot)Distribution of GDP in four countries (1960-2020)</p>
</div>


### Boxplots

Boxplots are almost never an appropriate choice because they hide the distribution of data, rather than show it. Unless we need to compare the summary statistics of many variables at once, then they should almost never be used. This is because the same boxplot can apply to very different distributions. To see this, consider some simulated data from the beta distribution of two types. One type of data contains draws from two beta distributions: one that is right skewed and another that is left skewed. The other type of data contains draws from a beta distribution with no skew.


```r
set.seed(853)

both_left_and_right_skew <- 
  c(
    rbeta(500, 5, 2),
    rbeta(500, 2, 5)
    )

no_skew <- 
  rbeta(1000, 1, 1)

beta_distributions <- 
  tibble(
    observation = c(both_left_and_right_skew, no_skew),
    source = c(rep("Left and right skew", 1000),
               rep("No skew", 1000)
               )
  )
```

We can first compare the boxplots of the two series (Figure \@ref(fig:boxplotfirst).


```r
beta_distributions |> 
  ggplot(aes(x = source, y = observation)) +
  geom_boxplot() +
  theme_classic()
```

<div class="figure">
<img src="11-static_communication_files/figure-html/boxplotfirst-1.png" alt="Data drawn from beta distributions with different parameters" width="672" />
<p class="caption">(\#fig:boxplotfirst)Data drawn from beta distributions with different parameters</p>
</div>

But if we plot the actual data then we can see how different they are (Figure \@ref(fig:freqpolyofdistributions)).


```r
beta_distributions |> 
  ggplot(aes(x = observation, color = source)) +
  geom_freqpoly(binwidth = 0.05) +
  theme_classic()
```

<div class="figure">
<img src="11-static_communication_files/figure-html/freqpolyofdistributions-1.png" alt="Data drawn from beta distributions with different parameters" width="672" />
<p class="caption">(\#fig:freqpolyofdistributions)Data drawn from beta distributions with different parameters</p>
</div>

One way forward, if a boxplot must be included, is to include the actual data as a layer on top of the boxplot. For instance, in Figure \@ref(fig:bloxplotandoverlay) we show the distribution of inflation across the four countries.


```r
world_bank_data |> 
  ggplot(mapping = aes(x = country, y = inflation)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.3, width = 0.15, height = 0) +
  theme_minimal() +
  labs(x = "Country",
       y = "Inflation",
       caption = "Data source: World Bank.") +
  scale_color_brewer(palette = "Set1") 
```

<div class="figure">
<img src="11-static_communication_files/figure-html/bloxplotandoverlay-1.png" alt="Distribution of unemployment data for four countries (1960-2020)" width="672" />
<p class="caption">(\#fig:bloxplotandoverlay)Distribution of unemployment data for four countries (1960-2020)</p>
</div>

<!-- Another solution is to graph the quantiles of each distribution against (Figure \@ref(fig:qqplotftw). The Q-Q plot was developed by @wilk1968probability and requires us to plot the distributions against each other. -->

<!-- ```{r qqplotftw, fig.cap = "Inflation for Australian, Ethiopia, India, and the US (1960-2020), m beta distributions with different parameters", warning = FALSE, message = FALSE} -->
<!-- world_bank_data |>  -->
<!--   ggplot(aes(sample = inflation, color = country)) + -->
<!--   stat_qq(alpha = 0.3) + -->
<!--   stat_qq_line() + -->
<!--   theme_classic() + -->
<!--   scale_color_brewer(palette = "Set1")  -->
<!-- ``` -->





## Tables

Tables are critical for telling a compelling story. Tables can communicate less information than a graph, but they can do so at a high fidelity. We primarily use tables in three ways:

1. To show some of our actual dataset, for which we use `kable()` from `knitr` [@citeknitr], alongside `kableExtra` [@citekableextra].
2. To communicate summary statistics, for which we use `modelsummary` [@citemodelsummary].
3. To display regression results, for which we also use `modelsummary` [@citemodelsummary].


### Showing part of a dataset

We illustrate showing part of a dataset using `kable()` from `knitr` and drawing on `kableExtra` for enhancement. We again use the World Bank dataset that we downloaded earlier.


```r
library(knitr)
head(world_bank_data)
#> # A tibble: 6 × 6
#>   country    year inflation gdp_growth population
#>   <chr>     <dbl>     <dbl>      <dbl>      <dbl>
#> 1 Australia  1960     3.73       NA      10276477
#> 2 Australia  1961     2.29        2.48   10483000
#> 3 Australia  1962    -0.319       1.29   10742000
#> 4 Australia  1963     0.641       6.21   10950000
#> 5 Australia  1964     2.87        6.98   11167000
#> 6 Australia  1965     3.41        5.98   11388000
#> # … with 1 more variable: unemployment_rate <dbl>
```

To begin, we can display the first ten rows with the default `kable()` settings.


```r
world_bank_data |> 
  slice(1:10) |> 
  kable() 
```



|country   | year|  inflation| gdp_growth| population| unemployment_rate|
|:---------|----:|----------:|----------:|----------:|-----------------:|
|Australia | 1960|  3.7288136|         NA|   10276477|                NA|
|Australia | 1961|  2.2875817|   2.483271|   10483000|                NA|
|Australia | 1962| -0.3194888|   1.294468|   10742000|                NA|
|Australia | 1963|  0.6410256|   6.214949|   10950000|                NA|
|Australia | 1964|  2.8662420|   6.978540|   11167000|                NA|
|Australia | 1965|  3.4055728|   5.980893|   11388000|                NA|
|Australia | 1966|  3.2934132|   2.381966|   11651000|                NA|
|Australia | 1967|  3.4782609|   6.303650|   11799000|                NA|
|Australia | 1968|  2.5210084|   5.095103|   12009000|                NA|
|Australia | 1969|  3.2786885|   7.043526|   12263000|                NA|

In order to be able to cross-reference it in text, we need to add a caption with 'caption'. We can also make the column names more information with 'col.names' and specify the number of digits to be displayed (Table \@ref(tab:gdpfirst)).


```r
world_bank_data |> 
  slice(1:10) |> 
  kable(
    caption = "First ten rows of a dataset of economic indicators for 
    Australia, Ethiopia, India, and the US",
    col.names = c("Country", "Year", "Inflation", "GDP growth", "Population", "Unemployment rate"),
    digits = 1
  )
```



Table: (\#tab:gdpfirst)First ten rows of a dataset of economic indicators for 
    Australia, Ethiopia, India, and the US

|Country   | Year| Inflation| GDP growth| Population| Unemployment rate|
|:---------|----:|---------:|----------:|----------:|-----------------:|
|Australia | 1960|       3.7|         NA|   10276477|                NA|
|Australia | 1961|       2.3|        2.5|   10483000|                NA|
|Australia | 1962|      -0.3|        1.3|   10742000|                NA|
|Australia | 1963|       0.6|        6.2|   10950000|                NA|
|Australia | 1964|       2.9|        7.0|   11167000|                NA|
|Australia | 1965|       3.4|        6.0|   11388000|                NA|
|Australia | 1966|       3.3|        2.4|   11651000|                NA|
|Australia | 1967|       3.5|        6.3|   11799000|                NA|
|Australia | 1968|       2.5|        5.1|   12009000|                NA|
|Australia | 1969|       3.3|        7.0|   12263000|                NA|

When producing PDFs, the 'booktabs' option makes a host of small changes to the default display and results in tables that look better (Table \@ref(tab:gdpbookdtabs)). When using 'booktabs' we additionally should specify 'linesep' otherwise `kable()` adds a small space every five lines. (None of this will show up for html output.)


```r
world_bank_data |> 
  slice(1:10) |> 
  kable(
    caption = "First ten rows of a dataset of economic indicators for 
    Australia, Ethiopia, India, and the US",
    col.names = c("Country", "Year", "Inflation", "GDP growth", "Population", "Unemployment rate"),
    digits = 1,
    booktabs = TRUE, 
    linesep = ""
  )
```



Table: (\#tab:gdpbookdtabs)First ten rows of a dataset of economic indicators for 
    Australia, Ethiopia, India, and the US

|Country   | Year| Inflation| GDP growth| Population| Unemployment rate|
|:---------|----:|---------:|----------:|----------:|-----------------:|
|Australia | 1960|       3.7|         NA|   10276477|                NA|
|Australia | 1961|       2.3|        2.5|   10483000|                NA|
|Australia | 1962|      -0.3|        1.3|   10742000|                NA|
|Australia | 1963|       0.6|        6.2|   10950000|                NA|
|Australia | 1964|       2.9|        7.0|   11167000|                NA|
|Australia | 1965|       3.4|        6.0|   11388000|                NA|
|Australia | 1966|       3.3|        2.4|   11651000|                NA|
|Australia | 1967|       3.5|        6.3|   11799000|                NA|
|Australia | 1968|       2.5|        5.1|   12009000|                NA|
|Australia | 1969|       3.3|        7.0|   12263000|                NA|


```r
world_bank_data |> 
  slice(1:10) |> 
  kable(
    caption = "First ten rows of a dataset of economic indicators for
    Australia, Ethiopia, India, and the US",
    col.names = c("Country", "Year", "Inflation", "GDP growth", "Population", "Unemployment rate"),
    digits = 1,
    booktabs = TRUE
  )
```



Table: (\#tab:gdpbookdtabsnolinesep)First ten rows of a dataset of economic indicators for
    Australia, Ethiopia, India, and the US

|Country   | Year| Inflation| GDP growth| Population| Unemployment rate|
|:---------|----:|---------:|----------:|----------:|-----------------:|
|Australia | 1960|       3.7|         NA|   10276477|                NA|
|Australia | 1961|       2.3|        2.5|   10483000|                NA|
|Australia | 1962|      -0.3|        1.3|   10742000|                NA|
|Australia | 1963|       0.6|        6.2|   10950000|                NA|
|Australia | 1964|       2.9|        7.0|   11167000|                NA|
|Australia | 1965|       3.4|        6.0|   11388000|                NA|
|Australia | 1966|       3.3|        2.4|   11651000|                NA|
|Australia | 1967|       3.5|        6.3|   11799000|                NA|
|Australia | 1968|       2.5|        5.1|   12009000|                NA|
|Australia | 1969|       3.3|        7.0|   12263000|                NA|


We can specify the alignment of the columns using a character vector of 'l' (left), 'c' (centre), and 'r' (right) (Table \@ref(tab:gdpalign)). Additionally, we can change the formatting. For instance, we could specify groupings for numbers that are at least one thousand using 'format.args = list(big.mark = ",")'.


```r
world_bank_data |> 
  slice(1:10) |> 
  mutate(year = as.factor(year)) |>
  kable(
    caption = "First ten rows of a dataset of economic indicators for 
    Australia, Ethiopia, India, and the US",
    col.names = c("Country", "Year", "Inflation", "GDP growth", 
                  "Population", "Unemployment rate"),
    digits = 1,
    booktabs = TRUE, 
    linesep = "",
    align = c('l', 'l', 'c', 'c', 'r', 'r'),
    format.args = list(big.mark = ",")
  )
```



Table: (\#tab:gdpalign)First ten rows of a dataset of economic indicators for 
    Australia, Ethiopia, India, and the US

|Country   |Year | Inflation | GDP growth | Population| Unemployment rate|
|:---------|:----|:---------:|:----------:|----------:|-----------------:|
|Australia |1960 |    3.7    |     NA     | 10,276,477|                NA|
|Australia |1961 |    2.3    |    2.5     | 10,483,000|                NA|
|Australia |1962 |   -0.3    |    1.3     | 10,742,000|                NA|
|Australia |1963 |    0.6    |    6.2     | 10,950,000|                NA|
|Australia |1964 |    2.9    |    7.0     | 11,167,000|                NA|
|Australia |1965 |    3.4    |    6.0     | 11,388,000|                NA|
|Australia |1966 |    3.3    |    2.4     | 11,651,000|                NA|
|Australia |1967 |    3.5    |    6.3     | 11,799,000|                NA|
|Australia |1968 |    2.5    |    5.1     | 12,009,000|                NA|
|Australia |1969 |    3.3    |    7.0     | 12,263,000|                NA|

We can use `kableExtra` [@citekableextra] to add extra functionality to `kable`. For instance, we could add a row that groups some of the columns (Table \@ref(tab:gdpalign)).


```r
library(kableExtra)

world_bank_data |> 
  slice(1:10) |> 
  kable(
    caption = "First ten rows of a dataset of economic indicators for 
    Australia, Ethiopia, India, and the US",
    col.names = c("Country", "Year", "Inflation", "GDP growth", 
                  "Population", "Unemployment rate"),
    digits = 1,
    booktabs = TRUE, 
    linesep = "",
    align = c('l', 'l', 'c', 'c', 'r', 'r'),
  ) |> 
  add_header_above(c(" " = 2, "Economic indicators" = 4))
```

<table>
<caption>(\#tab:gdpkableextra)First ten rows of a dataset of economic indicators for 
    Australia, Ethiopia, India, and the US</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="2"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="4"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Economic indicators</div></th>
</tr>
  <tr>
   <th style="text-align:left;"> Country </th>
   <th style="text-align:left;"> Year </th>
   <th style="text-align:center;"> Inflation </th>
   <th style="text-align:center;"> GDP growth </th>
   <th style="text-align:right;"> Population </th>
   <th style="text-align:right;"> Unemployment rate </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:left;"> 1960 </td>
   <td style="text-align:center;"> 3.7 </td>
   <td style="text-align:center;"> NA </td>
   <td style="text-align:right;"> 10276477 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:left;"> 1961 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:right;"> 10483000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:left;"> 1962 </td>
   <td style="text-align:center;"> -0.3 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:right;"> 10742000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:left;"> 1963 </td>
   <td style="text-align:center;"> 0.6 </td>
   <td style="text-align:center;"> 6.2 </td>
   <td style="text-align:right;"> 10950000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:left;"> 1964 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 7.0 </td>
   <td style="text-align:right;"> 11167000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:left;"> 1965 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 6.0 </td>
   <td style="text-align:right;"> 11388000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:left;"> 1966 </td>
   <td style="text-align:center;"> 3.3 </td>
   <td style="text-align:center;"> 2.4 </td>
   <td style="text-align:right;"> 11651000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:left;"> 1967 </td>
   <td style="text-align:center;"> 3.5 </td>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:right;"> 11799000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:left;"> 1968 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:right;"> 12009000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:left;"> 1969 </td>
   <td style="text-align:center;"> 3.3 </td>
   <td style="text-align:center;"> 7.0 </td>
   <td style="text-align:right;"> 12263000 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
</tbody>
</table>


### Communicating summary statistics

We can use `datasummary()` from `modelsummary` to create tables of summary statistics from our dataset. 


```r
library(modelsummary)

world_bank_data |> 
  datasummary_skim()
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Unique (#) </th>
   <th style="text-align:right;"> Missing (%) </th>
   <th style="text-align:right;"> Mean </th>
   <th style="text-align:right;"> SD </th>
   <th style="text-align:right;"> Min </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> Max </th>
   <th style="text-align:right;">    </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> year </td>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1990.0 </td>
   <td style="text-align:right;"> 17.6 </td>
   <td style="text-align:right;"> 1960.0 </td>
   <td style="text-align:right;"> 1990.0 </td>
   <td style="text-align:right;"> 2020.0 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="1.78" y="3.22" width="3.70" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="5.48" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="9.19" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="12.89" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="16.59" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="20.30" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="24.00" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="27.70" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="31.41" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="35.11" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="38.81" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="42.52" y="4.63" width="3.70" height="7.04" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> inflation </td>
   <td style="text-align:right;"> 238 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 6.1 </td>
   <td style="text-align:right;"> 6.3 </td>
   <td style="text-align:right;"> −9.8 </td>
   <td style="text-align:right;"> 4.3 </td>
   <td style="text-align:right;"> 44.4 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="1.62" y="11.30" width="4.10" height="0.36" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="5.72" y="11.23" width="4.10" height="0.43" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="9.82" y="3.22" width="4.10" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="13.92" y="7.23" width="4.10" height="4.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="18.02" y="9.44" width="4.10" height="2.22" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="22.12" y="11.02" width="4.10" height="0.64" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="26.22" y="11.59" width="4.10" height="0.072" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="30.32" y="11.52" width="4.10" height="0.14" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="34.42" y="11.59" width="4.10" height="0.072" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="38.52" y="11.59" width="4.10" height="0.072" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="42.62" y="11.59" width="4.10" height="0.072" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> gdp_growth </td>
   <td style="text-align:right;"> 220 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 4.2 </td>
   <td style="text-align:right;"> 3.7 </td>
   <td style="text-align:right;"> −11.1 </td>
   <td style="text-align:right;"> 3.9 </td>
   <td style="text-align:right;"> 13.9 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="0.26" y="11.54" width="3.56" height="0.12" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="3.81" y="11.54" width="3.56" height="0.12" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="7.37" y="11.42" width="3.56" height="0.24" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="10.92" y="11.54" width="3.56" height="0.12" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="14.48" y="10.83" width="3.56" height="0.83" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="18.03" y="10.23" width="3.56" height="1.43" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="21.59" y="9.40" width="3.56" height="2.26" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="25.14" y="3.22" width="3.56" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="28.70" y="6.43" width="3.56" height="5.23" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="32.25" y="7.62" width="3.56" height="4.04" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="35.81" y="10.00" width="3.56" height="1.67" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="39.36" y="10.71" width="3.56" height="0.95" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="42.92" y="11.07" width="3.56" height="0.59" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> population </td>
   <td style="text-align:right;"> 244 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 304177482.9 </td>
   <td style="text-align:right;"> 380093166.9 </td>
   <td style="text-align:right;"> 10276477.0 </td>
   <td style="text-align:right;"> 147817291.5 </td>
   <td style="text-align:right;"> 1380004385.0 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="1.44" y="3.22" width="6.49" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="7.93" y="8.22" width="6.49" height="3.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="14.42" y="10.75" width="6.49" height="0.91" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="20.91" y="10.88" width="6.49" height="0.78" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="27.40" y="10.95" width="6.49" height="0.71" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="33.89" y="10.95" width="6.49" height="0.71" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="40.38" y="10.82" width="6.49" height="0.84" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> unemployment_rate </td>
   <td style="text-align:right;"> 104 </td>
   <td style="text-align:right;"> 52 </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> 1.9 </td>
   <td style="text-align:right;"> 1.2 </td>
   <td style="text-align:right;"> 5.7 </td>
   <td style="text-align:right;"> 10.9 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="0.86" y="11.41" width="4.60" height="0.25" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="5.45" y="9.92" width="4.60" height="1.74" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="10.05" y="9.43" width="4.60" height="2.24" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="14.65" y="7.94" width="4.60" height="3.73" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="19.24" y="3.22" width="4.60" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="23.84" y="6.94" width="4.60" height="4.72" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="28.44" y="8.93" width="4.60" height="2.73" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="33.03" y="8.93" width="4.60" height="2.73" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="37.63" y="9.92" width="4.60" height="1.74" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="42.22" y="11.17" width="4.60" height="0.50" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
</tbody>
</table>

By default, `datasummary()` summarizes the 'numeric' variables, but we can ask for the 'categorical' variables (Table \@ref(tab:testdatasummary)). Additionally we can add cross-references in the same way as `kable()`, that is, include a title and then cross-reference the name of the R chunk.


```r
world_bank_data |> 
  datasummary_skim(type = "categorical",
                   title = "Summary of categorical economic indicator 
                   variables for four countries")
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:testdatasummary)Summary of categorical economic indicator 
                   variables for four countries</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> country </th>
   <th style="text-align:right;"> N </th>
   <th style="text-align:right;"> % </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Australia </td>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:right;"> 25.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ethiopia </td>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:right;"> 25.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> India </td>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:right;"> 25.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> United States </td>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:right;"> 25.0 </td>
  </tr>
</tbody>
</table>

We can create a table that shows the correlation between variables using `datasummary_correlation()` (Table \@ref(tab:correlationtable)).


```r
world_bank_data |> 
  datasummary_correlation(
    title = "Correlation between the economic indicator variables for 
    four countries (Australia, Ethiopia, India, and the US)"
    )
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:correlationtable)Correlation between the economic indicator variables for 
    four countries (Australia, Ethiopia, India, and the US)</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> year </th>
   <th style="text-align:right;"> inflation </th>
   <th style="text-align:right;"> gdp_growth </th>
   <th style="text-align:right;"> population </th>
   <th style="text-align:right;"> unemployment_rate </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> year </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> . </td>
   <td style="text-align:right;"> . </td>
   <td style="text-align:right;"> . </td>
   <td style="text-align:right;"> . </td>
  </tr>
  <tr>
   <td style="text-align:left;"> inflation </td>
   <td style="text-align:right;"> .00 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> . </td>
   <td style="text-align:right;"> . </td>
   <td style="text-align:right;"> . </td>
  </tr>
  <tr>
   <td style="text-align:left;"> gdp_growth </td>
   <td style="text-align:right;"> .10 </td>
   <td style="text-align:right;"> .00 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> . </td>
   <td style="text-align:right;"> . </td>
  </tr>
  <tr>
   <td style="text-align:left;"> population </td>
   <td style="text-align:right;"> .24 </td>
   <td style="text-align:right;"> .07 </td>
   <td style="text-align:right;"> .15 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> . </td>
  </tr>
  <tr>
   <td style="text-align:left;"> unemployment_rate </td>
   <td style="text-align:right;"> −.13 </td>
   <td style="text-align:right;"> −.14 </td>
   <td style="text-align:right;"> −.31 </td>
   <td style="text-align:right;"> −.35 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

We typically need a table of descriptive statistics that we could add to our paper (Table \@ref(tab:descriptivestats)). This contrasts with Table \@ref(tab:testdatasummary) which would likely not be included in a paper. We can add a note about the source of the data using 'notes'.


```r
datasummary_balance(formula = ~country,
                    data = world_bank_data,
                    title = "Descriptive statistics for the inflation and GDP dataset",
                    notes = "Data source: World Bank.")
```

<table style="NAborder-bottom: 0; width: auto !important; margin-left: auto; margin-right: auto;" class="table">
<caption>(\#tab:descriptivestats)Descriptive statistics for the inflation and GDP dataset</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Australia (N=61)</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Ethiopia (N=61)</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">India (N=61)</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">United States (N=61)</div></th>
</tr>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Mean </th>
   <th style="text-align:right;"> Std. Dev. </th>
   <th style="text-align:right;"> Mean  </th>
   <th style="text-align:right;"> Std. Dev.  </th>
   <th style="text-align:right;"> Mean   </th>
   <th style="text-align:right;"> Std. Dev.   </th>
   <th style="text-align:right;"> Mean    </th>
   <th style="text-align:right;"> Std. Dev.    </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> year </td>
   <td style="text-align:right;"> 1990.0 </td>
   <td style="text-align:right;"> 17.8 </td>
   <td style="text-align:right;"> 1990.0 </td>
   <td style="text-align:right;"> 17.8 </td>
   <td style="text-align:right;"> 1990.0 </td>
   <td style="text-align:right;"> 17.8 </td>
   <td style="text-align:right;"> 1990.0 </td>
   <td style="text-align:right;"> 17.8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> inflation </td>
   <td style="text-align:right;"> 4.7 </td>
   <td style="text-align:right;"> 3.8 </td>
   <td style="text-align:right;"> 8.7 </td>
   <td style="text-align:right;"> 10.4 </td>
   <td style="text-align:right;"> 7.4 </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> 3.7 </td>
   <td style="text-align:right;"> 2.8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> gdp_growth </td>
   <td style="text-align:right;"> 3.4 </td>
   <td style="text-align:right;"> 1.8 </td>
   <td style="text-align:right;"> 5.9 </td>
   <td style="text-align:right;"> 6.4 </td>
   <td style="text-align:right;"> 5.0 </td>
   <td style="text-align:right;"> 3.3 </td>
   <td style="text-align:right;"> 2.9 </td>
   <td style="text-align:right;"> 2.2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> population </td>
   <td style="text-align:right;"> 17244215.9 </td>
   <td style="text-align:right;"> 4328625.6 </td>
   <td style="text-align:right;"> 55662437.9 </td>
   <td style="text-align:right;"> 27626912.1 </td>
   <td style="text-align:right;"> 888774544.9 </td>
   <td style="text-align:right;"> 292997809.4 </td>
   <td style="text-align:right;"> 255028733.1 </td>
   <td style="text-align:right;"> 45603604.8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> unemployment_rate </td>
   <td style="text-align:right;"> 6.8 </td>
   <td style="text-align:right;"> 1.7 </td>
   <td style="text-align:right;"> 2.6 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 1.4 </td>
   <td style="text-align:right;"> 6.0 </td>
   <td style="text-align:right;"> 1.6 </td>
  </tr>
</tbody>
<tfoot><tr><td style="padding: 0; " colspan="100%">
<sup></sup> Data source: World Bank.</td></tr></tfoot>
</table>





### Display regression results

Finally, one common reason for needing a table is to report regression results. We will do this using `modelsummary()` from `modelsummary` [@citemodelsummary].


```r
first_model <- lm(formula = gdp_growth ~ inflation, 
                  data = world_bank_data)

modelsummary(first_model)
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Model 1 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> (Intercept) </td>
   <td style="text-align:center;"> 4.157 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (0.352) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> inflation </td>
   <td style="text-align:center;"> −0.002 </td>
  </tr>
  <tr>
   <td style="text-align:left;box-shadow: 0px 1px">  </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.041) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Num.Obs. </td>
   <td style="text-align:center;"> 218 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 Adj. </td>
   <td style="text-align:center;"> −0.005 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AIC </td>
   <td style="text-align:center;"> 1195.1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BIC </td>
   <td style="text-align:center;"> 1205.3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Log.Lik. </td>
   <td style="text-align:center;"> −594.554 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F </td>
   <td style="text-align:center;"> 0.002 </td>
  </tr>
</tbody>
</table>

We can put a variety of different of different models together (Table \@ref(tab:twomodels)).


```r
second_model <- lm(formula = gdp_growth ~ inflation + country, 
                  data = world_bank_data)

third_model <- lm(formula = gdp_growth ~ inflation + country + population, 
                  data = world_bank_data)

modelsummary(list(first_model, second_model, third_model),
             title = "Explaining GDP as a function of inflation")
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:twomodels)Explaining GDP as a function of inflation</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Model 1 </th>
   <th style="text-align:center;"> Model 2 </th>
   <th style="text-align:center;"> Model 3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> (Intercept) </td>
   <td style="text-align:center;"> 4.157 </td>
   <td style="text-align:center;"> 3.728 </td>
   <td style="text-align:center;"> 3.668 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (0.352) </td>
   <td style="text-align:center;"> (0.495) </td>
   <td style="text-align:center;"> (0.494) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> inflation </td>
   <td style="text-align:center;"> −0.002 </td>
   <td style="text-align:center;"> −0.075 </td>
   <td style="text-align:center;"> −0.072 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (0.041) </td>
   <td style="text-align:center;"> (0.041) </td>
   <td style="text-align:center;"> (0.041) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> countryEthiopia </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 2.872 </td>
   <td style="text-align:center;"> 2.716 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> (0.757) </td>
   <td style="text-align:center;"> (0.758) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> countryIndia </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 1.854 </td>
   <td style="text-align:center;"> −0.561 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> (0.655) </td>
   <td style="text-align:center;"> (1.520) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> countryUnited States </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> −0.524 </td>
   <td style="text-align:center;"> −1.176 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> (0.646) </td>
   <td style="text-align:center;"> (0.742) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> population </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;box-shadow: 0px 1px">  </td>
   <td style="text-align:center;box-shadow: 0px 1px">  </td>
   <td style="text-align:center;box-shadow: 0px 1px">  </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.000) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Num.Obs. </td>
   <td style="text-align:center;"> 218 </td>
   <td style="text-align:center;"> 218 </td>
   <td style="text-align:center;"> 218 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 </td>
   <td style="text-align:center;"> 0.000 </td>
   <td style="text-align:center;"> 0.110 </td>
   <td style="text-align:center;"> 0.123 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 Adj. </td>
   <td style="text-align:center;"> −0.005 </td>
   <td style="text-align:center;"> 0.093 </td>
   <td style="text-align:center;"> 0.102 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AIC </td>
   <td style="text-align:center;"> 1195.1 </td>
   <td style="text-align:center;"> 1175.7 </td>
   <td style="text-align:center;"> 1174.5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BIC </td>
   <td style="text-align:center;"> 1205.3 </td>
   <td style="text-align:center;"> 1196.0 </td>
   <td style="text-align:center;"> 1198.2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Log.Lik. </td>
   <td style="text-align:center;"> −594.554 </td>
   <td style="text-align:center;"> −581.844 </td>
   <td style="text-align:center;"> −580.266 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F </td>
   <td style="text-align:center;"> 0.002 </td>
   <td style="text-align:center;"> 6.587 </td>
   <td style="text-align:center;"> 5.939 </td>
  </tr>
</tbody>
</table>


We can adjust the number of significant digits (Table \@ref(tab:twomodelstwo)).


```r
modelsummary(list(first_model, second_model, third_model),
             fmt = 1,
             title = "Two models of GDP as a function of inflation")
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:twomodelstwo)Two models of GDP as a function of inflation</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Model 1 </th>
   <th style="text-align:center;"> Model 2 </th>
   <th style="text-align:center;"> Model 3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> (Intercept) </td>
   <td style="text-align:center;"> 4.2 </td>
   <td style="text-align:center;"> 3.7 </td>
   <td style="text-align:center;"> 3.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (0.4) </td>
   <td style="text-align:center;"> (0.5) </td>
   <td style="text-align:center;"> (0.5) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> inflation </td>
   <td style="text-align:center;"> 0.0 </td>
   <td style="text-align:center;"> −0.1 </td>
   <td style="text-align:center;"> −0.1 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (0.0) </td>
   <td style="text-align:center;"> (0.0) </td>
   <td style="text-align:center;"> (0.0) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> countryEthiopia </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 2.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> (0.8) </td>
   <td style="text-align:center;"> (0.8) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> countryIndia </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 1.9 </td>
   <td style="text-align:center;"> −0.6 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> (0.7) </td>
   <td style="text-align:center;"> (1.5) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> countryUnited States </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> −0.5 </td>
   <td style="text-align:center;"> −1.2 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> (0.6) </td>
   <td style="text-align:center;"> (0.7) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> population </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;box-shadow: 0px 1px">  </td>
   <td style="text-align:center;box-shadow: 0px 1px">  </td>
   <td style="text-align:center;box-shadow: 0px 1px">  </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.0) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Num.Obs. </td>
   <td style="text-align:center;"> 218 </td>
   <td style="text-align:center;"> 218 </td>
   <td style="text-align:center;"> 218 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 </td>
   <td style="text-align:center;"> 0.000 </td>
   <td style="text-align:center;"> 0.110 </td>
   <td style="text-align:center;"> 0.123 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 Adj. </td>
   <td style="text-align:center;"> −0.005 </td>
   <td style="text-align:center;"> 0.093 </td>
   <td style="text-align:center;"> 0.102 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AIC </td>
   <td style="text-align:center;"> 1195.1 </td>
   <td style="text-align:center;"> 1175.7 </td>
   <td style="text-align:center;"> 1174.5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BIC </td>
   <td style="text-align:center;"> 1205.3 </td>
   <td style="text-align:center;"> 1196.0 </td>
   <td style="text-align:center;"> 1198.2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Log.Lik. </td>
   <td style="text-align:center;"> −594.554 </td>
   <td style="text-align:center;"> −581.844 </td>
   <td style="text-align:center;"> −580.266 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F </td>
   <td style="text-align:center;"> 0.002 </td>
   <td style="text-align:center;"> 6.587 </td>
   <td style="text-align:center;"> 5.939 </td>
  </tr>
</tbody>
</table>









## Maps

In many ways maps can be thought of as another type of graph, where the x-axis is latitude, the y-axis is longitude, and there is some outline or a background image. We have seen this type of set-up  are used to this type of set-up, for instance, in the `ggplot2` setting, this is quite familiar. 


```r
ggplot() +
  geom_polygon( # First draw an outline
    data = some_data, 
    aes(x = latitude, 
        y = longitude,
        group = group
        )) +
  geom_point( # Then add points of interest
    data = some_other_data, 
    aes(x = latitude, 
        y = longitude)
    )
```

And while there are some small complications, for the most part it is as straight-forward as that. The first step is to get some data. There is some geographic data built into `ggplot2`, and there is additional information in the 'world.cities' dataset from `maps`. 


```r
library(maps)

france <- map_data(map = "france")

head(france)
#>       long      lat group order region subregion
#> 1 2.557093 51.09752     1     1   Nord      <NA>
#> 2 2.579995 51.00298     1     2   Nord      <NA>
#> 3 2.609101 50.98545     1     3   Nord      <NA>
#> 4 2.630782 50.95073     1     4   Nord      <NA>
#> 5 2.625894 50.94116     1     5   Nord      <NA>
#> 6 2.597699 50.91967     1     6   Nord      <NA>

french_cities <- 
  world.cities |>
  filter(country.etc == "France")

head(french_cities)
#>              name country.etc    pop   lat long capital
#> 1       Abbeville      France  26656 50.12 1.83       0
#> 2         Acheres      France  23219 48.97 2.06       0
#> 3            Agde      France  23477 43.33 3.46       0
#> 4            Agen      France  34742 44.20 0.62       0
#> 5 Aire-sur-la-Lys      France  10470 50.64 2.39       0
#> 6 Aix-en-Provence      France 148622 43.53 5.44       0
```

With that information in hand, we can then create a map of France that shows the larger cities.  We use `geom_polygon()` from `ggplot2` to draw shapes by connecting points within groups. And `coord_map()` adjusts for the fact that we are making a 2D map to represent a world that is 3D.)


```r
ggplot() +
  geom_polygon(data = france,
               aes(x = long,
                   y = lat,
                   group = group),
               fill = "white", 
               colour = "grey") +
  coord_map() +
  geom_point(aes(x = french_cities$long, 
                 y = french_cities$lat),
             alpha = 0.3,
             color = "black") +
  theme_classic() +
  labs(x = "Longitude",
       y = "Latitude")
```

<img src="11-static_communication_files/figure-html/unnamed-chunk-23-1.png" width="672" />


As is often the case with R, there are many different ways to get started creating static maps. We have seen how they can be built using only `ggplot2`, but `ggmap` brings additional functionality [@KahleWickham2013].

There are two essential components to a map: 

1) a border or background image (sometimes called a tile); and 
2) something of interest within that border, or on top of that tile. 

In `ggmap`, we use an open-source option for our tile, Stamen Maps. And we use plot points based on latitude and longitude.


### Australian polling places

In Australia people go to specific locations, called booths, to vote. These booths have latitudes and longitudes and so we can plot these. One reason we may like to do this is to notice patterns over geographies.

To get started we need to get a tile. We are going to use `ggmap` to get a tile from Stamen Maps, which builds on OpenStreetMap (openstreetmap.org). The main argument to this function is to specify a bounding box. This requires two latitudes - one for the top of the box and one for the bottom of the box - and two longitudes - one for the left of the box and one for the right of the box. It can be useful to use Google Maps, or an alternative, to find the values of these that you need. The bounding box provides the coordinates of the edges that you are interested in. In this case we have provided it with coordinates such that it will be centered around Canberra, Australia, which is a small city that was created for the purposes of being the capital.


```r
library(ggmap)

bbox <- c(left = 148.95, bottom = -35.5, right = 149.3, top = -35.1)
```

Once you have defined the bounding box, then the function `get_stamenmap()` will get the tiles in that area. The number of tiles that it needs to get depends on the zoom, and the type of tiles that it gets depends on the maptype. We have used a black-and-white type of map but the helpfile specifies others. At this point we can the map to maps to `ggmap()` and it will plot the tile! It will be actively downloading these tiles, and so it needs an internet connection.


```r
canberra_stamen_map <- get_stamenmap(bbox, zoom = 11, maptype = "toner-lite")

ggmap(canberra_stamen_map)
```

<img src="11-static_communication_files/figure-html/unnamed-chunk-25-1.png" width="672" />

Once we have a map then we can use `ggmap()` to plot it. Now we want to get some data that we plot on top of our tiles. We will just plot the location of the polling places, based on which 'division' it is. This is available [here](https://results.aec.gov.au/20499/Website/Downloads/HouseTppByPollingPlaceDownload-20499.csv). The Australian Electoral Commission (AEC) is the official government agency that is responsible for elections in Australia.


```r
# Read in the booths data for each year
booths <-
  readr::read_csv(
    "https://results.aec.gov.au/24310/Website/Downloads/GeneralPollingPlacesDownload-24310.csv",
    skip = 1,
    guess_max = 10000
  )

head(booths)
#> # A tibble: 6 × 15
#>   State DivisionID DivisionNm PollingPlaceID
#>   <chr>      <dbl> <chr>               <dbl>
#> 1 ACT          318 Bean                93925
#> 2 ACT          318 Bean                93927
#> 3 ACT          318 Bean                11877
#> 4 ACT          318 Bean                11452
#> 5 ACT          318 Bean                 8761
#> 6 ACT          318 Bean                 8763
#> # … with 11 more variables: PollingPlaceTypeID <dbl>,
#> #   PollingPlaceNm <chr>, PremisesNm <chr>,
#> #   PremisesAddress1 <chr>, PremisesAddress2 <chr>,
#> #   PremisesAddress3 <chr>, PremisesSuburb <chr>,
#> #   PremisesStateAb <chr>, PremisesPostCode <chr>,
#> #   Latitude <dbl>, Longitude <dbl>
```

This dataset is for the whole of Australia, but as we are just going to plot the area around Canberra we filter to that and only to booths that are geographic (the AEC has various options for people who are in hospital, or not able to get to a booth, etc, and these are still 'booths' in this dataset).


```r
# Reduce the booths data to only rows with that have latitude and longitude
booths_reduced <-
  booths |>
  filter(State == "ACT") |> 
  select(PollingPlaceID, DivisionNm, Latitude, Longitude) |> 
  filter(!is.na(Longitude)) |> # Remove rows that do not have a geography
  filter(Longitude < 165) # Remove Norfolk Island
```

Now we can use `ggmap` in the same way as before to plot our underlying tiles, and then build on that using `geom_point()` to add our points of interest.


```r
ggmap(canberra_stamen_map,
      extent = "normal",
      maprange = FALSE) +
  geom_point(data = booths_reduced,
             aes(x = Longitude,
                 y = Latitude,
                 colour = DivisionNm),) +
  scale_color_brewer(name = "2019 Division", palette = "Set1") +
  coord_map(
    projection = "mercator",
    xlim = c(attr(map, "bb")$ll.lon, attr(map, "bb")$ur.lon),
    ylim = c(attr(map, "bb")$ll.lat, attr(map, "bb")$ur.lat)
  ) +
  labs(x = "Longitude",
       y = "Latitude") +
  theme_minimal() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
```

<img src="11-static_communication_files/figure-html/unnamed-chunk-28-1.png" width="672" />

We may like to save the map so that we do not have to draw it every time, and we can do that in the same way as any other graph, using `ggsave()`.


```r
ggsave("map.pdf", width = 20, height = 10, units = "cm")
```

Finally, the reason that we used Stamen Maps and OpenStreetMap is because it is open source, but we could have also used Google Maps. This requires you to first register a credit card with Google, and specify a key, but with low usage should be free. Using Google Maps, `get_googlemap()`, brings some advantages over `get_stamenmap()`, for instance it will attempt to find a placename, rather than needing to specify a bounding box.



### US troop deployment

Let us see another example of a static map, this time using data on US military deployments from `troopdata` [@troopdata]. We can access data about US overseas military bases back to the start of the Cold War using `get_basedata()`.


```r
install.packages("troopdata")
```


```r
library(troopdata)

bases <- get_basedata()

head(bases)
#> # A tibble: 6 × 9
#>   countryname ccode iso3c basename   lat   lon  base lilypad
#>   <chr>       <dbl> <chr> <chr>    <dbl> <dbl> <dbl>   <dbl>
#> 1 Afghanistan   700 AFG   Bagram …  34.9  69.3     1       0
#> 2 Afghanistan   700 AFG   Kandaha…  31.5  65.8     1       0
#> 3 Afghanistan   700 AFG   Mazar-e…  36.7  67.2     1       0
#> 4 Afghanistan   700 AFG   Gardez    33.6  69.2     1       0
#> 5 Afghanistan   700 AFG   Kabul     34.5  69.2     1       0
#> 6 Afghanistan   700 AFG   Herat     34.3  62.2     1       0
#> # … with 1 more variable: fundedsite <dbl>
```

We will look at the locations of US military bases in: Germany, Japan, and Australia. The `troopdata` dataset already has latitude and longitude of the base. We will use that as our item of interest. The first step is to define a bounding box for each of country.


```r
library(ggmap)

# Based on: https://data.humdata.org/dataset/bounding-boxes-for-countries
bbox_germany <-
  c(
    left = 5.867,
    bottom = 45.967,
    right = 15.033,
    top = 55.133
  )

bbox_japan <-
  c(
    left = 127,
    bottom = 30,
    right = 146,
    top = 45
  )

bbox_australia <-
  c(
    left = 112.467,
    bottom = -45,
    right = 155,
    top = -9.133
  )
```

Then we need to get the tiles using `get_stamenmap()` from `ggmap`. 


```r
germany_stamen_map <-
  get_stamenmap(bbox_germany, zoom = 6, maptype = "toner-lite")

japan_stamen_map <-
  get_stamenmap(bbox_japan, zoom = 6, maptype = "toner-lite")

australia_stamen_map <-
  get_stamenmap(bbox_australia, zoom = 5, maptype = "toner-lite")
```

And finally, we can bring it all together with maps show US military bases in Germany (Figure \@ref(fig:mapbasesingermany)), Japan (Figure \@ref(fig:mapbasesinjapan)), and Australia (Figure \@ref(fig:mapbasesinaustralia)).


```r
ggmap(germany_stamen_map) +
  geom_point(data = bases,
             aes(x = lon,
                 y = lat)
             ) +
  labs(x = "Longitude",
       y = "Latitude") +
  theme_minimal() 
```

<div class="figure">
<img src="11-static_communication_files/figure-html/mapbasesingermany-1.png" alt="Map of US military bases in Germany" width="672" />
<p class="caption">(\#fig:mapbasesingermany)Map of US military bases in Germany</p>
</div>


```r
ggmap(japan_stamen_map) +
  geom_point(data = bases,
             aes(x = lon,
                 y = lat)
             ) +
  labs(x = "Longitude",
       y = "Latitude") +
  theme_minimal() 
```

<div class="figure">
<img src="11-static_communication_files/figure-html/mapbasesinjapan-1.png" alt="Map of US military bases in Japan" width="672" />
<p class="caption">(\#fig:mapbasesinjapan)Map of US military bases in Japan</p>
</div>



```r
ggmap(australia_stamen_map) +
  geom_point(data = bases,
             aes(x = lon,
                 y = lat)
             ) +
  labs(x = "Longitude",
       y = "Latitude") +
  theme_minimal() 
```

<div class="figure">
<img src="11-static_communication_files/figure-html/mapbasesinaustralia-1.png" alt="Map of US military bases in Australia" width="672" />
<p class="caption">(\#fig:mapbasesinaustralia)Map of US military bases in Australia</p>
</div>





### Geocoding

To this point we assumed that we already had geocoded data, which means that we have a latitude and longitude. If we only have place names, such as 'Canberra, Australia', 'Ottawa, Canada', 'Accra, Ghana', 'Quito, Ecuador' are just names, they do not actually inherently have a location. To plot them we need to get a latitude and longitude for them. The process of going from names to coordinates is called geocoding.

There are a range of options to geocode data in R, but `tidygeocoder` is especially useful [@citetidygeocoder]. We first need a dataframe of locations. 


```r
place_names <-
  tibble(
    city = c('Canberra', 'Ottawa', 'Accra', 'Quito'),
    country = c('Australia', 'Canada', 'Ghana', 'Ecuador')
  )

place_names
#> # A tibble: 4 × 2
#>   city     country  
#>   <chr>    <chr>    
#> 1 Canberra Australia
#> 2 Ottawa   Canada   
#> 3 Accra    Ghana    
#> 4 Quito    Ecuador
```


```r
library(tidygeocoder)

place_names <-
  geo(city = place_names$city,
      country = place_names$country,
      method = 'osm')

place_names
#> # A tibble: 4 × 4
#>   city     country       lat    long
#>   <chr>    <chr>       <dbl>   <dbl>
#> 1 Canberra Australia -35.3   149.   
#> 2 Ottawa   Canada     45.4   -75.7  
#> 3 Accra    Ghana       5.56   -0.201
#> 4 Quito    Ecuador    -0.220 -78.5
```

And we can now plot and label these cities (Figure \@ref(fig:mynicemap)).


```r
world <- map_data(map = "world")

ggplot() +
  geom_polygon(
    data = world,
    aes(x = long,
        y = lat,
        group = group),
    fill = "white",
    colour = "grey"
  ) +
  coord_map(ylim = c(47,-47)) +
  geom_point(aes(x = place_names$long,
                 y = place_names$lat),
             color = "black") +
  geom_text(aes(
    x = place_names$long,
    y = place_names$lat,
    label = place_names$city
  ),
  nudge_y = -5,) +
  theme_classic() +
  labs(x = "Longitude",
       y = "Latitude")
```

<div class="figure">
<img src="11-static_communication_files/figure-html/mynicemap-1.png" alt="Map of Accra, Canberra, Ottawa, and Quito after geocoding to obtain their locations" width="672" />
<p class="caption">(\#fig:mynicemap)Map of Accra, Canberra, Ottawa, and Quito after geocoding to obtain their locations</p>
</div>



## Exercises and tutorial

### Exercises


1. I have a dataset that contains measurements of height (in cm) for a sample of 300 penguins, who are either the Adeline or Emperor species. I am interested in visualizing the distribution of heights by species in a graphical way. Please discuss whether a pie chart is an appropriate type of graph to use. What about a box and whisker plot? Finally, what are some considerations if you made a histogram? [Please write a paragraph or two for each aspect.]
2. Assume the dataset and columns exist. Would this code work? `data |> ggplot(aes(x = col_one)) |> geom_point()` (pick one)?
    a. Yes
    b. No
3. If I have categorical data, which geom should I use to plot it (pick one)?
    a.  `geom_bar()`
    b. `geom_point()`
    c. `geom_abline()`
    d. `geom_boxplot()`
4. Why are boxplots often inappropriate (pick one)?
    a.  They hide the full distribution of the data.
    b. They are hard to make.
    c. They are ugly.
    d. The mode is clearly displayed.
5. Which of the following, if any, are elements of the layered grammar of graphics [@wickham2010layered] (select all that apply)?
    a. A default dataset and set of mappings from variables to aesthetics.
    b. One or more layers, with each layer having one geometric object, one statistical transformation, one position adjustment, and optionally, one dataset and set of aesthetic mappings.
    c. Colors that enable the reader to understand the main point.
    d. A coordinate system.
    e. The facet specification.
    f. One scale for each aesthetic mapping used.


### Tutorial

Using R Markdown, please create a graph using `ggplot2` and a map using `ggmap` and add explanatory text to accompany both. This should take one to two pages for each of them. 

For the graph, please reflect on @vanderplas2020testing and add a few paragraphs about the different options that you considered that the graph more effective. 

For the map, please reflect on the following quote from Heather Krause: 'maps only show people who aren't invisible to the makers' as well as Chapter 3 from @datafeminism2020 and add a few paragraphs related to this.

Please submit a PDF.
