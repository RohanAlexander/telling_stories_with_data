



# R essentials

**STATUS: Under construction.**

**Required material**

- Read *R for Data Science*, Chapters 3-6, 8, 10, 11, 13, 14, 15, and 18, [@r4ds]
- Watch *Make a reprex... Please*, [@sharlatalks]
- Read *The Kitchen Counter Observatory*, [@kieranskitchen]
- Read *This is how AI bias really happens---and why it's so hard to fix*, [@hao2019]
- Watch *Object of type 'closure' is not subsettable*, [@jennybryan]


<!-- - Watch *Defining Custom Functions in R*, [@shiroonfunctions]. -->

<!-- **Recommended reading** -->

<!-- - Alexander, Monica, 2019, 'The concentration and uniqueness of baby names in Australia and the US', https://www.monicaalexander.com/posts/2019-20-01-babynames/.  -->
<!-- - Hvitfeldt, Emil, 2020, 'Emoji in ggplot2', https://www.hvitfeldt.me/blog/real-emojis-in-ggplot2/. -->
<!-- - Pavlik, Kaylin, 2018, 'Dairy Queen Deserts in Minnesota', https://www.kaylinpavlik.com/dairy-queen-deserts/. -->
<!-- - 'R Studio Cloud Guide', https://rstudio.cloud/learn/guide. -->
<!-- - Scherer, Cédric, 2019, 'Best TidyTuesday 2019', https://cedricscherer.netlify.com/2019/12/30/best-tidytuesday-2019/. -->
<!-- - Silge, Julia, 2019, 'Reordering and facetting for ggplot2', https://juliasilge.com/blog/reorder-within/. -->
<!-- - Smale, David, 2019, 'Happy Days', https://davidsmale.netlify.com/portfolio/happy-days/. -->

**Key concepts and skills**

- Tibbles
- Importing data
- Joining data
- Strings
- Factors
- Dates
- Pivot

**Key libraries**

- `ggplot2`
- `tidyverse`

**Key functions**

- `|` 'or'
- `&` 'and'
- `|>` 'pipe'
- `$` 'extract'
- `as.character()`
- `as.integer()`
- `c()`
- `citation()`
- `class()`
- `dplyr::arrange()`
- `dplyr::case_when()`
- `dplyr::count()`
- `dplyr::filter()`
- `dplyr::group_by()`
- `dplyr::if_else()`
- `dplyr::left_join()`
- `dplyr::mutate()`
- `dplyr::pull()`
- `dplyr::rename()`
- `dplyr::select()`
- `dplyr::slice()`
- `dplyr::summarise()`
- `forcats::as_factor()`
- `forcats::fct_relevel()`
- `function()`
- `ggplot2::facet_wrap()`
- `ggplot2::geom_density()`
- `ggplot2::geom_histogram()`
- `ggplot2::geom_point()`
- `ggplot2::ggplot()`
- `head()`
- `janitor::clean_names()`
- `library()`
- `lubridate::ymd()`
- `max()`
- `mean()`
- `print()`
- `readr::read_csv()`
- `round()`
- `sample()`
- `set.seed()`
- `stats::rnorm()`
- `stats::runif()`
- `stringr::str_detect()`
- `stringr::str_replace()`
- `stringr::str_squish()`
- `sum()`
- `tibble::tibble()`
- `tidyr::pivot_longer()`
- `tidyr::pivot_wider()`



## Background

In this chapter we focus on foundational skills needed to use the statistical programming language R [@citeR] to tell stories with data. Some of it may not make sense at first, but these are skills and approaches that we will come back to throughout these notes. You should initially just go through this chapter quickly, noting aspects that you do not understand. And then come back to this chapter from time to time as you continue through the rest of the book. That way you will see how the various bits fit into context.

R is an open-source language that is useful for statistical programming. You can download R for free from the Comprehensive R Archive Network (CRAN): https://cran.r-project.org. R Studio is an Integrated Development Environment (IDE) for R which makes the language easier to use and can be downloaded for free: https://www.rstudio.com/products/rstudio/.

The past ten years or so, have been characterised by the increased use of the tidyverse. This is '...an opinionated collection of R packages designed for data science. All packages share an underlying design philosophy, grammar, and data structures' [@tidyversewebsite]. There are three distinctions here: the original R language, typically referred to as 'base'; the 'tidyverse' which is a collection of packages that build on top of the R language; and other packages. 

Essentially everything that we can do in the tidyverse, we can also do in base. But, as the tidyverse was built especially for modern data science it is often easier to use the tidyverse, especially when you are learning. Additionally, often everything that we can do in the tidyverse, we can also do with other packages. But, as the tidyverse is a coherent collection of packages, it is often easier to use the tidyverse, again, especially when you are learning. Eventually one begins to see cases where it makes sense to trade-off the convenience and coherence of the tidyverse for some features of base or other packages. Indeed, we will see that at various points later in this book. For instance, the tidyverse can be slow, and so if one needs to import thousands of CSVs then it can make sense to switch away from `readr::read_csv()`. The appropriate use of base and non-tidyverse packages, rather than dogmatic insistence on a particular solution, is a sign of one's development.

Central to our use of the statistical programming language R is data, and most of the data that we use will have humans at the heart of it. Sometimes it is easy to forget that, but other times it has the opposite effect.

> In practice, I find that far from distancing you from questions of meaning, quantitative data forces you to confront them. The numbers draw you in. Working with data like this is an unending exercise in humility, a constant compulsion to think through what you can and cannot see, and a standing invitation to understand what the measures really capture---what they mean, and for whom. 
>
> @kieranskitchen



<!-- Get started by loading the `tidyverse` package. -->

<!-- ```{r, warning = FALSE, message = FALSE} -->
<!-- library(tidyverse) -->
<!-- ``` -->



<!-- The general workflow that we will use involves: -->

<!-- 1. Import -->
<!-- 2. Tidy -->
<!-- 3. Transforming, descriptive -->
<!-- 4. Plot -->
<!-- 5. Model -->
<!-- 6. Repeat 3/4 -->





## Broader impact

> "We shouldn't have to think about the societal impact of our work because it's hard and other people can do it for us" is a really bad argument. I stopped doing CV research because I saw the impact my work was having. I loved the work but the military applications and privacy concerns eventually became impossible to ignore. But basically all facial recognition work would not get published if we took Broader Impacts sections seriously. There is almost no upside and enormous downside risk. To be fair though i should have a lot of humility here. For most of grad school I bought in to the myth that science is apolitical and research is objectively moral and good no matter what the subject is.
> 
> Joe Redmon, [20 February 2020](https://twitter.com/pjreddie/status/1230524770350817280).


Although the term 'data science' is ubiquitous in academia, industry, and even more generally, it is difficult to define. One deliberately antagonistic definition of data science is '[t]he inhumane reduction of humanity down to what can be counted' [@keyes2019]. While purposefully controversial, this definition highlights one reason for the increased demand for data science and quantitative methods over the past decade---individuals and their behaviour are now at the heart of it. Many of the techniques have been around for many decades, but what makes them popular now is this human focus. 

Unfortunately, even though much of the work may be focused on individuals, issues of privacy and consent, and ethical concerns more broadly, rarely seem front of mind. While there are some exceptions, in general, even at the same time as claiming that AI, machine learning, and data science are going to revolutionise society, consideration of these types of issues appears to have been largely treated as something that would be nice to have, rather than something that we may like to think of before we embrace the revolution.

For the most part, these are not new issues. In the sciences, there has been considerable recent ethical consideration around CRISPR technology and gene editing, but in an earlier time similar conversations were had, for instance, about Wernher von Braun being allowed to building rockets for the US. In medicine, of course, these concerns have been front-of-mind for some time. Data science seems determined to have its own Tuskegee-moment rather than think about, and deal appropriately with, these issues, based on the experiences of other fields before they occur in data science.

That said, there is some evidence that data scientists are beginning to be more concerned about the ethics surrounding the practice. For instance, NeurIPS, a prestigious machine learning conference, now requires a statement on ethics to accompany all submissions.

> In order to provide a balanced perspective, authors are required to include a statement of the potential broader impact of their work, including its ethical aspects and future societal consequences. Authors should take care to discuss both positive and negative outcomes.
>
> [NeurIPS 2020 Conference Call For Papers](https://neurips.cc/Conferences/2020/CallForPapers)

The purpose of ethical consideration and concern for the broader impact of our work is not to prescriptively rule things in or out, but to provide an opportunity to raise some issues that should be front of mind. The variety of data science applications, the relative youth of the field, and the speed of change, mean that such considerations are sometimes knowingly set aside, and this is acceptable to the rest of the field. This contrasts with fields such as science, medicine, engineering, and accounting. Possibly those fields are more self-aware (Figure \@ref(fig:personalprobability)).

<div class="figure">
<img src="figures/probability.png" alt="Probability, from https://xkcd.com/881/." width="90%" />
<p class="caption">(\#fig:personalprobability)Probability, from https://xkcd.com/881/.</p>
</div>




## R, R Studio, and R Studio Cloud

R and R Studio are complementary, but they are not the same thing. Liza Bolton, Assistant Professor, Teaching Stream, Department of Statistical Sciences at the University of Toronto explains their relationship by analogy where R is like the engine and R Studio is like the car. Although some of us can use a car engine directly, most of us use a car to interact with the engine.

### R

R---https://www.r-project.org/---is an open-source and free programming language that is focused on general statistics. Free in this context does not refer to a price of zero, but instead to 'freedom', but it also does have a price of zero. This is in contrast with an open-source programming language that is designed for general purpose, such as Python, or an open-source programming language that is focused on probability, such as Stan. It was created by Ross Ihaka and Robert Gentleman at the University of Auckland. It is maintained by the R Core Team and changes to this 'base' of code occur methodically and with concern given to a variety of different priorities.

<!-- If you are in Canada then you can download R here: http://cran.utstat.utoronto.ca/, if you are in Australia then you can download R here: https://cran.csiro.au/, otherwise you should go here - https://cran.r-project.org/mirrors.html - and find a location that suits you. (It doesn't really matter where you get it from, it's just that it may be slightly faster to use a closer option.) -->

Many people build on this stable base, to extend the capabilities of R to better and more quickly suit their needs. They do this by creating packages. Typically, although not always, a package is a collection of R code, mostly functions, and this allows us to more easily do things that we want to do. These packages are managed by CRAN, and other repositories such as Bioconductor. CRAN is built into the download of R that you just got, so you can use it straight away.

If you want to use a package then you need to firstly install it in your computer, and then you need to load it when you want to use it. 

Di Cook, Professor of Business Analytics at Monash University, describes this as analogous to a lightbulb. If you want light in your house, first you need to fit a lightbulb, and then you need to turn the switch on. Installing a package, say, `install.packages("tidyverse")`, is akin to fitting a lightbulb into a socket---you only need to do this once for each lightbulb. But then each time you want light you need to turn on the switch to the lightbulb, which in the R packages case, means calling the library, say, `library(tidyverse)`. 

To install a package on your computer (again, we will need to do this only once per computer) we use the function `install.packages()`.


```r
install.packages("tidyverse")
```

And then when we want to use the package, we need to use the function `library()`.


```r
library(tidyverse)
```

Having downloaded it, we can open R and use it directly. It is primarily designed to be interacted with through the command line. While this is functional, it can be useful to have a richer environment than the command line provides. In particular, it can be useful to install an Integrated Development Environment (IDE), which is an application that brings together various bits and pieces that will be used often. One common IDE for R is R Studio.

### R Studio

R Studio is distinct to R, and they are different entities. R Studio builds on top of R to make it easier to use R. This is in the same way that one could use the internet from the command line, but most folks use a browser such as Chrome, Firefox, or Safari.

R Studio is free in the sense that we do not pay for it. It is also free in the sense of being able to take the code, modify it, and distribute that code. But it is important to recognise that R Studio is a company and so it is possible that the current situation could change. It can be downloaded: https://www.rstudio.com/products/rstudio/.

When we open R Studio it will look like Figure \@ref(fig:first).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/01-03_r_essentials/01.png" alt="Opening R Studio for the first time" width="100%" />
<p class="caption">(\#fig:first)Opening R Studio for the first time</p>
</div>

The left pane is a console in which you can type and execute R code line by line. Try it with 2+2 by clicking next to the prompt '>' and typing that out then pressing enter. The code that you type should be:


```r
2 + 2
#> [1] 4
```

And hopefully you get the same answer printed in the console.

The pane on the top right has information about your environment. For instance, when we create variables a list of their names and some properties will appear there. Try to type the following code, replacing my name with your name, next to the prompt, and again press enter:


```r
my_name <- "Rohan"
```

You should notice a new value in the environment pane with the variable name and its value. 

The pane in the bottom right is a file manager. At the moment it should just have two files: an R History file and a R Project file. We will get to what these are later, but for now we will create and save a file.

Type out the following code (do not worry too much about the details for now):


```r
saveRDS(object = my_name, file = "my_first_file.rds")
```

And you should see a new '.rds' file in your list of files.

### R Studio Cloud

While you can and should download R Studio to your own computer, initially we will use R Studio Cloud: https://rstudio.cloud/. This is an online version that is provided by R Studio. We will use this so that you can focus on getting comfortable with R and R Studio in an environment that is consistent. This way you do not have to worry about what computer you have or installation permissions, amongst other things.

The free version of R Studio Cloud is free as is 'no financial cost'. The trade-off is that it is not very powerful, and it is sometimes slow, but for the purposes of getting started it is enough.


## Getting started

We will now start going through some code. It is important that you actively write this all out yourself.

While working line-by-line in the console is fine, it is easier to write out a whole script that can then be executed. We will do this by making an R Script. To do this go to: File -> New File -> R Script. The console pane will fall to the bottom left and an R Script will open in the top left. We will write some code that will get all of the Australian federal politicians and then construct a small table about the genders of the prime ministers.

(Some of this code will not make sense at this stage, but just type it all out to get in the habit and then run it. To run the whole script, we can click 'Run' or we can highlight certain lines and then click 'Run' to just run those lines.


```r
# Install the packages that we need
install.packages("tidyverse")
install.packages("AustralianPoliticians")
```


```r
# Load the packages that we need to use this time
library(tidyverse)
library(AustralianPoliticians)

# Make a table of the counts of genders of the prime ministers
AustralianPoliticians::get_auspol('all') |> 
  as_tibble() |> 
  filter(wasPrimeMinister == 1) |> 
  count(gender)
#> # A tibble: 2 × 2
#>   gender     n
#>   <chr>  <int>
#> 1 female     1
#> 2 male      29
```

We can see that, as at the end of 2021, one female has been prime minister (Julia Gillard), while the other 29 prime ministers were male

One critical operator when programming is the 'pipe': `|>`. We read this as 'and then'. This takes the output of a line of code and uses it as the first input to the next line of code. It makes code easier to read.

The idea of the pipe is that we take a dataset, and then, do something to it. We used this in the earlier example. Another example follows where we will look at the first six lines of a dataset by piping it to `head()`. Notice that `head()` does not explicitly take any arguments in this example. It knows which data to display because the pipe does it implicitly.


```r
AustralianPoliticians::get_auspol('all') |> 
  head()
#> # A tibble: 6 × 20
#>   uniqueID   surname allOtherNames      firstName commonName
#>   <chr>      <chr>   <chr>              <chr>     <chr>     
#> 1 Abbott1859 Abbott  Richard Hartley S… Richard   <NA>      
#> 2 Abbott1869 Abbott  Percy Phipps       Percy     <NA>      
#> 3 Abbott1877 Abbott  Macartney          Macartney Mac       
#> 4 Abbott1886 Abbott  Charles Lydiard A… Charles   Aubrey    
#> 5 Abbott1891 Abbott  Joseph Palmer      Joseph    <NA>      
#> 6 Abbott1957 Abbott  Anthony John       Anthony   Tony      
#> # … with 15 more variables: displayName <chr>,
#> #   earlierOrLaterNames <chr>, title <chr>, gender <chr>,
#> #   birthDate <date>, birthYear <dbl>, birthPlace <chr>,
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>, wikidataID <chr>,
#> #   wikipedia <chr>, adb <chr>, comments <chr>
```

We can save this R Script as 'my_first_r_script.R' using File -> Save As. At this point, our workspace should look something like Figure \@ref(fig:third).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/01-03_r_essentials/03.png" alt="After running an R Script" width="100%" />
<p class="caption">(\#fig:third)After running an R Script</p>
</div>

One thing to be aware of is that each R Studio Cloud workspace is essentially a new computer. Because of this, we need to install any package that we want to use for each workspace. For instance, before we can use the `tidyverse`, we need to install it with the function `install.packages("tidyverse")`. This contrasts with when you use your own computer.

A few final notes on R Studio Cloud:

1. In the Australian politician's example, we got our data from the website GitHub using an R package, but we can get data into a workspace from a local computer in a variety of ways. One way is to use the 'upload' button in the 'Files' panel.
2. R Studio Cloud allows some degree of collaboration. For instance, you can give someone else access to a workspace that you create. This could be useful for collaborating on an assignment, although it is not quite full featured yet and you cannot both be in the workspace at the same time (in contrast to, say, Google Docs).
3. There are a variety of weaknesses of R Studio Cloud, in particular the RAM limits. Additionally, things break from time to time. The R Studio Community page that is focused on R Studio Cloud is sometimes helpful: https://community.rstudio.com/c/rstudio-cloud.





## The `dplyr` verbs

One of the key packages that we will use is the `tidyverse` [@tidyverse]. The `tidyverse` is actually a package of packages, which means when we install the `tidyverse`, we actually install a whole bunch of different packages. The key package in the `tidyverse` in terms of manipulating data is `dplyr` [@citedplyr].

There are five `dplyr` functions that are regularly used, and we will now go through each of these. These are commonly referred to as the `dplyr` verbs.

1. `select()`
2. `filter()`
3. `arrange()`
4. `mutate()`
5. `summarise()` or equally `summarize()`

Two additional functions that we will cover here as they are closely related are `group_by()`, and `count()`.

As we have already installed the `tidyverse` we need to load it.


```r
library(tidyverse)
```

And we will begin by again using some data about Australian politicians from the `AustralianPoliticians` package [@citeaustralianpoliticians].


```r
library(AustralianPoliticians)

australian_politicians <- 
  get_auspol('all')

head(australian_politicians)
#> # A tibble: 6 × 20
#>   uniqueID   surname allOtherNames      firstName commonName
#>   <chr>      <chr>   <chr>              <chr>     <chr>     
#> 1 Abbott1859 Abbott  Richard Hartley S… Richard   <NA>      
#> 2 Abbott1869 Abbott  Percy Phipps       Percy     <NA>      
#> 3 Abbott1877 Abbott  Macartney          Macartney Mac       
#> 4 Abbott1886 Abbott  Charles Lydiard A… Charles   Aubrey    
#> 5 Abbott1891 Abbott  Joseph Palmer      Joseph    <NA>      
#> 6 Abbott1957 Abbott  Anthony John       Anthony   Tony      
#> # … with 15 more variables: displayName <chr>,
#> #   earlierOrLaterNames <chr>, title <chr>, gender <chr>,
#> #   birthDate <date>, birthYear <dbl>, birthPlace <chr>,
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>, wikidataID <chr>,
#> #   wikipedia <chr>, adb <chr>, comments <chr>
```

### `select()`

We use `select()` to pick particular columns of a dataset. For instance, we might like to select the 'firstName' column.


```r
australian_politicians |> 
  select(firstName) |> 
  head()
#> # A tibble: 6 × 1
#>   firstName
#>   <chr>    
#> 1 Richard  
#> 2 Percy    
#> 3 Macartney
#> 4 Charles  
#> 5 Joseph   
#> 6 Anthony
```

In R, there are many ways to do things. Sometimes they are different ways to do the same thing, and other times they are different ways to do almost the same thing. For instance, another way to pick a particular column of a dataset is to use the extract operator '$'. This is from base, as opposed to `select()` which is from the `tidyverse`.


```r
australian_politicians$firstName |> 
  head()
#> [1] "Richard"   "Percy"     "Macartney" "Charles"  
#> [5] "Joseph"    "Anthony"
```

The two appear similar---both pick the 'firstName' column---but they different in the class of what they return. For the sake of completeness, if we combine `select()` with `pull()` then we get the same class of output as if we had used the extract operator.


```r
australian_politicians |> 
  select(firstName) |> 
  pull() |> 
  head()
#> [1] "Richard"   "Percy"     "Macartney" "Charles"  
#> [5] "Joseph"    "Anthony"
```

We can also use `select()` to remove columns. To do this, we `select()` in a negative sense.


```r
australian_politicians |> 
  select(-firstName) |> 
  head()
#> # A tibble: 6 × 19
#>   uniqueID   surname allOtherNames    commonName displayName
#>   <chr>      <chr>   <chr>            <chr>      <chr>      
#> 1 Abbott1859 Abbott  Richard Hartley… <NA>       Abbott, Ri…
#> 2 Abbott1869 Abbott  Percy Phipps     <NA>       Abbott, Pe…
#> 3 Abbott1877 Abbott  Macartney        Mac        Abbott, Mac
#> 4 Abbott1886 Abbott  Charles Lydiard… Aubrey     Abbott, Au…
#> 5 Abbott1891 Abbott  Joseph Palmer    <NA>       Abbott, Jo…
#> 6 Abbott1957 Abbott  Anthony John     Tony       Abbott, To…
#> # … with 14 more variables: earlierOrLaterNames <chr>,
#> #   title <chr>, gender <chr>, birthDate <date>,
#> #   birthYear <dbl>, birthPlace <chr>, deathDate <date>,
#> #   member <dbl>, senator <dbl>, wasPrimeMinister <dbl>,
#> #   wikidataID <chr>, wikipedia <chr>, adb <chr>,
#> #   comments <chr>
```

Finally, we can use `select()` based on conditions. For instance, we can `select()` all of the columns that start with, say, 'birth'.


```r
australian_politicians |> 
  select(starts_with("birth")) |> 
  head()
#> # A tibble: 6 × 3
#>   birthDate  birthYear birthPlace  
#>   <date>         <dbl> <chr>       
#> 1 NA              1859 Bendigo     
#> 2 1869-05-14        NA Hobart      
#> 3 1877-07-03        NA Murrurundi  
#> 4 1886-01-04        NA St Leonards 
#> 5 1891-10-18        NA North Sydney
#> 6 1957-11-04        NA London
```

There are a variety of similar 'selection helpers' including 'starts_with()', 'ends_with()', and 'contains()'. More information about these is available in the help page for `select()` which can be accessed with `?select()`.

At this point, we will use `select()` to reduce the width of our dataset.


```r
australian_politicians <-
  australian_politicians |>
  select(uniqueID,
         surname,
         firstName,
         gender,
         birthDate,
         birthYear,
         deathDate,
         member,
         senator,
         wasPrimeMinister)

australian_politicians
#> # A tibble: 1,783 × 10
#>    uniqueID   surname firstName gender birthDate  birthYear
#>    <chr>      <chr>   <chr>     <chr>  <date>         <dbl>
#>  1 Abbott1859 Abbott  Richard   male   NA              1859
#>  2 Abbott1869 Abbott  Percy     male   1869-05-14        NA
#>  3 Abbott1877 Abbott  Macartney male   1877-07-03        NA
#>  4 Abbott1886 Abbott  Charles   male   1886-01-04        NA
#>  5 Abbott1891 Abbott  Joseph    male   1891-10-18        NA
#>  6 Abbott1957 Abbott  Anthony   male   1957-11-04        NA
#>  7 Abel1939   Abel    John      male   1939-06-25        NA
#>  8 Abetz1958  Abetz   Eric      male   1958-01-25        NA
#>  9 Adams1943  Adams   Judith    female 1943-04-11        NA
#> 10 Adams1951  Adams   Dick      male   1951-04-29        NA
#> # … with 1,773 more rows, and 4 more variables:
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>
```

### `filter()`

We use `filter()` to pick particular rows of a dataset. For instance, we might like to filter to only politicians that became prime minister.


```r
australian_politicians |> 
  filter(wasPrimeMinister == 1)
#> # A tibble: 30 × 10
#>    uniqueID    surname firstName gender birthDate  birthYear
#>    <chr>       <chr>   <chr>     <chr>  <date>         <dbl>
#>  1 Abbott1957  Abbott  Anthony   male   1957-11-04        NA
#>  2 Barton1849  Barton  Edmund    male   1849-01-18        NA
#>  3 Bruce1883   Bruce   Stanley   male   1883-04-15        NA
#>  4 Chifley1885 Chifley Joseph    male   1885-09-22        NA
#>  5 Cook1860    Cook    Joseph    male   1860-12-07        NA
#>  6 Curtin1885  Curtin  John      male   1885-01-08        NA
#>  7 Deakin1856  Deakin  Alfred    male   1856-08-03        NA
#>  8 Fadden1894  Fadden  Arthur    male   1894-04-13        NA
#>  9 Fisher1862  Fisher  Andrew    male   1862-08-29        NA
#> 10 Forde1890   Forde   Francis   male   1890-07-18        NA
#> # … with 20 more rows, and 4 more variables:
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>
```

We could also pass `filter()` two conditions. For instance, we could look at politicians that become prime minister and were named Joseph, using the 'and' operator '&'.


```r
australian_politicians |> 
  filter(wasPrimeMinister == 1 & firstName == "Joseph")
#> # A tibble: 3 × 10
#>   uniqueID    surname firstName gender birthDate  birthYear
#>   <chr>       <chr>   <chr>     <chr>  <date>         <dbl>
#> 1 Chifley1885 Chifley Joseph    male   1885-09-22        NA
#> 2 Cook1860    Cook    Joseph    male   1860-12-07        NA
#> 3 Lyons1879   Lyons   Joseph    male   1879-09-15        NA
#> # … with 4 more variables: deathDate <date>, member <dbl>,
#> #   senator <dbl>, wasPrimeMinister <dbl>
```

We would get the same result if we use a comma instead of an ampersand.


```r
australian_politicians |> 
  filter(wasPrimeMinister == 1, firstName == "Joseph")
#> # A tibble: 3 × 10
#>   uniqueID    surname firstName gender birthDate  birthYear
#>   <chr>       <chr>   <chr>     <chr>  <date>         <dbl>
#> 1 Chifley1885 Chifley Joseph    male   1885-09-22        NA
#> 2 Cook1860    Cook    Joseph    male   1860-12-07        NA
#> 3 Lyons1879   Lyons   Joseph    male   1879-09-15        NA
#> # … with 4 more variables: deathDate <date>, member <dbl>,
#> #   senator <dbl>, wasPrimeMinister <dbl>
```

Similarly, we could look at politicians who were named Myles or Ruth using the 'or' operator '|'


```r
australian_politicians |> 
  filter(firstName == "Myles" | firstName == "Ruth")
#> # A tibble: 3 × 10
#>   uniqueID     surname firstName gender birthDate  birthYear
#>   <chr>        <chr>   <chr>     <chr>  <date>         <dbl>
#> 1 Coleman1931  Coleman Ruth      female 1931-09-27        NA
#> 2 Ferricks1875 Ferric… Myles     male   1875-11-12        NA
#> 3 Webber1965   Webber  Ruth      female 1965-03-24        NA
#> # … with 4 more variables: deathDate <date>, member <dbl>,
#> #   senator <dbl>, wasPrimeMinister <dbl>
```

We could also pipe the result. For instance we could pipe from `filter()` to `select()`.


```r
australian_politicians |> 
  filter(firstName == "Ruth" | firstName == "Myles") |> 
  select(firstName, surname)
#> # A tibble: 3 × 2
#>   firstName surname 
#>   <chr>     <chr>   
#> 1 Ruth      Coleman 
#> 2 Myles     Ferricks
#> 3 Ruth      Webber
```

If we happen to know the particular row number that is of interest then we could `filter()` to only that particular row. For instance, say the row 853 was of interest.


```r
australian_politicians |> 
  filter(row_number() == 853)
#> # A tibble: 1 × 10
#>   uniqueID     surname firstName gender birthDate  birthYear
#>   <chr>        <chr>   <chr>     <chr>  <date>         <dbl>
#> 1 Jakobsen1947 Jakobs… Carolyn   female 1947-09-11        NA
#> # … with 4 more variables: deathDate <date>, member <dbl>,
#> #   senator <dbl>, wasPrimeMinister <dbl>
```

There is also a dedicated function to do this, which is `slice()`


```r
australian_politicians |> 
  slice(853)
#> # A tibble: 1 × 10
#>   uniqueID     surname firstName gender birthDate  birthYear
#>   <chr>        <chr>   <chr>     <chr>  <date>         <dbl>
#> 1 Jakobsen1947 Jakobs… Carolyn   female 1947-09-11        NA
#> # … with 4 more variables: deathDate <date>, member <dbl>,
#> #   senator <dbl>, wasPrimeMinister <dbl>
```

While this may seem somewhat esoteric, it is especially useful if we would like to remove a particular row using negation, or duplicate specific rows. For instance, we could remove the first row.


```r
australian_politicians |> 
  slice(-1)
#> # A tibble: 1,782 × 10
#>    uniqueID    surname firstName gender birthDate  birthYear
#>    <chr>       <chr>   <chr>     <chr>  <date>         <dbl>
#>  1 Abbott1869  Abbott  Percy     male   1869-05-14        NA
#>  2 Abbott1877  Abbott  Macartney male   1877-07-03        NA
#>  3 Abbott1886  Abbott  Charles   male   1886-01-04        NA
#>  4 Abbott1891  Abbott  Joseph    male   1891-10-18        NA
#>  5 Abbott1957  Abbott  Anthony   male   1957-11-04        NA
#>  6 Abel1939    Abel    John      male   1939-06-25        NA
#>  7 Abetz1958   Abetz   Eric      male   1958-01-25        NA
#>  8 Adams1943   Adams   Judith    female 1943-04-11        NA
#>  9 Adams1951   Adams   Dick      male   1951-04-29        NA
#> 10 Adamson1857 Adamson John      male   1857-02-18        NA
#> # … with 1,772 more rows, and 4 more variables:
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>
```

We could also only, say, only keep the first three rows.


```r
australian_politicians |> 
  slice(1:3)
#> # A tibble: 3 × 10
#>   uniqueID   surname firstName gender birthDate  birthYear
#>   <chr>      <chr>   <chr>     <chr>  <date>         <dbl>
#> 1 Abbott1859 Abbott  Richard   male   NA              1859
#> 2 Abbott1869 Abbott  Percy     male   1869-05-14        NA
#> 3 Abbott1877 Abbott  Macartney male   1877-07-03        NA
#> # … with 4 more variables: deathDate <date>, member <dbl>,
#> #   senator <dbl>, wasPrimeMinister <dbl>
```

Finally, we could duplicate the first two rows.


```r
australian_politicians |> 
  slice(1:2, 1:n())
#> # A tibble: 1,785 × 10
#>    uniqueID   surname firstName gender birthDate  birthYear
#>    <chr>      <chr>   <chr>     <chr>  <date>         <dbl>
#>  1 Abbott1859 Abbott  Richard   male   NA              1859
#>  2 Abbott1869 Abbott  Percy     male   1869-05-14        NA
#>  3 Abbott1859 Abbott  Richard   male   NA              1859
#>  4 Abbott1869 Abbott  Percy     male   1869-05-14        NA
#>  5 Abbott1877 Abbott  Macartney male   1877-07-03        NA
#>  6 Abbott1886 Abbott  Charles   male   1886-01-04        NA
#>  7 Abbott1891 Abbott  Joseph    male   1891-10-18        NA
#>  8 Abbott1957 Abbott  Anthony   male   1957-11-04        NA
#>  9 Abel1939   Abel    John      male   1939-06-25        NA
#> 10 Abetz1958  Abetz   Eric      male   1958-01-25        NA
#> # … with 1,775 more rows, and 4 more variables:
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>
```




### `arrange()`

We use `arrange()` to change the order of the dataset based on the values of particular columns. For instance, could arrange 'australian_politicians' by their birthday.


```r
australian_politicians |> 
  arrange(birthDate)
#> # A tibble: 1,783 × 10
#>    uniqueID    surname firstName gender birthDate  birthYear
#>    <chr>       <chr>   <chr>     <chr>  <date>         <dbl>
#>  1 Braddon1829 Braddon Edward    male   1829-06-11        NA
#>  2 Ferguson18… Fergus… John      male   1830-03-15        NA
#>  3 Zeal1830    Zeal    William   male   1830-12-05        NA
#>  4 Fraser1832  Fraser  Simon     male   1832-08-21        NA
#>  5 Groom1833   Groom   William   male   1833-03-09        NA
#>  6 Sargood1834 Sargood Frederick male   1834-05-30        NA
#>  7 Fysh1835    Fysh    Philip    male   1835-03-01        NA
#>  8 Playford18… Playfo… Thomas    male   1837-11-26        NA
#>  9 Solomon1839 Solomon Elias     male   1839-09-02        NA
#> 10 McLean1840  McLean  Allan     male   1840-02-03        NA
#> # … with 1,773 more rows, and 4 more variables:
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>
```

We could modify `arrange()` with `desc()` to change from ascending to descending order.


```r
australian_politicians |> 
  arrange(desc(birthDate))
#> # A tibble: 1,783 × 10
#>    uniqueID   surname  firstName gender birthDate  birthYear
#>    <chr>      <chr>    <chr>     <chr>  <date>         <dbl>
#>  1 SteeleJoh… Steele-… Jordon    male   1994-10-14        NA
#>  2 Chandler1… Chandler Claire    female 1990-06-01        NA
#>  3 Roy1990    Roy      Wyatt     male   1990-05-22        NA
#>  4 Thompson1… Thompson Phillip   male   1988-05-07        NA
#>  5 Paterson1… Paterson James     male   1987-11-21        NA
#>  6 Burns1987  Burns    Joshua    male   1987-02-06        NA
#>  7 Smith1986  Smith    Marielle  female 1986-12-30        NA
#>  8 Kakoschke… Kakosch… Skye      female 1985-12-19        NA
#>  9 Simmonds1… Simmonds Julian    male   1985-08-29        NA
#> 10 Gorman1984 Gorman   Patrick   male   1984-12-12        NA
#> # … with 1,773 more rows, and 4 more variables:
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>
```

And we could arrange based on more than one column. For instance, if two politicians have the same first name, then we could arrange based on their birthday.


```r
australian_politicians |> 
  arrange(firstName, birthDate)
#> # A tibble: 1,783 × 10
#>    uniqueID    surname firstName gender birthDate  birthYear
#>    <chr>       <chr>   <chr>     <chr>  <date>         <dbl>
#>  1 Blain1894   Blain   Adair     male   1894-11-21        NA
#>  2 Dein1889    Dein    Adam      male   1889-03-04        NA
#>  3 Armstrong1… Armstr… Adam      male   1909-07-01        NA
#>  4 Bandt1972   Bandt   Adam      male   1972-03-11        NA
#>  5 Ridgeway19… Ridgew… Aden      male   1962-09-18        NA
#>  6 Bennett1933 Bennett Adrian    male   1933-01-21        NA
#>  7 Gibson1935  Gibson  Adrian    male   1935-11-03        NA
#>  8 Wynne1850   Wynne   Agar      male   1850-01-15        NA
#>  9 Robertson1… Robert… Agnes     female 1882-07-31        NA
#> 10 Pittard1902 Pittard Alan      male   1902-11-15        NA
#> # … with 1,773 more rows, and 4 more variables:
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>
```

We could achieve the same result with by using a pipe between two instances of `arrange()`.


```r
australian_politicians |> 
  arrange(birthDate) |> 
  arrange(firstName)
#> # A tibble: 1,783 × 10
#>    uniqueID    surname firstName gender birthDate  birthYear
#>    <chr>       <chr>   <chr>     <chr>  <date>         <dbl>
#>  1 Blain1894   Blain   Adair     male   1894-11-21        NA
#>  2 Dein1889    Dein    Adam      male   1889-03-04        NA
#>  3 Armstrong1… Armstr… Adam      male   1909-07-01        NA
#>  4 Bandt1972   Bandt   Adam      male   1972-03-11        NA
#>  5 Ridgeway19… Ridgew… Aden      male   1962-09-18        NA
#>  6 Bennett1933 Bennett Adrian    male   1933-01-21        NA
#>  7 Gibson1935  Gibson  Adrian    male   1935-11-03        NA
#>  8 Wynne1850   Wynne   Agar      male   1850-01-15        NA
#>  9 Robertson1… Robert… Agnes     female 1882-07-31        NA
#> 10 Pittard1902 Pittard Alan      male   1902-11-15        NA
#> # … with 1,773 more rows, and 4 more variables:
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>
```

When we use `arrange()` it is important to be clear about precedence. For instance, changing to birthday and then first name would give a different arrangement.


```r
australian_politicians |> 
  arrange(birthYear, firstName)
#> # A tibble: 1,783 × 10
#>    uniqueID    surname firstName gender birthDate birthYear
#>    <chr>       <chr>   <chr>     <chr>  <date>        <dbl>
#>  1 Edwards1842 Edwards Richard   male   NA             1842
#>  2 Sawers1844  Sawers  William   male   NA             1844
#>  3 Barker1846  Barker  Stephen   male   NA             1846
#>  4 Corser1852  Corser  Edward    male   NA             1852
#>  5 Lee1856     Lee     Henry     male   NA             1856
#>  6 Grant1857   Grant   John      male   NA             1857
#>  7 Palmer1859  Palmer  Albert    male   NA             1859
#>  8 Riley1859   Riley   Edward    male   NA             1859
#>  9 Abbott1859  Abbott  Richard   male   NA             1859
#> 10 Kennedy1860 Kennedy Thomas    male   NA             1860
#> # … with 1,773 more rows, and 4 more variables:
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>
```

A nice way to arrange by a variety of columns is to use `across()`. This means that we can specify a variety of columns. It also enables us to use the 'selection helpers' such as 'starts_with()' that were mentioned in association with `select()`.


```r
australian_politicians |> 
  arrange(across(c(firstName, birthYear))) %>% 
  head()
#> # A tibble: 6 × 10
#>   uniqueID    surname  firstName gender birthDate  birthYear
#>   <chr>       <chr>    <chr>     <chr>  <date>         <dbl>
#> 1 Blain1894   Blain    Adair     male   1894-11-21        NA
#> 2 Armstrong1… Armstro… Adam      male   1909-07-01        NA
#> 3 Bandt1972   Bandt    Adam      male   1972-03-11        NA
#> 4 Dein1889    Dein     Adam      male   1889-03-04        NA
#> 5 Ridgeway19… Ridgeway Aden      male   1962-09-18        NA
#> 6 Bennett1933 Bennett  Adrian    male   1933-01-21        NA
#> # … with 4 more variables: deathDate <date>, member <dbl>,
#> #   senator <dbl>, wasPrimeMinister <dbl>

australian_politicians |> 
  arrange(across(starts_with('birth'))) %>% 
  head()
#> # A tibble: 6 × 10
#>   uniqueID     surname firstName gender birthDate  birthYear
#>   <chr>        <chr>   <chr>     <chr>  <date>         <dbl>
#> 1 Braddon1829  Braddon Edward    male   1829-06-11        NA
#> 2 Ferguson1830 Fergus… John      male   1830-03-15        NA
#> 3 Zeal1830     Zeal    William   male   1830-12-05        NA
#> 4 Fraser1832   Fraser  Simon     male   1832-08-21        NA
#> 5 Groom1833    Groom   William   male   1833-03-09        NA
#> 6 Sargood1834  Sargood Frederick male   1834-05-30        NA
#> # … with 4 more variables: deathDate <date>, member <dbl>,
#> #   senator <dbl>, wasPrimeMinister <dbl>
```


### `mutate()`

We use `mutate()` when we want to make a new column. For instance, perhaps we want to make a new column that is 1 if a person was a member and a senator and 0 otherwise. That is to say that our new column would denote politicians that served in both the upper and the lower house.


```r
australian_politicians <- 
  australian_politicians |> 
  mutate(was_both = if_else(member == 1 & senator == 1, 1, 0))

australian_politicians |> 
  select(member, senator, was_both)
#> # A tibble: 1,783 × 3
#>    member senator was_both
#>     <dbl>   <dbl>    <dbl>
#>  1      0       1        0
#>  2      1       1        1
#>  3      0       1        0
#>  4      1       0        0
#>  5      1       0        0
#>  6      1       0        0
#>  7      1       0        0
#>  8      0       1        0
#>  9      0       1        0
#> 10      1       0        0
#> # … with 1,773 more rows
```

We can use `mutate()` for math, such as addition and subtraction. For instance, we could calculate the age that the politicians are (or would have been) in 2022.


```r
australian_politicians <- 
  australian_politicians |> 
  mutate(age = 2022 - lubridate::year(birthDate))

australian_politicians %>% 
  select(uniqueID, age)
#> # A tibble: 1,783 × 2
#>    uniqueID     age
#>    <chr>      <dbl>
#>  1 Abbott1859    NA
#>  2 Abbott1869   153
#>  3 Abbott1877   145
#>  4 Abbott1886   136
#>  5 Abbott1891   131
#>  6 Abbott1957    65
#>  7 Abel1939      83
#>  8 Abetz1958     64
#>  9 Adams1943     79
#> 10 Adams1951     71
#> # … with 1,773 more rows
```

There are a variety of functions that are especially useful when constructing new columns. These include `log()` which will compute the natural logarithm, `lead()` which will bring values up by one row, `lag()` which will push values down by one row, and `cumsum()` which creates a cumulative sum of the column.


```r
australian_politicians %>% 
  select(uniqueID, age) %>% 
  mutate(log_age = log(age)) %>% 
  head()
#> # A tibble: 6 × 3
#>   uniqueID     age log_age
#>   <chr>      <dbl>   <dbl>
#> 1 Abbott1859    NA   NA   
#> 2 Abbott1869   153    5.03
#> 3 Abbott1877   145    4.98
#> 4 Abbott1886   136    4.91
#> 5 Abbott1891   131    4.88
#> 6 Abbott1957    65    4.17

australian_politicians %>% 
  select(uniqueID, age) %>% 
  mutate(lead_age = lead(age)) %>% 
  head()
#> # A tibble: 6 × 3
#>   uniqueID     age lead_age
#>   <chr>      <dbl>    <dbl>
#> 1 Abbott1859    NA      153
#> 2 Abbott1869   153      145
#> 3 Abbott1877   145      136
#> 4 Abbott1886   136      131
#> 5 Abbott1891   131       65
#> 6 Abbott1957    65       83

australian_politicians %>% 
  select(uniqueID, age) %>% 
  mutate(lag_age = lag(age)) %>% 
  head()
#> # A tibble: 6 × 3
#>   uniqueID     age lag_age
#>   <chr>      <dbl>   <dbl>
#> 1 Abbott1859    NA      NA
#> 2 Abbott1869   153      NA
#> 3 Abbott1877   145     153
#> 4 Abbott1886   136     145
#> 5 Abbott1891   131     136
#> 6 Abbott1957    65     131

australian_politicians %>% 
  select(uniqueID, age) %>% 
  filter(!is.na(age)) %>% 
  mutate(cumulative_age = cumsum(age)) %>% 
  head()
#> # A tibble: 6 × 3
#>   uniqueID     age cumulative_age
#>   <chr>      <dbl>          <dbl>
#> 1 Abbott1869   153            153
#> 2 Abbott1877   145            298
#> 3 Abbott1886   136            434
#> 4 Abbott1891   131            565
#> 5 Abbott1957    65            630
#> 6 Abel1939      83            713
```

Finally, we can also use `mutate()` in combination with `across()`, as we have in earlier examples, including the potential use of the 'selection helpers'. For instance, we could count the number of characters in both the first and last names at the same time.


```r
australian_politicians |> 
  mutate(across(c(firstName, surname), stringr::str_count)) %>% 
  select(uniqueID, firstName, surname)
#> # A tibble: 1,783 × 3
#>    uniqueID   firstName surname
#>    <chr>          <int>   <int>
#>  1 Abbott1859         7       6
#>  2 Abbott1869         5       6
#>  3 Abbott1877         9       6
#>  4 Abbott1886         7       6
#>  5 Abbott1891         6       6
#>  6 Abbott1957         7       6
#>  7 Abel1939           4       4
#>  8 Abetz1958          4       5
#>  9 Adams1943          6       5
#> 10 Adams1951          4       5
#> # … with 1,773 more rows
```




### `summarise()`

We use `summarise()` when we would like to make new, condensed, summary variables. For instance, perhaps we would like to know what the minimum, average, or maximum of some column. 


```r
australian_politicians |> 
  summarise(youngest = min(age, na.rm = TRUE),
            oldest = max(age, na.rm = TRUE),
            average = mean(age, na.rm = TRUE))
#> # A tibble: 1 × 3
#>   youngest oldest average
#>      <dbl>  <dbl>   <dbl>
#> 1       28    193    101.
```

As an aside, `summarise()` and `summarize()` are equivalent and we can use either and get the same result.


```r
australian_politicians |> 
  summarize(youngest = min(age, na.rm = TRUE),
            oldest = max(age, na.rm = TRUE),
            average = mean(age, na.rm = TRUE))
#> # A tibble: 1 × 3
#>   youngest oldest average
#>      <dbl>  <dbl>   <dbl>
#> 1       28    193    101.
```

By default, `summarise()` will provide one row of output for a whole dataset. For instance, in the earlier example we found the youngest, oldest, and average across all politicians. However, we can create more groups in our dataset using the function `group_by()`. And we can then apply another function within the context of those groups. We could use many functions on the basis of groups, but the `summarise()` function is particularly powerful in conjunction with `group_by()`. For instance, we could `summarise()` by gender, and then get our age-based summary statistics.


```r
australian_politicians |> 
  group_by(gender) |> 
  summarise(youngest = min(age, na.rm = TRUE),
            oldest = max(age, na.rm = TRUE),
            average = mean(age, na.rm = TRUE))
#> # A tibble: 2 × 4
#>   gender youngest oldest average
#>   <chr>     <dbl>  <dbl>   <dbl>
#> 1 female       32    140    66.0
#> 2 male         28    193   106.
```

Similarly, we could look at youngest, oldest, and mean age at death by gender.


```r
australian_politicians |>
  mutate(days_lived = deathDate - birthDate) |> 
  filter(!is.na(days_lived)) |> 
  group_by(gender) |> 
  summarise(
    min_days = min(days_lived),
    mean_days = mean(days_lived) |> round(),
    max_days = max(days_lived)
    )
#> # A tibble: 2 × 4
#>   gender min_days   mean_days  max_days  
#>   <chr>  <drtn>     <drtn>     <drtn>    
#> 1 female 14856 days 28857 days 35560 days
#> 2 male   12380 days 27376 days 36416 days
```

And so we learn that female members of parliament on average lived slightly longer than male members of parliament.

We can use `group_by()` on the basis of more than one group. For instance, looking again at average number of days lived by gender, but also by house.


```r
australian_politicians |>
  mutate(days_lived = deathDate - birthDate) |> 
  filter(!is.na(days_lived)) |> 
  group_by(gender, member) |> 
  summarise(
    min_days = min(days_lived),
    mean_days = mean(days_lived) |> round(),
    max_days = max(days_lived)
    )
#> # A tibble: 4 × 5
#> # Groups:   gender [2]
#>   gender member min_days   mean_days  max_days  
#>   <chr>   <dbl> <drtn>     <drtn>     <drtn>    
#> 1 female      0 21746 days 29517 days 35560 days
#> 2 female      1 14856 days 27538 days 33442 days
#> 3 male        0 13619 days 27133 days 36416 days
#> 4 male        1 12380 days 27496 days 36328 days
```

We can use the function `count()` to create counts by groups. For instance, the number of politicians by gender.


```r
australian_politicians |> 
  group_by(gender) |> 
  count()
#> # A tibble: 2 × 2
#> # Groups:   gender [2]
#>   gender     n
#>   <chr>  <int>
#> 1 female   240
#> 2 male    1543
```

In addition to the `count()`, we could make a proportion if we wanted to.


```r
australian_politicians |> 
  group_by(gender) |> 
  count() %>% 
  ungroup() %>% 
  mutate(proportion = n/(sum(n)))
#> # A tibble: 2 × 3
#>   gender     n proportion
#>   <chr>  <int>      <dbl>
#> 1 female   240      0.135
#> 2 male    1543      0.865
```

The function `count()` is essentially the same as using `group_by()` and then `summarise()`. For instance, we can get the same result.


```r
australian_politicians |> 
  group_by(gender) |> 
  summarise(n = n())
#> # A tibble: 2 × 2
#>   gender     n
#>   <chr>  <int>
#> 1 female   240
#> 2 male    1543
```

And there is a similarly helpful function for `mutate()`, which is `add_count()`. The difference is that the number will be added in a column.


```r
australian_politicians |> 
  group_by(gender) |> 
  add_count() %>% 
  select(uniqueID, gender, n)
#> # A tibble: 1,783 × 3
#> # Groups:   gender [2]
#>    uniqueID   gender     n
#>    <chr>      <chr>  <int>
#>  1 Abbott1859 male    1543
#>  2 Abbott1869 male    1543
#>  3 Abbott1877 male    1543
#>  4 Abbott1886 male    1543
#>  5 Abbott1891 male    1543
#>  6 Abbott1957 male    1543
#>  7 Abel1939   male    1543
#>  8 Abetz1958  male    1543
#>  9 Adams1943  female   240
#> 10 Adams1951  male    1543
#> # … with 1,773 more rows
```




## Base

### Class

A class is the broader type of object that something is. For instance, your class is probably 'human', which is itself an 'animal'. Similarly, if we create a number in R we can use `class()` to work out its class, which in this case will be numeric.  


```r
my_number <- 8
class(my_number)
#> [1] "numeric"
```

Or we could make it a character.


```r
my_name <- "rohan"
class(my_name)
#> [1] "character"
```

Finally, we can often coerce classes to be something else. 


```r
my_number_as_character <- as.character(my_number)
class(my_number_as_character)
#> [1] "character"
```

There are many ways for your code to not run but having an issue with the classes is the almost always the first thing to check.







### Simulating data

Simulating data is a key skill for statistics. We will use the following functions all the time: `rnorm()`, `sample()`, and `runif()`. Arguably the most important function is `set.seed()`, which we need because while we want our data to be random, we want it to be repeatable.

Let's get 10 observations from the standard normal.


```r
set.seed(853)

number_of_observations <- 10

simulated_data <- tibble(person = c(1:number_of_observations),
                         observation = rnorm(number_of_observations, 
                                             mean = 0, 
                                             sd = 1)
                         )
```

Then let's add 10 draws from the uniform distribution between 0 and 10.


```r
simulated_data$another_observation <- runif(number_of_observations, 
                                            min = 0, 
                                            max = 10)
```

Finally, let's use sample, which allows use to pick from a list of items, to add a favourite colour to each observation.


```r
simulated_data$fav_colour <- sample(x = c("blue", " white "), 
                                    size = number_of_observations,
                                    replace = TRUE)
```

We set the option `replace` to `TRUE` because we are only choosing between two items, but we want ten outcomes. Depending on the simulation you should think about whether you need it `TRUE` or `FALSE`. Also, there is another useful option to adjust the probability with which each item is drawn. In particular, the default is that both options are equally likely, but perhaps we might like to have 10 per cent `blue` with 90 per cent `white`. The way to do this is to set the option `prob`. As always with functions, you can find more in the help with `?sample`.






### Functions

There are a lot of functions in R, and almost any common task that you might need to do is likely already done. But you will need to write your own functions. The way to do this is to define a function and give it a name. Your function will probably have some inputs (note that these inputs can have default values). Your function will then do something with these inputs and then return something.


```r
my_function <- function(some_names) {
  print(some_names)
}

my_function(c("rohan", "monica"))
#> [1] "rohan"  "monica"
```










## ggplot


If the key package in the `tidyverse` in terms of manipulating data is `dplyr` [@citedplyr], then the key package in the `tidyverse` in terms of creating graphs is `ggplot2` [@citeggplot].

The `ggplot` package is the plotting package that is part of the `tidyverse` collection of packages. 

In a similar way to piping, it works in layers. But instead of using the pipe (`|>`) ggplot uses `+`. 

### Main features

There are three key aspects: 

1. data;
2. aesthetics / mapping; and
3. type.

For instances, let's build up a histogram of age of death with increasing complexity.

Starts with a grey box:


```r
australian_politicians |> 
  mutate(days_lived = as.integer(deathDate - birthDate)) |> 
  filter(!is.na(days_lived)) |> 
  ggplot(mapping = aes(x = days_lived))
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-54-1.png" width="672" />

We need to tell it what we want to plot. This is where `geom` comes in 


```r
australian_politicians |> 
  mutate(days_lived = as.integer(deathDate - birthDate)) |> 
  filter(!is.na(days_lived)) |> 
  ggplot(mapping = aes(x = days_lived)) +
  geom_histogram(binwidth = 365)
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-55-1.png" width="672" />

Now let's color the bars by gender, which means adding an aesthetic.


```r
australian_politicians |> 
  mutate(days_lived = as.integer(deathDate - birthDate)) |> 
  filter(!is.na(days_lived)) |> 
  ggplot(mapping = aes(x = days_lived, fill = gender)) +
  geom_histogram(binwidth = 365)
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-56-1.png" width="672" />

We can add some labels, change the color, and background. 


```r
australian_politicians |> 
  mutate(days_lived = as.integer(deathDate - birthDate)) |> 
  filter(!is.na(days_lived)) |> 
  ggplot(mapping = aes(x = days_lived, fill = gender)) +
  geom_histogram(binwidth = 365) +
  labs(title = "Length of life of Australian politicians", 
       x = "Age of deaths (days)", 
       y = "Number") +
  theme_classic() +
  scale_fill_brewer(palette = "Set1")
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-57-1.png" width="672" />

I forget who said this but, '`ggplot` makes it so easy to have nicely labelled axes, there's no real excuse not to'.


### Facets

Facets are subplots and are invaluable because they allow you to add another variable to your plot without having to make a 3D plot.


```r
australian_politicians |> 
  mutate(days_lived = as.integer(deathDate - birthDate)) |> 
  filter(!is.na(days_lived)) |> 
  ggplot(mapping = aes(x = days_lived)) +
  geom_histogram(binwidth = 365) +
  labs(title = "Length of life of Australian politicians", 
       x = "Age of deaths (days)", 
       y = "Number") +
  theme_classic() +
  scale_fill_brewer(palette = "Set1") +
  facet_wrap(~gender)
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-58-1.png" width="672" />







## Exploring the tidyverse


### Tibbles

A tibble is a data frame, but it is a data frame with some particular changes that make it easier to work with. You should read Chapter 10 of @r4ds for more detail. The main difference is that compared with a dataframe, a tibble doesn't convert strings to factors, and it prints nicely, including letting you know the class of a column.

You can make a tibble manually if you need, for instance this can be handy for simulating data, but usually we will just import data as a tibble.


```r
people <- 
  tibble(names = c("rohan", "monica"),
         website = c("rohanalexander.com", "monicaalexander.com"),
         fav_colour = c("blue", " white "),
         )
people
#> # A tibble: 2 × 3
#>   names  website             fav_colour
#>   <chr>  <chr>               <chr>     
#> 1 rohan  rohanalexander.com  "blue"    
#> 2 monica monicaalexander.com " white "
```


###  Importing data

There are a variety of ways to import data. If you are dealing with CSV files then try `read_csv()` in the first instance. There were examples of that in earlier sections. 


###  Joining data

We can join two datasets together in a variety of ways. The most common join that I use is `left_join()`, where I have one main dataset and I want to join another to it based on some common column names. Here we'll join two datasets based on favourite colour.


```r
both <- 
  simulated_data |> 
  left_join(people, by = "fav_colour")

both
#> # A tibble: 10 × 6
#>    person observation another_observation fav_colour names 
#>     <int>       <dbl>               <dbl> <chr>      <chr> 
#>  1      1     -0.360                9.52  "blue"     rohan 
#>  2      2     -0.0406               0.586 " white "  monica
#>  3      3     -1.78                 2.48  "blue"     rohan 
#>  4      4     -1.12                 5.80  " white "  monica
#>  5      5     -1.00                 5.26  "blue"     rohan 
#>  6      6      1.78                 4.09  "blue"     rohan 
#>  7      7     -1.39                 3.97  "blue"     rohan 
#>  8      8     -0.497                2.52  " white "  monica
#>  9      9     -0.558                6.29  "blue"     rohan 
#> 10     10     -0.824                8.57  "blue"     rohan 
#> # … with 1 more variable: website <chr>
```


###  Strings

We've seen a string earlier, but it is an object that is created with single or double quotes. String manipulation is an entire book in itself, but you should start with the stringr package [@citestringr].

I'll just cover a few essentials: `stringr::str_detect()`, `stringr::str_replace()`, `stringr::str_squish()`.


```r
head(people)
#> # A tibble: 2 × 3
#>   names  website             fav_colour
#>   <chr>  <chr>               <chr>     
#> 1 rohan  rohanalexander.com  "blue"    
#> 2 monica monicaalexander.com " white "

people <- 
  people |> 
  mutate(is_rohan = stringr::str_detect(names, "rohan"),
         make_howlett = stringr::str_replace(website, "alexander", "howlett"),
         fav_colour_trim = stringr::str_squish(fav_colour)
         )

head(people)
#> # A tibble: 2 × 6
#>   names  website         fav_colour is_rohan make_howlett   
#>   <chr>  <chr>           <chr>      <lgl>    <chr>          
#> 1 rohan  rohanalexander… "blue"     TRUE     rohanhowlett.c…
#> 2 monica monicaalexande… " white "  FALSE    monicahowlett.…
#> # … with 1 more variable: fav_colour_trim <chr>
```


###  Pivot

Datasets tend to be either long or wide. Generally, in the tidyverse, and certainly for ggplot, we need long data. To go from one to the other you can use the `pivot_longer()` and `pivot_wider()` functions.

Let's see an example with some data on whether red team or blue team won a competition in some year.


```r
pivot_example_data <- 
  tibble(year = c(2019, 2020, 2021),
         blue_team = c(1, 2, 1),
         red_team = c(2, 1, 2))

head(pivot_example_data)
#> # A tibble: 3 × 3
#>    year blue_team red_team
#>   <dbl>     <dbl>    <dbl>
#> 1  2019         1        2
#> 2  2020         2        1
#> 3  2021         1        2
```

This dataset is in wide format at the moment. To get it into long format, what we'd like is to have a column that specifies the team, and then another that specifies the result. We'll use `tidyr::pivot_longer`.


```r
data_pivoted_longer <- 
  pivot_example_data |> 
  tidyr::pivot_longer(cols = c("blue_team", "red_team"),
              names_to = "team",
               values_to = "position")

head(data_pivoted_longer)
#> # A tibble: 6 × 3
#>    year team      position
#>   <dbl> <chr>        <dbl>
#> 1  2019 blue_team        1
#> 2  2019 red_team         2
#> 3  2020 blue_team        2
#> 4  2020 red_team         1
#> 5  2021 blue_team        1
#> 6  2021 red_team         2
```

Occasionally, you'll need to go from long data to wide data. We accomplish this with `tidyr::pivot_wider`.


```r
data_pivoted_wider <- 
  data_pivoted_longer |> 
  tidyr::pivot_wider(id_cols = c("year", "team"),
                     names_from = "team",
                     values_from = "position")

head(data_pivoted_wider)
#> # A tibble: 3 × 3
#>    year blue_team red_team
#>   <dbl>     <dbl>    <dbl>
#> 1  2019         1        2
#> 2  2020         2        1
#> 3  2021         1        2
```


### Factors

A factor is a string that has an inherent ordering. For instance, the days of the week have an order - Monday, Tuesday, Wednesday,... - which is not alphabetical. Factors feature prominently in base, but they often add more complication than they are worth and so the tidyverse gives them a less prominent role. Nonetheless taking advantage of factors is useful in certain circumstances, for instance when plotting the days of the week we probably want them in the usual ordering than in the alphabetical ordering that would result if we had them as characters. The package that we use to deal with factors is `forcats` [@citeforcats].

Sometimes you will have a character vector and you will want it ordered in a particular way. The default is that a character vector is ordered alphabetically, but you may not want that, for instance, the days of the week would look strange on a graph if they were alphabetically ordered: Friday, Monday, Saturday, Sunday, Thursday, Tuesday, Wednesday!

The way to change the ordering is to change the variable from a character to a factor. I would then use the `forcats` package to specify an ordering by hand. The help page is here: https://forcats.tidyverse.org/reference/fct_relevel.html.

Let's look at a concrete example.


```r
my_data <- tibble(all_names = c("Rohan", "Monica", "Edward"))
```

If we plotted this then Edward would be first, because it would be alphabetical. But if instead I want to be first as I am the oldest then we could use `forcats` in the following way.


```r
library(forcats) # (BTW you'll probably have to install that one)
library(tidyverse)

my_data <-
  my_data |>
  mutate(all_names = factor(all_names), # Change to factor
         all_names_releveled = fct_relevel(all_names, "Rohan", "Monica")) # Change the levels

# Then compare the two
my_data$all_names
#> [1] Rohan  Monica Edward
#> Levels: Edward Monica Rohan
my_data$all_names_releveled
#> [1] Rohan  Monica Edward
#> Levels: Rohan Monica Edward
```




### Cases

If you need to write a few conditional statements, then `case_when` is the way to go.

Let's start with a tibble of dates and pretend that we want to group them into 'pre-1950', '1950-2000', '2000-onwards'


```r
case_when_example <- 
  tibble(some_dates = c("1909-12-31", "1919-12-31", "1929-12-31", "1939-12-31", 
                        "1949-12-31", "1959-12-31", "1969-12-31", "1979-12-31", 
                        "1989-12-31", "1999-12-31", "2009-12-31")
         )

case_when_example <- 
  case_when_example |> 
  mutate(some_dates = lubridate::ymd(some_dates)
         )

head(case_when_example)
#> # A tibble: 6 × 1
#>   some_dates
#>   <date>    
#> 1 1909-12-31
#> 2 1919-12-31
#> 3 1929-12-31
#> 4 1939-12-31
#> 5 1949-12-31
#> 6 1959-12-31
```

Now we'll use `dplyr::case_when()` to group these.


```r
case_when_example <- 
  case_when_example |> 
  mutate(year_group = 
           case_when(
             some_dates < lubridate::ymd("1950-01-01") ~ "pre-1950",
             some_dates < lubridate::ymd("2000-01-01") ~ "1950-2000",
             some_dates >= lubridate::ymd("2000-01-01") ~ "2000-onwards",
             TRUE ~ "CHECK ME"
             )
  )

head(case_when_example)
#> # A tibble: 6 × 2
#>   some_dates year_group
#>   <date>     <chr>     
#> 1 1909-12-31 pre-1950  
#> 2 1919-12-31 pre-1950  
#> 3 1929-12-31 pre-1950  
#> 4 1939-12-31 pre-1950  
#> 5 1949-12-31 pre-1950  
#> 6 1959-12-31 1950-2000
```

We could accomplish this with a series of `if_else` statements, but `case_when` is just a bit cleaner. The only thing to be aware of is that statements are evaluated in order. So as soon as something matches it doesn't continue down the list of conditions. That's why we have that catch-all at the end - if the date doesn't fit any of the earlier conditions, then we've got a problem and want to know about it.


## Dealing with errors

> When you are programming, eventually your code will break, when I say eventually, I mean like probably 10 or 20 times a day.
>
> @sharlatalks

Everyone who uses R, or any programming language for that matter, has trouble find them at some point. This is normal. We must develop strategies to work through these, including:

1. Looking at the help file for the function, by putting '?' before the function, for instance, `?pivot_wider()`.
2. Checking the class and ensuring that it is what we expect, by using the function `class()`, for instance, `class(data_set$data_column)`.
3. Looking for typos.
4. Searching for the error message, focusing especially on Stack Overflow answers.
5. Searching for what we are trying to do, being sure to include 'tidyverse' or 'in R' in the search to help make the results more appropriate.
6. Restarting R ('Session' -> 'Restart R and Clear Output') and starting again.
7. Making a small, self-contained, reproducible example 'reprex' to see if the issue can be isolated and to enable others to help.
8. Restarting your computer.

Having established the need to have a thorough plan for when things go wrong, w



## Exercises and tutorial


### Exercises

1. What is R?
    a. A open-source statistical programming language
    b. A programming language created by Guido van Rossum
    c. A closed source statistical programming language
    d. An integrated development environment (IDE)
2. What are three advantages of R? What are three disadvantages?
3. What is R Studio?
    a. An integrated development environment (IDE).
    b. A closed source paid program.
    c. A programming language created by Guido van Rossum
    d. A statistical programming language.
4. What is the class of the output of '2 + 2' (pick one)?
    a. character
    b. factor
    c. numeric
    d. date
5. Say we had run: `my_name <- 'Rohan'`. What would be the result of running `print(my_name)` (pick one)?
    a. 'Edward'
    b. 'Monica'
    c. 'Hugo'
    d. 'Rohan'
6. Say we had a dataset with two columns: 'name', and 'age'. Which verb should we use to pick just 'name' (pick one)?
    a. `tidyverse::select()`.
    b. `tidyverse::mutate()`.
    c. `tidyverse::filter()`.
    d. `tidyverse::rename()`.
7. Say we had loaded `AustralianPoliticians` and `tidyverse` and then run the following code: `australian_politicians <- AustralianPoliticians::get_auspol('all')`. How could we select all of the columns that end with 'Name' (pick one)? 
    a. `australian_politicians |> select(contains("Name"))`
    b. `australian_politicians |> select(starts_with("Name"))`
    c. `australian_politicians |> select(matches("Name"))`
    d. `australian_politicians |> select(ends_with("Name"))`
8. Under what circumstances, in terms of the names of the columns, would the use of 'contains()' potentially give different answers to using 'ends_with()' in the above question?    
6. Assume a variable called 'age' is an integer. Which line of code would create a column that is its exponential (pick one)? 
    a. `mutate(exp_age = exponential(age))`
    b. `mutate(exp_age = exponent(age))`
    c. `mutate(exp_age = exp(age))`
    d. `mutate(exp_age = expon(age))`
9. Assume a column called 'age'. Which line of code could create a column that contains the value from five rows above?
    a. `mutate(five_before = lag(age))`
    b. `mutate(five_before = lead(age))`
    c. `mutate(five_before = lag(age, n = 5))`
    d. `mutate(five_before = lead(age, n = 5))`
10. Which of the following are not tidyverse verbs (pick one)? 
    a. `select()`.
    b. `filter()`.
    c. `arrange()`.
    d. `mutate()`.
    e. `visualize()`.
11. If I wanted to make a new column which verb should I use (pick one)? 
    a. `select()`.
    b. `filter()`.
    c. `arrange()`.
    d. `mutate()`.
    e. `visualize()`.
12. If I wanted to focus on particular rows which verb should I use (pick one)? 
    a. `select()`.
    b. `filter()`.
    c. `arrange()`.
    d. `mutate()`.
    e. `summarise()`
13. If I wanted a summary of the data that gave me the mean by sex, which two verbs should I use (pick one)? 
    a. `summarise()`.
    b. `filter()`.
    c. `arrange()`.
    d. `mutate()`.
    e. `group_by()`.
14. Assume a variable called age is an integer. Which line of code would create a column that is its exponential?
    a. mutate(exp_age = exponential(age))
    b. mutate(exp_age = exponent(age))
    c. mutate(exp_age = exp(age))
    d. mutate(exp_age = expon(age))
15. Assume a column called age, and I want to create a column that contains the value from five rows above. Which line of code would create a column that is its exponential?
    a. mutate(five_before = lag(age))
    b. mutate(five_before = lead(age))
    c. mutate(five_before = lag(age, n = 5))
    d. mutate(five_before = lead(age, n = 5))
16. What are the three key aspects of the grammar of graphics (select all)? 
    a. data.
    b. aesthetics.
    c. type.
    d. geom_histogram().
17. What is not one of the four challenges for mitigating bias mentioned in @hao2019 (pick one)? 
    a. Unknown unknowns. 
    b. Imperfect processes. 
    c. The definitions of fairness. 
    d. Lack of social context. 
    e. Disinterest given profit considerations.
18. What would be the output of `class('edward')` (pick one)? 
    a. 'numeric'. 
    b. 'character'.
    c. 'data.frame'.
    d. 'vector'.
19. How can I simulate 10,000 draws from a normal distribution with a mean of 27 and a standard deviation of 3 (pick one)? 
    a. `rnorm(10000, mean = 27, sd = 3)`. 
    b. `rnorm(27, mean = 10000, sd = 3)`. 
    c. `rnorm(3, mean = 10000, sd = 27)`. 
    d. `rnorm(27, mean = 3, sd = 1000)`.     

### Tutorial

Listen to Gladwell and then rank sports teams or other departments or something else of interest to you based on at least three variables and one of which is peer thoughts. 
