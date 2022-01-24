



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

When telling stories with data, we are trying to allow the data to convince our reader of something. The paper is the medium, and the data are the message. To that end, we want to try to show our reader the data that allowed us to come to our understanding of the story. We use graphs, tables, and maps to help achieve this. 

In the first instance, we must show the actual data that underpin our analysis, or as close to it as we can. For instance, if our dataset consists of 2,500 responses to a survey, then at some point in our paper we would expect a graph that contains 2,500 points or sums to 2,500. To do this we build graphs using `ggplot2` [@citeggplot]. We will go through a variety of different options here including bar charts, scatterplots, histograms, and line charts.

In contrast to the role of graphs, which is to show the actual data, or as close to it as possible, the role of tables is typically to convey various summary statistics. We will build tables using `knitr` [@citeknitr] and `kableExtra` [@citekableextra] in the first instance, and then `gt` [@citegt] and `modelsummary` [@citemodelsummary]. 

Finally, we cover maps as a variant of graphs that are used to show a particular type of data. We will build static maps using `ggmap` [@KahleWickham2013], having obtained the geocoded data that we need using `tidygeocoder` [@citetidygeocoder].


## Graphs

Graphs are a critical aspect of compelling stories told with data.

> Graphs allow us to explore data to see overall patterns and to see detailed behavior; no other approach can compete in revealing the structure of data so thoroughly. Graphs allow us to view complex mathematical models fitted to data, and they allow us to assess the validity of such models.
>
> @elementsofgraphingdata [p. 5]

In a way, the graphing of data is an information coding process where we create a glyph, or purposeful mark, that we mean to convey information to our audience. The audience must decode our glyph. The success of our graph turns on how much data are lost in this process. And the decoding is the critical aspect [@elementsofgraphingdata, p. 221], which means that we are creating graphs for the audience. If nothing else is possible, the most important feature is to convey as much of the actual data as possible.

To see why this is important we begin by using the dataset 'datasaurus_dozen' from `datasauRus` [@citedatasauRus]. First, we can take a quick look at the dataset.


```r
install.packages('datasauRus')
```


```r
library(tidyverse)
library(datasauRus)

head(datasaurus_dozen)
#> # A tibble: 6 x 3
#>   dataset     x     y
#>   <chr>   <dbl> <dbl>
#> 1 dino     55.4  97.2
#> 2 dino     51.5  96.0
#> 3 dino     46.2  94.5
#> 4 dino     42.8  91.4
#> 5 dino     40.8  88.3
#> 6 dino     38.7  84.9
datasaurus_dozen |> count(dataset)
#> # A tibble: 13 x 2
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

We can see that the dataset consists of values for 'x' and 'y', which should be plotted on the x-axis and y-axis, respectively. We can further see that there are thirteen different values in the variable 'dataset' including: "dino", "star", "away", and "bullseye". We will focus on those four and generate some summary statistics for each (Table \@ref(tab:datasaurussummarystats)).


```r
# Code from Julia Silge: https://juliasilge.com/blog/datasaurus-multiclass/
datasaurus_dozen |>
  filter(dataset %in% c("dino", "star", "away", "bullseye")) |>
  group_by(dataset) |>
  summarise(across(c(x, y), 
                   list(mean = mean, sd = sd)),
            x_y_cor = cor(x, y)) |>
  knitr::kable(
    caption = "Mean and standard deviation for four 'datasaurus' datasets",
    col.names = c("Dataset", "x mean", "x sd", "y mean", "y sd", "correlation"),
    digits = 1,
    booktabs = TRUE,
    linesep = ""
  )
```

\begin{table}

\caption{(\#tab:datasaurussummarystats)Mean and standard deviation for four 'datasaurus' datasets}
\centering
\begin{tabular}[t]{lrrrrr}
\toprule
Dataset & x mean & x sd & y mean & y sd & correlation\\
\midrule
away & 54.3 & 16.8 & 47.8 & 26.9 & -0.1\\
bullseye & 54.3 & 16.8 & 47.8 & 26.9 & -0.1\\
dino & 54.3 & 16.8 & 47.8 & 26.9 & -0.1\\
star & 54.3 & 16.8 & 47.8 & 26.9 & -0.1\\
\bottomrule
\end{tabular}
\end{table}

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

![(\#fig:datasaurusgraph)Graph of four 'datasaurus' datasets](11-static_communication_files/figure-latex/datasaurusgraph-1.pdf) 

This is a variant of the famous 'Anscombe's Quartet'. That plot conveys the same message about the importance of plotting the actual data and not relying on summary statistics. The 'anscombe' dataset is built into R.


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
# From Nick Tierney: https://www.njtierney.com/post/2020/06/01/tidy-anscombe/
# Code from pivot_longer() vignette.
tidy_anscombe <- 
  anscombe |>
  pivot_longer(everything(),
               names_to = c(".value", "set"),
               names_pattern = "(.)(.)"
               )
```

We can again first create some summary statistics (Table \@ref(tab:anscombesummarystats)) and then graph the data (Figure \@ref(fig:anscombegraph)).


```r
tidy_anscombe |>
  group_by(set) |>
  summarise(across(c(x, y),
                   list(mean = mean, sd = sd)),
            x_y_cor = cor(x, y)) |>
  knitr::kable(
    caption = "Mean and standard deviation for Anscombe",
    col.names = c("Dataset", "x mean", "x sd", "y mean", "y sd", "correlation"),
    digits = 1,
    booktabs = TRUE,
    linesep = ""
  )
```

\begin{table}

\caption{(\#tab:anscombesummarystats)Mean and standard deviation for Anscombe}
\centering
\begin{tabular}[t]{lrrrrr}
\toprule
Dataset & x mean & x sd & y mean & y sd & correlation\\
\midrule
1 & 9 & 3.3 & 7.5 & 2 & 0.8\\
2 & 9 & 3.3 & 7.5 & 2 & 0.8\\
3 & 9 & 3.3 & 7.5 & 2 & 0.8\\
4 & 9 & 3.3 & 7.5 & 2 & 0.8\\
\bottomrule
\end{tabular}
\end{table}



```r
tidy_anscombe |> 
  ggplot(aes(x = x, y = y, colour = set)) +
  geom_point() +
  theme_minimal() +
  facet_wrap(vars(set), nrow = 2, ncol = 2) +
  labs(colour = "Dataset")
```

![(\#fig:anscombegraph)Recreation of Anscombe's Quartet](11-static_communication_files/figure-latex/anscombegraph-1.pdf) 


<!-- Figure \@ref(fig:thomowillrose) provides invaluable advice (thank you to Thomas William Rosenthal). -->

<!-- ```{r thomowillrose, echo=FALSE, fig.cap = "How do we get started with our data?", out.width = '90%'} -->
<!-- knitr::include_graphics(here::here("figures/thomowillrose.png")) -->




### Bar charts

We typically use a bar chart when we have a categorical variable that we want to focus on. We saw an example of this in Chapter \@ref(drinking-from-a-fire-hose) where we constructed a graph of the number of occupied beds. The geom that we primarily use is `geom_bar()`, but there are many variants to cater for the specific situation. 

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
#> # A tibble: 6 x 11
#>    ...1 vote     age economic.cond.n~ economic.cond.h~ Blair
#>   <dbl> <chr>  <dbl>            <dbl>            <dbl> <dbl>
#> 1     1 Liber~    43                3                3     4
#> 2     2 Labour    36                4                4     4
#> 3     3 Labour    35                4                4     5
#> 4     4 Labour    24                4                2     2
#> 5     5 Labour    41                2                2     1
#> 6     6 Labour    47                3                4     4
#> # ... with 5 more variables: Hague <dbl>, Kennedy <dbl>,
#> #   Europe <dbl>, political.knowledge <dbl>, gender <chr>
```


We have some data on the age of the respondents. We could begin by making a graph of this age distribution (Figure \@ref(fig:bepfitst)).


```r
beps |> 
  ggplot(mapping = aes(x = age)) +
  geom_bar()
```

![(\#fig:bepfitst)Distribution of ages in the 1997-2001 British Election Panel Study](11-static_communication_files/figure-latex/bepfitst-1.pdf) 

We can see that by default, `geom_bar()` has created a count of the number of times each age appears in the dataset. It does this because the default 'stat' for `geom_bar()` is 'count'. This saves us from having to create that ourselves. But if we had already constructed a count (for instance, with `beps |> count(age)`), then we could also specify a column of values for the y-axis and then use 'stat = "identity"'.

We may also like to consider different groupings of the data, for instance, 'vote' (Figure \@ref(fig:bepsecond)).


```r
beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar()
```

![(\#fig:bepsecond)Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study](11-static_communication_files/figure-latex/bepsecond-1.pdf) 

The default is that these different groups are stacked, but they can be placed side-by-side with 'position = "dodge"' (Figure \@ref(fig:bepthird)).


```r
beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar(position = "dodge")
```

![(\#fig:bepthird)Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study](11-static_communication_files/figure-latex/bepthird-1.pdf) 

At this point, we may like to address the general look of the graph. There are various themes that are built into `ggplot2`. Some of these include `theme_bw()`, `theme_classic()`, `theme_linedraw()`, and `theme_minimal()`. A full list is available at the `ggplot2` cheatsheet: https://github.com/rstudio/cheatsheets/blob/main/data-visualization.pdf. We can use these themes by adding them as a layer (Figure \@ref(fig:bepthemes)). We can use `patchwork` [@citepatchwork] to bring together multiple graphs. To do this we assign the graph to a name, and then use '+' to signal which should be next to each other, '/' to signal which would be on top, and brackets for precedence.


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

theme_linedraw <- 
  beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar(position = "dodge") +
  theme_linedraw()

theme_minimal <- 
  beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar(position = "dodge") +
  theme_minimal()

(theme_bw + theme_classic) / (theme_linedraw + theme_minimal)
```

![(\#fig:bepthemes)Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study, illustrating different themes](11-static_communication_files/figure-latex/bepthemes-1.pdf) 

We can install themes from other packages, including `ggthemes` [@ggthemes], and `hrbrthemes` [@hrbrthemes], and we can even build our own.

The default labels are from the name of the relevant variable, and it is often useful to add more detail. We can add a title and caption at this point. A caption can be useful to add information about the source of the dataset. A title can be useful when the graph is going to be considered outside of the context of our paper. But the need to cross-reference all graphs that are in a paper means that included a title within `labs()` is unnecessary (Figure \@ref(fig:withnicelabels)).


```r
beps |> 
  ggplot(mapping = aes(x = age, fill = vote)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Age of respondent",
       y = "Number of respondents",
       fill = "Voted for",
       title = "Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study",
       caption = "Source: 1997-2001 British Election Panel Study.")
```

![(\#fig:withnicelabels)Distribution of ages, and vote preference, in the 1997-2001 British Election Panel Study](11-static_communication_files/figure-latex/withnicelabels-1.pdf) 

We use facets to create 'many little graphics that are variations of a single graphic' [@grammarofgraphics, p. 219]. They are especially useful when we want to specifically compare some outcomes across some variable. For instance, we may be interested to explain vote, by age and gender (Figure \@ref(fig:facets)).


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

![(\#fig:facets)Distribution of age by gender, and vote preference, in the 1997-2001 British Election Panel Study](11-static_communication_files/figure-latex/facets-1.pdf) 

We could change `facet_wrap()` to wrap vertically instead of horizontally with 'dir = "v"'. Alternatively, we could specify a number of rows, say 'nrow = 2', or a number of columns, say 'ncol = 2'. Additionally, by default, both facets will have the same scales. We could enable both facets to have different scales with 'scales = "free"', or just the x-axis 'scales = "free_x"', or just the y-axis 'scales = "free_y"' (Figure \@ref(fig:facetsfancy)). 


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

![(\#fig:facetsfancy)Distribution of age by gender, and vote preference, in the 1997-2001 British Election Panel Study](11-static_communication_files/figure-latex/facetsfancy-1.pdf) 

Finally, we can change the labels of the facets (Figure \@ref(fig:facetsfancylabels)). 


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

![(\#fig:facetsfancylabels)Distribution of age by gender, and vote preference, in the 1997-2001 British Election Panel Study](11-static_communication_files/figure-latex/facetsfancylabels-1.pdf) 

There are a variety of different ways to change the colors, and many palettes are available including from `RColorBrewer` [@RColorBrewer], which we specify with `scale_fill_brewer()`, `viridis` [@viridis], which we specify with `scale_fill_viridis()` and is particularly focused on color-blind palettes (Figure \@ref(fig:usecolor)). 


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
       y = "Number of respondents",
       fill = "Voted for") +
   scale_fill_viridis(discrete = TRUE, 
                      option = "magma")

(RColorBrewerBrBG + RColorBrewerSet2) /
 (viridis + viridismagma)
```

![(\#fig:usecolor)Distribution of age and vote preference, in the 1997-2001 British Election Panel Study](11-static_communication_files/figure-latex/usecolor-1.pdf) 

Details of the variety of palettes available in `RColorBrewer` and `viridis` are available in their help files. Many different palettes are available, and we can also build our own. That said, color is something to be considered with a great deal of care because the test of the success of a graph is the amount of information that is communicated [@elementsofgraphingdata]. Colors should not be added to graphs unnecessarily---that is to say, they must play some role. Typically, that role is to distinguish different groups, and that implies making the colors dissimilar. Colors may also be appropriate if there is some relationship between the color and the variable, for instance if making a graph of 'lemons and cherries' it would help the reader if the colors were 'yellow and red' respectively [@franconeri2021science, p. 121].


### Scatterplots

We are often interested in the relationship between two variables. We can use scatterplots to show this information. Unless there is a good reason to move to a different option, a scatterplot is almost always the best choice [@weissgerber2015beyond]. Indeed, 'among all forms of statistical graphics, the scatterplot may be considered the most versatile and generally useful invention in the entire history of statistical graphics.' [@historyofdataviz, p. 121] To illustrate scatterplots, we use `WDI` [@WDI] to download some economic indicators from the World Bank.

> **Oh, you think we have good data on that!** Gross Domestic Product (GDP) 'combines in a single figure, and with no double counting, all the output (or production) carried out by all the firms, non-profit institutions, government bodies and households in a given country during a given period, regardless of the type of goods and services produced, provided that the production takes place within the country's economic territory. (@EssentialMacroAggregates, p. 15). The modern concept was developed by Simon Kuznets and is widely used and reported. There is a certain comfort in having a definitive and concrete single number to describe something as complicated as the entire economic activity of a country. And it is crucial that we have such summary statistics. But as with any summary statistic, its strength is also its weakness. A single number necessarily loses information about constituent components, and these distributional differences are critical. It highlights short term economic progress over longer term improvements. And 'the quantitative definiteness of the estimates makes it easy to forget their dependence upon imperfect data and the consequently wide margins of possible error to which both totals and components are liable' [@NationalIncomeAndItsComposition, p. xxvi]. Reliance on any one summary measure of economic performance presents a misguided picture not only of a country's economy, but also of its peoples.


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





At this point we may like to change the names to be more meaningful and only keep the columns that we need.


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
#> # A tibble: 6 x 6
#>   country    year inflation gdp_growth population
#>   <chr>     <dbl>     <dbl>      <dbl>      <dbl>
#> 1 Australia  1960     3.73       NA      10276477
#> 2 Australia  1961     2.29        2.48   10483000
#> 3 Australia  1962    -0.319       1.29   10742000
#> 4 Australia  1963     0.641       6.21   10950000
#> 5 Australia  1964     2.87        6.98   11167000
#> 6 Australia  1965     3.41        5.98   11388000
#> # ... with 1 more variable: unemployment_rate <dbl>
```

Now let us look at income as a function of years of education (Figure \@ref(fig:scattorplot)).


```r
world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_point()
#> Warning: Removed 26 rows containing missing values
#> (geom_point).
```

![(\#fig:scattorplot)Relationship between inflation and GDP for Australia, Ethiopia, India, and the US](11-static_communication_files/figure-latex/scattorplot-1.pdf) 

As with the bar plots, we change the theme, and update the labels (Figure \@ref(fig:scatterplotnicer)).


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
#> Warning: Removed 26 rows containing missing values
#> (geom_point).
```

![(\#fig:scatterplotnicer)Relationship between inflation and GDP for Australia, Ethiopia, India, and the US](11-static_communication_files/figure-latex/scatterplotnicer-1.pdf) 

We use 'color' instead of 'fill' because we are using dots rather than bars. This also then slightly affects how we change the palette (Figure \@ref(fig:scatterplotnicercolor)). 


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
       title = "Relationship between inflation and GDP growth",
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
       title = "Relationship between inflation and GDP growth",
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
       title = "Relationship between inflation and GDP growth",
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
       title = "Relationship between inflation and GDP growth",
       caption = "Data source: World Bank.") +
  scale_colour_viridis_d(option = "magma")

(RColorBrewerBrBG + RColorBrewerSet2) /
 (viridis + viridismagma)
```

![(\#fig:scatterplotnicercolor)Relationship between inflation and GDP for Australia, Ethiopia, India, and the US](11-static_communication_files/figure-latex/scatterplotnicercolor-1.pdf) 

The dots of a dot plot often overlap. We can address this situation in one of two ways: adding a degree of transparency to our dots with 'alpha' (Figure \@ref(fig:alphaplot)). The value for 'alpha' can vary between 0, which is fully transparent, and 1, which is completely opaque. We can also specify a small amount by which we are comfortable if the points move with `geom_jitter()` (Figure \@ref(fig:jitterplot)). We can specify which direction movement occurs with 'width' or 'height'. The decision between these two options turns on the degree to which exact accuracy matters, and the number of points.


```r
world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_point(alpha = 0.5) +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       title = "Relationship between inflation and GDP growth",
       caption = "Data source: World Bank.")
#> Warning: Removed 26 rows containing missing values
#> (geom_point).
```

![(\#fig:alphaplot)Relationship between inflation and GDP for Australia, Ethiopia, India, and the US](11-static_communication_files/figure-latex/alphaplot-1.pdf) 


```r
world_bank_data |>
  ggplot(mapping = aes(x = gdp_growth, y = inflation, color = country)) +
  geom_jitter() +
  theme_minimal() +
  labs(x = "Inflation",
       y = "GDP growth",
       color = "Country",
       title = "Relationship between inflation and GDP growth",
       caption = "Data source: World Bank.")
#> Warning: Removed 26 rows containing missing values
#> (geom_point).
```

![(\#fig:jitterplot)Relationship between inflation and GDP for Australia, Ethiopia, India, and the US](11-static_communication_files/figure-latex/jitterplot-1.pdf) 

A common use case for a scatterplot is to illustrate a relationship between two variables. It can be useful to add a line of best fit using `geom_smooth()` (Figure \@ref(fig:scattorplottwo)). By default `geom_smooth()` will impose a X relationship. By default, loess smoothing is used for datasets with less than 1,000 observations, but we can specify the relationship using 'method', change the color with 'color' and remove standard errors with 'se'. We use `geom_smooth()` to add a layer to the graph, and so it inherits all the settings that it can from `ggplot()`. For instance, that is why here we have one line for each country. We could overwrite that by specifying a particular color, in which case we would only have one line.


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
       title = "Relationship between inflation and GDP growth",
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
       title = "Relationship between inflation and GDP growth",
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
       title = "Relationship between inflation and GDP growth",
       caption = "Data source: World Bank.")

(defaults + straightline + onestraightline)
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
#> Warning: Removed 26 rows containing non-finite values
#> (stat_smooth).
#> Warning: Removed 26 rows containing missing values
#> (geom_point).
#> `geom_smooth()` using formula 'y ~ x'
#> Warning: Removed 26 rows containing non-finite values
#> (stat_smooth).

#> Warning: Removed 26 rows containing missing values (geom_point).
#> `geom_smooth()` using formula 'y ~ x'
#> Warning: Removed 26 rows containing non-finite values
#> (stat_smooth).

#> Warning: Removed 26 rows containing missing values (geom_point).
```

![(\#fig:scattorplottwo)Relationship between inflation and GDP for Australia, Ethiopia, India, and the US](11-static_communication_files/figure-latex/scattorplottwo-1.pdf) 


### Line plots

We can use a line plot when we have variables that should be joined together, for instance, economic time series. We will continue with the dataset from the World Bank and focus on initially on GDP (Figure \@ref(fig:lineplot)). 


```r
world_bank_data |>
  ggplot(mapping = aes(x = year, y = gdp_growth, color = country)) +
  geom_line()
#> Warning: Removed 25 row(s) containing missing values
#> (geom_path).
```

![(\#fig:lineplot)GDP over time for Australia, Ethiopia, India, and the US](11-static_communication_files/figure-latex/lineplot-1.pdf) 

As before, we can adjust the theme and labels (Figure \@ref(fig:lineplottwo)).


```r
world_bank_data |>
  ggplot(mapping = aes(x = year, y = gdp_growth, color = country)) +
  geom_line() +
  theme_minimal() +
  labs(x = "Year",
       y = "GDP",
       color = "Country",
       title = "GDP over time",
       caption = "Data source: World Bank.")
#> Warning: Removed 25 row(s) containing missing values
#> (geom_path).
```

![(\#fig:lineplottwo)GDP over time for Australia, Ethiopia, India, and the US](11-static_communication_files/figure-latex/lineplottwo-1.pdf) 

We can use a slight variant, `geom_step()` to focus attention on the change from year to year (Figure \@ref(fig:stepplot)).


```r
world_bank_data |>
  ggplot(mapping = aes(x = year, y = gdp_growth, color = country)) +
  geom_step() +
  theme_minimal() +
  labs(x = "Year",
       y = "GDP",
       color = "Country",
       title = "GDP over time",
       caption = "Data source: World Bank.")
#> Warning: Removed 25 row(s) containing missing values
#> (geom_path).
```

![(\#fig:stepplot)GDP over time for Australia, Ethiopia, India, and the US](11-static_communication_files/figure-latex/stepplot-1.pdf) 

The Phillips curve is the name given to plot of the relationship between unemployment and inflation over time. An inverse relationship is sometimes found in the data, for instance in the UK between 1861 and 1957 [@phillips1958relation]. We have a variety of ways to investigate this including `geom_path()` which links values in the order they appear in the datset. In Figure \@ref(fig:phillipsmyboy) we show a Phillips curve for the US between 1960 and 2020, and it is clear that any relationship that once existed between these variables does not appear to still exist.


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

![(\#fig:phillipsmyboy)Phillips curve for the US (1960-2020)](11-static_communication_files/figure-latex/phillipsmyboy-1.pdf) 


### Histograms

A histogram is useful to show the shape of a continuous variable and works by constructing counts of the number of observations in different subsets of the support, called 'bins'. In Figure \@ref(fig:hisogramone) we examine the distribution of GDP in the US.


```r
world_bank_data |> 
  filter(country == "United States") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram()
```

![(\#fig:hisogramone)Distribution of income](11-static_communication_files/figure-latex/hisogramone-1.pdf) 

And again we can add a theme and labels (Figure \@ref(fig:hisogramtwo).


```r
world_bank_data |> 
  filter(country == "United States") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram() +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")
#> `stat_bin()` using `bins = 30`. Pick better value with
#> `binwidth`.
#> Warning: Removed 1 rows containing non-finite values
#> (stat_bin).
```

![(\#fig:hisogramtwo)Distribution of GDP in the United States](11-static_communication_files/figure-latex/hisogramtwo-1.pdf) 

The key component determining the shape of a histogram is the number of bins. This can be specified in one of two ways: 1) specifying the number of 'bins' to include, or 2) specifying how wide they should be with 'binwidth' (Figure \@ref(fig:hisogrambins)).


```r

twobins <- 
  world_bank_data |> 
  filter(country == "United States") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(bins = 2) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

fivebins <- 
  world_bank_data |> 
  filter(country == "United States") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(bins = 5) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

twentybins <- 
  world_bank_data |> 
  filter(country == "United States") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(bins = 20) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

halfbinwidth <- 
  world_bank_data |> 
  filter(country == "United States") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(binwidth = 0.5) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

twobinwidth <- 
  world_bank_data |> 
  filter(country == "United States") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(binwidth = 2) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

fivebinwidth <- 
  world_bank_data |> 
  filter(country == "United States") |> 
  ggplot(mapping = aes(x = gdp_growth)) +
  geom_histogram(binwidth = 5) +
  theme_minimal() +
  labs(x = "GDP",
       y = "Number of occurrences",
       caption = "Data source: World Bank.")

(twobins + fivebins + twentybins) / (halfbinwidth + twobinwidth + fivebinwidth)
```

![(\#fig:hisogrambins)Distribution of GDP in the United States](11-static_communication_files/figure-latex/hisogrambins-1.pdf) 

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

![(\#fig:freq)Distribution of GDP in the United States](11-static_communication_files/figure-latex/freq-1.pdf) 



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

![(\#fig:dotplot)Distribution of GDP in the United States](11-static_communication_files/figure-latex/dotplot-1.pdf) 


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

![(\#fig:boxplotfirst)Data drawn from beta distributions with different parameters](11-static_communication_files/figure-latex/boxplotfirst-1.pdf) 

But if we plot the actual data then we can see how different they are (Figure \@ref(fig:freqpolyofdistributions).


```r
beta_distributions |> 
  ggplot(aes(x = observation, color = source)) +
  geom_freqpoly(binwidth = 0.05) +
  theme_classic()
```

![(\#fig:freqpolyofdistributions)Data drawn from beta distributions with different parameters](11-static_communication_files/figure-latex/freqpolyofdistributions-1.pdf) 

One way forward, if a boxplot must be included, is to include the actual data as a layer on top of the boxplot (Figure \@ref(fig:bloxplotandoverlay).


```r
beta_distributions |> 
  ggplot(aes(x = source, y = observation)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.3) +
  theme_classic()
```

![(\#fig:bloxplotandoverlay)Data drawn from beta distributions with different parameters](11-static_communication_files/figure-latex/bloxplotandoverlay-1.pdf) 

An even better solution is to graph the quantiles of each distribution against (Figure \@ref(fig:qqplotftw). The Q-Q plot was developed by @wilk1968probability and requires us to plot the distributions against each other.


```r
beta_distributions |> 
  ggplot(aes(sample = observation, color = source)) +
  stat_qq(alpha = 0.3) +
  stat_qq_line() +
  theme_classic() +
  scale_color_brewer(palette = "Set1") 
```

![(\#fig:qqplotftw)Data drawn from beta distributions with different parameters](11-static_communication_files/figure-latex/qqplotftw-1.pdf) 





## Tables

Tables are critical for telling a compelling story. Tables can communicate less information than a graph, but they can do so at a high fidelity. We primarily use tables in three ways:

1. To show some of our actual dataset, for which we use `kable()` from `knitr` [@citeknitr], alongside `kableExtra` [@citekableextra].
2. To communicate summary statistics, for which we use `gt` [@citegt] and `modelsummary` [@citemodelsummary].
3. To display regression results, for which we use `modelsummary` [@citemodelsummary].


### Showing part of a dataset

We will illustrate showing part of a dataset using `kable()` from `knitr` and drawing on `kableExtra` for enhancement. We will use the World Bank dataset on inflation and GDP from earlier.


```r
library(knitr)
head(world_bank_data)
#> # A tibble: 6 x 6
#>   country    year inflation gdp_growth population
#>   <chr>     <dbl>     <dbl>      <dbl>      <dbl>
#> 1 Australia  1960     3.73       NA      10276477
#> 2 Australia  1961     2.29        2.48   10483000
#> 3 Australia  1962    -0.319       1.29   10742000
#> 4 Australia  1963     0.641       6.21   10950000
#> 5 Australia  1964     2.87        6.98   11167000
#> 6 Australia  1965     3.41        5.98   11388000
#> # ... with 1 more variable: unemployment_rate <dbl>
```

To begin, we can display the first ten rows with the default `kable()` settings.


```r
world_bank_data |> 
  slice(1:10) |> 
  kable() 
```


\begin{tabular}{l|r|r|r|r|r}
\hline
country & year & inflation & gdp\_growth & population & unemployment\_rate\\
\hline
Australia & 1960 & 3.7288136 & NA & 10276477 & NA\\
\hline
Australia & 1961 & 2.2875817 & 2.483271 & 10483000 & NA\\
\hline
Australia & 1962 & -0.3194888 & 1.294468 & 10742000 & NA\\
\hline
Australia & 1963 & 0.6410256 & 6.214949 & 10950000 & NA\\
\hline
Australia & 1964 & 2.8662420 & 6.978540 & 11167000 & NA\\
\hline
Australia & 1965 & 3.4055728 & 5.980893 & 11388000 & NA\\
\hline
Australia & 1966 & 3.2934132 & 2.381966 & 11651000 & NA\\
\hline
Australia & 1967 & 3.4782609 & 6.303650 & 11799000 & NA\\
\hline
Australia & 1968 & 2.5210084 & 5.095103 & 12009000 & NA\\
\hline
Australia & 1969 & 3.2786885 & 7.043526 & 12263000 & NA\\
\hline
\end{tabular}

In order to be able to cross-reference it in text, we need to add a caption with 'caption'. We can also make the column names more information with 'col.names' and specify the number of digits to be displayed (Table \@ref(tab:gdpfirst)).


```r
world_bank_data |> 
  slice(1:10) |> 
  kable(
    caption = "First ten rows of a dataset of economic indicators for Australia, Ethiopia, India, and the US",
    col.names = c("Country", "Year", "Inflation", "GDP growth", "Population", "Unemployment rate"),
    digits = 1
  )
```

\begin{table}

\caption{(\#tab:gdpfirst)First ten rows of a dataset of economic indicators for Australia, Ethiopia, India, and the US}
\centering
\begin{tabular}[t]{l|r|r|r|r|r}
\hline
Country & Year & Inflation & GDP growth & Population & Unemployment rate\\
\hline
Australia & 1960 & 3.7 & NA & 10276477 & NA\\
\hline
Australia & 1961 & 2.3 & 2.5 & 10483000 & NA\\
\hline
Australia & 1962 & -0.3 & 1.3 & 10742000 & NA\\
\hline
Australia & 1963 & 0.6 & 6.2 & 10950000 & NA\\
\hline
Australia & 1964 & 2.9 & 7.0 & 11167000 & NA\\
\hline
Australia & 1965 & 3.4 & 6.0 & 11388000 & NA\\
\hline
Australia & 1966 & 3.3 & 2.4 & 11651000 & NA\\
\hline
Australia & 1967 & 3.5 & 6.3 & 11799000 & NA\\
\hline
Australia & 1968 & 2.5 & 5.1 & 12009000 & NA\\
\hline
Australia & 1969 & 3.3 & 7.0 & 12263000 & NA\\
\hline
\end{tabular}
\end{table}

When producing PDFs, the 'booktabs' option makes a host of small changes to the default display and results in tables that look better (Table \@ref(tab:gdpbookdtabs)). When using 'booktabs' we additionally should specify 'linesep' otherwise `kable()` adds a small space every five lines. (None of this will show up for html output.)


```r
world_bank_data |> 
  slice(1:10) |> 
  kable(
    caption = "First ten rows of a dataset of economic indicators for Australia, Ethiopia, India, and the US",
    col.names = c("Country", "Year", "Inflation", "GDP growth", "Population", "Unemployment rate"),
    digits = 1,
    booktabs = TRUE, 
    linesep = ""
  )
```

\begin{table}

\caption{(\#tab:gdpbookdtabs)First ten rows of a dataset of economic indicators for Australia, Ethiopia, India, and the US}
\centering
\begin{tabular}[t]{lrrrrr}
\toprule
Country & Year & Inflation & GDP growth & Population & Unemployment rate\\
\midrule
Australia & 1960 & 3.7 & NA & 10276477 & NA\\
Australia & 1961 & 2.3 & 2.5 & 10483000 & NA\\
Australia & 1962 & -0.3 & 1.3 & 10742000 & NA\\
Australia & 1963 & 0.6 & 6.2 & 10950000 & NA\\
Australia & 1964 & 2.9 & 7.0 & 11167000 & NA\\
Australia & 1965 & 3.4 & 6.0 & 11388000 & NA\\
Australia & 1966 & 3.3 & 2.4 & 11651000 & NA\\
Australia & 1967 & 3.5 & 6.3 & 11799000 & NA\\
Australia & 1968 & 2.5 & 5.1 & 12009000 & NA\\
Australia & 1969 & 3.3 & 7.0 & 12263000 & NA\\
\bottomrule
\end{tabular}
\end{table}


```r
world_bank_data |> 
  slice(1:10) |> 
  kable(
    caption = "First ten rows of a dataset of economic indicators for Australia, Ethiopia, India, and the US",
    col.names = c("Country", "Year", "Inflation", "GDP growth", "Population", "Unemployment rate"),
    digits = 1,
    booktabs = TRUE
  )
```

\begin{table}

\caption{(\#tab:gdpbookdtabsnolinesep)First ten rows of a dataset of economic indicators for Australia, Ethiopia, India, and the US}
\centering
\begin{tabular}[t]{lrrrrr}
\toprule
Country & Year & Inflation & GDP growth & Population & Unemployment rate\\
\midrule
Australia & 1960 & 3.7 & NA & 10276477 & NA\\
Australia & 1961 & 2.3 & 2.5 & 10483000 & NA\\
Australia & 1962 & -0.3 & 1.3 & 10742000 & NA\\
Australia & 1963 & 0.6 & 6.2 & 10950000 & NA\\
Australia & 1964 & 2.9 & 7.0 & 11167000 & NA\\
\addlinespace
Australia & 1965 & 3.4 & 6.0 & 11388000 & NA\\
Australia & 1966 & 3.3 & 2.4 & 11651000 & NA\\
Australia & 1967 & 3.5 & 6.3 & 11799000 & NA\\
Australia & 1968 & 2.5 & 5.1 & 12009000 & NA\\
Australia & 1969 & 3.3 & 7.0 & 12263000 & NA\\
\bottomrule
\end{tabular}
\end{table}


We can specify the alignment of the columns using a character vector of 'l' (left), 'c' (centre), and 'r' (right) (Table \@ref(tab:gdpalign)). Additionally, (and this is not relevant for this table), we could specify groupings for numbers that are at least one thousand using 'format.args = list(big.mark = ",")'.


```r
world_bank_data |> 
  slice(1:10) |> 
  kable(
    caption = "First ten rows of a dataset of economic indicators for Australia, Ethiopia, India, and the US",
    col.names = c("Country", "Year", "Inflation", "GDP growth", "Population", "Unemployment rate"),
    digits = 1,
    booktabs = TRUE, 
    linesep = "",
    align = c('l', 'l', 'c', 'c', 'r', 'r'),
  )
```

\begin{table}

\caption{(\#tab:gdpalign)First ten rows of a dataset of economic indicators for Australia, Ethiopia, India, and the US}
\centering
\begin{tabular}[t]{llccrr}
\toprule
Country & Year & Inflation & GDP growth & Population & Unemployment rate\\
\midrule
Australia & 1960 & 3.7 & NA & 10276477 & NA\\
Australia & 1961 & 2.3 & 2.5 & 10483000 & NA\\
Australia & 1962 & -0.3 & 1.3 & 10742000 & NA\\
Australia & 1963 & 0.6 & 6.2 & 10950000 & NA\\
Australia & 1964 & 2.9 & 7.0 & 11167000 & NA\\
Australia & 1965 & 3.4 & 6.0 & 11388000 & NA\\
Australia & 1966 & 3.3 & 2.4 & 11651000 & NA\\
Australia & 1967 & 3.5 & 6.3 & 11799000 & NA\\
Australia & 1968 & 2.5 & 5.1 & 12009000 & NA\\
Australia & 1969 & 3.3 & 7.0 & 12263000 & NA\\
\bottomrule
\end{tabular}
\end{table}

We can use `kableExtra` [@citekableextra] to add extra functionality to `kable`. For instance, we could add a row that groups some of the columns (Table \@ref(tab:gdpalign)).


```r
library(kableExtra)

world_bank_data |> 
  slice(1:10) |> 
  kable(
    caption = "First ten rows of a dataset of economic indicators for Australia, Ethiopia, India, and the US",
    col.names = c("Country", "Year", "Inflation", "GDP growth", "Population", "Unemployment rate"),
    digits = 1,
    booktabs = TRUE, 
    linesep = "",
    align = c('l', 'l', 'c', 'c', 'r', 'r'),
  ) |> 
  add_header_above(c(" " = 2, "Economic indicators" = 4))
```

\begin{table}

\caption{(\#tab:gdpkableextra)First ten rows of a dataset of economic indicators for Australia, Ethiopia, India, and the US}
\centering
\begin{tabular}[t]{llccrr}
\toprule
\multicolumn{2}{c}{ } & \multicolumn{4}{c}{Economic indicators} \\
\cmidrule(l{3pt}r{3pt}){3-6}
Country & Year & Inflation & GDP growth & Population & Unemployment rate\\
\midrule
Australia & 1960 & 3.7 & NA & 10276477 & NA\\
Australia & 1961 & 2.3 & 2.5 & 10483000 & NA\\
Australia & 1962 & -0.3 & 1.3 & 10742000 & NA\\
Australia & 1963 & 0.6 & 6.2 & 10950000 & NA\\
Australia & 1964 & 2.9 & 7.0 & 11167000 & NA\\
Australia & 1965 & 3.4 & 6.0 & 11388000 & NA\\
Australia & 1966 & 3.3 & 2.4 & 11651000 & NA\\
Australia & 1967 & 3.5 & 6.3 & 11799000 & NA\\
Australia & 1968 & 2.5 & 5.1 & 12009000 & NA\\
Australia & 1969 & 3.3 & 7.0 & 12263000 & NA\\
\bottomrule
\end{tabular}
\end{table}


### Communicating summary statistics

We can use `datasummary()` from `modelsummary` to create tables of summary statistics from our dataset. 


```r
library(modelsummary)

world_bank_data |> 
  datasummary_skim()
```

\begin{table}
\centering
\begin{tabular}[t]{lrrrrrrr>{}r}
\toprule
  & Unique (\#) & Missing (\%) & Mean & SD & Min & Median & Max &   \\
\midrule
year & 61 & 0 & \num{1990.0} & \num{17.6} & \num{1960.0} & \num{1990.0} & \num{2020.0} & \includegraphics[width=0.67in, height=0.17in]{11-static_communication_files/figure-latex//hist_d03761648359.pdf}\\
inflation & 238 & 3 & \num{6.1} & \num{6.3} & \num{-9.8} & \num{4.3} & \num{44.4} & \includegraphics[width=0.67in, height=0.17in]{11-static_communication_files/figure-latex//hist_d0375e976218.pdf}\\
gdp\_growth & 220 & 10 & \num{4.2} & \num{3.7} & \num{-11.1} & \num{3.9} & \num{13.9} & \includegraphics[width=0.67in, height=0.17in]{11-static_communication_files/figure-latex//hist_d037653e0581.pdf}\\
population & 244 & 0 & \num{304177482.9} & \num{380093166.9} & \num{10276477.0} & \num{147817291.5} & \num{1380004385.0} & \includegraphics[width=0.67in, height=0.17in]{11-static_communication_files/figure-latex//hist_d03713c99b71.pdf}\\
unemployment\_rate & 104 & 52 & \num{6.0} & \num{1.9} & \num{1.2} & \num{5.7} & \num{10.9} & \includegraphics[width=0.67in, height=0.17in]{11-static_communication_files/figure-latex//hist_d037511340fb.pdf}\\
\bottomrule
\end{tabular}
\end{table}

By default it summarizes the 'numeric' variables, but we can ask for the 'categorical' variables (Table \@ref(tab:testdatasummary)). Additionally we can add cross-references in the same way as `kable()`, that is, include a title and then cross-reference the name of the R chunk.


```r
world_bank_data |> 
  datasummary_skim(type = "categorical",
                   title = "Summary of categorical variables for the inflation and GDP dataset")
```

\begin{table}

\caption{(\#tab:testdatasummary)Summary of categorical variables for the inflation and GDP dataset}
\centering
\begin{tabular}[t]{lrr}
\toprule
country & N & \%\\
\midrule
Australia & 61 & \num{25.0}\\
Ethiopia & 61 & \num{25.0}\\
India & 61 & \num{25.0}\\
United States & 61 & \num{25.0}\\
\bottomrule
\end{tabular}
\end{table}

We can create a table that shows the correlation between variables using `datasummary_correlation()` (Table \@ref(tab:correlationtable)).


```r
world_bank_data |> 
  datasummary_correlation(
    title = "Correlation between the variables for the inflation and GDP dataset"
    )
```

\begin{table}

\caption{(\#tab:correlationtable)Correlation between the variables for the inflation and GDP dataset}
\centering
\begin{tabular}[t]{lrrrrr}
\toprule
  & year & inflation & gdp\_growth & population & unemployment\_rate\\
\midrule
year & 1 & . & . & . & .\\
inflation & \num{.00} & 1 & . & . & .\\
gdp\_growth & \num{.10} & \num{.00} & 1 & . & .\\
population & \num{.24} & \num{.07} & \num{.15} & 1 & .\\
unemployment\_rate & \num{-.13} & \num{-.14} & \num{-.31} & \num{-.35} & 1\\
\bottomrule
\end{tabular}
\end{table}

We typically need a table of descriptive statistics that we could add to our paper (Table \@ref(tab:descriptivestats)). This is in contrast to Table \@ref(tab:testdatasummary) which would likely not be included in a paper. We can add a note about the source of the data using 'notes'.


```r
datasummary_balance(formula = ~country,
                    data = world_bank_data,
                    title = "Descriptive statistics for the inflation and GDP dataset",
                    notes = "Data source: World Bank.")
```

\begin{table}

\caption{(\#tab:descriptivestats)Descriptive statistics for the inflation and GDP dataset}
\centering
\begin{tabular}[t]{lrrrrrrrr}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{2}{c}{Australia (N=61)} & \multicolumn{2}{c}{Ethiopia (N=61)} & \multicolumn{2}{c}{India (N=61)} & \multicolumn{2}{c}{United States (N=61)} \\
\cmidrule(l{3pt}r{3pt}){2-3} \cmidrule(l{3pt}r{3pt}){4-5} \cmidrule(l{3pt}r{3pt}){6-7} \cmidrule(l{3pt}r{3pt}){8-9}
  & Mean & Std. Dev. & Mean  & Std. Dev.  & Mean   & Std. Dev.   & Mean    & Std. Dev.   \\
\midrule
year & 1990.0 & 17.8 & 1990.0 & 17.8 & 1990.0 & 17.8 & 1990.0 & 17.8\\
inflation & 4.7 & 3.8 & 8.7 & 10.4 & 7.4 & 5.0 & 3.7 & 2.8\\
gdp\_growth & 3.4 & 1.8 & 5.9 & 6.4 & 5.0 & 3.3 & 2.9 & 2.2\\
population & 17244215.9 & 4328625.6 & 55662437.9 & 27626912.1 & 888774544.9 & 292997809.4 & 255028733.1 & 45603604.8\\
unemployment\_rate & 6.8 & 1.7 & 2.6 & 0.9 & 3.5 & 1.4 & 6.0 & 1.6\\
\bottomrule
\multicolumn{9}{l}{\rule{0pt}{1em}Data source: World Bank.}\\
\end{tabular}
\end{table}





### Display regression results

Finally, one common reason for needing a table is to report regression results. We will do this using `modelsummary()` from `modelsummary` [@citemodelsummary].


```r
first_model <- lm(formula = gdp_growth ~ inflation, 
                  data = world_bank_data)

modelsummary(first_model)
```

\begin{table}
\centering
\begin{tabular}[t]{lc}
\toprule
  & Model 1\\
\midrule
(Intercept) & \num{4.157}\\
 & (\num{0.352})\\
inflation & \num{-0.002}\\
 & (\num{0.041})\\
\midrule
Num.Obs. & \num{218}\\
R2 & \num{0.000}\\
R2 Adj. & \num{-0.005}\\
AIC & \num{1195.1}\\
BIC & \num{1205.3}\\
Log.Lik. & \num{-594.554}\\
F & \num{0.002}\\
\bottomrule
\end{tabular}
\end{table}

We can put a variety of different of different models together (Table \@ref(tab:twomodels)).


```r
second_model <- lm(formula = gdp_growth ~ inflation + country, 
                  data = world_bank_data,
                  title = "Explaining GDP as a function of inflation")
#> Warning: In lm.fit(x, y, offset = offset, singular.ok = singular.ok, ...) :
#>  extra argument 'title' will be disregarded

third_model <- lm(formula = gdp_growth ~ inflation + country + population, 
                  data = world_bank_data,
                  title = "Explaining GDP as a function of inflation")
#> Warning: In lm.fit(x, y, offset = offset, singular.ok = singular.ok, ...) :
#>  extra argument 'title' will be disregarded

modelsummary(list(first_model, second_model, third_model))
```

\begin{table}
\centering
\begin{tabular}[t]{lccc}
\toprule
  & Model 1 & Model 2 & Model 3\\
\midrule
(Intercept) & \num{4.157} & \num{3.728} & \num{3.668}\\
 & (\num{0.352}) & (\num{0.495}) & (\num{0.494})\\
inflation & \num{-0.002} & \num{-0.075} & \num{-0.072}\\
 & (\num{0.041}) & (\num{0.041}) & (\num{0.041})\\
countryEthiopia &  & \num{2.872} & \num{2.716}\\
 &  & (\num{0.757}) & (\num{0.758})\\
countryIndia &  & \num{1.854} & \num{-0.561}\\
 &  & (\num{0.655}) & (\num{1.520})\\
countryUnited States &  & \num{-0.524} & \num{-1.176}\\
 &  & (\num{0.646}) & (\num{0.742})\\
population &  &  & \num{0.000}\\
 &  &  & (\num{0.000})\\
\midrule
Num.Obs. & \num{218} & \num{218} & \num{218}\\
R2 & \num{0.000} & \num{0.110} & \num{0.123}\\
R2 Adj. & \num{-0.005} & \num{0.093} & \num{0.102}\\
AIC & \num{1195.1} & \num{1175.7} & \num{1174.5}\\
BIC & \num{1205.3} & \num{1196.0} & \num{1198.2}\\
Log.Lik. & \num{-594.554} & \num{-581.844} & \num{-580.266}\\
F & \num{0.002} & \num{6.587} & \num{5.939}\\
\bottomrule
\end{tabular}
\end{table}


We can adjust the number of significant digits (Table \@ref(tab:twomodelstwo)).


```r
modelsummary(list(first_model, second_model, third_model),
             fmt = 1,
             title = "Two models of GDP as a function of inflation")
```

\begin{table}

\caption{(\#tab:twomodelstwo)Two models of GDP as a function of inflation}
\centering
\begin{tabular}[t]{lccc}
\toprule
  & Model 1 & Model 2 & Model 3\\
\midrule
(Intercept) & \num{4.2} & \num{3.7} & \num{3.7}\\
 & (\num{0.4}) & (\num{0.5}) & (\num{0.5})\\
inflation & \num{0.0} & \num{-0.1} & \num{-0.1}\\
 & (\num{0.0}) & (\num{0.0}) & (\num{0.0})\\
countryEthiopia &  & \num{2.9} & \num{2.7}\\
 &  & (\num{0.8}) & (\num{0.8})\\
countryIndia &  & \num{1.9} & \num{-0.6}\\
 &  & (\num{0.7}) & (\num{1.5})\\
countryUnited States &  & \num{-0.5} & \num{-1.2}\\
 &  & (\num{0.6}) & (\num{0.7})\\
population &  &  & \num{0.0}\\
 &  &  & (\num{0.0})\\
\midrule
Num.Obs. & \num{218} & \num{218} & \num{218}\\
R2 & \num{0.000} & \num{0.110} & \num{0.123}\\
R2 Adj. & \num{-0.005} & \num{0.093} & \num{0.102}\\
AIC & \num{1195.1} & \num{1175.7} & \num{1174.5}\\
BIC & \num{1205.3} & \num{1196.0} & \num{1198.2}\\
Log.Lik. & \num{-594.554} & \num{-581.844} & \num{-580.266}\\
F & \num{0.002} & \num{6.587} & \num{5.939}\\
\bottomrule
\end{tabular}
\end{table}









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

And while there are some small complications, for the most part it is as straight-forward as that. The first step is to get some data. There is some geographic data built into `ggplot2`, and there is additional information in `maps`. 


```r
library(maps)

canada <- map_data(database = "world", regions = "canada")
canadian_cities <- maps::canada.cities

head(canada)
#>        long      lat group order region    subregion
#> 1 -59.78760 43.93960     1     1 Canada Sable Island
#> 2 -59.92227 43.90391     1     2 Canada Sable Island
#> 3 -60.03775 43.90664     1     3 Canada Sable Island
#> 4 -60.11426 43.93911     1     4 Canada Sable Island
#> 5 -60.11748 43.95337     1     5 Canada Sable Island
#> 6 -59.93604 43.93960     1     6 Canada Sable Island

head(canadian_cities)
#>            name country.etc    pop   lat    long capital
#> 1 Abbotsford BC          BC 157795 49.06 -122.30       0
#> 2      Acton ON          ON   8308 43.63  -80.03       0
#> 3 Acton Vale QC          QC   5153 45.63  -72.57       0
#> 4    Airdrie AB          AB  25863 51.30 -114.02       0
#> 5    Aklavik NT          NT    643 68.22 -135.00       0
#> 6    Albanel QC          QC   1090 48.87  -72.42       0
```

With that information in hand we can then create a map of Canada that shows the cities with a population over 1,000. (The `geom_polygon()` function within `ggplot2` draws shapes, by connecting points within groups. And the `coord_map()` function adjusts for the fact that we are making something that is 2D map to represent something that is 3D.)


```r
ggplot() +
  geom_polygon(data = canada,
               aes(x = long,
                   y = lat,
                   group = group),
               fill = "white", 
               colour = "grey") +
  coord_map(ylim = c(40, 70)) +
  geom_point(aes(x = canadian_cities$long, 
                 y = canadian_cities$lat),
             alpha = 0.3,
             color = "black") +
  theme_classic() +
  labs(x = "Longitude",
       y = "Latitude")
```

![](11-static_communication_files/figure-latex/unnamed-chunk-23-1.pdf)<!-- --> 


As is often the case with R, there are many different ways to get started creating static maps. We have already seen how they can be built using only `ggplot2`, but `ggmap` brings additional functionality [@KahleWickham2013].

There are two essential components to a map: 

1) some border or background image (also known as a tile); and 
2) something of interest within that border or on top of that tile. 

In `ggmap`, we use an open-source option for our tile, Stamen Maps: maps.stamen.com. And we use plot points based on latitude and longitude.


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

![](11-static_communication_files/figure-latex/unnamed-chunk-25-1.pdf)<!-- --> 

Once we have a map then we can use `ggmap()` to plot it. (That circle in the middle of the map is where the Australian Parliament House is. Yes, the Australian parliament is surrounded by circular roads, which Australians call 'roundabouts', actually Australians thought this was such a great idea, that we surrounded it by two of them.)

Now we want to get some data that we plot on top of our tiles. We will just plot the location of the polling places, based on which 'division' (the Australian equivalent to 'ridings' in Canada) it is. This is available here: https://results.aec.gov.au/20499/Website/Downloads/HouseTppByPollingPlaceDownload-20499.csv. The Australian Electoral Commission (AEC) is the official government agency that is responsible for elections in Australia.


```r
# Read in the booths data for each year
booths <-
  readr::read_csv(
    "https://results.aec.gov.au/24310/Website/Downloads/GeneralPollingPlacesDownload-24310.csv",
    skip = 1,
    guess_max = 10000
  )

head(booths)
#> # A tibble: 6 x 15
#>   State DivisionID DivisionNm PollingPlaceID
#>   <chr>      <dbl> <chr>               <dbl>
#> 1 ACT          318 Bean                93925
#> 2 ACT          318 Bean                93927
#> 3 ACT          318 Bean                11877
#> 4 ACT          318 Bean                11452
#> 5 ACT          318 Bean                 8761
#> 6 ACT          318 Bean                 8763
#> # ... with 11 more variables: PollingPlaceTypeID <dbl>,
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

![](11-static_communication_files/figure-latex/unnamed-chunk-28-1.pdf)<!-- --> 

We may like to save the map so that we do not have to draw it every time, and we can do that in the same way as any other graph, using `ggsave()`.


```r
ggsave("map.pdf", width = 20, height = 10, units = "cm")
```

Finally, the reason that we used Stamen Maps and OpenStreetMap is because it is open source, but you can also use Google Maps. This requires you to first register a credit card with Google, and specify a key, but with low usage should be free. Using Google Maps, `get_googlemap()`, brings some advantages over `get_stamenmap()`, for instance it will attempt to find a placename, rather than needing to specify a bounding box.



### Toronto bike parking

Let us see another example of a static map, this time using Toronto data accessed using `opendatatoronto` [@citeSharla]. The dataset that we are going to plot is available here: https://open.toronto.ca/dataset/street-furniture-bicycle-parking/.



```r
# Based on: https://open.toronto.ca/dataset/street-furniture-bicycle-parking/.
library(opendatatoronto)
# (The string identifies the package.)
resources <- list_package_resources("71e6c206-96e1-48f1-8f6f-0e804687e3be")
# In this case there is only one dataset within this resource so just need the first one	
bike_parking_locations <- filter(resources, row_number()==1) |> get_resource()
```




```r
head(bike_parking_locations)
#> # A tibble: 6 x 20
#>     `_id` OBJECTID ID       ADDRESSNUMBERTEXT ADDRESSSTREET 
#>     <dbl>    <dbl> <chr>    <chr>             <chr>         
#> 1 3613143        4 BP-11699 70                The Pond Rd   
#> 2 3613144        9 BP-11900 8                 Assiniboine Rd
#> 3 3613145       56 BP-11338 1495              Queen St W    
#> 4 3613146       65 BP-03501 8                 Kensington Ave
#> 5 3613147      100 BP-03280 87                Avenue Rd     
#> 6 3613148      109 BP-12883 21                Canniff St    
#> # ... with 15 more variables: FRONTINGSTREET <chr>,
#> #   SIDE <chr>, FROMSTREET <chr>, DIRECTION <chr>,
#> #   SITEID <lgl>, WARD <chr>, BIA <chr>, ASSETTYPE <chr>,
#> #   STATUS <chr>, SDE_STATE_ID <dbl>, X <dbl>, Y <dbl>,
#> #   LONGITUDE <dbl>, LATITUDE <dbl>, geometry <chr>
```

First, we need to clean the data are little. There are some clear errors in the ADDRESSNUMBERTEXT field, but not too many, so we just ignore it and focus on the data that we are interested in.


```r
bike_data <- tibble(
  ward = bike_parking_locations$WARD,
  id = bike_parking_locations$ID,
  status = bike_parking_locations$STATUS,
  street_address = paste(
    bike_parking_locations$ADDRESSNUMBERTEXT,
    bike_parking_locations$ADDRESSSTREET
  ),
  latitude = bike_parking_locations$LATITUDE,
  longitude = bike_parking_locations$LONGITUDE
)
rm(bike_parking_locations)
```

Some of the bike racks were temporary so remove them and also let us just look at the area around the University of Toronto, which is Ward 11


```r
# Only keep ones that still exist
bike_data <- 
  bike_data |>
  filter(status == "Existing") |> 
  select(-status)

bike_data <- bike_data |> 
  filter(ward == 11) |> 
  select(-ward)
```

If you look at the dataset at this point, then you will notice that there is a row for every bike parking spot. But we do not really need to know that, because sometimes there are lots right next to each other. Instead, we'd just like the one point. So, we want to create a count by address, and then just get one instance per address.


```r
bike_data <- 
  bike_data |>
  group_by(street_address) |> 
  mutate(number_of_spots = n(),
         running_total = row_number()
         ) |> 
  ungroup() |> 
  filter(running_total == 1) |> 
  select(-id, -running_total)

head(bike_data)
#> # A tibble: 6 x 4
#>   street_address   latitude longitude number_of_spots
#>   <chr>               <dbl>     <dbl>           <int>
#> 1 8 Kensington Ave     43.7     -79.4               1
#> 2 87 Avenue Rd         43.7     -79.4               4
#> 3 162 Mc Caul St       43.7     -79.4               1
#> 4 147 Baldwin St       43.7     -79.4               2
#> 5 888 Yonge St         43.7     -79.4               1
#> 6 180 Elizabeth St     43.7     -79.4              10
```



Now we can grab our tile and add our bike rack data onto it.


```r
bbox <-
  c(
    left = -79.420390,
    bottom = 43.642658,
    right = -79.383354,
    top = 43.672557
  )

toronto_stamen_map <-
  get_stamenmap(bbox, zoom = 14, maptype = "toner-lite")

ggmap(toronto_stamen_map,  maprange = FALSE) +
  geom_point(data = bike_data,
             aes(x = longitude,
                 y = latitude),
             alpha = 0.3) +
  labs(x = "Longitude",
       y = "Latitude") +
  theme_minimal() 
```

![](11-static_communication_files/figure-latex/unnamed-chunk-37-1.pdf)<!-- --> 




### Geocoding

To this point we assumed that we already had geocoded data. But the places 'Canberra, Australia', or 'Ottawa, Canada', are just names, they do not actually inherently have a location. In order to plot them we need to get a latitude and longitude for them. The process of going from names to coordinates is called geocoding. 

There are a range of options to geocode data in R, but `tidygeocoder` is especially useful [@citetidygeocoder]. To get started using the package we need a dataframe of locations. 


```r
some_locations <- 
  tibble(city = c('Canberra', 'Ottawa'),
         country = c('Australia', 'Canada'))
```


```r
tidygeocoder::geo(city = some_locations$city, 
                  country = some_locations$country, 
                  method = 'osm')
#> Passing 2 addresses to the Nominatim single address geocoder
#> Query completed in: 2 seconds
#> # A tibble: 2 x 4
#>   city     country     lat  long
#>   <chr>    <chr>     <dbl> <dbl>
#> 1 Canberra Australia -35.3 149. 
#> 2 Ottawa   Canada     45.4 -75.7
```




## Exercises and tutorial

### Exercises


1. I have a dataset that contains measurements of height (in cm) for a sample of 300 penguins, who are either the Adeline or Emperor species. I am interested in visualizing the distribution of heights by species in a graphical way. Please discuss whether a pie chart is an appropriate type of graph to use. What about a box and whisker plot? Finally, what are some considerations if you made a histogram? [Please write a paragraph or two for each aspect.]
2. Assume the dataset and columns exist. Would this code work? `data |> ggplot(aes(x = col_one)) |> geom_point()` (pick one)?
    a. Yes
    b. No
3. If I have categorical data, which geom should I use to plot it (pick one)?
    a. `geom_bar()`
    b. `geom_point()`
    c. `geom_abline()`
    d. `geom_boxplot()`
4. Why are boxplots often inappropriate (pick one)?
    a. They hide the full distribution of the data.
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

Using R Markdown, please create a graph using `ggplot2` and a map using `ggmap` and add explanatory text to accompany both. This should take one or two pages for each of them.

For the graph, please reflect on @vanderplas2020testing and add a few paragraphs about the different options that you considered that the graph more effective. 

For the map, please reflect on the following quote from Heather Krause: 'maps only show people who aren't invisible to the makers' as well as Chapter 3 from @datafeminism2020 and add a few paragraphs related to this.
