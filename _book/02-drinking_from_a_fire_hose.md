


# Drinking from a fire hose

**STATUS: Comments welcome.**

**Required material**

- Read *Data science as an atomic habit*, [@citeBarrett]
- Read *This is how AI bias really happens*, [@hao2019]
- Read *The mundanity of excellence: An ethnographic report on stratification and Olympic swimmers*, [@chambliss1989mundanity]

**Key concepts and skills**

- The statistical programming language R enables us to tell interesting stories using data.
- It is a language like any other, and there is a slow path to mastery.
- The way to learn is to start with a small project and break down what is required to achieve it into tiny steps. Then look at other people's code to work out how you might deal with the steps. Copy, paste, and modify their code to achieve each step. Don't worry about perfection, just worry about achieving each step. Complete that project and move onto the next project. Rinse and repeat. Each project you'll get a little better. 
- The key is to just start.

**Key libraries**

- `ggplot2` [@citeggplot]
- `janitor` [@janitor]
- `opendatatoronto` [@citeSharla]
- `tidyr` [@citetidyr]
- `tidyverse` [@Wickham2017]


**Key functions**

- `<-` 'assign'
- `%>%` 'pipe'
- `+` 'add'
- `c()`
- `citation()`
- `class()`
- `dplyr::arrange()`
- `dplyr::filter()`
- `dplyr::mutate()`
- `dplyr::recode()`
- `dplyr::rename()`
- `dplyr::select()`
- `dplyr::summarise()`
- `ggplot2::geom_histogram()`
- `ggplot2::geom_point()`
- `ggplot2::ggplot()`
- `head()`
- `janitor::clean_names()`
- `library()`
- `names()`
- `readr::read_csv()`
- `readr::write_csv()`
- `rep()`
- `sample()`
- `set.seed()`
- `stats::rpois()`
- `stats::runif()`
- `stringr::str_remove()`
- `sum()`
- `tail()`
- `tidyr::separate()`


## Hello, World!

The way to start, is to start. In this chapter we go through three complete examples of the workflow advocated in this book. This means we will: plan, simulate, acquire, explore, and share. If you are new to R, then some of the code may be a bit unfamiliar to you. If you are new to statistical modelling, then some of the concepts may be unfamiliar. Do not worry. It will all soon be familiar. 

The only way to learn how to tell stories, is to start telling stories yourself. This means that you should try to get these examples working. Do the sketches yourself, type everything out yourself (using R Studio Cloud if you are new to R and do not have it installed on your own computer), and execute it all. It is important, and normal, to realise that you are going to be bad at it for a while.

> Whenever you're learning a new tool, for a long time, you're going to suck... But the good news is that is typical; that's something that happens to everyone, and it's only temporary.
>
> Hadley Wickham as quoted by @citeBarrett.

Although you will be guided thoroughly to achieve this, hopefully by seeing the power of telling stories with data here, you will feel empowered to stick with it when you run into difficulties later.

To get started, go to https://rstudio.cloud/ and create an account. As we are just getting started the free version will be fine for now. Once you have an account and log in, then it should look something like Figure \@ref(fig:second).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/01-03_r_essentials/02.png" alt="Opening R Studio Cloud for the first time" width="100%" />
<p class="caption">(\#fig:second)Opening R Studio Cloud for the first time</p>
</div>

(You'll be in 'Your Workspace', and you won't have an 'Example Workspace'.) From here you should start a 'New Project'. You can give the project a name by clicking on 'Untitled Project' and replacing it. 


## Canadian elections

Canada is a parliamentary democracy with 338 seats in the House of Commons, which is the lower house, and that from which government is formed. There are two major parties---'Liberal' and 'Conservative'---three minor parties---'Bloc Québécois', 'New Democratic', and 'Green'---as well as many smaller parties. In this example we will create a graph of the number of seats that each party won in the 2019 Federal Election.

### Plan

For this example, we need to plan two aspects. The first is what the dataset that we need will look like, and the second is what the final graph will look like.

The basic requirement for the dataset is that it has the name of the seat (typically called a 'riding' in Canada) and the party of the person that represents it. So, a quick sketch of the dataset that we would need could look something like Figure \@ref(fig:canadaexampledata). 

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/IMG_1815.png" alt="Quick sketch of a dataset that could be useful for analysing Canadian elections" width="50%" />
<p class="caption">(\#fig:canadaexampledata)Quick sketch of a dataset that could be useful for analysing Canadian elections</p>
</div>

We will also need to make the graph that we are interested in. Given we want to display the number of seats that each party won, a quick sketch of what we are probably aiming for is something like Figure \@ref(fig:canadaexampletable). 

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/IMG_1814.png" alt="Quick sketch of a graph of the number of ridings won by each party" width="90%" />
<p class="caption">(\#fig:canadaexampletable)Quick sketch of a graph of the number of ridings won by each party</p>
</div>


### Simulate

We will now simulate some data, to bring some specificity to our sketches.

To get started, within R Studio Cloud, make a new R Markdown file (File -> New File -> R Markdown). For this first example, we will just put everything into this one R Markdown document. 

In that R Markdown document create a new R code chunk (Code -> Insert Chunk) and add preamble documentation that explains:

- the purpose of the document;
- the author and their contact details;
- when the file was written or last updated; and
- pre-requisites that the file relies on. 

In R, lines that start with '#' are comments, which means that they will not be run as code, and instead are designed to be read by humans. Each line of this preamble should start with a '#'. Also make it clear that this is the preamble section by surrounding that with '####'.

An example follows.


```r
#### Preamble ####
# Purpose: Read in data from the 2019 Canadian Election and make a graph
# of the number of ridings each party won.
# Author: Rohan Alexander
# Email: rohan.alexander@utoronto.ca
# Date: 1 January 2022
# Prerequisites: Need to know where to get Canadian elections data from.
```

After this, set up the workspace. This involves installing and/or loading any packages that are needed, and possibly updating them. A package only needs to be installed once for each computer, but needs to be loaded each time it is to be used. In this case we are going to use `tidyverse` [@Wickham2017], `janitor` [@janitor], and `tidyr` [@citetidyr]. They will need to be installed because this is the first time they are being used, and then each will need to be loaded.

An example of installing the packages follows (excessive comments have been added to be clear about what is going on; in general, this level of commenting is unnecessary). You run this code by clicking the small green arrow associated with that R code chunk.


```r
#### Workspace set-up ####
install.packages("tidyverse") # Only need to do this once per computer
install.packages("janitor") # Only need to do this once per computer
install.packages("tidyr") # Only need to do this once per computer
```

Now that the packages are installed, they need to be loaded. As that installation step only needs to be done once per computer, that code can be commented out so that it is not accidentally run. So, the example would become as follows.


```r
#### Workspace set-up ####
# install.packages("tidyverse") # Only need to do this once per computer
# install.packages("janitor") # Only need to do this once per computer
# install.packages("tidyr") # Only need to do this once per computer

library(tidyverse) # A collection of data-related packages
library(janitor) # Helps clean datasets
library(tidyr) # Helps make tidy datasets
```

All packages contain a help file that provides information about them and their functions. It can be accessed by appending a question mark before the package name and then running that code. For instance `?tidyverse`.

To simulate our data, we need to create a dataset with two columns: 'Riding' and 'Party', and some values for each. In the case of 'Riding' reasonable values would be a name of one of the 338 Canadian ridings. In the case of 'Party' reasonable values would be one of the following six: 'Liberal', 'Conservative', 'Bloc Québécois', 'New Democratic', 'Green', 'Other'.

An example of a simulated dataset follows.


```r
simulated_data <-
  tibble(
    # We use the number 1 through to 338 to represent each riding
    'Riding' = 1:338,
    # We randomly choose one of six options, with replacement, 338 times
    'Party' = sample(
      x = c(
        'Liberal',
        'Conservative',
        'Bloc Québécois',
        'New Democratic',
        'Green',
        'Other'
        ),
      size = 338,
      replace = TRUE
      )
    )

simulated_data
#> # A tibble: 338 × 2
#>    Riding Party         
#>     <int> <chr>         
#>  1      1 Other         
#>  2      2 Conservative  
#>  3      3 Green         
#>  4      4 Other         
#>  5      5 Bloc Québécois
#>  6      6 New Democratic
#>  7      7 Green         
#>  8      8 Liberal       
#>  9      9 Green         
#> 10     10 New Democratic
#> # … with 328 more rows
```


### Acquire

Now we want to get the actual data. We will read in a dataset from Elections Canada, which is the non-partisan agency that organizes Canadian federal elections. We can pass a website to the `read_csv()` function from the `readr` package [@citereadr], which saves a lot of time. (We do not need to explicitly load the `readr` package because it is part of the `tidyverse`.)


```r
#### Read in the data ####
# The '<-' or 'assignment operator' is allocating the output of read_csv() to a
# object called raw_elections_data. 
raw_elections_data <- 
  read_csv(
    file =
      "https://www.elections.ca/res/rep/off/ovr2019app/51/data_donnees/table_tableau11.csv",
    show_col_types = FALSE
    ) 

# We have read the data from the Elections Canada website. We may like to save 
# it just in case something happens and they move it. 
write_csv(
  x = raw_elections_data, 
  file = "canadian_voting.csv"
  )
```






We can take a quick look at it using the function `head()` which will show the first six rows, and `tail()` which will show the last six rows.


```r
head(raw_elections_data)
#> # A tibble: 6 × 13
#>   Province   `Electoral Distri… `Electoral Distr… Population
#>   <chr>      <chr>                          <dbl>      <dbl>
#> 1 Newfoundl… Avalon                         10001      86494
#> 2 Newfoundl… Bonavista--Burin-…             10002      74116
#> 3 Newfoundl… Coast of Bays--Ce…             10003      77680
#> 4 Newfoundl… Labrador                       10004      27197
#> 5 Newfoundl… Long Range Mounta…             10005      86553
#> 6 Newfoundl… St. John's East/S…             10006      85697
#> # … with 9 more variables: Electors/Électeurs <dbl>,
#> #   Polling Stations/Bureaux de scrutin <dbl>,
#> #   Valid Ballots/Bulletins valides <dbl>,
#> #   Percentage of Valid Ballots /Pourcentage des bulletins valides <dbl>,
#> #   Rejected Ballots/Bulletins rejetés <dbl>,
#> #   Percentage of Rejected Ballots /Pourcentage des bulletins rejetés <dbl>,
#> #   Total Ballots Cast/Total des bulletins déposés <dbl>, …
tail(raw_elections_data)
#> # A tibble: 6 × 13
#>   Province   `Electoral Distri… `Electoral Distr… Population
#>   <chr>      <chr>                          <dbl>      <dbl>
#> 1 British C… Vancouver South/V…             59040     102927
#> 2 British C… Victoria                       59041     117133
#> 3 British C… West Vancouver--S…             59042     119113
#> 4 Yukon      Yukon                          60001      35874
#> 5 Northwest… Northwest Territo…             61001      41786
#> 6 Nunavut    Nunavut                        62001      35944
#> # … with 9 more variables: Electors/Électeurs <dbl>,
#> #   Polling Stations/Bureaux de scrutin <dbl>,
#> #   Valid Ballots/Bulletins valides <dbl>,
#> #   Percentage of Valid Ballots /Pourcentage des bulletins valides <dbl>,
#> #   Rejected Ballots/Bulletins rejetés <dbl>,
#> #   Percentage of Rejected Ballots /Pourcentage des bulletins rejetés <dbl>,
#> #   Total Ballots Cast/Total des bulletins déposés <dbl>, …
```

We need to clean the data so that we can use it. In particular, we are trying to make it similar to the dataset that we thought we wanted in the planning stage. While it is fine to move away from the plan, this needs to be a deliberate, reasoned, decision. After reading in the dataset that we saved, the first thing that we will do is adjust the names to make them easier to type. We will do this using the function `clean_names()` from `janitor` [@janitor].




```r
#### Basic cleaning ####
raw_elections_data <- 
  read_csv(file = "canadian_voting.csv",
           show_col_types = FALSE
           )
```


```r
# Make the names easier to type
cleaned_elections_data <- 
  clean_names(raw_elections_data)

# Have a look at the first six rows
head(cleaned_elections_data)
#> # A tibble: 6 × 13
#>   province   electoral_distric… electoral_distri… population
#>   <chr>      <chr>                          <dbl>      <dbl>
#> 1 Newfoundl… Avalon                         10001      86494
#> 2 Newfoundl… Bonavista--Burin-…             10002      74116
#> 3 Newfoundl… Coast of Bays--Ce…             10003      77680
#> 4 Newfoundl… Labrador                       10004      27197
#> 5 Newfoundl… Long Range Mounta…             10005      86553
#> 6 Newfoundl… St. John's East/S…             10006      85697
#> # … with 9 more variables: electors_electeurs <dbl>,
#> #   polling_stations_bureaux_de_scrutin <dbl>,
#> #   valid_ballots_bulletins_valides <dbl>,
#> #   percentage_of_valid_ballots_pourcentage_des_bulletins_valides <dbl>,
#> #   rejected_ballots_bulletins_rejetes <dbl>,
#> #   percentage_of_rejected_ballots_pourcentage_des_bulletins_rejetes <dbl>,
#> #   total_ballots_cast_total_des_bulletins_deposes <dbl>, …
```

Even though the names are still quite long, the reason that they are faster to type is because R Studio will auto complete them. To do this, begin typing the name of a column and then use tab to auto complete it.

There are many columns in the dataset, and we are primarily interested in two: 'electoral_district_name_nom_de_circonscription', and 'elected_candidate_candidat_elu'. We can choose certain columns of interest using `select()` from `dplyr` [@citedplyr] (which we loaded as part of the `tidyverse`). Additionally, the pipe operator, `%>%`, pushes the output from one line to be the first input of the function on the next line. 


```r
cleaned_elections_data <- 
  cleaned_elections_data %>% 
  # Select only certain columns
  select(electoral_district_name_nom_de_circonscription,
         elected_candidate_candidat_elu
         )

# Have a look at the first six rows
head(cleaned_elections_data)
#> # A tibble: 6 × 2
#>   electoral_district_name_no… elected_candidate_candidat_elu
#>   <chr>                       <chr>                         
#> 1 Avalon                      McDonald, Kenneth Liberal/Lib…
#> 2 Bonavista--Burin--Trinity   Rogers, Churence Liberal/Libé…
#> 3 Coast of Bays--Central--No… Simms, Scott Liberal/Libéral  
#> 4 Labrador                    Jones, Yvonne Liberal/Libéral 
#> 5 Long Range Mountains        Hutchings, Gudie Liberal/Libé…
#> 6 St. John's East/St. John's… Harris, Jack NDP-New Democrat…
```

Some of the names of the columns are still quite long because they have both English and French in them. We can look at the names of the columns with `names()`. And we can change the names using `rename()` from `dplyr` [@citedplyr].


```r
names(cleaned_elections_data)
#> [1] "electoral_district_name_nom_de_circonscription"
#> [2] "elected_candidate_candidat_elu"
```


```r
cleaned_elections_data <- 
  cleaned_elections_data %>% 
  rename(
    electoral_district = electoral_district_name_nom_de_circonscription,
    elected_candidate = elected_candidate_candidat_elu
    )

head(cleaned_elections_data)
#> # A tibble: 6 × 2
#>   electoral_district                 elected_candidate      
#>   <chr>                              <chr>                  
#> 1 Avalon                             McDonald, Kenneth Libe…
#> 2 Bonavista--Burin--Trinity          Rogers, Churence Liber…
#> 3 Coast of Bays--Central--Notre Dame Simms, Scott Liberal/L…
#> 4 Labrador                           Jones, Yvonne Liberal/…
#> 5 Long Range Mountains               Hutchings, Gudie Liber…
#> 6 St. John's East/St. John's-Est     Harris, Jack NDP-New D…
```

Looking at this dataset, and the 'elected_candidate' column in particular, we can see that we have the surname of the elected candidate, followed by a comma, followed by their first name, followed by a space, followed by the name of the party in both English and French, separated by a slash. We can break-up this column into its pieces using `separate()` from `tidyr` [@citetidyr].


```r
cleaned_elections_data <- 
  cleaned_elections_data %>% 
  # Separate the column into two based on the slash
  separate(col = elected_candidate,
           into = c('other', 'party'),
           sep = '/') %>% 
  # Remove the 'other' column
  select(-other)

head(cleaned_elections_data)
#> # A tibble: 6 × 2
#>   electoral_district                 party                  
#>   <chr>                              <chr>                  
#> 1 Avalon                             Libéral                
#> 2 Bonavista--Burin--Trinity          Libéral                
#> 3 Coast of Bays--Central--Notre Dame Libéral                
#> 4 Labrador                           Libéral                
#> 5 Long Range Mountains               Libéral                
#> 6 St. John's East/St. John's-Est     NPD-Nouveau Parti démo…
```

Finally we want to change the party names from French to English to match what we simulated using `recode()` from `dplyr` [@citedplyr].


```r
cleaned_elections_data$party <- 
  recode(cleaned_elections_data$party,
         'Conservateur' = 'Conservative',
         'Indépendant(e)' = 'Other',
         'Libéral' = 'Liberal',
         'NPD-Nouveau Parti démocratique' = 'New Democratic',
         'Parti Vert' = 'Green')

head(cleaned_elections_data)
#> # A tibble: 6 × 2
#>   electoral_district                 party         
#>   <chr>                              <chr>         
#> 1 Avalon                             Liberal       
#> 2 Bonavista--Burin--Trinity          Liberal       
#> 3 Coast of Bays--Central--Notre Dame Liberal       
#> 4 Labrador                           Liberal       
#> 5 Long Range Mountains               Liberal       
#> 6 St. John's East/St. John's-Est     New Democratic
```

Our data now matches our plan (Figure \@ref(fig:canadaexampledata)) pretty well. For every electoral district we have the party of the person that won it. 

Having now nicely cleaned the dataset, we should save it, so that we can start with that cleaned dataset in the next stage.


```r
write_csv(
  x = cleaned_elections_data,
  file = "cleaned_elections_data.csv"
  )
```



### Explore 

At this point we would like to explore the dataset that we created. One way to better understand a dataset is to make a graph. In particular, here we would like to build the graph that we planned in Figure \@ref(fig:canadaexampletable).

First, we need to read in the dataset that we just created. 




```r
#### Read in the data ####
cleaned_elections_data <- 
  read_csv(
    "cleaned_elections_data.csv",
    show_col_types = FALSE
    )
```

To build the graph that we are interested in, we will rely on the `ggplot2` package [@citeggplot]. The key aspect of this package is that is involves building graphs by adding layers using the '+' operator. In particular we will create a histogram use the function `geom_histogram()` from `ggplot2` [@citeggplot].


```r
cleaned_elections_data %>% 
  ggplot(aes(x = party)) + # aes abbreviates aesthetics and enables us 
  # to specify the x axis variable
  geom_histogram(stat = "count")
```

<img src="02-drinking_from_a_fire_hose_files/figure-html/unnamed-chunk-22-1.png" width="672" />

This accomplishes what we set out to do. But we can make it look a bit nicer by modifying the default options (Figure \@ref(fig:canadanice)).


```r
cleaned_elections_data %>% 
  ggplot(aes(x = party)) +
  geom_histogram(stat = "count") +
  theme_minimal() + # Make the theme neater
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + # Rotate label
  labs(x = "Party",
       y = "Number of seats") # Make the labels more meaningful
```

<div class="figure">
<img src="02-drinking_from_a_fire_hose_files/figure-html/canadanice-1.png" alt="Number of seats won, by political party, at the 2019 Canadian Federal Election." width="672" />
<p class="caption">(\#fig:canadanice)Number of seats won, by political party, at the 2019 Canadian Federal Election.</p>
</div>


### Communicate

To this point we have downloaded some data, cleaned it, and made a graph. We would typically need to communicate what we have done at some length. In this case, we can write a few paragraphs about what we did, why we did it, and what we found. An example follows.

> Canada is a parliamentary democracy with 338 seats in the House of Commons, which is the house that forms government. There are two major parties---'Liberal' and 'Conservative'---three minor parties---'Bloc Québécois', 'New Democratic', and 'Green'---and many smaller parties. The 2019 Federal Election occurred on 21 October, and more than 17 million votes were cast. 
>
> We downloaded the results, on a seat-specific basis, from the Elections Canada website. We were interested in the number of seats that were won by each party. We cleaned and tidied the dataset using the statistical programming language R [@citeR] as well as the packages `tidyverse` [@citetidyverse] and `janitor` [@janitor]. We then created a graph of the number of seats that each political party won (Figure \@ref(fig:canadanice)).
>
> We found that the Liberal Party won 157 seats, followed by the Conservative Party with 121 seats. The minor parties won the following number of seats: Bloc Québécois, 32 seats, New Democratic Party, 24 seats, and the Green Party, 3 seats. Finally, one independent candidate won a seat. 
>
> The distribution of seats is skewed toward the two major parties which could reflect relatively stable preferences on the part of Canadian voters, or possibly inertia due to the benefits of already being a major party such a national network and funding, or some other reason. A better understanding the reasons for this distribution are of interest in future work. While the dataset consists of everyone who voted, it worth noting that some are systematically excluded from voting; and it is much difficult for some to vote than others.



## Toronto homelessness

Toronto has a large homeless population. Freezing winters mean it is critical there are enough places in shelters. In this example we will make a table of shelter usage in the second half of 2021 that compares average use in each month. Our expectation is that there is greater usage in the colder months, for instance, December, compared with warmer months, for instance, July.


### Plan

The dataset that we are interested in would need to have date, the shelter, and the number of beds that were occupied that night. A quick sketch of a dataset that would work is Figure \@ref(fig:torontohomelessdataplan). 

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/IMG_1817.png" alt="Quick sketch of a dataset that could be useful for understanding shelter usage in Toronto" width="65%" />
<p class="caption">(\#fig:torontohomelessdataplan)Quick sketch of a dataset that could be useful for understanding shelter usage in Toronto</p>
</div>

We are interested in creating a table that has the average number of beds occupied each month. The table would probably look something like Figure \@ref(fig:houselessexampletable). 

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/IMG_1818.png" alt="Quick sketch of a table of the average number of beds occupied each month" width="65%" />
<p class="caption">(\#fig:houselessexampletable)Quick sketch of a table of the average number of beds occupied each month</p>
</div>


### Simulate

The next step is to simulate some data that could resemble our dataset. 

Again within R Studio Cloud make a new R Markdown file, and make a new R code chunk and add preamble documentation. Then install and/or load the libraries that are needed. We will again use `tidyverse` [@Wickham2017], `janitor` [@janitor], and `tidyr` [@citetidyr]. As those were installed earlier, they do not need to be installed again. In this example we will additionally use `opendatatoronto` [@citeSharla], `lubridate` [@GrolemundWickham2011], and `knitr` [@citeknitr] and these will need to be installed.

An example follows.


```r
#### Preamble ####
# Purpose: Read in data about 2021 houseless shelter usage and make a table
# Author: Rohan Alexander
# Email: rohan.alexander@utoronto.ca
# Date: 1 January 2022
# Prerequisites: - 

#### Workspace set-up ####
install.packages("opendatatoronto")
install.packages("lubridate")
install.packages("knitr")

library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)
library(tidyr)
```



To add a bit more detail to the earlier example, libraries contain code that other people have written. There are a few common ones that you will see regularly, especially the `tidyverse`. To use a package, we must first install it and then we need to load it. Di Cook, Professor of Business Analytics at Monash University, compares installing a package, say, `install.packages("tidyverse")`, with installing a lightbulb---you only need to do this once for each light socket; but then each time you want light you need to turn on the switch, analogous to say, `library(tidyverse)`. So, the packages that we installed earlier do not need to be reinstalled here.

Given that a lot of people freely gave up their time to make `R` and the packages that we use, it is important to cite them. To get the information that is needed, we can use the function `citation()`. When run without any arguments, that provides the citation information for `R` itself, and when run with an argument that is the name of a package, it provides the citation information for that package.


```r
citation() # Get the citation information for R
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
citation('tidyverse') # Get the citation information for a particular package
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
```

Turning to the simulation, we need three columns: 'date', 'shelter', and 'occupancy'. This example will build on the earlier one by adding a 'seed'. This enables us to always generate the same random data. Any integer can be used as the seed. In this case the seed is 853. If you use that as the seed, then you should get the same random numbers as in the example. If you use a different seed, then you should get different random numbers.


```r
#### Simulate data ####
set.seed(853)   

simulated_occupancy_data <- 
  tibble(
    date = rep(as.Date("2021-07-01") + c(0:183), 3), # Based on Dirk
    # Eddelbuettel: https://stackoverflow.com/a/21502386
    shelter = c(rep("Shelter 1", 184), 
                rep("Shelter 2", 184),
                rep("Shelter 3", 184)),
    number_occupied = 
      rpois(n = 184*3,
            lambda = 150) # Draw 552 times from the Poisson distribution
    )

head(simulated_occupancy_data)
#> # A tibble: 6 × 3
#>   date       shelter   number_occupied
#>   <date>     <chr>               <int>
#> 1 2021-07-01 Shelter 1             145
#> 2 2021-07-02 Shelter 1             144
#> 3 2021-07-03 Shelter 1             136
#> 4 2021-07-04 Shelter 1             139
#> 5 2021-07-05 Shelter 1             132
#> 6 2021-07-06 Shelter 1             127
```

In this simulation we first create a list of all the dates in 2021. We repeat that list three times. We assume data for three shelters for every day of the year. To simulate the number of beds that are occupied each night, we draw from a Poisson distribution.

### Acquire

We will use some data that has been made available about Toronto homeless shelters by the City of Toronto. The premise of the data is that each night at 4am a count is made of all the occupied beds. To access the data, we will use the R package `opendatatoronto` [@citeSharla]. 


```r
#### Acquire data ####
# Based on code from: 
# https://open.toronto.ca/dataset/daily-shelter-overnight-service-occupancy-capacity/
toronto_shelters <- 
  list_package_resources("21c83b32-d5a8-4106-a54f-010dbe49f6f2") %>% 
  filter(row_number()==1) %>% 
  get_resource()

write_csv(
  x = toronto_shelters, 
  file = "toronto_shelters.csv"
  )

head(toronto_shelters)
```



Not much needs to be done to this to make it similar to the dataset that we were interested in. We will need to change the names to make them easier to type, reduce the columns to only those that are relevant, and then add a month column.


```r
toronto_shelters_clean <- 
  clean_names(toronto_shelters) %>% 
  select(occupancy_date, id, occupied_beds) %>% 
  mutate(occupancy_date = as_date(occupancy_date),
         occupancy_month = month(occupancy_date, 
                                 label = TRUE, 
                                 abbr = FALSE)
         ) %>% 
  filter(occupancy_date >= as_date("2021-07-01"))

head(toronto_shelters_clean)
#> # A tibble: 6 × 4
#>   occupancy_date      id occupied_beds occupancy_month
#>   <date>           <dbl>         <dbl> <ord>          
#> 1 2021-12-27     7323151            50 December       
#> 2 2021-12-27     7323152            18 December       
#> 3 2021-12-27     7323153            28 December       
#> 4 2021-12-27     7323154            50 December       
#> 5 2021-12-27     7323155            NA December       
#> 6 2021-12-27     7323156            NA December
```

All that remains is to save the nicely cleaned dataset.


```r
write_csv(
  x = toronto_shelters_clean, 
  file = "cleaned_toronto_shelters.csv"
  )
```



### Explore

First, we need to read in the dataset that we just created. 




```r
#### Explore ####
toronto_shelters_clean <- 
  read_csv(
    "cleaned_toronto_shelters.csv",
    show_col_types = FALSE
    )
```

The dataset is on a daily basis for each shelter. We are interested in understanding average monthly usage, so we need to create a summary statistic on the basis of monthly groups.


```r
# Code based on that of Florence Vallée-Dubois and Lisa Lendway
toronto_shelters_clean %>%
  drop_na(occupied_beds) %>% # We only want rows that have data
  group_by(occupancy_month) %>% # We want to know the occupancy by month
  summarise(number_occupied = mean(occupied_beds)) %>% 
  kable()
```



|occupancy_month | number_occupied|
|:---------------|---------------:|
|August          |        30.83975|
|December        |        33.57806|
|July            |        29.67137|
|November        |        33.26980|
|October         |        32.32991|
|September       |        31.65405|

As with before, this looks fine, and achieves what we set out to do. But we can make some tweaks to the defaults to make it look even better (Table \@ref(tab:homelessoccupancy)).


```r
# Code based on that of Florence Vallée-Dubois and Lisa Lendway
toronto_shelters_clean %>%
  drop_na(occupied_beds) %>% # We only want rows that have data
  group_by(occupancy_month) %>% # We want to know the occupancy by month
  summarise(number_occupied = mean(occupied_beds)) %>% 
  kable(caption = "Homeless shelter usage in Toronto in 2021", 
        col.names = c("Month", "Average daily number of occupied beds"),
        digits = 1,
        booktabs = TRUE,
        linesep = ""
        )
```



Table: (\#tab:homelessoccupancy)Homeless shelter usage in Toronto in 2021

|Month     | Average daily number of occupied beds|
|:---------|-------------------------------------:|
|August    |                                  30.8|
|December  |                                  33.6|
|July      |                                  29.7|
|November  |                                  33.3|
|October   |                                  32.3|
|September |                                  31.7|


### Communicate

Again, we will write a few brief paragraphs about what we did, why we did it, and what we found. An example follows.

> Toronto has a large homeless population. Freezing winters mean it is critical there are enough places in shelters. We are interested to understand how usage of shelters changes in colder months, compared with warmer months. 
> 
> We use data provided by the City of Toronto about Toronto homeless shelter bed occupancy. Specifically, at 4am each night a count is made of the occupied beds. We are interested in averaging this over the month. We cleaned, tidied, and analyzed the dataset using the statistical programming language R [@citeR] as well as the packages `tidyverse` [@Wickham2017], `janitor` [@janitor], `tidyr` [@citetidyr], `opendatatoronto` [@citeSharla], `lubridate` [@GrolemundWickham2011], and `knitr` [@citeknitr]. We then made a table of the average number of occupied beds each night for each month (Table \@ref(tab:homelessoccupancy)).
> 
> We found that the daily average number of occupied beds was higher in December 2021 than July 2021, with 34 occupied beds in December, compared with 30 in July. More generally, there was a steady increase in the daily average number of occupied beds between July and December, with a slight increase each month. 
>
> The dataset is on the basis of shelters, and so our results may be skewed by changes that are specific to especially large or especially small shelters. It may be that particular shelters are especially attractive in colder months, leading to a substitution, which would have policy implications but not be reflected in Table \@ref(tab:homelessoccupancy).

Although this example is only a few paragraphs, it could be reduced to form an abstract, or increased to form a full report. The first paragraph is general and motivational; the second focuses on the data; the third on the results; and the fourth is a more general discussion. Each of these could be expanded to form sections of a short report.




## Neonatal mortality

Neonatal mortality refers to a death that occurs within the first month of life, and in particular, the neonatal mortality rate (NMR) is the number of neonatal deaths per 1,000 live births [@alexander2018global]. In this example we will create a graph of the NMR for the past fifty years for: Argentina, Australia, Canada, China, and Kenya.

### Plan

For this example, we need to think about what our dataset should look like, and also what the graph should look like.

The dataset needs to have a column that specifies the country, and another that specifies the year. It also needs to have a column with the NMR estimate for that year for that country. Roughly, it should look like Figure \@ref(fig:nmrexampledata). 

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/IMG_1812.png" alt="Quick sketch of a potentially useful NMR dataset" width="50%" />
<p class="caption">(\#fig:nmrexampledata)Quick sketch of a potentially useful NMR dataset</p>
</div>

We are interested to make a graph with year on the x-axis and NMR on the y-axis. Each country should have its own line. Roughly similar to Figure \@ref(fig:nmrexamplegraph). 

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/IMG_1813.png" alt="Quick sketch of a graph of NMR by country over time" width="90%" />
<p class="caption">(\#fig:nmrexamplegraph)Quick sketch of a graph of NMR by country over time</p>
</div>



### Simulate

We would like to simulate some data that aligns with our plan. In this case we will need three columns: country, year, and NMR.

Again within R Studio Cloud make a new R Markdown file. Add preamble documentation and load the workspace. We will again use `tidyverse` [@Wickham2017], `janitor` [@janitor], and `lubridate` [@GrolemundWickham2011], .

An example follows.


```r
#### Preamble ####
# Purpose: Obtain and prepare data about neonatal mortality for five countries
# for the past fifty years and create a graph.
# Author: Rohan Alexander
# Email: rohan.alexander@utoronto.ca
# Date: 1 January 2022
# Prerequisites: - 

#### Workspace set-up ####
library(janitor)
library(lubridate)
library(tidyverse)
```



Libraries contain code that other people have written, and that code can update from time to time. We can see which version of a package we are using by `packageVersion()`. For instance, we are using version 1.3.1 of the `tidyverse` and version 2.1.0 of `janitor`.


```r
packageVersion('tidyverse')
#> [1] '1.3.1'
packageVersion('janitor')
#> [1] '2.1.0'
```

To update the version of the package, we use `update.packages()`.


```r
update.packages()
```

This does not need to be run, say, every day, but from time-to-time it is worth updating packages. While many packages take care to ensure backward compatibility, at a certain point this does not become reasonable, and so it is important to be aware the updating packages can result in old code needing to be updated.

Returning to the simulation, we repeat the name of each country 50 times, and then use the numbers from 1 to 50 to stand in for the passing of the years and then adding 1970 for them. Finally, we draw from the uniform distribution using `runif()` as a simulation of a NMR value for that year for that country.


```r
#### Simulate data ####
set.seed(853)

simulated_nmr_data <- 
  tibble(
    country = 
      c(
        rep('Argentina', 50),
        rep('Australia', 50),
        rep('Canada', 50),
        rep('China', 50),
        rep('Kenya', 50)
        ),
    year = 
      rep(c(1:50 + 1970), 5),
    nmr = 
      runif(n = 250,
            min = 0, 
            max = 100)
  )

head(simulated_nmr_data)
#> # A tibble: 6 × 3
#>   country    year   nmr
#>   <chr>     <dbl> <dbl>
#> 1 Argentina  1971 35.9 
#> 2 Argentina  1972 12.0 
#> 3 Argentina  1973 48.4 
#> 4 Argentina  1974 31.6 
#> 5 Argentina  1975  3.74
#> 6 Argentina  1976 40.4
```

While this simulation works, it would be time-consuming and error-prone if we decided that instead of fifty years, we were interested in simulating, say, sixty years. One way to make this easier is to replace all instances of 50 with a variable. An example follows.


```r
#### Simulate data ####
set.seed(853)

number_of_years <- 50

simulated_nmr_data <- 
  tibble(
    country = 
      c(
        rep('Argentina', number_of_years),
        rep('Australia', number_of_years),
        rep('Canada', number_of_years),
        rep('China', number_of_years),
        rep('Kenya', number_of_years)
        ),
    year = 
      rep(c(1:number_of_years + 1970), 5),
    nmr = 
      runif(n = number_of_years * 5,
            min = 0, 
            max = 100)
  )

head(simulated_nmr_data)
#> # A tibble: 6 × 3
#>   country    year   nmr
#>   <chr>     <dbl> <dbl>
#> 1 Argentina  1971 35.9 
#> 2 Argentina  1972 12.0 
#> 3 Argentina  1973 48.4 
#> 4 Argentina  1974 31.6 
#> 5 Argentina  1975  3.74
#> 6 Argentina  1976 40.4
```

The result will be the same, but now all we have to do to change from fifty to sixty years is to change it in one place.

We can have confidence in this simulated dataset because it is relatively straight-forward, and we wrote the code for it. But when we turn to the real dataset, it is more difficult to be sure that it is what it claims to be. Even if we trust the data, it is important that we are able to share that confidence with others. One way forward is to establish some checks that our data are as they should be. For instance, we expect: 

1. That 'country' is, and only is, one of these five: 'Argentina', 'Australia', 'Canada', 'China', or 'Kenya'.
2. Conversely, that 'country' contains all those five countries.
3. That 'year' is no smaller than 1971 and no larger than 2020 and is an integer.
4. That 'nmr' is a value somewhere between 0 and 1,000 and is a number.

We can write a series of tests based on these features, that we expect that dataset to pass.


```r
# Tests for simulated data
simulated_nmr_data$country %>% unique() == c("Argentina", "Australia", "Canada", "China", "Kenya")
#> [1] TRUE TRUE TRUE TRUE TRUE

simulated_nmr_data$country %>% unique() %>% length() == 5
#> [1] TRUE

simulated_nmr_data$year %>% min() == 1971
#> [1] TRUE

simulated_nmr_data$year %>% max() == 2020
#> [1] TRUE

simulated_nmr_data$nmr %>% min() >= 0
#> [1] TRUE

simulated_nmr_data$nmr %>% max() <= 1000
#> [1] TRUE

simulated_nmr_data$nmr %>% class() == "numeric"
#> [1] TRUE
```

Having passed these tests, we can have confidence in the simulated dataset. More importantly, we can apply these tests to the real dataset. This enables us to have greater confidence in that dataset and to share that confidence with others.

### Acquire

The UN Inter-agency Group for Child Mortality Estimation (IGME) provides estimates of the NMR at the website: https://childmortality.org/.


```r
#### Acquire data ####
raw_igme_data <- 
  read_csv(
    file =
      "https://childmortality.org/wp-content/uploads/2021/09/UNIGME-2021.csv",
    show_col_types = FALSE) 

write_csv(
  raw_igme_data, 
  here("igme.csv")
  )
```



We can take a quick look at it, especially being interested in what the dataset seems to look like (using `head()` and `tail()`), what the names of the columns are (using `names()`), and what type each column is (using `class()`).


```r
head(raw_igme_data)
#> # A tibble: 6 × 29
#>   `Geographic area` Indicator         Sex   `Wealth Quintil…
#>   <chr>             <chr>             <chr> <chr>           
#> 1 Afghanistan       Neonatal mortali… Total Total           
#> 2 Afghanistan       Neonatal mortali… Total Total           
#> 3 Afghanistan       Neonatal mortali… Total Total           
#> 4 Afghanistan       Neonatal mortali… Total Total           
#> 5 Afghanistan       Neonatal mortali… Total Total           
#> 6 Afghanistan       Neonatal mortali… Total Total           
#> # … with 25 more variables: Series Name <chr>,
#> #   Series Year <chr>, Regional group <chr>,
#> #   TIME_PERIOD <chr>, OBS_VALUE <dbl>,
#> #   COUNTRY_NOTES <chr>, CONNECTION <lgl>,
#> #   DEATH_CATEGORY <lgl>, CATEGORY <chr>,
#> #   Observation Status <chr>, Unit of measure <chr>,
#> #   Series Category <chr>, Series Type <chr>, …
names(raw_igme_data)
#>  [1] "Geographic area"        "Indicator"             
#>  [3] "Sex"                    "Wealth Quintile"       
#>  [5] "Series Name"            "Series Year"           
#>  [7] "Regional group"         "TIME_PERIOD"           
#>  [9] "OBS_VALUE"              "COUNTRY_NOTES"         
#> [11] "CONNECTION"             "DEATH_CATEGORY"        
#> [13] "CATEGORY"               "Observation Status"    
#> [15] "Unit of measure"        "Series Category"       
#> [17] "Series Type"            "STD_ERR"               
#> [19] "REF_DATE"               "Age Group of Women"    
#> [21] "Time Since First Birth" "DEFINITION"            
#> [23] "INTERVAL"               "Series Method"         
#> [25] "LOWER_BOUND"            "UPPER_BOUND"           
#> [27] "STATUS"                 "YEAR_TO_ACHIEVE"       
#> [29] "Model Used"
sapply(raw_igme_data, class)
#>        Geographic area              Indicator 
#>            "character"            "character" 
#>                    Sex        Wealth Quintile 
#>            "character"            "character" 
#>            Series Name            Series Year 
#>            "character"            "character" 
#>         Regional group            TIME_PERIOD 
#>            "character"            "character" 
#>              OBS_VALUE          COUNTRY_NOTES 
#>              "numeric"            "character" 
#>             CONNECTION         DEATH_CATEGORY 
#>              "logical"              "logical" 
#>               CATEGORY     Observation Status 
#>            "character"            "character" 
#>        Unit of measure        Series Category 
#>            "character"            "character" 
#>            Series Type                STD_ERR 
#>            "character"              "numeric" 
#>               REF_DATE     Age Group of Women 
#>              "numeric"            "character" 
#> Time Since First Birth             DEFINITION 
#>            "character"            "character" 
#>               INTERVAL          Series Method 
#>              "numeric"            "character" 
#>            LOWER_BOUND            UPPER_BOUND 
#>              "numeric"              "numeric" 
#>                 STATUS        YEAR_TO_ACHIEVE 
#>            "character"            "character" 
#>             Model Used 
#>            "character"
```

We would like to clean up the names and only keep the rows and columns that we are interested in. Based on our planning, we are interested in rows where 'Sex' is 'Total', 'Series Name' is 'UN IGME estimate', 'Geographic area' is one of 'Argentina', 'Australia', 'Canada', 'China', and 'Kenya', and the 'Indicator' is 'Neonatal mortality rate'. After this we are interested in just a few columns: 'geographic_area', 'time_period', and 'obs_value'.


```r
cleaned_igme_data <- 
  clean_names(raw_igme_data) %>% 
  filter(sex == 'Total',
         series_name == 'UN IGME estimate',
         geographic_area %in% 
           c('Argentina', 'Australia', 'Canada', 'China', 'Kenya'),
         indicator == 'Neonatal mortality rate') %>% 
  select(geographic_area,
         time_period,
         obs_value)

head(cleaned_igme_data)
#> # A tibble: 6 × 3
#>   geographic_area time_period obs_value
#>   <chr>           <chr>           <dbl>
#> 1 Argentina       1970-06          24.9
#> 2 Argentina       1971-06          24.7
#> 3 Argentina       1972-06          24.6
#> 4 Argentina       1973-06          24.6
#> 5 Argentina       1974-06          24.5
#> 6 Argentina       1975-06          24.1
```

This is looking good, but we just need to fix two final things: the class of 'time_period' is character when we need it to be a date (it is actually a year) and the name of 'obs_value' should be 'nmr' so to be more informative.


```r
cleaned_igme_data <- 
  cleaned_igme_data %>% 
  mutate(time_period = str_remove(time_period, "-06"),
         time_period = as.integer(time_period)) %>% 
  filter(time_period >= 1971) %>% 
  rename(nmr = obs_value,
         year = time_period,
         country = geographic_area)

head(cleaned_igme_data)
#> # A tibble: 6 × 3
#>   country    year   nmr
#>   <chr>     <int> <dbl>
#> 1 Argentina  1971  24.7
#> 2 Argentina  1972  24.6
#> 3 Argentina  1973  24.6
#> 4 Argentina  1974  24.5
#> 5 Argentina  1975  24.1
#> 6 Argentina  1976  23.3
```

Finally, we can check that our dataset passes the tests that we developed based on the simulated dataset.


```r
# Test the cleaned dataset
cleaned_igme_data$country %>% unique() == c("Argentina", "Australia", "Canada", "China", "Kenya")
#> [1] TRUE TRUE TRUE TRUE TRUE

cleaned_igme_data$country %>% unique() %>% length() == 5
#> [1] TRUE

cleaned_igme_data$year %>% min() == 1971
#> [1] TRUE

cleaned_igme_data$year %>% max() == 2020
#> [1] TRUE

cleaned_igme_data$nmr %>% min() >= 0
#> [1] TRUE

cleaned_igme_data$nmr %>% max() <= 1000
#> [1] TRUE

cleaned_igme_data$nmr %>% class() == "numeric"
#> [1] TRUE
```

All that remains is to save the nicely cleaned dataset.


```r
write_csv(
  x = cleaned_igme_data, 
  file = "cleaned_igme_data.csv"
  )
```



### Explore

First, we need to read in the dataset that we just created. 




```r
#### Explore ####
cleaned_igme_data <- 
  read_csv(
    "cleaned_igme_data.csv",
    show_col_types = FALSE
    )
```

We can now make the graph that we are interested in (Figure \@ref(fig:nmrgraph)). We are interested in showing how NMR has changed over time and the difference between countries.


```r
cleaned_igme_data %>% 
  ggplot(aes(x = year, y = nmr, color = country)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Year",
       y = "Neonatal Mortality Rate (NMR)",
       color = "Country") +
  scale_color_brewer(palette = "Set1")
```

<div class="figure">
<img src="02-drinking_from_a_fire_hose_files/figure-html/nmrgraph-1.png" alt="Neonatal Mortality Rate (NMR), for Argentina, Australia, Canada, China, and Kenya, (1971-2020)" width="672" />
<p class="caption">(\#fig:nmrgraph)Neonatal Mortality Rate (NMR), for Argentina, Australia, Canada, China, and Kenya, (1971-2020)</p>
</div>


### Communicate

To this point we have downloaded some data, cleaned it, wrote some tests, and made a graph. We would typically need to communicate what we have done at some length. In this case, we will write a few paragraphs about what we did, why we did it, and what we found. 

> Neonatal mortality refers to a death that occurs within the first month of life. In particular, the neonatal mortality rate (NMR) is the number of neonatal deaths per 1,000 live births [@alexander2018global]. We obtain estimates for NMR for five countries---Argentina, Australia, Canada, China, and Kenya---over the past fifty years. We find substantial reductions over time in the NMR across all countries.
> 
> The UN Inter-agency Group for Child Mortality Estimation (IGME) provides estimates of the NMR at the website: https://childmortality.org/. We downloaded their estimates then cleaned and tidied the dataset using the statistical programming language R [@citeR].
> 
> We found considerable change in the estimated NMR over time and between the five countries of interest (Figure \@ref(fig:nmrgraph)). In particular, we found that the 1970s tended to be associated with reductions in the estimated NMR. Australia and Canada were estimated to have a low NMR at that point and remained there through 2020, with slight improvements. The estimates for Argentina and Kenya continued to have substantial reductions through 2020. Data were only available from 1990 for China and the estimates show a substantial reduction in the NMR, especially in the 1990s and 2000s.
> 
> Our results suggest considerable improvements in estimated NMR over time. But it is worth emphasising that estimates of the NMR are based on a statistical model and underlying data. The paradox of data availability is that often high-quality data are less easily available for countries with worse outcomes. For instance, @alexander2018global say '[t]here is large variability in the availability of data on neonatal mortality'. Our conclusions are subject to the model that underpins the estimates, and the quality of the underlying data and we did not independently verify either of these. Additionally, there is often particular concern about the validity of Chinese government data [@lyu2018gdp].




## Exercises and tutorial

### Exercises

1. When was the dataset that underpins @chambliss1989mundanity collected (pick one)? 
    a. August 1983 to August 1984
    b. January 1983 to August 1984
    c. January 1983 to January 1984
    d. August 1983 to January 1984
2. When @chambliss1989mundanity talks of stratification, what is he talking about?
3. How does @chambliss1989mundanity define 'excellence' (pick one)?
    a. Prolonged performance at world-class level.
    b. All Olympic medal winners.
    c. Consistent superiority of performance.
    d. All national-level athletes.
4. Think about the following quote from @chambliss1989mundanity [p.81] and list three small skills or activities that could help you achieve excellence in data science.

> Excellence is mundane. Superlative performance is really a confluence of dozens of small skills or activities, each one learned or stumbled upon, which have been carefully drilled into habit and then are fitted together in a synthesized whole. There is nothing extraordinary or super-human in any one of those actions; only the fact that they are done consistently and correctly, and all together, produce excellence.

5. Which of the following are arguments for `readr::read_csv()` (select all that apply)? (Hint: You can access the help for the function with `?readr::read_csv()`.)
    a. 'all_cols'
    b. 'file'
    c. 'show_col_types'
    d. 'number'
6. We used `rpois()` and `runif()` to draw from the Poisson and Uniform distributions, respectively. Which of the following can be used to draw from the Normal and Binomial distributions (select all that apply)?
    a. `rnormal()` and `rbinom()`
    b. `rnorm()` and `rbinomial()`
    c. `rnormal()` and `rbinomial()`
    d. `rnorm()` and `rbinom()`
7. What is the result of `sample(x = letters, size = 2)` when the seed is set to '853'? What about when the seed is set to '1234' (pick one)?
    a. '"i" "q"' and '"p" "v"'
    b. '"e" "l"' and '"e" "r"'
    c. '"i" "q"' and '"e" "r"'
    d. '"e" "l"' and '"p" "v"'
8. How do we get the citation information for `opendatatoronto` (pick one)?
    a. cite()
    b. citation()
    c. cite('opendatatoronto')
    d. citation('opendatatoronto')
9. Which argument needs to be changed in order to change the column labels in `kable` (pick one)?
    a. 'booktabs'
    b. 'col.names'
    c. 'digits'
    d. 'linesep'
    e. 'caption'
10. Which function could be used to update packages (pick one)? 
    a. `update.packages()`
    b. `upgrade.packages()`
    c. `revise.packages()`
    d. `renovate.packages()`
11. What are some features that we might typically expect of a column that claimed to be a year (select all that apply)? 
    a. The class is 'character'.
    b. There are no negative numbers.
    c. There are letters in the column.
    d. Each entry has four digits.


### Tutorial

The purpose of this tutorial is to encourage greater comfort with data simulation and communication, and to engender a broader understanding of the practice of data science.

1. Please pick either the seed-growing, or hair-length, example from Chapter \@ref(telling-stories-with-data). You should have already started to record some data, but you probably do not have much of it. Please use `sample()` to create a tibble that has twelve weeks' worth of data.
2. Pretend that the dataset that you just generated is the actual data that you end up with. Please write three paragraphs (i.e. about a page or so) to communicate what you did, why, and what you found.
3. Reflecting on @chambliss1989mundanity, please write a one-page paper about stratification and excellence as it relates to using programming languages, such as R or Python, for data science.



