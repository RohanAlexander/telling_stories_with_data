



# R essentials

**Required material**

- Read *The Kitchen Counter Observatory*, [@kieranskitchen]
- Read *R for Data Science*, Chapter 5 'Data transformation', [@r4ds]
- Read *Data Feminism*, Chapter 6 'The Numbers Don't Speak for Themselves', [@datafeminism2020]


**Key concepts and skills**

- Understanding foundational aspects of R and R Studio.
- Being able to use key `dplyr` verbs.
- Know fundamentals of class and how to manipulate it.
- Ability to simulate data.
- Ability to make graphs in `ggplot2`.
- Comfort with other aspects of the `tidyverse` including importing data, dataset manipulation, string manipulation, and factors.
- Develop strategies for when things do not work.

**Key libraries**

- `forcats` [@citeforcats]
- `ggplot2` [@citeggplot]
- `haven` [@citehaven]
- `stringr` [@citestringr]
- `tidyr` [@citetidyr]
- `tidyverse` [@citetidyverse]

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
- `rnorm()`
- `round()`
- `runif()`
- `sample()`
- `set.seed()`
- `stringr::str_detect()`
- `stringr::str_replace()`
- `stringr::str_squish()`
- `sum()`
- `tibble::tibble()`
- `tidyr::pivot_longer()`
- `tidyr::pivot_wider()`



## Background

In this chapter we focus on foundational skills needed to use the statistical programming language R [@citeR] to tell stories with data. Some of it may not make sense at first, but these are skills and approaches that we will often use. You should initially just go through this chapter quickly, noting aspects that you do not understand. And then come back to this chapter from time to time as you continue through the rest of the book. That way you will see how the various bits fit into context.

R is an open-source language for statistical programming. You can download R for free from the Comprehensive R Archive Network (CRAN): https://cran.r-project.org. R Studio is an Integrated Development Environment (IDE) for R which makes the language easier to use and can be downloaded for free: https://www.rstudio.com/products/rstudio/.

The past ten years or so, have been characterized by the increased use of the `tidyverse`. This is '...an opinionated collection of R packages designed for data science. All packages share an underlying design philosophy, grammar, and data structures' [@tidyversewebsite]. There are three distinctions to be clear about: the original R language, typically referred to as 'base'; the 'tidyverse' which is a coherent collection of packages that build on top of base, and other packages. 

Essentially everything that we can do in the tidyverse, we can also do in base. But, as the `tidyverse` was built especially for data science it is often easier to use the tidyverse, especially when learning. Additionally, often everything that we can do in the tidyverse, we can also do with other packages. But, as the `tidyverse` is a coherent collection of packages, it is often easier to use the tidyverse, again, especially when learning. Eventually there are cases where it makes sense to trade-off the convenience and coherence of the `tidyverse` for some features of base or other packages. Indeed, we will see that at various points later in this book. For instance, the `tidyverse` can be slow, and so if one needs to import thousands of CSVs then it can make sense to switch away from `read_csv()`. The appropriate use of base and non-tidyverse packages, or even other languages, rather than dogmatic insistence on a particular solution, is a sign of intellectual maturity.

Central to our use of the statistical programming language R is data, and most of the data that we use will have humans at the heart of it. Sometimes, dealing with human-centered data in this way can have a numbing effect, results in over-generalization, and potentially problematic work. Another sign of intellectual maturity is when it has the opposite effect.

> In practice, I find that far from distancing you from questions of meaning, quantitative data forces you to confront them. The numbers draw you in. Working with data like this is an unending exercise in humility, a constant compulsion to think through what you can and cannot see, and a standing invitation to understand what the measures really capture---what they mean, and for whom. 
>
> @kieranskitchen





## Broader impacts

> "We shouldn't have to think about the societal impact of our work because it's hard and other people can do it for us" is a really bad argument. I stopped doing CV [computer vision] research because I saw the impact my work was having. I loved the work but the military applications and privacy concerns eventually became impossible to ignore. But basically all facial recognition work would not get published if we took Broader Impacts sections seriously. There is almost no upside and enormous downside risk. To be fair though i should have a lot of humility here. For most of grad school I bought in to the myth that science is apolitical and research is objectively moral and good no matter what the subject is.
> 
> Joe Redmon, 20 February 2020


Although the term 'data science' is ubiquitous in academia, industry, and even more generally, it is difficult to define. One deliberately antagonistic definition of data science is '[t]he inhumane reduction of humanity down to what can be counted' [@keyes2019]. While purposefully controversial, this definition highlights one reason for the increased demand for data science and quantitative methods over the past decade---individuals and their behavior are now at the heart of it. Many of the techniques have been around for many decades, but what makes them popular now is this human focus. 

Unfortunately, even though much of the work may be focused on individuals, issues of privacy and consent, and ethical concerns more broadly, rarely seem front of mind. While there are some exceptions, in general, even at the same time as claiming that AI, machine learning, and data science are going to revolutionize society, consideration of these types of issues appears to have been largely treated as something that would be nice to have, rather than something that we may like to think of before we embrace the revolution.

For the most part, these types of issues are not new. In the sciences, there has been considerable recent ethical consideration around CRISPR technology and gene editing [@brokowski2019crispr], but in an earlier time similar conversations were had, for instance, about Wernher von Braun being allowed to building rockets for the US [@neufeld2002wernher]. In medicine, of course, these concerns have been front-of-mind for some time [@american1848code]. Data science seems determined to have its own Tuskegee-moment rather than think about, and proactively deal appropriately with, these issues, based on the experiences of other fields.

That said, there is some evidence that data scientists are beginning to be more concerned about the ethics surrounding the practice. For instance, NeurIPS, a prestigious machine learning conference, has required a statement on ethics to accompany all submissions since 2020.

> In order to provide a balanced perspective, authors are required to include a statement of the potential broader impact of their work, including its ethical aspects and future societal consequences. Authors should take care to discuss both positive and negative outcomes.
>
> NeurIPS 2020 Conference Call For Papers

The purpose of ethical consideration and concern for the broader impact of data science is not to prescriptively rule things in or out, but to provide an opportunity to raise some issues that should be paramount. The variety of data science applications, the relative youth of the field, and the speed of change, mean that such considerations are sometimes knowingly set aside, and this is acceptable to the rest of the field. This contrasts with fields such as science, medicine, engineering, and accounting. Possibly those fields are more self-aware (Figure \@ref(fig:personalprobability)).

<div class="figure" style="text-align: center">
<img src="figures/probability.png" alt="Probability, from XKCD" width="90%" />
<p class="caption">(\#fig:personalprobability)Probability, from XKCD</p>
</div>




## R, R Studio, and R Studio Cloud

R and R Studio are complementary, but they are not the same thing. Liza Bolton, Assistant Professor, Teaching Stream, University of Toronto explains their relationship by analogy where R is like the engine and R Studio is like the car. Although some of us use a car engine directly, most of us use a car to interact with the engine.

### R

R -- https://www.r-project.org/ -- is an open-source and free programming language that is focused on general statistics. Free in this context does not refer to a price of zero, but instead to the freedom that the creators give users to largely do what they want with it, although it also does have a price of zero. This is in contrast with an open-source programming language that is designed for general purpose, such as Python, or an open-source programming language that is focused on probability, such as Stan. It was created by Ross Ihaka and Robert Gentleman at the University of Auckland in the 1990s, and traces its provenance to S, which was developed at Bell Labs in the 1970s. It is maintained by the R Core Team and changes to this 'base' of code occur methodically and with concern given to a variety of different priorities.

Many people build on this stable base, to extend the capabilities of R to better and more quickly suit their needs. They do this by creating packages. Typically, although not always, a package is a collection of R code, mostly functions, and this allows us to more easily do things that we want to do. These packages are managed by repositories such as CRAN and Bioconductor. 

If you want to use a package then you first need to install it on your computer, and then you need to load it when you want to use it. Di Cook, Professor of Business Analytics at Monash University, describes this as analogous to a lightbulb. If you want light in your house, first you need to fit a lightbulb, and then you need to turn the switch on. Installing a package, say, `install.packages("tidyverse")`, is akin to fitting a lightbulb into a socket---you only need to do this once for each lightbulb. But then each time you want light you need to turn on the switch to the lightbulb, which in the R packages case, means calling the library, say, `library(tidyverse)`. 

To install a package on your computer (again, we will need to do this only once per computer) we use `install.packages()`.


```r
install.packages("tidyverse")
```

And then when we want to use the package, we use `library()`.


```r
library(tidyverse)
```

Having downloaded it, we can open R and use it directly. It is primarily designed to be interacted with through the command line. While this is functional, it can be useful to have a richer environment than the command line provides. In particular, it can be useful to install an Integrated Development Environment (IDE), which is an application that brings together various bits and pieces that will be used often. One common IDE for R is R Studio, although others such as Visual Studio are also used.

### R Studio

R Studio is distinct to R, and they are different entities. R Studio builds on top of R to make it easier to use R. This is in the same way that one could use the internet from the command line, but most folks use a browser such as Chrome, Firefox, or Safari.

R Studio is free in the sense that we do not pay for it. It is also free in the sense of being able to take the code, modify it, and distribute that code. But it is important to recognize that R Studio is a company and so it is possible that the current situation could change. It can be downloaded: https://www.rstudio.com/products/rstudio/.

When we open R Studio it will look like Figure \@ref(fig:first).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/01-03_r_essentials/01.png" alt="Opening R Studio for the first time" width="100%" />
<p class="caption">(\#fig:first)Opening R Studio for the first time</p>
</div>

The left pane is a console in which you can type and execute R code line by line. Try it with 2+2 by clicking next to the prompt '>', typing '2+2', and then pressing 'return/enter'.


```r
2 + 2
#> [1] 4
```

The pane on the top right has information about your environment. For instance, when we create variables a list of their names and some properties will appear there. Try to type the following code, replacing my name with your name, next to the prompt, and again press enter:


```r
my_name <- "Rohan"
```

You should notice a new value in the environment pane with the variable name and its value. 

The pane in the bottom right is a file manager. At the moment it should just have two files: an R History file and a R Project file. We will get to what these are later, but for now we will create and save a file.

Run the following code, without worrying too much about the details for now. And you should see a new '.rds' file in your list of files.


```r
saveRDS(object = my_name, file = "my_first_file.rds")
```

### R Studio Cloud

While you can and should download R Studio to your own computer, initially we will use R Studio Cloud: https://rstudio.cloud/. This is an online version that is provided by R Studio. We will use this so that you can focus on getting comfortable with R and R Studio in an environment that is consistent. This way you do not have to worry about what computer you have or installation permissions, amongst other things.

The free version of R Studio Cloud is free as is 'no financial cost'. The trade-off is that it is not very powerful, and it is sometimes slow, but for the purposes of getting started it is enough.


## Getting started

We will now start going through some code. It is important to actively write this all out yourself.

While working line-by-line in the console is fine, it is easier to write out a whole script that can then be run. We will do this by making an R Script ('File' -> 'New File' -> 'R Script'). The console pane will fall to the bottom left and an R Script will open in the top left. We will write some code that will get all of the Australian federal politicians and then construct a small table about the genders of the prime ministers. Some of this code will not make sense at this stage, but just type it all out to get in the habit and then run it. To run the whole script, we can click 'Run' or we can highlight certain lines and then click 'Run' to just run those lines.


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

The idea of the pipe is that we take a dataset, and then do something to it. We used this in the earlier example. Another example follows where we will look at the first six lines of a dataset by piping it to `head()`. Notice that `head()` does not explicitly take any arguments in this example. It knows which data to display because the pipe does it implicitly.


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

We can save this R Script as 'my_first_r_script.R' ('File' -> 'Save As'). At this point, our workspace should look something like Figure \@ref(fig:third).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/01-03_r_essentials/03.png" alt="After running an R Script" width="100%" />
<p class="caption">(\#fig:third)After running an R Script</p>
</div>

One thing to be aware of is that each R Studio Cloud workspace is essentially a new computer. Because of this, we need to install any package that we want to use for each workspace. For instance, before we can use the `tidyverse`, we need to install it with `install.packages("tidyverse")`. This contrasts with using one's own computer.

A few final notes on R Studio Cloud:

1. In the Australian politician's example, we got our data from the website GitHub using an R package, but we can get data into a workspace from a local computer in a variety of ways. One way is to use the 'upload' button in the 'Files' panel.
2. R Studio Cloud allows some degree of collaboration. For instance, you can give someone else access to a workspace that you create. This could be useful for collaborating on an assignment, although it is not quite full featured yet and you cannot both be in the workspace at the same time, in contrast to, say, Google Docs.
3. There are a variety of weaknesses of R Studio Cloud, in particular the RAM limits. Additionally, like any web application, things break from time to time or go down.


## The `dplyr` verbs

One of the key packages that we will use is the `tidyverse` [@tidyverse]. The `tidyverse` is actually a package of packages, which means when we install the `tidyverse`, we actually install a whole bunch of different packages. The key package in the `tidyverse` in terms of manipulating data is `dplyr` [@citedplyr].

There are five `dplyr` functions that are regularly used, and we will now go through each of these. These are commonly referred to as the `dplyr` verbs.

1. `select()`
2. `filter()`
3. `arrange()`
4. `mutate()`
5. `summarise()` or equally `summarize()`

We will also cover `group_by()`, and `count()` here as they are closely related.

As we have already installed the `tidyverse`, we just need to load it.


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

In R, there are many ways to do things. Sometimes these are different ways to do the same thing, and other times they are different ways to do almost the same thing. For instance, another way to pick a particular column of a dataset is to use the 'extract' operator '$'. This is from base, as opposed to `select()` which is from the `tidyverse`.


```r
australian_politicians$firstName |> 
  head()
#> [1] "Richard"   "Percy"     "Macartney" "Charles"  
#> [5] "Joseph"    "Anthony"
```

The two appear similar---both pick the 'firstName' column---but they differ in the class of what they return. For the sake of completeness, if we combine `select()` with `pull()` then we get the same class of output as if we had used the extract operator.


```r
australian_politicians |> 
  select(firstName) |> 
  pull() |> 
  head()
#> [1] "Richard"   "Percy"     "Macartney" "Charles"  
#> [5] "Joseph"    "Anthony"
```

We can also use `select()` to remove columns, by negating the column name.


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

Finally, we can `select()` based on conditions. For instance, we can `select()` all of the columns that start with, say, 'birth'.


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

There are a variety of similar 'selection helpers' including `starts_with()`, `ends_with()`, and `contains()`. More information about these is available in the help page for `select()` which can be accessed by running `?select()`.

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

australian_politicians |> head()
#> # A tibble: 6 × 10
#>   uniqueID   surname firstName gender birthDate  birthYear
#>   <chr>      <chr>   <chr>     <chr>  <date>         <dbl>
#> 1 Abbott1859 Abbott  Richard   male   NA              1859
#> 2 Abbott1869 Abbott  Percy     male   1869-05-14        NA
#> 3 Abbott1877 Abbott  Macartney male   1877-07-03        NA
#> 4 Abbott1886 Abbott  Charles   male   1886-01-04        NA
#> 5 Abbott1891 Abbott  Joseph    male   1891-10-18        NA
#> 6 Abbott1957 Abbott  Anthony   male   1957-11-04        NA
#> # … with 4 more variables: deathDate <date>, member <dbl>,
#> #   senator <dbl>, wasPrimeMinister <dbl>
```

### `filter()`

We use `filter()` to pick particular rows of a dataset. For instance, we might be only interested in politicians that became prime minister.


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

We could also give `filter()` two conditions. For instance, we could look at politicians that become prime minister and were named Joseph, using the 'and' operator '&'.


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

We get the same result if we use a comma instead of an ampersand.


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

Similarly, we could look at politicians who were named, say, Myles or Ruth using the 'or' operator '|'


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

There is also a dedicated function to do this, which is `slice()`.


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

We use `arrange()` to change the order of the dataset based on the values of particular columns. For instance, we could arrange the politicians by their birthday.


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

We could achieve the same result by piping between two instances of `arrange()`.


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

A nice way to arrange by a variety of columns is to use `across()`. It enables us to use the 'selection helpers' such as `starts_with()` that were mentioned in association with `select()`.


```r
australian_politicians |> 
  arrange(across(c(firstName, birthYear))) |> 
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
  arrange(across(starts_with('birth'))) |> 
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

We use `mutate()` when we want to make a new column. For instance, perhaps we want to make a new column that is 1 if a person was both a member and a senator and 0 otherwise. That is to say that our new column would denote politicians that served in both the upper and the lower house.


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

We could use `mutate()` with math, such as addition and subtraction. For instance, we could calculate the age that the politicians are (or would have been) in 2022.


```r
australian_politicians <- 
  australian_politicians |> 
  mutate(age = 2022 - lubridate::year(birthDate))

australian_politicians |> 
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
australian_politicians |> 
  select(uniqueID, age) |> 
  mutate(log_age = log(age)) |> 
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

australian_politicians |> 
  select(uniqueID, age) |> 
  mutate(lead_age = lead(age)) |> 
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

australian_politicians |> 
  select(uniqueID, age) |> 
  mutate(lag_age = lag(age)) |> 
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

australian_politicians |> 
  select(uniqueID, age) |> 
  filter(!is.na(age)) |> 
  mutate(cumulative_age = cumsum(age)) |> 
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

As we have in earlier examples, we can also use `mutate()` in combination with `across()`. This includes the potential use of the selection helpers. For instance, we could count the number of characters in both the first and last names at the same time.


```r
australian_politicians |> 
  mutate(across(c(firstName, surname), str_count)) |> 
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


Finally, we use `case_when()` when we need to make a new column on the basis of more than two conditional statements. For instance, we may have some years and want to group them into decades.


```r
australian_politicians |> 
  mutate(year_of_birth = lubridate::year(birthDate),
         decade_of_birth = 
           case_when(
             year_of_birth <= 1929 ~ "pre-1930",
             year_of_birth <= 1939 ~ "1930s",
             year_of_birth <= 1949 ~ "1940s",
             year_of_birth <= 1959 ~ "1950s",
             year_of_birth <= 1969 ~ "1960s",
             year_of_birth <= 1979 ~ "1970s",
             year_of_birth <= 1989 ~ "1980s",
             TRUE ~ "Unknown or error"
             )
  ) |> 
  select(uniqueID, year_of_birth, decade_of_birth)
#> # A tibble: 1,783 × 3
#>    uniqueID   year_of_birth decade_of_birth 
#>    <chr>              <dbl> <chr>           
#>  1 Abbott1859            NA Unknown or error
#>  2 Abbott1869          1869 pre-1930        
#>  3 Abbott1877          1877 pre-1930        
#>  4 Abbott1886          1886 pre-1930        
#>  5 Abbott1891          1891 pre-1930        
#>  6 Abbott1957          1957 1950s           
#>  7 Abel1939            1939 1930s           
#>  8 Abetz1958           1958 1950s           
#>  9 Adams1943           1943 1940s           
#> 10 Adams1951           1951 1950s           
#> # … with 1,773 more rows
```

We could accomplish this with a series of `if_else()` statements, but `case_when()` is more clear. The cases are evaluated in order and as soon as there is a match `case_when()` does not continue to the remainder of the cases. So it can be useful to have a catch-all at the end that will signal if there is a potential issue that we might like to know about.




### `summarise()`

We use `summarise()` when we would like to make new, condensed, summary variables. For instance, perhaps we would like to know the minimum, average, and maximum of some column. 


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

As an aside, `summarise()` and `summarize()` are equivalent and we can use either.


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

By default, `summarise()` will provide one row of output for a whole dataset. For instance, in the earlier example we found the youngest, oldest, and average across all politicians. However, we can create more groups in our dataset using `group_by()`. And we can then apply another function within the context of those groups. We could use many functions on the basis of groups, but the `summarise()` function is particularly powerful in conjunction with `group_by()`. For instance, we could group by gender, and then get age-based summary statistics.


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

We can use `group_by()` on the basis of more than one group. For instance, we could look at the average number of days lived by gender and by house.


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

We can use `count()` to create counts by groups. For instance, the number of politicians by gender.


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

In addition to the `count()`, we could make a proportion.


```r
australian_politicians |> 
  group_by(gender) |> 
  count() |> 
  ungroup() |> 
  mutate(proportion = n/(sum(n)))
#> # A tibble: 2 × 3
#>   gender     n proportion
#>   <chr>  <int>      <dbl>
#> 1 female   240      0.135
#> 2 male    1543      0.865
```

Using `count()` is essentially the same as using `group_by()` and then `summarise()`, and we get the same result in that way.


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
  add_count() |> 
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

While the `tidyverse` was established relatively recently to help with data science, R existed long before this. There is a host of functionality that is built into R especially around the core needs of programming and statisticians.

In particular, we will cover:

1. `class()`
2. data simulation
3. `function()`, `for()`, and `apply()`

There is no need to install any additional packages, as this functionality comes with R.

### `class()`

In everyday usage 'a, b, c, ...' are letters and '1, 2, 3,...' are numbers. And we use letters and numbers differently, for instance we do not add letters. Similarly, R needs to have some way of distinguishing different classes of content. And to define the properties that each class has, 'how it behaves, and how it relates to other types of objects' [@advancedr].

Classes have a hierarchy. For instance, we are 'human', which is itself 'animal'. All 'humans' are 'animals', but not all 'animals' are 'humans'. Similarly, all integers are numbers, but not all numbers are integers. We can find out the class of an object in R with `class()`. 


```r
a_number <- 8
class(a_number)
#> [1] "numeric"

a_letter <- "a"
class(a_letter)
#> [1] "character"
```

The classes that we cover here are 'numeric', 'character', 'factor', 'date', and 'data.frame'.

The first thing to know is that, in the same way that a frog can become a prince, we can sometimes change the class of an object in R. For instance, we could start with a 'numeric', change it to a 'character' with `as.character()`, and then a 'factor' with `as.factor()`. But if we tried to make it into a date with `as.Date()` we would get an error because no all numbers have the properties that are needed to be a date.


```r
a_number <- 8
a_number
#> [1] 8
class(a_number)
#> [1] "numeric"

a_number <- as.character(a_number)
a_number
#> [1] "8"
class(a_number)
#> [1] "character"

a_number <- as.factor(a_number)
a_number
#> [1] 8
#> Levels: 8
class(a_number)
#> [1] "factor"
```

Compared with 'numeric' and 'character' classes, the 'factor' class might be less familiar. A 'factor' is used for categorical data that can only take certain values  [@advancedr]. For instance, typical usage of a factor variable would be a binary, such as 'day' or 'night'. It is also often used for age-groups, such as '18-29', '30-44', '45-60', '60+' (as opposed to age, which would often be a 'numeric'); and sometimes for level of education: 'less than high school', 'high school', 'college', 'undergraduate degree', 'postgraduate degree'. We can find the allowed levels for a 'factor' using `levels()`.


```r
age_groups <- factor(
  c('18-29', '30-44', '45-60', '60+')
)
age_groups
#> [1] 18-29 30-44 45-60 60+  
#> Levels: 18-29 30-44 45-60 60+
class(age_groups)
#> [1] "factor"
levels(age_groups)
#> [1] "18-29" "30-44" "45-60" "60+"
```

Dates are an especially tricky class and quickly become complicated. Nonetheless, at a foundational level, we can use `as.Date()` to convert a character that looks like a date into an actual date. This enables us to, say, perform addition and subtraction, when we would not be able to do that with a character.


```r
looks_like_a_date_but_is_not <- "2022-01-01"
looks_like_a_date_but_is_not
#> [1] "2022-01-01"
class(looks_like_a_date_but_is_not)
#> [1] "character"
is_a_date <- as.Date(looks_like_a_date_but_is_not)
is_a_date
#> [1] "2022-01-01"
class(is_a_date)
#> [1] "Date"
is_a_date + 3
#> [1] "2022-01-04"
```

The final class that we discuss here is 'data.frame'. This looks like a spreadsheet and is commonly used to store the data that we will analyze. Formally, 'a data frame is a list of equal-length vectors' [@advancedr]. It will have column and row names which we can see using `colnames()` and `rownames()`, although often the names of the rows are just numbers.

To illustrate this, we use the 'ResumeNames' dataset from `AER` [@citeaer]. This package can be installed in the same way as any other package from CRAN. This dataset comprises cross-sectional data about resume content, especially the name used on the resume, and associated information about whether the candidate received a call-back for 4,870 fictitious resumes. The dataset was created by @bertrand2004emily who sent fictitious resumes in response to job advertisements in Boston and Chicago that differed in whether the resume was assigned a 'very African American sounding name or a very White sounding name'. They found considerable discrimination whereby 'White names receive 50 percent more callbacks for interviews'. 


```r
install.packages("AER")
```


```r
library(AER)
data("ResumeNames", package = "AER")
```


```r
ResumeNames |> 
  head()
#>      name gender ethnicity quality call    city jobs
#> 1 Allison female      cauc     low   no chicago    2
#> 2 Kristen female      cauc    high   no chicago    3
#> 3 Lakisha female      afam     low   no chicago    1
#> 4 Latonya female      afam    high   no chicago    4
#> 5  Carrie female      cauc    high   no chicago    3
#> 6     Jay   male      cauc     low   no chicago    2
#>   experience honors volunteer military holes school email
#> 1          6     no        no       no   yes     no    no
#> 2          6     no       yes      yes    no    yes   yes
#> 3          6     no        no       no    no    yes    no
#> 4          6     no       yes       no   yes     no   yes
#> 5         22     no        no       no    no    yes   yes
#> 6          6    yes        no       no    no     no    no
#>   computer special college minimum equal     wanted
#> 1      yes      no     yes       5   yes supervisor
#> 2      yes      no      no       5   yes supervisor
#> 3      yes      no     yes       5   yes supervisor
#> 4      yes     yes      no       5   yes supervisor
#> 5      yes      no      no    some   yes  secretary
#> 6       no     yes     yes    none   yes      other
#>   requirements reqexp reqcomm reqeduc reqcomp reqorg
#> 1          yes    yes      no      no     yes     no
#> 2          yes    yes      no      no     yes     no
#> 3          yes    yes      no      no     yes     no
#> 4          yes    yes      no      no     yes     no
#> 5          yes    yes      no      no     yes    yes
#> 6           no     no      no      no      no     no
#>                           industry
#> 1                    manufacturing
#> 2                    manufacturing
#> 3                    manufacturing
#> 4                    manufacturing
#> 5 health/education/social services
#> 6                            trade
class(ResumeNames)
#> [1] "data.frame"
colnames(ResumeNames)
#>  [1] "name"         "gender"       "ethnicity"   
#>  [4] "quality"      "call"         "city"        
#>  [7] "jobs"         "experience"   "honors"      
#> [10] "volunteer"    "military"     "holes"       
#> [13] "school"       "email"        "computer"    
#> [16] "special"      "college"      "minimum"     
#> [19] "equal"        "wanted"       "requirements"
#> [22] "reqexp"       "reqcomm"      "reqeduc"     
#> [25] "reqcomp"      "reqorg"       "industry"
```

We can examine the class of the vectors, i.e. the columns, that make-up a data frame by specifying the column name.


```r
class(ResumeNames$name)
#> [1] "factor"
class(ResumeNames$jobs)
#> [1] "integer"
```

Sometimes it is helpful to be able to change the classes of many columns at once. We can do this by using `mutate()` and `across()`.


```r
class(ResumeNames$name)
#> [1] "factor"
class(ResumeNames$gender)
#> [1] "factor"
class(ResumeNames$ethnicity)
#> [1] "factor"

ResumeNames |>
  mutate(across(c(name, gender, ethnicity), as.character)) |>
  head()
#>      name gender ethnicity quality call    city jobs
#> 1 Allison female      cauc     low   no chicago    2
#> 2 Kristen female      cauc    high   no chicago    3
#> 3 Lakisha female      afam     low   no chicago    1
#> 4 Latonya female      afam    high   no chicago    4
#> 5  Carrie female      cauc    high   no chicago    3
#> 6     Jay   male      cauc     low   no chicago    2
#>   experience honors volunteer military holes school email
#> 1          6     no        no       no   yes     no    no
#> 2          6     no       yes      yes    no    yes   yes
#> 3          6     no        no       no    no    yes    no
#> 4          6     no       yes       no   yes     no   yes
#> 5         22     no        no       no    no    yes   yes
#> 6          6    yes        no       no    no     no    no
#>   computer special college minimum equal     wanted
#> 1      yes      no     yes       5   yes supervisor
#> 2      yes      no      no       5   yes supervisor
#> 3      yes      no     yes       5   yes supervisor
#> 4      yes     yes      no       5   yes supervisor
#> 5      yes      no      no    some   yes  secretary
#> 6       no     yes     yes    none   yes      other
#>   requirements reqexp reqcomm reqeduc reqcomp reqorg
#> 1          yes    yes      no      no     yes     no
#> 2          yes    yes      no      no     yes     no
#> 3          yes    yes      no      no     yes     no
#> 4          yes    yes      no      no     yes     no
#> 5          yes    yes      no      no     yes    yes
#> 6           no     no      no      no      no     no
#>                           industry
#> 1                    manufacturing
#> 2                    manufacturing
#> 3                    manufacturing
#> 4                    manufacturing
#> 5 health/education/social services
#> 6                            trade

class(ResumeNames$name)
#> [1] "factor"
class(ResumeNames$gender)
#> [1] "factor"
class(ResumeNames$ethnicity)
#> [1] "factor"
```

There are many ways for code to not run but having an issue with the class is always among the first things to check. Common issues are variables that we think should be 'character' or 'numeric', actually being 'factor'. And variables that we think should be 'numeric' actually being 'character'.

### Simulating data

Simulating data is a key skill for telling believable stories with data. In order to simulate data, we need to be able to randomly draw from statistical distributions and other collections. R has a variety of functions to make this easier, including: the normal distribution, `rnorm()`; the uniform distribution, `runif()`; the Poisson distribution, `rpois`; the binomial distribution, `rbinom`; and many others. To randomly sample from a collection of items, we can use `sample()`. 

When dealing with randomness, the need for reproducibility makes it important, paradoxically, that the randomness is repeatable. That is to say, another person needs to be able to draw the random numbers that we draw. We do this by setting a seed for our random draws using `set.seed()`.

We could get observations from the standard normal distribution and put the those into a data frame.


```r
set.seed(853)

number_of_observations <- 5

simulated_data <- 
  data.frame(
    person = c(1:number_of_observations),
    std_normal_observations = rnorm(n = number_of_observations,
                                    mean = 0,
                                    sd = 1)
    )

simulated_data
#>   person std_normal_observations
#> 1      1             -0.35980342
#> 2      2             -0.04064753
#> 3      3             -1.78216227
#> 4      4             -1.12242282
#> 5      5             -1.00278400
```

We could then add draws from the uniform, Poisson, and binomial distributions, using `cbind()` to bring the columns of the original dataset and the new one together. 


```r
simulated_data <-
  data.frame(
    uniform_observations = 
      runif(n = number_of_observations, min = 0, max = 10),
    poisson_observations = 
      rpois(n = number_of_observations, lambda = 100),
    binomial_observations = 
      rbinom(n = number_of_observations, size = 2, prob = 0.5)
  ) |>
  cbind(simulated_data)

simulated_data
#>   uniform_observations poisson_observations
#> 1            9.6219155                   81
#> 2            7.2269016                   91
#> 3            0.8252921                   84
#> 4            1.0379810                  100
#> 5            3.0942004                   97
#>   binomial_observations person std_normal_observations
#> 1                     2      1             -0.35980342
#> 2                     1      2             -0.04064753
#> 3                     1      3             -1.78216227
#> 4                     1      4             -1.12242282
#> 5                     1      5             -1.00278400
```

Finally, we will add a favorite color to each observation with `sample()`.


```r
simulated_data <- 
  data.frame(
    favorite_color = sample(x = c("blue", " white "), 
                             size = number_of_observations,
                             replace = TRUE)
    ) |>
  cbind(simulated_data)

simulated_data
#>   favorite_color uniform_observations poisson_observations
#> 1           blue            9.6219155                   81
#> 2           blue            7.2269016                   91
#> 3           blue            0.8252921                   84
#> 4         white             1.0379810                  100
#> 5           blue            3.0942004                   97
#>   binomial_observations person std_normal_observations
#> 1                     2      1             -0.35980342
#> 2                     1      2             -0.04064753
#> 3                     1      3             -1.78216227
#> 4                     1      4             -1.12242282
#> 5                     1      5             -1.00278400
```

We set the option 'replace' to 'TRUE' because we are only choosing between two items, but each time we choose we want the possibility that either are chosen. Depending on the simulation we may need to think about whether 'replace' should be 'TRUE' or 'FALSE'. Another useful optional argument in `sample()` is to adjust the probability with which each item is drawn. The default is that all options are equally likely, but we could specify particular probabilities if we wanted to with 'prob'. As always with functions, we can find more in the help file, for instance `?sample`.






### `function()`, `for()`, and `apply()`

R 'is a functional programming language' [@advancedr]. This means that we foundationally write, use, and compose functions, which are collections of code that accomplish something specific. 

There are a lot of functions in R that other people have written, and we can use. Almost any common statistical or data science task that we might need to accomplish likely already has a function that has been written by someone else and made available to us, either as part of the base R installation or a package. But we will need to write our own functions from time to time, especially for more-specific tasks. 
We define a function using `function()`, and then assign a name. We will likely need to include some inputs and outputs for the function. Inputs are specified between round brackets. The specific task that the function is to accomplish goes between braces.


```r
print_names <- function(some_names) {
  print(some_names)
}

print_names(c("rohan", "monica"))
#> [1] "rohan"  "monica"
```

We can specify defaults for the inputs in case the person using the function does not supply them.


```r
print_names <- function(some_names = c("edward", "hugo")) {
  print(some_names)
}

print_names()
#> [1] "edward" "hugo"
```

One common scenario is that we want to apply a function multiple times. Like many programming languages, we can use a `for()` loop for this. The look of a `for()` loop in R is similar to `function()`, in that we define what we are iterating over in the round brackets, and the function to apply in braces.


```r
for (i in 1:3) {
  print(i)
}
#> [1] 1
#> [1] 2
#> [1] 3
```


```r
x <- cbind(x1 = 66, x2 = c(4:1, 2:5))
dimnames(x)[[1]] <- letters[1:8]
class(x)
#> [1] "matrix" "array"
apply(x, 2, mean, trim = .2)
#> x1 x2 
#> 66  3
```

Because R is a programming language that is focused on statistics, we are often interested in arrays or matrices. We us `apply()` to apply a function to rows ('MARGIN = 1') or columns ('MARGIN = 2').


```r
simulated_data
#>   favorite_color uniform_observations poisson_observations
#> 1           blue            9.6219155                   81
#> 2           blue            7.2269016                   91
#> 3           blue            0.8252921                   84
#> 4         white             1.0379810                  100
#> 5           blue            3.0942004                   97
#>   binomial_observations person std_normal_observations
#> 1                     2      1             -0.35980342
#> 2                     1      2             -0.04064753
#> 3                     1      3             -1.78216227
#> 4                     1      4             -1.12242282
#> 5                     1      5             -1.00278400
apply(X = simulated_data, MARGIN = 2, FUN = unique)
#> $favorite_color
#> [1] "blue"    " white "
#> 
#> $uniform_observations
#> [1] "9.6219155" "7.2269016" "0.8252921" "1.0379810"
#> [5] "3.0942004"
#> 
#> $poisson_observations
#> [1] " 81" " 91" " 84" "100" " 97"
#> 
#> $binomial_observations
#> [1] "2" "1"
#> 
#> $person
#> [1] "1" "2" "3" "4" "5"
#> 
#> $std_normal_observations
#> [1] "-0.35980342" "-0.04064753" "-1.78216227" "-1.12242282"
#> [5] "-1.00278400"
```





## Making graphs with `ggplot2`

If the key package in the `tidyverse` in terms of manipulating data is `dplyr` [@citedplyr], then the key package in the `tidyverse` in terms of creating graphs is `ggplot2` [@citeggplot]. It is part of the `tidyverse` collection of packages and so does not need to be explicitly installed or loaded if the `tidyverse` has been loaded. 

More formally, `ggplot2` works by defining layers which build to form a graph, based around the 'grammar of graphics' (hence, the 'gg'). Instead of the pipe operator (`|>`) ggplot uses the add operator `+`. 

There are three key aspects that need to be specified to build a graph with `ggplot2`: 

1. data;
2. aesthetics / mapping; and
3. type.

To get started we will obtain some GDP data for OECD countries [@citeoecdgdp].


```r
library(tidyverse)

oecd_gdp <- 
  read_csv("https://stats.oecd.org/sdmx-json/data/DP_LIVE/.QGDP.../OECD?contentType=csv&detail=code&separator=comma&csv-lang=en")

write_csv(oecd_gdp, 'inputs/data/oecd_gdp.csv')
```


```
#> # A tibble: 6 × 8
#>   LOCATION INDICATOR SUBJECT MEASURE  FREQUENCY TIME  Value
#>   <chr>    <chr>     <chr>   <chr>    <chr>     <chr> <dbl>
#> 1 OECD     QGDP      TOT     PC_CHGPP A         1962   5.70
#> 2 OECD     QGDP      TOT     PC_CHGPP A         1963   5.20
#> 3 OECD     QGDP      TOT     PC_CHGPP A         1964   6.38
#> 4 OECD     QGDP      TOT     PC_CHGPP A         1965   5.35
#> 5 OECD     QGDP      TOT     PC_CHGPP A         1966   5.75
#> 6 OECD     QGDP      TOT     PC_CHGPP A         1967   3.96
#> # … with 1 more variable: Flag Codes <chr>
```

We are interested, firstly, in making a bar chart of GDP change in the third quarter of 2021 for ten countries: Australia, Canada, Chile, Indonesia, Germany, Great Britain, New Zealand, South Africa, Spain, and the US.


```r
oecd_gdp_most_recent <- 
  oecd_gdp |> 
  filter(TIME == "2021-Q3",
         SUBJECT == "TOT",
         LOCATION %in% c("AUS", "CAN", "CHL", "DEU", "GBR",
                         "IDN", "ESP", "NZL", "USA", "ZAF"),
         MEASURE == "PC_CHGPY") |> 
  mutate(european = if_else(LOCATION %in% c("DEU", "GBR", "ESP"),
                             "European",
                             "Not european"),
         hemisphere = if_else(LOCATION %in% c("CAN", "DEU", "GBR", "ESP", "USA"),
                             "Northern Hemisphere",
                             "Southern Hemisphere"),
         )
```

We start with `ggplot` and specify a mapping/aesthetic, which in this case means specifying the x-axis and the y-axis.


```r
oecd_gdp_most_recent |> 
  ggplot(mapping = aes(x = LOCATION, y = Value))
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-68-1.png" width="672" />

Now we need to specify the type of graph that we are interested in. In this case we want a bar chart and we do this by adding `geom_bar()`.


```r
oecd_gdp_most_recent |> 
  ggplot(mapping = aes(x = LOCATION, y = Value)) +
  geom_bar(stat="identity")
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-69-1.png" width="672" />

We can color the bars by whether the country is European by adding another aesthetic, 'fill'.


```r
oecd_gdp_most_recent |> 
  ggplot(mapping = aes(x = LOCATION, y = Value, fill = european)) +
  geom_bar(stat="identity")
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-70-1.png" width="672" />

Finally, we could make it look nicer by: adding labels, `labs()`; changing the color, `scale_fill_brewer()`; and the background, `theme_classic()`. 


```r
oecd_gdp_most_recent |> 
  ggplot(mapping = aes(x = LOCATION, y = Value, fill = european)) +
  geom_bar(stat="identity") + 
  labs(title = "Quarterly change in GDP for ten OECD countries in 2021Q3", 
       x = "Countries", 
       y = "Change (%)",
       fill = "Is European?") +
  theme_classic() +
  scale_fill_brewer(palette = "Set1")
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-71-1.png" width="672" />


Facets enable us to that we create subplots that focus on specific aspects of our data. They are invaluable because they allow us to add another variable to a graph without having to make a 3D graph. We use `facet_wrap()` to add a facet and specify the variable that we would like to facet by. In this case, we facet by hemisphere.


```r
oecd_gdp_most_recent |> 
  ggplot(mapping = aes(x = LOCATION, y = Value, fill = european)) +
  geom_bar(stat="identity") + 
  labs(title = "Quarterly change in GDP for ten OECD countries in 2021Q3", 
       x = "Countries", 
       y = "Change (%)",
       fill = "Is European?") +
  theme_classic() +
  scale_fill_brewer(palette = "Set1") +
  facet_wrap(~hemisphere, 
              scales = "free_x")
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-72-1.png" width="672" />



## Exploring the `tidyverse`

We have focused on two aspects of the `tidyverse`: `dplyr`, and `ggplot2`. However, the `tidyverse` comprises a variety of different packages and functions. We will now go through four common aspects:

- Importing data and `tibble()`
- Joining and pivoting datasets
- String manipulation and `stringr`
- Factor variables and `forcats`


### Importing data and `tibble()`

There are a variety of ways to get data into R so that we can use it. For CSV files, there is `read_csv()` from `readr` [@citereadr], and for dta files, there is `read_dta()` from `haven` [@citehaven].

CSVs are a common format and have many advantages including the fact that they typically do not modify the data. Each column is separated by a comma, and each row is a record. We can provide `read_csv()` with a URL or a local file to read. There are a variety of different options that can be passed to `read_csv()` including the ability to specify whether the dataset has column names, the types of the columns, and how many lines to skip. If we do not specify the types of the columns then `read_csv()` will make a guess by looking at the dataset. 

We use `read_dta()` to read .dta files, which are commonly produced by the statistical program Stata. This means that they are common in fields such as sociology, political science, and economics. This format separates the data from its labels and so we typically reunite these using `to_factor()` from `labelled` [@citelabelled]. `haven` is part of the `tidyverse`, but is not automatically loaded by default, in contrast to a package such as `ggplot2`, and so we would need to run `library(haven)`.

Typically a dataset enters R as a 'data.frame'. While this can be useful, another helpful class for a dataset is 'tibble'. These can be created using `tibble()` from the `tibble` package which is part of the `tidyverse`. A tibble is a data frame, with some particular changes that make it easier to work with, including not converting strings to factors by default, showing the class of columns, and printing nicely.

We can make a tibble manually, if need be, for instance, when we simulate data. But we typically import data directly as a tibble, for instance, when we use `read_csv()`.


```r
people_as_dataframe <- 
  data.frame(names = c("rohan", "monica"),
             website = c("rohanalexander.com", "monicaalexander.com"),
             fav_color = c("blue", " white ")
             )
class(people_as_dataframe)
#> [1] "data.frame"
people_as_dataframe
#>    names             website fav_color
#> 1  rohan  rohanalexander.com      blue
#> 2 monica monicaalexander.com    white

people_as_tibble <- 
  tibble(names = c("rohan", "monica"),
         website = c("rohanalexander.com", "monicaalexander.com"),
         fav_color = c("blue", " white ")
         )
people_as_tibble
#> # A tibble: 2 × 3
#>   names  website             fav_color
#>   <chr>  <chr>               <chr>    
#> 1 rohan  rohanalexander.com  "blue"   
#> 2 monica monicaalexander.com " white "
class(people_as_tibble)
#> [1] "tbl_df"     "tbl"        "data.frame"
```


### Dataset manipulation with joins and pivots

There are two dataset manipulations that are often needed: joins and pivots.

We often have a situation where we have two, or more, datasets and we are interested in combining them. We can join datasets together in a variety of ways. A common way is to use `left_join()` from `dplyr` [@citedplyr]. This is most useful where there is one main dataset that we are using and there is another dataset with some useful variables that we want to add to that. The critical aspect is that we have column/s that we can use to link the two datasets. Here we will create two tibbles and then join them on the basis of names.


```r
main_dataset <- 
  tibble(
    names = c('rohan', 'monica', 'edward', 'hugo'),
    status = c('adult', 'adult', 'child', 'infant')
  )
main_dataset
#> # A tibble: 4 × 2
#>   names  status
#>   <chr>  <chr> 
#> 1 rohan  adult 
#> 2 monica adult 
#> 3 edward child 
#> 4 hugo   infant

supplementary_dataset <- 
  tibble(
    names = c('rohan', 'monica', 'edward', 'hugo'),
    favorite_food = c('pasta', 'salmon', 'pizza', 'milk')
  )
supplementary_dataset
#> # A tibble: 4 × 2
#>   names  favorite_food
#>   <chr>  <chr>        
#> 1 rohan  pasta        
#> 2 monica salmon       
#> 3 edward pizza        
#> 4 hugo   milk

main_dataset <- 
  main_dataset |> 
  left_join(supplementary_dataset, by = "names")

main_dataset
#> # A tibble: 4 × 3
#>   names  status favorite_food
#>   <chr>  <chr>  <chr>        
#> 1 rohan  adult  pasta        
#> 2 monica adult  salmon       
#> 3 edward child  pizza        
#> 4 hugo   infant milk
```

There are a variety of other options to join datasets, including `inner_join()`, `right_join()`, and `full_join()`.

Another common dataset manipulation task is pivoting them. Datasets tend to be either long or wide. Generally, in the `tidyverse`, and certainly for `ggplot2`, we need long data. To go from one to the other we use `pivot_longer()` and `pivot_wider()` from `tidyr` [@citetidyr].

We will create some wide data on whether 'mark' or 'lauren' won a running race in each of three years.


```r
pivot_example_data <- 
  tibble(year = c(2019, 2020, 2021),
         mark = c("first", "second", "first"),
         lauren = c("second", "first", "second"))

pivot_example_data
#> # A tibble: 3 × 3
#>    year mark   lauren
#>   <dbl> <chr>  <chr> 
#> 1  2019 first  second
#> 2  2020 second first 
#> 3  2021 first  second
```

This dataset is in wide format at the moment. To get it into long format, we need a column that specifies the person, and another that specifies the result. We use `pivot_longer()` to achieve this.


```r
data_pivoted_longer <- 
  pivot_example_data |> 
  tidyr::pivot_longer(cols = c("mark", "lauren"),
              names_to = "person",
               values_to = "position")

head(data_pivoted_longer)
#> # A tibble: 6 × 3
#>    year person position
#>   <dbl> <chr>  <chr>   
#> 1  2019 mark   first   
#> 2  2019 lauren second  
#> 3  2020 mark   second  
#> 4  2020 lauren first   
#> 5  2021 mark   first   
#> 6  2021 lauren second
```

Occasionally, we need to go from long data to wide data. We use `pivot_wider()` to do this.


```r
data_pivoted_wider <- 
  data_pivoted_longer |> 
  tidyr::pivot_wider(id_cols = c("year", "person"),
                     names_from = "person",
                     values_from = "position")

head(data_pivoted_wider)
#> # A tibble: 3 × 3
#>    year mark   lauren
#>   <dbl> <chr>  <chr> 
#> 1  2019 first  second
#> 2  2020 second first 
#> 3  2021 first  second
```


### String manipulation and `stringr`

In R we often create a string with double quotes, although using single quotes works too. For instance `c("a", "b")` consists of two strings 'a' and 'b', that are contained in a character vector. There are a variety of ways to manipulate strings in R and we focus on `stringr` [@citestringr]. This is automatically loaded when we load the `tidyverse`.

If we want to look for whether a string contains certain content, then we can use `str_detect()`. And if we want to remove or change some particular content then we can use `str_remove()` or `str_replace()`. 


```r
dataset_of_strings <- 
  tibble(
    names = c("rohan alexander", 
              "monica alexander", 
              "edward alexander", 
              "hugo alexander")
  )

dataset_of_strings |> 
  mutate(is_rohan = str_detect(names, "rohan"),
         make_howlett = str_replace(names, "alexander", "howlett"),
         remove_rohan = str_remove(names, "rohan")
         )
#> # A tibble: 4 × 4
#>   names            is_rohan make_howlett   remove_rohan     
#>   <chr>            <lgl>    <chr>          <chr>            
#> 1 rohan alexander  TRUE     rohan howlett  " alexander"     
#> 2 monica alexander FALSE    monica howlett "monica alexande…
#> 3 edward alexander FALSE    edward howlett "edward alexande…
#> 4 hugo alexander   FALSE    hugo howlett   "hugo alexander"
```

There are a variety of other functions that are often especially useful in data cleaning. For instance, we can use `str_length()` to find out how long a string is, and `str_c()` to bring strings together.


```r
dataset_of_strings |> 
  mutate(length_is = str_length(string = names),
         name_and_length = str_c(names, length_is, sep = " - ")
         )
#> # A tibble: 4 × 3
#>   names            length_is name_and_length      
#>   <chr>                <int> <chr>                
#> 1 rohan alexander         15 rohan alexander - 15 
#> 2 monica alexander        16 monica alexander - 16
#> 3 edward alexander        16 edward alexander - 16
#> 4 hugo alexander          14 hugo alexander - 14
```

Finally, `separate()` from `tidyr`, although not part of `stringr`, is indispensable for string manipulation. It turns one character column into many.


```r
dataset_of_strings |> 
  separate(col = names,
           into = c("first", "last"),
           sep = " ",
           remove = FALSE)
#> # A tibble: 4 × 3
#>   names            first  last     
#>   <chr>            <chr>  <chr>    
#> 1 rohan alexander  rohan  alexander
#> 2 monica alexander monica alexander
#> 3 edward alexander edward alexander
#> 4 hugo alexander   hugo   alexander
```


### Factor variables and `forcats`

A factor is a collection of strings that are categories. Sometimes there will be an inherent ordering. For instance, the days of the week have an order -- Monday, Tuesday, Wednesday, ... -- which is not alphabetical. But there is no requirement for that to be the case, for instance gender: female, male, and other. Factors feature prominently in base R. They can be useful because they ensure that only appropriate strings are allowed. For instance, if 'days_of_the_week' was a factor variable then 'January' would not be allowed. But they can add a great deal of complication, and so they have a less prominent role in `tidyverse`. Nonetheless taking advantage of factors is useful in certain circumstances. For instance, when plotting the days of the week we probably want them in the usual ordering than in the alphabetical ordering that would result if we had them as a character variable. While factors are built into base R, one `tidyverse` package that is especially useful when using factors is `forcats` [@citeforcats].

Sometimes we have a character vector, and we will want it ordered in a particular way. The default is that a character vector is ordered alphabetically, but we may not want that. For instance, the days of the week would look strange on a graph if they were alphabetically ordered: Friday, Monday, Saturday, Sunday, Thursday, Tuesday, and Wednesday!

The way to change the ordering is to change the variable from a character to a factor. We can use `fct_relevel()` from `forcats` [@citeforcats] to specify an ordering.


```r
set.seed(853)

days_data <-
  tibble(
    days =
      c(
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
      ),
    some_value = c(sample.int(100, 7))
  )

days_data <-
  days_data |>
  mutate(
    days_as_factor = factor(days),
    days_as_factor = fct_relevel(
      days,
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    )
  )
```

And we can compare the results by graphing first with the original character vector on the x-axis, and then another graph with the factor vector on the x-axis.


```r
days_data |> 
  ggplot(aes(x = days, y = some_value)) +
  geom_point()

days_data |> 
  ggplot(aes(x = days_as_factor, y = some_value)) +
  geom_point()
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-82-1.png" width="50%" /><img src="03-r_essentials_files/figure-html/unnamed-chunk-82-2.png" width="50%" />







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
    a. `tidyverse::select()`
    b. `tidyverse::mutate()`
    c. `tidyverse::filter()`
    d. `tidyverse::rename()`
7. Say we had loaded `AustralianPoliticians` and `tidyverse` and then run the following code: `australian_politicians <- AustralianPoliticians::get_auspol('all')`. How could we select all of the columns that end with 'Name' (pick one)? 
    a. `australian_politicians |> select(contains("Name"))`
    b. `australian_politicians |> select(starts_with("Name"))`
    c. `australian_politicians |> select(matches("Name"))`
    d. `australian_politicians |> select(ends_with("Name"))`
8. Under what circumstances, in terms of the names of the columns, would the use of 'contains()' potentially give different answers to using 'ends_with()' in the above question?
9. Which of the following are not `tidyverse` verbs (pick one)? 
    a. `select()`
    b. `filter()`
    c. `arrange()`
    d. `mutate()`
    e. `visualize()`
10. Which function would make a new column (pick one)? 
    a. `select()`
    b. `filter()`
    c. `arrange()`
    d. `mutate()`
    e. `visualize()`
11. Which function would focus on particular rows (pick one)? 
    a. `select()`
    b. `filter()`
    c. `arrange()`
    d. `mutate()`
    e. `summarise()`
12. Which combination of two functions could provide a mean of a dataset, by sex (pick two)? 
    a. `summarise()`
    b. `filter()`
    c. `arrange()`
    d. `mutate()`
    e. `group_by()`
13. Assume a variable called 'age' is an integer. Which line of code would create a column that is its exponential (pick one)? 
    a. `mutate(exp_age = exponential(age))`
    b. `mutate(exp_age = exponent(age))`
    c. `mutate(exp_age = exp(age))`
    d. `mutate(exp_age = expon(age))`
14. Assume a column called 'age'. Which line of code could create a column that contains the value from five rows above?
    a. `mutate(five_before = lag(age))`
    b. `mutate(five_before = lead(age))`
    c. `mutate(five_before = lag(age, n = 5))`
    d. `mutate(five_before = lead(age, n = 5))`
15. What would be the output of `class('edward')` (pick one)? 
    a. 'numeric'
    b. 'character'
    c. 'data.frame'
    d. 'vector'
16. Which function would enable us to draw once from three options 'blue, white, red', with 10 per cent probability on 'blue' and 'white', and the remainder on 'red'?
    a. `sample(c('blue', 'white', 'red'), prob = c(0.1, 0.1, 0.8))`
    b. `sample(c('blue', 'white', 'red'), size = 1)`
    c. `sample(c('blue', 'white', 'red'), size = 1, prob = c(0.8, 0.1, 0.1))`
    d. `sample(c('blue', 'white', 'red'), size = 1, prob = c(0.1, 0.1, 0.8))`
17. Which code simulates 10,000 draws from a normal distribution with a mean of 27 and a standard deviation of 3 (pick one)? 
    a. `rnorm(10000, mean = 27, sd = 3)`
    b. `rnorm(27, mean = 10000, sd = 3)`
    c. `rnorm(3, mean = 10000, sd = 27)`
    d. `rnorm(27, mean = 3, sd = 1000)`
18. What are the three key aspects of the grammar of graphics (select all)? 
    a. data
    b. aesthetics
    c. type
    d. `geom_histogram()`
  

### Tutorial

> I think we should be suspicious when we find ourselves attracted to data---very, very thin and weak data---that seem to justify beliefs that have held great currency in lots of societies throughout history, in a way that is conducive to the oppression of large segments of the population
> 
> Amia Srinivasan, 22 September 2021

Reflect on the quote from Amia Srinivasan, Chichele Professor of Social and Political Theory, All Souls College, Oxford, and @datafeminism2020, especially Chapter 6, and in two pages discuss a dataset that you are familiar with.


