






# Drinking from a fire hose

**Required material**

- Read *Data science as an atomic habit*, [@citeBarrett]
- Read *This is how AI bias really happens---and why it's so hard to fix*, [@hao2019]


**Key libraries**

- `ggplot2` [@citeggplot]
- `tidyverse` [@Wickham2017]


**Key concepts/skills/etc**

- R is fun and allows you to tell interesting stories.
- But like any language it is a slow path to mastery.
- The way to learn is to start with a small project, and break down the steps required to achieve it. Look at other people's code to work out how you might deal with the steps. Copy, paste, and modify their code to achieve each step. Don't worry about perfection, just worry about achieving each step. Complete that project and move onto the next project. Rinse and repeat. Each project you'll get a little better. 



**Key functions**

- `%>%` 'pipe'
- `dplyr::arrange()`
- `dplyr::filter()`
- `dplyr::group_by()`
- `dplyr::mutate()`
- `dplyr::select()`
- `dplyr::summarise()`
- `dplyr::ungroup()`
- `ggplot::facet_wrap()`
- `ggplot::geom_histogram()`

       
    

## Hello world

To jump in we will get some data from the wild, make a graph with it, and then use this to tell a story. Some of the code may be a bit unfamiliar to you if it's your first-time using R. It'll all soon be familiar. But the only way to learn how to code is to code. Please try to get this working on your own computer, typing out (not copy/pasting) all the code that you need. It's important and normal to realise that you're going to be bad at this for a while.

> Whenever you’re learning a new tool, for a long time, you're going to suck... But the good news is that is typical; that's something that happens to everyone, and it's only temporary.
>
> Hadley Wickham as quoted by @citeBarrett.

One of the great things about graphs is that sometimes this is all you need to have a convincing story, as Figure \@ref(fig:covid) from @ftcoronavirus show.

<div class="figure">
<img src="/Users/rohanalexander/Documents/bs4_version/figures/covid.png" alt="New confirmed cases of Covid-19 in United States, United Kingdom, Canada and Australia, as at 22 December 2020." width="90%" />
<p class="caption">(\#fig:covid)New confirmed cases of Covid-19 in United States, United Kingdom, Canada and Australia, as at 22 December 2020.</p>
</div>

In this section we are going to focus on making a table and a graph from our data. Although you will be guided thoroughly to achieve this, hopefully by seeing the power of quantitative analysis with R you will be motivated to stick with it when you run into difficulties later on.


## Case study - Canadian elections


<div class="figure">
<img src="/Users/rohanalexander/Documents/bs4_version/figures/county_election.jpg" alt="The County Election (1851–52), by George Caleb Bingham (American, 1811 - 1879), as downloaded from https://artvee.com/dl/the-county-election." width="90%" />
<p class="caption">(\#fig:canadianelections)The County Election (1851–52), by George Caleb Bingham (American, 1811 - 1879), as downloaded from https://artvee.com/dl/the-county-election.</p>
</div>


### Getting started

To get started you should open a new R Markdown file (File -> New File -> R Markdown). As this is our first attempt at using R in the wild, we will just have everything in the one R Markdown document. (In later projects we will move to a more robust set-up.) Then you should create a new R code chunk (keyboard shortcut: Command + Option + I) and add some preamble documentation. I like to specify the purpose of the document, who the author is and their contact details, when the file was written or last updated, and pre-requisites that the file relies on. You may also like to include a license, and list outstanding issues or todos. Remember that in R, lines that start with '#' are comments - they won't run.


```r
#### Preamble ####
# Purpose: Read in voting data from the 2019 Canadian Election and output a 
# dataset that can be used for analysis.
# Author: Rohan Alexander
# Email: rohan.alexander@utoronto.ca
# Date: 9 January 2019
# Prerequisites: Need the text file from the Canadian elections website
# Issues: 
# To do:
```

After this I typically set-up my workspace. This usually involves installing and/or reading in any packages, and possibly updating them. Remember that you only need to install a package once for each computer. But you need to call it every time you want to use it. (Here I've added excessive comments so that you know what is going on and why - in general I wouldn't explain what tidyverse is.)


```r
#### Workspace set-up ####
install.packages("tidyverse") # Only need to do this once
install.packages("janitor") # Only need to do this once
install.packages("here") 
```

In this case we are going to use `tidyverse` @Wickham2017, `janitor` @janitor, and `here` @here.


```r
#### Workspace set-up ####
# tidyverse is a collection of packages
# Try ?tidyverse to see more
library(tidyverse) # Calls the tidyverse - need to do this each time.
library(janitor) # janitor helps us clean datasets
library(here) # here helps us to know where files are
# update.packages() # You can uncomment this if you want to update your packages. 
```


### Get the data

We read in the dataset from the Elections Canada website. We can actually pass a website to the `read_tsv()` function, which saves a lot of time.


```r
#### Read in the data ####
# Read in the data using read_tsv from the readr package (part of the tidyverse)
# The '<-' is assigning the output of readr::read_tsv to a object called raw_data. 
raw_elections_data <- readr::read_tsv(file = "http://enr.elections.ca/DownloadResults.aspx",
                            skip = 1) 
# There is some debris on the first line so we skip them.
# We have read the data from the Elections Canada website. We may like to save 
# it just in case something happens and they move it. 
write_csv(raw_elections_data, here("inputs/data/canadian_voting.csv"))
```

(Note that Elections Canada updates this link with the latest elections. When I run this on 31 December 2020, I get the results of a Toronto by-election. While I'll certainly update these notes from time to time, it may be that there's been an election between now and when you run these notes, so your specific results may be slightly different.)

### Clean the data 

Now we'd like to clean the data so that we can use it.


```r
#### Basic cleaning ####
raw_elections_data <- read_csv(here("inputs/data/canadian_voting.csv"))
#> Rows: 33 Columns: 14
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> chr (9): Electoral district number - Numéro de la circon...
#> dbl (4): Votes obtained - Votes obtenus, % Votes obtaine...
#> lgl (1): Middle name(s) - Autre(s) prénom(s)
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
# If you called the library (as we did) then you don't need to use this set-up 
# of janitor::clean_names, you could just use clean_names, but I'm making it 
# explicit here, but won't in the future.
cleaned_elections_data <- janitor::clean_names(raw_elections_data)
# One thing to notice for those who have a Stata background is that we just 
# overwrote the name - that's fine in R.

# The pipe operator - %>% - pushes the output from one line to be an input to the 
# next line.
cleaned_elections_data <- 
  cleaned_elections_data %>% 
  # Filter to only have certain rows
  filter(type_of_results == "validated") %>% 
  # Select only certain columns
  select(electoral_district_number_numero_de_la_circonscription,
         electoral_district_name,
         political_affiliation,
         surname_nom_de_famille,
         percent_votes_obtained_votes_obtenus_percent
         ) %>% 
  # Rename the columns to be a bit shorter
  rename(riding_number = electoral_district_number_numero_de_la_circonscription,
         riding = electoral_district_name,
         party = political_affiliation,
         surname = surname_nom_de_famille,
         votes = percent_votes_obtained_votes_obtenus_percent)

head(cleaned_elections_data)
#> # A tibble: 6 × 5
#>   riding_number riding         party          surname  votes
#>   <chr>         <chr>          <chr>          <chr>    <dbl>
#> 1 35108         Toronto Centre People's Part… Bawa       1.1
#> 2 35108         Toronto Centre Free Party Ca… Cappell…   0.3
#> 3 35108         Toronto Centre NDP-New Democ… Chang     17  
#> 4 35108         Toronto Centre Independent    Clarke     0.5
#> 5 35108         Toronto Centre Liberal        Ien       42  
#> 6 35108         Toronto Centre Libertarian    Komar      0.5
```

Finally we may like to save our cleaned dataset.


```r
#### Save ####
readr::write_csv(cleaned_elections_data, "outputs/data/cleaned_elections_data.csv")
```


### Make a graph

First we need to read in the dataset, we then filter the number of parties to a smaller number.


```r
#### Read in the data ####
cleaned_elections_data <- 
  readr::read_csv("outputs/data/cleaned_elections_data.csv")
#> Rows: 15 Columns: 5
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> chr (3): riding, party, surname
#> dbl (2): riding_number, votes
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

# Make a graph just considers Toronto riding
cleaned_elections_data %>% 
  filter(party %in% c("Bloc Québécois", 
                      "Conservative", 
                      "Liberal",
                      "NDP-New Democratic Party")
  ) %>% 
  ggplot(aes(x = riding, y = votes, color = party)) +
  geom_point() +
  theme_minimal() + # Make the theme neater
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + # Change the angle
  labs(x = "Riding",
       y = "Votes (%)",
       color = "Party")
```

<img src="02-drinking_from_a_fire_hose_files/figure-html/unnamed-chunk-8-1.png" width="672" />

```r

# Save the graph
ggsave("outputs/figures/toronto_results.pdf", width = 40, height = 20, units = "cm")
```


### Make a table

There are an awful lot of ways to make a table in R. First we'll try the built-in function `summary()`.


```r
#### Read in the data ####
cleaned_elections_data <- 
  readr::read_csv("outputs/data/cleaned_elections_data.csv")
#> Rows: 15 Columns: 5
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> chr (3): riding, party, surname
#> dbl (2): riding_number, votes
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

#### Make some tables ####
# Try some different default summary table
summary(cleaned_elections_data)
#>  riding_number      riding             party          
#>  Min.   :35108   Length:15          Length:15         
#>  1st Qu.:35108   Class :character   Class :character  
#>  Median :35108   Mode  :character   Mode  :character  
#>  Mean   :35112                                        
#>  3rd Qu.:35118                                        
#>  Max.   :35118                                        
#>    surname              votes      
#>  Length:15          Min.   : 0.20  
#>  Class :character   1st Qu.: 0.55  
#>  Mode  :character   Median : 3.60  
#>                     Mean   :13.34  
#>                     3rd Qu.:24.85  
#>                     Max.   :45.70
```

Now we can try a `group_by()` and `summarise()`.


```r
# Make our own
cleaned_elections_data %>% 
  # Using group_by and summarise means that whatever summary statistics we 
  # construct will be on a party basis. We could group_by multiple variables and
  # similarly, we could create a bunch of different other summary statistics.
  group_by(party) %>% 
  summarise(min = min(votes),
            mean = mean(votes),
            max = max(votes))
#> # A tibble: 9 × 4
#>   party                      min  mean   max
#>   <chr>                    <dbl> <dbl> <dbl>
#> 1 Conservative               5.7 23.8   41.8
#> 2 Free Party Canada          0.3  0.3    0.3
#> 3 Green Party                2.6 17.7   32.7
#> 4 Independent                0.5  0.55   0.6
#> 5 Liberal                   42   43.8   45.7
#> 6 Libertarian                0.5  0.5    0.5
#> 7 NDP-New Democratic Party   5.8 11.4   17  
#> 8 No Affiliation             0.2  0.2    0.2
#> 9 People's Party - PPC       1.1  2.35   3.6
```



## Case study - Toronto homelessness

Toronto has a large homeless population, and of course given the pandemic and winter it is critical that there are enough places in shelters. Unfortunately, as we will see in this case study, there are not enough places. However, the one good thing is that we have the data to see this is a problem. 

In this case study we are going to use data on the number of people in Toronto shelters to make a graph of usage. This will also introduce us to Tidy Tuesday! In my experience, people are most successful at 'learning R' when they are learning it to achieve something else. If you're in a university course then that might be 'pass the course', but often it's nice to have some other projects. TidyTuesday is a weekly event in which the R community comes together around a dataset and shares code and approaches. You can learn more about it here: https://github.com/rfordatascience/tidytuesday. 

### Getting started

Again, open a new R Markdown file: (File -> New File -> R Markdown). Update the details so that they reflect your own.

Again, add some top matter with some comments and explanations of the code.



```r
#### Preamble ####
# Purpose: Read in Toronto homelessness data and output a graph.
# Author: Rohan Alexander
# Email: rohan.alexander@utoronto.ca
# Date: 22 December 2020
# Prerequisites: 
# Issues: 
# To do:
```



I want to talk a little about the libraries this time. Libraries are bits of code that other people have written. There are a few common ones that you'll see regularly, especially the `tidyverse`. To use a package we first have to install it and then we need to load it. Jenny Bryan has a wonderful analogy of installing a lightbulb - `install.packages("tidyverse")`. You only need to do this once, but then if you want light then you need to turn on the switch - `library(tidyverse)`. So because we installed everything earlier we won't need to do it again, we can just call the library.


```r
#### Workspace set-up ####
library(tidyverse)
```

Given that a lot of people gave up their time to make `R` and the packages, it's important to cite them. Luckily, it's easy to get the information that you need to properly cite them.


```r
# To get the citation for R run:
citation()
#> 
#> To cite R in publications use:
#> 
#>   R Core Team (2020). R: A language and environment
#>   for statistical computing. R Foundation for
#>   Statistical Computing, Vienna, Austria. URL
#>   https://www.R-project.org/.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {R: A Language and Environment for Statistical Computing},
#>     author = {{R Core Team}},
#>     organization = {R Foundation for Statistical Computing},
#>     address = {Vienna, Austria},
#>     year = {2020},
#>     url = {https://www.R-project.org/},
#>   }
#> 
#> We have invested a lot of time and effort in creating
#> R, please cite it when using it for data analysis.
#> See also 'citation("pkgname")' for citing R packages.
# And to get the citation for a package run that function with the package name. For instance:
citation('tidyverse')
#> 
#>   Wickham et al., (2019). Welcome to the tidyverse.
#>   Journal of Open Source Software, 4(43), 1686,
#>   https://doi.org/10.21105/joss.01686
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Article{,
#>     title = {Welcome to the {tidyverse}},
#>     author = {Hadley Wickham and Mara Averick and Jennifer Bryan and Winston Chang and Lucy D'Agostino McGowan and Romain François and Garrett Grolemund and Alex Hayes and Lionel Henry and Jim Hester and Max Kuhn and Thomas Lin Pedersen and Evan Miller and Stephan Milton Bache and Kirill Müller and Jeroen Ooms and David Robinson and Dana Paige Seidel and Vitalie Spinu and Kohske Takahashi and Davis Vaughan and Claus Wilke and Kara Woo and Hiroaki Yutani},
#>     year = {2019},
#>     journal = {Journal of Open Source Software},
#>     volume = {4},
#>     number = {43},
#>     pages = {1686},
#>     doi = {10.21105/joss.01686},
#>   }
# Again, don't worry too much about the details - we'll get into them later.
```

### Get the data

We are going to grab some data that has been made available about Toronto homeless shelters. Again, don't worry too much about the details for now, but what we are saying here, is that there's a CSV that has been made available to us on GitHub and this code downloads it to our own computer. After we download it we can quickly look at the data using `head()`.


```r
toronto_shelters <- 
  readr::read_csv(
    'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-12-01/shelters.csv'
    )
#> Rows: 115916 Columns: 13
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> chr  (9): organization_name, shelter_name, shelter_addre...
#> dbl  (3): id, occupancy, capacity
#> dttm (1): occupancy_date
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

head(toronto_shelters)
#> # A tibble: 6 × 13
#>      id occupancy_date      organization_name  shelter_name 
#>   <dbl> <dttm>              <chr>              <chr>        
#> 1     1 2017-01-01 00:00:00 COSTI Immigrant S… COSTI Recept…
#> 2     2 2017-01-01 00:00:00 Christie Ossingto… Christie Oss…
#> 3     3 2017-01-01 00:00:00 Christie Ossingto… Christie Oss…
#> 4     4 2017-01-01 00:00:00 Christie Refugee … Christie Ref…
#> 5     5 2017-01-01 00:00:00 City of Toronto    Birchmount R…
#> 6     6 2017-01-01 00:00:00 City of Toronto    Birkdale Res…
#> # … with 9 more variables: shelter_address <chr>,
#> #   shelter_city <chr>, shelter_province <chr>,
#> #   shelter_postal_code <chr>, facility_name <chr>,
#> #   program_name <chr>, sector <chr>, occupancy <dbl>,
#> #   capacity <dbl>
```


### Make a graph

The dataset is on a daily basis for each shelter. What I'd like to do is to get an overall picture of the availability of shelter places in Toronto. This code is based on code by [Florence Vallée-Dubois](https://florencevdubois.github.io)^[https://github.com/florencevdubois/MyTidyTuesdays/blob/master/2020.12.01.R] and [Lisa Lendway](https://lisalendway.netlify.app)^[https://github.com/llendway/tidy_tuesday_in_thirty/blob/main/2020_12_01_tidy_tuesday.Rmd]. 

Now, I'd like to first do some data manipulation before we graph it this time. I'm going to introduce a few new functions here that we'll see a lot more soon. Again, don't worry if this doesn't all make sense right now. You're learning a brand-new language! Just try to focus on picking up a word or two and staying motivated!

Finally, because it's Christmas, we can grab a [seasonally-appropriate theme](https://github.com/elb0/decemberLB) from my colleague [Liza Bolton](https://twitter.com/liza_bolton). 


```r
# In contrast to the earlier packages, which were located in a central repository 
# of packages called CRAN, Liza's is available on her GitHub. Again, don't worry 
# about the details for now, it'll all be clarified later.
devtools::install_github("elb0/decemberLB", ref = "main")
#> Using github PAT from envvar GITHUB_PAT
#> Skipping install of 'decemberLB' from a github remote, the SHA1 (2cc38a25) has not changed since last install.
#>   Use `force = TRUE` to force installation

# Once it's installed we call the library as usual.
library(decemberLB)

toronto_shelters %>% 
  tidyr::drop_na(occupancy, capacity) %>% # We only want rows that have data
  group_by(occupancy_date, sector) %>% # We want to know the occupancy by date and sector
  summarise(the_sum = sum(occupancy),
            the_capacity = sum(capacity),
            the_usage = the_sum / the_capacity, .groups = 'drop') %>% 
  ggplot(aes(x = occupancy_date, y = the_usage, color = sector)) + 
  geom_smooth(aes(group = sector), se = FALSE) +
  scale_y_continuous(limits = c(0, NA)) +
  labs(color = "Type",
       x = "Date",
       y = "Occupancy rate",
       title = "Toronto shelters",
       subtitle = "Occupancy per day") +
  theme_minimal() +
  scale_color_december(palette = "xmas")
#> `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'
```

<img src="02-drinking_from_a_fire_hose_files/figure-html/unnamed-chunk-15-1.png" width="672" />








## Exercises and tutorial

### Exercises

### Tutorial



