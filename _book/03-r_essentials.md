




# R Essentials


**STATUS: Under construction.**


**Required material**

- Read *What They Forgot to Teach You About R*, Chapters 1-5, [@whattheyforgot].
- Read *R for Data Science*, Chapters 3-6, 8, 10, 11, 13, 14, 15, and 18 [@r4ds].
- Watch *Defining Custom Functions in R*, [@shiroonfunctions].


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

- `class()`
- `dplyr::case_when()`
- `ggplot::facet_wrap()`
- `ggplot::geom_density()`
- `ggplot::geom_histogram()`
- `ggplot::geom_point()`
- `janitor::clean_names()`
- `skimr::skim()`
- `tidyr::pivot_longer()`
- `tidyr::pivot_wider()`


## R essentials

This section is the basics of using R. Some of it may not make sense at first, but these are commands that we will come back to throughout these notes. You should initially just go through this chapter quickly, noting aspects that you don't understand. Then start to play around with some of the initial case studies. Then maybe come back to this chapter. That way you will see how the various bits fit into context, and hopefully be more motivated to pick up various aspects. We will come back to everything in this chapter in more detail at some point in these notes.

R is an open-source language that is useful for statistical programming. You can download R for free here: http://cran.utstat.utoronto.ca/, and you can download R Studio Desktop for free here: https://rstudio.com/products/rstudio/download/#download. 

When you are using R you will run into trouble at some point. To work through that trouble:

1. Look at the help file for the function by putting '?' before the function e.g. `?pivot_wider()`.
2. Check the class of your data, by `class(data_set$data_column)`.
3. Check for typos.
4. Google the error.
5. Google what you are trying to do.
6. Restart R (`Session` -> `Restart R and Clear Output`).
7. Try to make a small example and see if you have the same issues. 
8. Restart your computer.

The past ten years or so of R have been characterised by the rise of the tidyverse. This is '... an opinionated collection of R packages designed for data science. All packages share an underlying design philosophy, grammar, and data structures' [@tidyversewebsite]. There are three distinctions here: the original R language, typically referred to as 'base'; the 'tidyverse' which is a collection of packages that build on top of the R language; and other packages. 

Pretty much everything that you can do in the tidyverse, you can also do in base. However, as the tidyverse was built especially for modern data science it is usually easier to use the tidyverse, especially when you are setting out. Additionally, pretty much everything that you can do in the tidyverse, you can also do with other packages. However, as the tidyverse is a coherent collection of packages, it is often easier to use the tidyverse, especially when you are setting out. Eventually you will start to see cases where it makes sense to trade-off the convenience and coherence of the tidyverse for some features of base or other packages. Indeed, you'll see that at various points in these notes. For instance, the tidyverse can be slow, and so if you need to import thousands of CSVs then it can make sense to switch away from `read_csv()`. That is great and the appropriate use of base and non-tidyverse packages, rather than dogmatic insistence on a solution, is a sign of your development as an applied statistician. 

Get started by loading the `tidyverse` package.


```r
library(tidyverse)
```



The general workflow that we will use involves:

1. Import
2. Tidy
3. Transforming, descriptive
4. Plot
5. Model
6. Repeat 3/4

People like Keyes have tried to tell us this for a long time, but COVID-19 make it very clear to everyone - most of the data that we use will have humans at the heart of it. It's vitally important that you keep that in mind and grapple with it in everything that you do with R. It can be really easy to forget that almost every point in our dataset is likely a person.



## Social impact

> "We shouldn't have to think about the societal impact of our work because it's hard and other people can do it for us" is a really bad argument. I stopped doing CV research because I saw the impact my work was having. I loved the work but the military applications and privacy concerns eventually became impossible to ignore. But basically all facial recognition work would not get published if we took Broader Impacts sections seriously. There is almost no upside and enormous downside risk. To be fair though i should have a lot of humility here. For most of grad school I bought in to the myth that science is apolitical and research is objectively moral and good no matter what the subject is.
> 
> Joe Redmon, [20 February 2020](https://twitter.com/pjreddie/status/1230524770350817280).


Although the term 'data science' is ubiquitous in academia, industry, and even more generally, it is difficult to define. One deliberately antagonistic definition of data science is '[t]he inhumane reduction of humanity down to what can be counted' [@keyes2019]. While purposefully controversial, this definition highlights one reason for the increased demand for data science and quantitative methods over the past decade---individuals and their behaviour are now at the heart of it. Many of the techniques have been around for many decades, but what makes them popular now is this human focus. 

Unfortunately, even though much of the work may be focused on individuals, issues of privacy and consent, and ethical concerns more broadly, rarely seem front of mind. While there are some exceptions, in general, even at the same time as claiming that AI, machine learning, and data science are going to revolutionise society, consideration of these types of issues appears to have been largely treated as something that would be nice to have, rather than something that we may like to think of before we embrace the revolution.

For the most part, these are not new issues. In the sciences, there has been considerable recent ethical consideration around CRISPR technology and gene editing, but in an earlier time similar conversations were had, for instance, about Wernher von Braun being allowed to building rockets for the US. In medicine, of course, these concerns have been front-of-mind for some time. Data science seems determined to have its own Tuskegee syphilis experiment moment rather than think about and deal appropriately with these issues, based on the experiences of other fields, before they occur.

That said, there is some evidence that data scientists are beginning to be more concerned about the ethics surrounding the practice. For instance, NeurIPS, the most prestigious machine learning conference, now requires a statement on ethics to accompany all submissions.

> In order to provide a balanced perspective, authors are required to include a statement of the potential broader impact of their work, including its ethical aspects and future societal consequences. Authors should take care to discuss both positive and negative outcomes.
>
> [NeurIPS call for papers](https://neurips.cc/Conferences/2020/CallForPapers), as accessed 26 February 2020.

Ethical considerations will be mentioned throughout these notes rather than clumped in one easily ignorable part that can be thrown away after 'ethics week'. The purpose is not to prescriptively rule things in or out, but to provide an opportunity to raise some issues that should be front of mind. The variety of data science applications, the relative youth of the field, and the speed of change, mean that ethical considerations can sometimes be set aside when it comes to data science. This is in contrast to fields such as science, medicine, engineering, and accounting where there is a long history. Nonetheless it can be helpful to think through some ethical considerations that you may encounter in the content of a usual data science project. 


<div class="figure">
<img src="figures/probability.png" alt="Probability, from https://xkcd.com/881/." width="90%" />
<p class="caption">(\#fig:unnamed-chunk-3)Probability, from https://xkcd.com/881/.</p>
</div>




## R, R Studio, and R Studio Cloud

My colleague [Liza Bolton](https://twitter.com/liza_bolton) has a lovely analogy here on the relationship between R and R Studio which I really like. R is like a car engine and R Studio is like the car. Although some of us can use a car engine directly, most of us use a car to interact with the engine.

### R

R - https://www.r-project.org/ - is an open-source and free programming language that is focused on general statistics. (Free in this context doesn't refer to a price of zero, but instead to 'freedom', but it also does have a price of zero). This is in contrast with an open-source programming language that is designed for general purpose, such as Python, or an open-source programming language that is focused on probability, such as Stan. It was created by Ross Ihaka and Robert Gentleman at the University of Auckland in New Zealand. It is maintained by the R Core Team and changes to this 'base' of code occur methodically and with concern given to a variety of different priorities.

If you are in Canada then you can download R here: http://cran.utstat.utoronto.ca/, if you are in Australia then you can download R here: https://cran.csiro.au/, otherwise you should go here - https://cran.r-project.org/mirrors.html - and find a location that suits you. (It doesn't really matter where you get it from, it's just that it may be slightly faster to use a closer option.)

Many people build on this stable base, to extend the capabilities of R to better and more quickly suit their needs. They do this by creating packages. Typically, although not always, a package is a collection R code, and this allows you to more easily do things that you want to do. These packages are managed by the Comprehensive R Archive Network (CRAN) - https://cran.r-project.org/, and other repositories. CRAN is built into the download of R that you just got, so you can use it straight away.

If you want to use a package then you need to firstly install it in your computer, and then you need to load it when you want to use it. [Di Cook](http://dicook.org/), who is a Professor of Business Analytics at Monash University in Australia, [describes](https://twitter.com/visnut/status/1248087845589274624) this as analogous to a lightbulb: if you want light in your house, first you need to screw in the lightbulb, and you need to turn the switch on. You only need to screw in the lightbulb once per house, but you need to turn the switch on every time you want to use the light.

To install a package on your computer (again, you'll need to do this only once per computer) you use the code:


```r
install.packages("tidyverse")
```

Then when you want to use a package, you need to call it with this code:


```r
library(tidyverse)
```

You can open R and use it on your computer. It is primarily designed to be interacted with through the command line. This is how I had to start with R, and it's fine, but it can be useful to have a richer environment than the command line provides. In particular, it can be useful to install an Integrated Development Environment (IDE), which is an application that brings together various bits and pieces that you'll use all the time. The one that we will use is R Studio.



### R Studio

R Studio is distinct to R and they are different entities. R Studio builds on top of R to make it easier for you to use R. This is in the same way that you can use the internet from the command line, but most of us use a browser such as Chrome, Firefox, or Safari. 

R Studio is free in the sense that you don't pay anything for it. It is also free in the sense of being able to take the code, modify it, and distribute that code provided others are similarly allowed to take your code and modify it and distribute, etc. However, it is important to recognise that R Studio is an entity and so it is possible that in the future the current situation could change.

You can download R Studio here: https://rstudio.com/products/rstudio/download/#download.

When you open R Studio it will look like Figure \@ref(fig:first).

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

The pane in the bottom right is a file manager. At the moment it should just have two files - an R History file and a R Project file. We'll get to what these are later, but for now we will create and save a file.

Type out the following code (don't worry too much about the details for now):


```r
saveRDS(object = my_name, file = "my_first_file.rds")
```

And you should see a new '.rds' file in your list of files.



### R Studio Cloud

While you can download R Studio to your own computer, initially we will us R Studio Cloud, which is an online version that is provided by R Studio. We will use this so that you can focus on getting comfortable with R and R Studio in an environment that is consistent. This way you don't have to worry about what computer you have or installation permissions while you are still getting used to the basics. 

The R Studio Cloud - https://rstudio.cloud/ - is as easy as it gets in terms of moving to the cloud. The trade-off is that it is not very powerful, and it is sometimes slow, but for the purposes of the initial sections of these notes that will be fine.

To get started, go to https://rstudio.cloud/ and create an account. If you are going to be a student for a while then it might be worthwhile using a university email account, because although they don't yet charge for it, they will probably start charging soon, but with some luck they will offer education discounts. 

Once you have an account and log in, then it should look something like Figure \@ref(fig:second).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/01-03_r_essentials/02.png" alt="Opening R Studio Cloud for the first time" width="100%" />
<p class="caption">(\#fig:second)Opening R Studio Cloud for the first time</p>
</div>

(You'll be in 'Your Workspace', and you won't have an 'Example Workspace'.) From here you should start a 'New Project'. You can give the project a name by clicking on 'Untitled Project' and replacing it. We can now use R Studio in the cloud. 

While working line-by-line in the console is fine, it is easier to write out a whole script that can then be executed. We will do this by making an R Script. To do this go to: File -> New File -> R Script, or use the shortcut Command + Shift + N. The console pane will fall to the bottom left and an R Script will open in the top left. Let's write some code that will grab all of the Australian politicians and then construct a small table about the genders of the prime ministers.

(Some of this code won't make sense at this stage, but just type it all out to get in the habit and then run it, by selecting all of the code and clicking 'Run' (or using the keyboard shortcut: Command + Return)


```r
# Install the packages that we'll need
install.packages("devtools")
install.packages("tidyverse")
```


```r
# Load the packages that we need to use this time
library(devtools)
library(tidyverse)

# Grab the data on Australian politicians
install_github("RohanAlexander/AustralianPoliticians")

# Make a table of the counts of genders of the prime ministers
AustralianPoliticians::all %>% 
  as_tibble() %>% 
  count(gender, wasPrimeMinister)
#> # A tibble: 4 × 3
#>   gender wasPrimeMinister     n
#>   <chr>             <int> <int>
#> 1 female                1     1
#> 2 female               NA   235
#> 3 male                  1    29
#> 4 male                 NA  1511
```

You can save your R Script as 'my_first_r_script.R' using File -> Save As (or the keyboard shortcut: Command + S). When you're done your workspace should look something like Figure \@ref(fig:third).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/01-03_r_essentials/03.png" alt="After running an R Script" width="100%" />
<p class="caption">(\#fig:third)After running an R Script</p>
</div>


One thing to be aware of is that each R Studio Cloud workspace is essentially a new computer. Because of this, you'll need to install any package that you want to use for each workspace. For instance, before you can use the tidyverse, you need to install.packages("tidyverse"). This is in contrast to when you use your own computer.

A few final notes on R Studio Cloud for you to keep in the back of your mind:

1) In the Australian politicians example, we got our data from the website GitHub, but you can get data into your workspace from your local computer in a variety of ways. One way is to use the 'upload' button in the Files panel.
2) R Studio Cloud allows some degree of collaboration. For instance, you can give someone else access to a workspace that you create. This could be useful for collaborating on an assignment, although it is not quite full featured yet and you cannot both be in the workspace at the same time (in contrast to, say, Google Docs).
3) There are a variety of weaknesses of R Studio Cloud, in particular at the moment there is a 1GB limit on RAM. Additionally, it is still under-developed, and things break from time to time. The R Studio Community page that is focused on R Studio Cloud can be helpful sometimes: https://community.rstudio.com/c/rstudio-cloud.





## Tidyverse I

**Aspects of 'Tidyverse I' were written with [Monica Alexander](https://www.monicaalexander.com/).**

One of the key packages that we use in these notes is the `tidyverse` @tidyverse. The `tidyverse` is actually a package of packages (i.e. when you install `tidyverse`, you are actually installing a whole bunch of different packages). The key package in the `tidyverse` in terms of manipulating data is `dplyr` @citedplyr, and the key package in the `tidyverse` in terms of creating graphs is `ggplot2` @citeggplot.

In this section we are going to cycle through some essentials from the Tidyverse. You'll come back to the functions in this section regularly.

I want to keep this section self-contained, so let's start by installing the `tidyverse` (again, to use Di Cook's analogy, this is the equivalent of screwing in the lightbulb). If you just did it, then you don't need to do it again.


```r
install.packages("tidyverse")
```

Now we can load the `tidyverse` (again, to use Di Cook's analogy, the equivalent of turning on the light-switch). 


```r
library(tidyverse)
```

Here we are going to download the data about Australian politicians using the function `read_csv()`.


```r
australian_politicians <- 
  read_csv(
    file = 
      "https://raw.githubusercontent.com/RohanAlexander/telling_stories_with_data/master/inputs/data/australian_politicians.csv"
    )
```



```
#> Rows: 1776 Columns: 20
#> ── Column specification ────────────────────────────────────
#> Delimiter: ","
#> chr  (14): uniqueID, surname, allOtherNames, firstName, ...
#> dbl   (4): birthYear, member, senator, wasPrimeMinister
#> date  (2): birthDate, deathDate
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```


We will now cover the pipe and six functions that are useful to know and that we will use all the time:

- `select()`
- `filter()`
- `arrange()`
- `mutate()`
- `summarise()/summarize()`
- `group_by()`


### The pipe

One key tidyverse helper is the 'pipe': `%>%`. Read it as "and then" (keyboard shortcut: Command + Shift + M). This takes the output of a line of code and uses it as an input to the next line of code. You don't have to use it, but it tends to make your code more readable.

The idea of the pipe is that you take your dataset, **and then**, do something to it. In this case, we will look at the first few lines of our dataset by piping `australian_politicians` through to the `head()` function.


```r
australian_politicians %>% 
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


### Selecting

The `select()` function is used to get a particular column of a dataset. For instance, we might like to select the first names column.


```r
australian_politicians %>% 
  select(firstName) %>% 
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

In R, there are many ways to do things. Another way to get a particular column of a dataset is to use the dollar sign. This is from base R (as opposed to `select()` which is from the `tidyverse` package).


```r
australian_politicians$firstName %>% 
  head()
#> [1] "Richard"   "Percy"     "Macartney" "Charles"  
#> [5] "Joseph"    "Anthony"
```

The two are almost equivalent and differ only in the class of what they return (we'll talk more about class later in the notes).

For the sake of completeness, if you combine `select()` with `pull()` then you will get the same class of output as if you use the dollar sign. 


```r
australian_politicians %>% 
  select(firstName) %>% 
  pull() %>% 
  head()
#> [1] "Richard"   "Percy"     "Macartney" "Charles"  
#> [5] "Joseph"    "Anthony"
```

You can also use `select` to get rid of columns, by selecting in a negative sense.


```r
australian_politicians %>% 
  select(-firstName)
#> # A tibble: 1,776 × 19
#>    uniqueID   surname allOtherNames   commonName displayName
#>    <chr>      <chr>   <chr>           <chr>      <chr>      
#>  1 Abbott1859 Abbott  Richard Hartle… <NA>       Abbott, Ri…
#>  2 Abbott1869 Abbott  Percy Phipps    <NA>       Abbott, Pe…
#>  3 Abbott1877 Abbott  Macartney       Mac        Abbott, Mac
#>  4 Abbott1886 Abbott  Charles Lydiar… Aubrey     Abbott, Au…
#>  5 Abbott1891 Abbott  Joseph Palmer   <NA>       Abbott, Jo…
#>  6 Abbott1957 Abbott  Anthony John    Tony       Abbott, To…
#>  7 Abel1939   Abel    John Arthur     <NA>       Abel, John 
#>  8 Abetz1958  Abetz   Eric            <NA>       Abetz, Eric
#>  9 Adams1943  Adams   Judith Anne     <NA>       Adams, Jud…
#> 10 Adams1951  Adams   Dick Godfrey H… <NA>       Adams, Dick
#> # … with 1,766 more rows, and 14 more variables:
#> #   earlierOrLaterNames <chr>, title <chr>, gender <chr>,
#> #   birthDate <date>, birthYear <dbl>, birthPlace <chr>,
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>, wikidataID <chr>,
#> #   wikipedia <chr>, adb <chr>, comments <chr>
```


Finally, you can select, based on conditions. For instance, selecting all of the columns that start with something, for instance, 'birth'.


```r
australian_politicians %>% 
  select(starts_with("birth"))
#> # A tibble: 1,776 × 3
#>    birthDate  birthYear birthPlace  
#>    <date>         <dbl> <chr>       
#>  1 NA              1859 Bendigo     
#>  2 1869-05-14      1869 Hobart      
#>  3 1877-07-03      1877 Murrurundi  
#>  4 1886-01-04      1886 St Leonards 
#>  5 1891-10-18      1891 North Sydney
#>  6 1957-11-04      1957 London      
#>  7 1939-06-25      1939 Sydney      
#>  8 1958-01-25      1958 Stuttgart   
#>  9 1943-04-11      1943 Picton      
#> 10 1951-04-29      1951 Launceston  
#> # … with 1,766 more rows
```


### Filtering

The `filter()` function is used to get particular rows from a dataset. For instance, we might like to filter to only politicians that became prime minister.


```r
australian_politicians %>% 
  filter(wasPrimeMinister == 1) 
#> # A tibble: 30 × 20
#>    uniqueID    surname allOtherNames    firstName commonName
#>    <chr>       <chr>   <chr>            <chr>     <chr>     
#>  1 Abbott1957  Abbott  Anthony John     Anthony   Tony      
#>  2 Barton1849  Barton  Edmund           Edmund    <NA>      
#>  3 Bruce1883   Bruce   Stanley Melbour… Stanley   <NA>      
#>  4 Chifley1885 Chifley Joseph Benedict  Joseph    Ben       
#>  5 Cook1860    Cook    Joseph           Joseph    <NA>      
#>  6 Curtin1885  Curtin  John Joseph Amb… John      <NA>      
#>  7 Deakin1856  Deakin  Alfred           Alfred    <NA>      
#>  8 Fadden1894  Fadden  Arthur William   Arthur    Arthur    
#>  9 Fisher1862  Fisher  Andrew           Andrew    <NA>      
#> 10 Forde1890   Forde   Francis Michael  Francis   Frank     
#> # … with 20 more rows, and 15 more variables:
#> #   displayName <chr>, earlierOrLaterNames <chr>,
#> #   title <chr>, gender <chr>, birthDate <date>,
#> #   birthYear <dbl>, birthPlace <chr>, deathDate <date>,
#> #   member <dbl>, senator <dbl>, wasPrimeMinister <dbl>,
#> #   wikidataID <chr>, wikipedia <chr>, adb <chr>,
#> #   comments <chr>
```

The `filter()` function also accepts two conditions. For instance, we can look at politicians who were prime minister and were named Joseph.


```r
australian_politicians %>% 
  filter(wasPrimeMinister == 1 & firstName == "Joseph")
#> # A tibble: 3 × 20
#>   uniqueID    surname allOtherNames   firstName commonName
#>   <chr>       <chr>   <chr>           <chr>     <chr>     
#> 1 Chifley1885 Chifley Joseph Benedict Joseph    Ben       
#> 2 Cook1860    Cook    Joseph          Joseph    <NA>      
#> 3 Lyons1879   Lyons   Joseph Aloysius Joseph    <NA>      
#> # … with 15 more variables: displayName <chr>,
#> #   earlierOrLaterNames <chr>, title <chr>, gender <chr>,
#> #   birthDate <date>, birthYear <dbl>, birthPlace <chr>,
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>, wikidataID <chr>,
#> #   wikipedia <chr>, adb <chr>, comments <chr>
```

We would get the same result if we use a comma instead of an ampersand.


```r
australian_politicians %>% 
  filter(wasPrimeMinister == 1, firstName == "Joseph")
#> # A tibble: 3 × 20
#>   uniqueID    surname allOtherNames   firstName commonName
#>   <chr>       <chr>   <chr>           <chr>     <chr>     
#> 1 Chifley1885 Chifley Joseph Benedict Joseph    Ben       
#> 2 Cook1860    Cook    Joseph          Joseph    <NA>      
#> 3 Lyons1879   Lyons   Joseph Aloysius Joseph    <NA>      
#> # … with 15 more variables: displayName <chr>,
#> #   earlierOrLaterNames <chr>, title <chr>, gender <chr>,
#> #   birthDate <date>, birthYear <dbl>, birthPlace <chr>,
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>, wikidataID <chr>,
#> #   wikipedia <chr>, adb <chr>, comments <chr>
```


Similarly, we can look at politicians who were named Myles or Ruth.


```r
australian_politicians %>% 
  filter(firstName == "Ruth" | firstName == "Myles")
#> # A tibble: 3 × 20
#>   uniqueID     surname  allOtherNames  firstName commonName
#>   <chr>        <chr>    <chr>          <chr>     <chr>     
#> 1 Coleman1931  Coleman  Ruth Nancy     Ruth      <NA>      
#> 2 Ferricks1875 Ferricks Myles Aloysius Myles     <NA>      
#> 3 Webber1965   Webber   Ruth Stephanie Ruth      <NA>      
#> # … with 15 more variables: displayName <chr>,
#> #   earlierOrLaterNames <chr>, title <chr>, gender <chr>,
#> #   birthDate <date>, birthYear <dbl>, birthPlace <chr>,
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>, wikidataID <chr>,
#> #   wikipedia <chr>, adb <chr>, comments <chr>
```

We can also pipe the results, for instance, pipe from the `filter()` to `select()`


```r
australian_politicians %>% 
  filter(firstName == "Ruth" | firstName == "Myles") %>% 
  select(firstName, surname)
#> # A tibble: 3 × 2
#>   firstName surname 
#>   <chr>     <chr>   
#> 1 Ruth      Coleman 
#> 2 Myles     Ferricks
#> 3 Ruth      Webber
```

Finally, we can `filter()` to a particular row number, for instance, in this case row 853.


```r
australian_politicians %>% 
  filter(row_number() == 853)
#> # A tibble: 1 × 20
#>   uniqueID   surname allOtherNames firstName commonName
#>   <chr>      <chr>   <chr>         <chr>     <chr>     
#> 1 Jarman1923 Jarman  Alan William  Alan      <NA>      
#> # … with 15 more variables: displayName <chr>,
#> #   earlierOrLaterNames <chr>, title <chr>, gender <chr>,
#> #   birthDate <date>, birthYear <dbl>, birthPlace <chr>,
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>, wikidataID <chr>,
#> #   wikipedia <chr>, adb <chr>, comments <chr>
```

But there is also a dedicated function to do this, which is `slice()`


```r
australian_politicians %>% 
  slice(853)
#> # A tibble: 1 × 20
#>   uniqueID   surname allOtherNames firstName commonName
#>   <chr>      <chr>   <chr>         <chr>     <chr>     
#> 1 Jarman1923 Jarman  Alan William  Alan      <NA>      
#> # … with 15 more variables: displayName <chr>,
#> #   earlierOrLaterNames <chr>, title <chr>, gender <chr>,
#> #   birthDate <date>, birthYear <dbl>, birthPlace <chr>,
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>, wikidataID <chr>,
#> #   wikipedia <chr>, adb <chr>, comments <chr>
```



### Arranging

We can change the order of the dataset based on the values in a particular column using the `arrange()` function. For instance, we may like to arrange the data by year of birth.


```r
australian_politicians %>% 
  arrange(surname)
#> # A tibble: 1,776 × 20
#>    uniqueID   surname allOtherNames     firstName commonName
#>    <chr>      <chr>   <chr>             <chr>     <chr>     
#>  1 Abbott1859 Abbott  Richard Hartley … Richard   <NA>      
#>  2 Abbott1869 Abbott  Percy Phipps      Percy     <NA>      
#>  3 Abbott1877 Abbott  Macartney         Macartney Mac       
#>  4 Abbott1886 Abbott  Charles Lydiard … Charles   Aubrey    
#>  5 Abbott1891 Abbott  Joseph Palmer     Joseph    <NA>      
#>  6 Abbott1957 Abbott  Anthony John      Anthony   Tony      
#>  7 Abel1939   Abel    John Arthur       John      <NA>      
#>  8 Abetz1958  Abetz   Eric              Eric      <NA>      
#>  9 Adams1943  Adams   Judith Anne       Judith    <NA>      
#> 10 Adams1951  Adams   Dick Godfrey Har… Dick      <NA>      
#> # … with 1,766 more rows, and 15 more variables:
#> #   displayName <chr>, earlierOrLaterNames <chr>,
#> #   title <chr>, gender <chr>, birthDate <date>,
#> #   birthYear <dbl>, birthPlace <chr>, deathDate <date>,
#> #   member <dbl>, senator <dbl>, wasPrimeMinister <dbl>,
#> #   wikidataID <chr>, wikipedia <chr>, adb <chr>,
#> #   comments <chr>
```

We can also use the `desc()` function to arrange in descending order.


```r
australian_politicians %>% 
  arrange(desc(surname))
#> # A tibble: 1,776 × 20
#>    uniqueID      surname   allOtherNames firstName commonName
#>    <chr>         <chr>     <chr>         <chr>     <chr>     
#>  1 Zimmerman1968 Zimmerman Trent Moir    Trent     <NA>      
#>  2 Zeal1830      Zeal      William Aust… William   <NA>      
#>  3 Zappia1952    Zappia    Antonio       Antonio   Tony      
#>  4 Zammit1941    Zammit    Paul John     Paul      <NA>      
#>  5 Zakharov1929  Zakharov  Alice Olive   Alice     Olive     
#>  6 Zahra1973     Zahra     Christian Jo… Christian <NA>      
#>  7 Young1923     Young     Harold Willi… Harold    <NA>      
#>  8 Young1936     Young     Michael Jero… Michael   Mick      
#>  9 Young1968     Young     Terry James   Terry     <NA>      
#> 10 Yates1871     Yates     George Edwin  George    Gunner    
#> # … with 1,766 more rows, and 15 more variables:
#> #   displayName <chr>, earlierOrLaterNames <chr>,
#> #   title <chr>, gender <chr>, birthDate <date>,
#> #   birthYear <dbl>, birthPlace <chr>, deathDate <date>,
#> #   member <dbl>, senator <dbl>, wasPrimeMinister <dbl>,
#> #   wikidataID <chr>, wikipedia <chr>, adb <chr>,
#> #   comments <chr>
```

We can also arrange based on more than one column.


```r
australian_politicians %>% 
  arrange(firstName, surname)
#> # A tibble: 1,776 × 20
#>    uniqueID      surname   allOtherNames firstName commonName
#>    <chr>         <chr>     <chr>         <chr>     <chr>     
#>  1 Blain1894     Blain     Adair Macali… Adair     <NA>      
#>  2 Armstrong1909 Armstrong Adam Alexand… Adam      Bill      
#>  3 Bandt1972     Bandt     Adam Paul     Adam      <NA>      
#>  4 Dein1889      Dein      Adam Kemball  Adam      Dick      
#>  5 Ridgeway1962  Ridgeway  Aden Derek    Aden      <NA>      
#>  6 Bennett1933   Bennett   Adrian Frank  Adrian    <NA>      
#>  7 Gibson1935    Gibson    Adrian        Adrian    <NA>      
#>  8 Wynne1850     Wynne     Agar          Agar      <NA>      
#>  9 Robertson1882 Robertson Agnes Robert… Agnes     <NA>      
#> 10 Bird1906      Bird      Alan Charles  Alan      <NA>      
#> # … with 1,766 more rows, and 15 more variables:
#> #   displayName <chr>, earlierOrLaterNames <chr>,
#> #   title <chr>, gender <chr>, birthDate <date>,
#> #   birthYear <dbl>, birthPlace <chr>, deathDate <date>,
#> #   member <dbl>, senator <dbl>, wasPrimeMinister <dbl>,
#> #   wikidataID <chr>, wikipedia <chr>, adb <chr>,
#> #   comments <chr>
```

We can pipe `arrange()` to another `arrange()`.


```r
australian_politicians %>% 
  arrange(firstName) %>% 
  arrange(surname)
#> # A tibble: 1,776 × 20
#>    uniqueID   surname allOtherNames     firstName commonName
#>    <chr>      <chr>   <chr>             <chr>     <chr>     
#>  1 Abbott1957 Abbott  Anthony John      Anthony   Tony      
#>  2 Abbott1886 Abbott  Charles Lydiard … Charles   Aubrey    
#>  3 Abbott1891 Abbott  Joseph Palmer     Joseph    <NA>      
#>  4 Abbott1877 Abbott  Macartney         Macartney Mac       
#>  5 Abbott1869 Abbott  Percy Phipps      Percy     <NA>      
#>  6 Abbott1859 Abbott  Richard Hartley … Richard   <NA>      
#>  7 Abel1939   Abel    John Arthur       John      <NA>      
#>  8 Abetz1958  Abetz   Eric              Eric      <NA>      
#>  9 Adams1951  Adams   Dick Godfrey Har… Dick      <NA>      
#> 10 Adams1943  Adams   Judith Anne       Judith    <NA>      
#> # … with 1,766 more rows, and 15 more variables:
#> #   displayName <chr>, earlierOrLaterNames <chr>,
#> #   title <chr>, gender <chr>, birthDate <date>,
#> #   birthYear <dbl>, birthPlace <chr>, deathDate <date>,
#> #   member <dbl>, senator <dbl>, wasPrimeMinister <dbl>,
#> #   wikidataID <chr>, wikipedia <chr>, adb <chr>,
#> #   comments <chr>
```

It is just important to be clear about the precedence of each.


```r
australian_politicians %>% 
  arrange(surname, firstName)
#> # A tibble: 1,776 × 20
#>    uniqueID   surname allOtherNames     firstName commonName
#>    <chr>      <chr>   <chr>             <chr>     <chr>     
#>  1 Abbott1957 Abbott  Anthony John      Anthony   Tony      
#>  2 Abbott1886 Abbott  Charles Lydiard … Charles   Aubrey    
#>  3 Abbott1891 Abbott  Joseph Palmer     Joseph    <NA>      
#>  4 Abbott1877 Abbott  Macartney         Macartney Mac       
#>  5 Abbott1869 Abbott  Percy Phipps      Percy     <NA>      
#>  6 Abbott1859 Abbott  Richard Hartley … Richard   <NA>      
#>  7 Abel1939   Abel    John Arthur       John      <NA>      
#>  8 Abetz1958  Abetz   Eric              Eric      <NA>      
#>  9 Adams1951  Adams   Dick Godfrey Har… Dick      <NA>      
#> 10 Adams1943  Adams   Judith Anne       Judith    <NA>      
#> # … with 1,766 more rows, and 15 more variables:
#> #   displayName <chr>, earlierOrLaterNames <chr>,
#> #   title <chr>, gender <chr>, birthDate <date>,
#> #   birthYear <dbl>, birthPlace <chr>, deathDate <date>,
#> #   member <dbl>, senator <dbl>, wasPrimeMinister <dbl>,
#> #   wikidataID <chr>, wikipedia <chr>, adb <chr>,
#> #   comments <chr>
```


### Grouping

We can group variables using the function `group_by()` and then apply some other function within those groups. For instance, we could arrange by first name within gender, and then get the first three results. 


```r
australian_politicians %>% 
  group_by(gender) %>% 
  arrange(firstName) %>% 
  slice(1:3)
#> # A tibble: 6 × 20
#> # Groups:   gender [2]
#>   uniqueID       surname    allOtherNames firstName commonName
#>   <chr>          <chr>      <chr>         <chr>     <chr>     
#> 1 Robertson1882  Robertson  Agnes Robert… Agnes     <NA>      
#> 2 MacTiernan1953 MacTiernan Alannah Joan… Alannah   <NA>      
#> 3 Zakharov1929   Zakharov   Alice Olive   Alice     Olive     
#> 4 Blain1894      Blain      Adair Macali… Adair     <NA>      
#> 5 Armstrong1909  Armstrong  Adam Alexand… Adam      Bill      
#> 6 Bandt1972      Bandt      Adam Paul     Adam      <NA>      
#> # … with 15 more variables: displayName <chr>,
#> #   earlierOrLaterNames <chr>, title <chr>, gender <chr>,
#> #   birthDate <date>, birthYear <dbl>, birthPlace <chr>,
#> #   deathDate <date>, member <dbl>, senator <dbl>,
#> #   wasPrimeMinister <dbl>, wikidataID <chr>,
#> #   wikipedia <chr>, adb <chr>, comments <chr>
```


### Mutating

The `mutate()` function is used to make a new column. For instance, perhaps we want to make a new column that is 1 if a person was a member and a senator and 0 otherwise.


```r
australian_politicians <- 
  australian_politicians %>% 
  mutate(was_both = if_else(member == 1 & senator == 1, 1, 0))

australian_politicians %>% 
  select(member, senator, was_both) %>% 
  head()
#> # A tibble: 6 × 3
#>   member senator was_both
#>    <dbl>   <dbl>    <dbl>
#> 1      0       1        0
#> 2      1       1        1
#> 3      0       1        0
#> 4      1       0        0
#> 5      1       0        0
#> 6      1       0        0
```



### Summarise

The function `summarise()` is used to create new summary variables. For instance, looking at the maximum of birth year to find who the most recently born politicians are.


```r
australian_politicians %>% 
  summarise(youngest_politicians_birth_year = max(birthYear, na.rm = TRUE))
#> # A tibble: 1 × 1
#>   youngest_politicians_birth_year
#>                             <dbl>
#> 1                            1994
```

And we can check that using `arrange()`.


```r
australian_politicians %>% 
  arrange(-birthYear) %>% 
  select(uniqueID, surname, allOtherNames, birthYear) %>% 
  slice(1:3)
#> # A tibble: 3 × 4
#>   uniqueID       surname     allOtherNames    birthYear
#>   <chr>          <chr>       <chr>                <dbl>
#> 1 SteeleJohn1994 Steele-John Jordon Alexander      1994
#> 2 Chandler1990   Chandler    Claire                1990
#> 3 Roy1990        Roy         Wyatt Beau            1990
```

The `summarise()` function is particularly powerful in conjunction with `group_by()`. For instance, let's look at the year of birth of the youngest by gender.


```r
australian_politicians %>%
  group_by(gender) %>% 
  summarise(youngest_politician_birth_year = max(birthYear, na.rm = TRUE))
#> # A tibble: 2 × 2
#>   gender youngest_politician_birth_year
#>   <chr>                           <dbl>
#> 1 female                           1990
#> 2 male                             1994
```

Let's look at mean of age at death by gender.


```r
australian_politicians %>%
  mutate(days_lived = deathDate - birthDate) %>% 
  filter(!is.na(days_lived)) %>% 
  group_by(gender) %>% 
  summarise(mean_days_lived = round(mean(days_lived), 2)) %>% 
  arrange(-mean_days_lived)
#> # A tibble: 2 × 2
#>   gender mean_days_lived
#>   <chr>  <drtn>         
#> 1 female 28857.30 days  
#> 2 male   27372.89 days
```

We can use `group_by()` for more than one group for instance, looking again at average number of days lived by gender and by which house.


```r
australian_politicians %>%
  mutate(days_lived = deathDate - birthDate) %>% 
  filter(!is.na(days_lived)) %>% 
  group_by(gender, wasPrimeMinister) %>% 
  summarise(mean_days_lived = round(mean(days_lived), 2)) %>% 
  arrange(-mean_days_lived)
#> `summarise()` has grouped output by 'gender'. You can override using the `.groups` argument.
#> # A tibble: 3 × 3
#> # Groups:   gender [2]
#>   gender wasPrimeMinister mean_days_lived
#>   <chr>             <dbl> <drtn>         
#> 1 female               NA 28857.30 days  
#> 2 male                  1 28446.61 days  
#> 3 male                 NA 27345.20 days
```

### Counting

We can use the function `count()` to create counts by groups. For instance, the number of politicians by gender.


```r
australian_politicians %>% 
  group_by(gender) %>% 
  count()
#> # A tibble: 2 × 2
#> # Groups:   gender [2]
#>   gender     n
#>   <chr>  <int>
#> 1 female   236
#> 2 male    1540
```

### Proportions

Finally, often calculating proportions is a combination of `summarise()` and `mutate()` (and `group_by()`).

Let's calculate the proportion of genders.

Note here, that we needed to `ungroup()` the data before mutating. 


```r
australian_politicians %>% 
  group_by(gender) %>% 
  count() %>% 
  ungroup() %>% 
  mutate(prop = n/(sum(n)))
#> # A tibble: 2 × 3
#>   gender     n  prop
#>   <chr>  <int> <dbl>
#> 1 female   236 0.133
#> 2 male    1540 0.867
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

The `ggplot` package is the plotting package that is part of the `tidyverse` collection of packages. 

In a similar way to piping, it works in layers. But instead of using the pipe (`%>%`) ggplot uses `+`. 

### Main features

There are three key aspects: 

1. data;
2. aesthetics / mapping; and
3. type.

For instances, let's build up a histogram of age of death with increasing complexity.

Starts with a grey box:


```r
australian_politicians %>% 
  mutate(days_lived = as.integer(deathDate - birthDate)) %>% 
  filter(!is.na(days_lived)) %>% 
  ggplot(mapping = aes(x = days_lived))
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-49-1.png" width="672" />

We need to tell it what we want to plot. This is where `geom` comes in 


```r
australian_politicians %>% 
  mutate(days_lived = as.integer(deathDate - birthDate)) %>% 
  filter(!is.na(days_lived)) %>% 
  ggplot(mapping = aes(x = days_lived)) +
  geom_histogram(binwidth = 365)
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-50-1.png" width="672" />

Now let's color the bars by gender, which means adding an aesthetic.


```r
australian_politicians %>% 
  mutate(days_lived = as.integer(deathDate - birthDate)) %>% 
  filter(!is.na(days_lived)) %>% 
  ggplot(mapping = aes(x = days_lived, fill = gender)) +
  geom_histogram(binwidth = 365)
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-51-1.png" width="672" />

We can add some labels, change the color, and background. 


```r
australian_politicians %>% 
  mutate(days_lived = as.integer(deathDate - birthDate)) %>% 
  filter(!is.na(days_lived)) %>% 
  ggplot(mapping = aes(x = days_lived, fill = gender)) +
  geom_histogram(binwidth = 365) +
  labs(title = "Length of life of Australian politicians", 
       x = "Age of deaths (days)", 
       y = "Number") +
  theme_classic() +
  scale_fill_brewer(palette = "Set1")
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-52-1.png" width="672" />

I forget who said this but, '`ggplot` makes it so easy to have nicely labelled axes, there's no real excuse not to'.


### Facets

Facets are subplots and are invaluable because they allow you to add another variable to your plot without having to make a 3D plot.


```r
australian_politicians %>% 
  mutate(days_lived = as.integer(deathDate - birthDate)) %>% 
  filter(!is.na(days_lived)) %>% 
  ggplot(mapping = aes(x = days_lived)) +
  geom_histogram(binwidth = 365) +
  labs(title = "Length of life of Australian politicians", 
       x = "Age of deaths (days)", 
       y = "Number") +
  theme_classic() +
  scale_fill_brewer(palette = "Set1") +
  facet_wrap(~gender)
```

<img src="03-r_essentials_files/figure-html/unnamed-chunk-53-1.png" width="672" />







## Tidyverse II





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
  simulated_data %>% 
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
  people %>% 
  mutate(is_rohan = stringr::str_detect(names, "rohan"),
         make_howlett = stringr::str_replace(website, "alexander", "howlett"),
         fav_colour_trim = stringr::str_squish(fav_colour)
         )

head(people)
#> # A tibble: 2 × 6
#>   names  website             fav_colour is_rohan make_howlett
#>   <chr>  <chr>               <chr>      <lgl>    <chr>       
#> 1 rohan  rohanalexander.com  "blue"     TRUE     rohanhowlet…
#> 2 monica monicaalexander.com " white "  FALSE    monicahowle…
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
  pivot_example_data %>% 
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
  data_pivoted_longer %>% 
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
  my_data %>%
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
  case_when_example %>% 
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
  case_when_example %>% 
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




## Exercises and tutorial


### Exercises

1. If I had a dataset with the following columns: `name`, `age` and wanted to focus on `name`, then which verb should I use (pick one)? 
    a. `tidyverse::select()`.
    b. `tidyverse::mutate()`.
    c. `tidyverse::filter()`.
    d. `tidyverse::rename()`.
2. If I want to cite R then how do I find a recommended citation (pick one)? 
    a. `cite('R')`. 
    b. `cite()`.
    c. `citation('R')`.
    d. `citation()`.
3. What are three advantages of R? What are three disadvantages?
4. What is R Studio?
    a. An integrated development environment (IDE)
    b. A closed source paid program
    c. A programming language created by Guido van Rossum
    d. A statistical programming language
5. What is R?
    a. A open-source statistical programming language
    b. A programming language created by Guido van Rossum
    c. A closed source statistical programming language
    d. An integrated development environment (IDE)
6. Which of the following are not tidyverse verbs (pick one)? 
    a. `select()`.
    b. `filter()`.
    c. `arrange()`.
    d. `mutate()`.
    e. `visualize()`.
7. If I wanted to make a new column which verb should I use (pick one)? 
    a. `select()`.
    b. `filter()`.
    c. `arrange()`.
    d. `mutate()`.
    e. `visualize()`.
8. If I wanted to focus on particular rows which verb should I use (pick one)? 
    a. `select()`.
    b. `filter()`.
    c. `arrange()`.
    d. `mutate()`.
    e. `summarise()`
9. If I wanted a summary of the data that gave me the mean by sex, which two verbs should I use (pick one)? 
    a. `summarise()`.
    b. `filter()`.
    c. `arrange()`.
    d. `mutate()`.
    e. `group_by()`.
10. What are the three key aspects of the grammar of graphics (select all)? 
    a. data.
    b. aesthetics.
    c. type.
    d. geom_histogram().
11. What is not one of the four challenges for mitigating bias mentioned in Hao 2019 (pick one)? 
    a. Unknown unknowns. 
    b. Imperfect processes. 
    c. The definitions of fairness. 
    d. Lack of social context. 
    e. Disinterest given profit considerations.
12. What would be the output of `class('edward')` (pick one)? 
    a. 'numeric'. 
    b. 'character'.
    c. 'data.frame'.
    d. 'vector'.
13. How can I simulate 10,000 draws from a normal distribution with a mean of 27 and a standard deviation of 3 (pick one)? 
    a. `rnorm(10000, mean = 27, sd = 3)`. 
    b. `rnorm(27, mean = 10000, sd = 3)`. 
    c. `rnorm(3, mean = 10000, sd = 27)`. 
    d. `rnorm(27, mean = 3, sd = 1000)`.     

### Tutorial

Listen to Gladwell and then rank sports teams or other departments or something else of interest to you based on at least three variables and one of which is peer thoughts. 