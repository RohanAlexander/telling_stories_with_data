
# (PART) Preparation {-}

# Clean and prepare

**Required material**

- Read *Data Feminism*, Chapter 5 'Unicorns, Janitors, Ninjas, Wizards, and Rock Stars', [@datafeminism2020].
- Read *R for Data Science*, Chapter 12 'Tidy data', [@r4ds].
- Read *We Gave Four Good Pollsters the Same Raw Data. They Had Four Different Results*, [@cohn2016].
- Read *Column Names as Contracts*, [@columnnamesascontracts]
<!-- - *Data Cleaning Procedures for the 1993 Robert Wood Johnson Foundation Employer Health Insurance Survey*, [@euller1997data]. -->
<!-- - *Data Cleaning*, [@ilyas2019data]. -->


**Key concepts and skills**

- Planning an end-point and simulating the dataset that we would like to end up with, are key elements of cleaning and preparing data.
- Begin on a small sample of the dataset, write code to fix that, and then iterate and generalize to additional tranches.
- Develop a series of tests and checks that the dataset should pass so that the features of the dataset are clear.
- Be especially concerned about the class of variables, having clear names, and that the values of each variable are as expected given all this.


**Key libraries**

- `convo` [@convo]
- `janitor` [@janitor]
- `pointblank` [@pointblank]
- `purrr` [@citepurrr]
- `stringr` [@citestringr]
- `tidyr` [@citetidyr]
- `tidyverse` [@Wickham2017]

**Key functions**

- `dplyr::count()`
- `dplyr::mutate()`
- `dplyr::select()`
- `janitor::clean_names()`
- `stringr::str_replace_all()`
- `stringr::str_trim()`
- `tidyr::pivot_longer()`
- `tidyr::separate()`
- `tidyr::separate_rows()`

## Introduction

> "Well, Lyndon, you may be right and they may be every bit as intelligent as you say," said Rayburn, "but I'd feel a whole lot better about them if just one of them had run for sheriff once."
> 
> Sam Rayburn's reaction to Lyndon Johnson's enthusiasm about Kennedy's incoming cabinet, as quoted by @halberstam [p. 41].

In earlier chapters we have done some data cleaning and preparation, and in this chapter we will put in place more formal approaches. To a large extent, the role of data cleaning and preparation is so great, that the only people that we can trust understand their data, are those that who have cleaned it. And, paradoxically, often those that do the cleaning and preparation are often those that trust it the least. At some point in every data science workflow, those doing the modelling should get their hands dirty with data cleaning. To clean and prepare data is to make a lot of different decisions, many of which are important.

For a long time, data cleaning and preparation was largely overlooked. We now realize that was a mistake. It has been difficult to trust results in disciplines that apply statistics. The reproducibility crisis, which started in psychology but has now extended to many other fields in the physical and social sciences, has brought to light issues such as p-value 'hacking', researcher degrees of freedom, file-drawer issues, and even data and results fabrication [@gelman2013garden]. Steps are now being put in place to address these. However, there has been relatively little focus on the data gathering, cleaning, and preparation aspects of applied statistics, despite evidence that decisions made during these steps greatly affect statistical results [@huntington2020influence]. In this chapter we focus on these issues.

While the statistical practices that underpin data science are themselves correct and robust when applied to simulated datasets, data science is typically not conducted with these types of datasets. For instance, data scientists are interested in 'messy, unfiltered, and possibly unclean data---tainted by heteroskedasticity, complex dependence and missingness patterns---that until recently were avoided in polite conversations between more traditional statisticians' [@craiu2019hiring]. 

Big data does not resolve this issue, and may even exacerbate it, for instance 'without taking data quality into account, population inferences with Big Data are subject to a Big Data Paradox: the more the data, the surer we fool ourselves' [@meng2018statistical]. It is important to note that the issues that are found in much applied statistics research are not necessarily associated with researcher quality, or their biases [@silberzahn2018many]. Instead, they are a result of the environment within which data science is conducted. This chapter aims to give you the tools to explicitly think about this work.

@gelman2020most writing about the most important statistical ideas of the past 50 years say that each of them enabled new ways of thinking about data analysis and they brought into the tent of statistics, approaches that 'had been considered more a matter of taste or philosophy'. The focus on data cleaning and preparation in this chapter is analogous, insofar, as it represents a codification, or bringing inside the tent, of aspects that are typically, incorrectly, considered those of taste rather than statistics.

The workflow that we advocate is:

1. Save the raw data.
2. Plan the end state.
3. Execute that plan on a tiny sample.
4. Write tests and documentation.
5. Iterate the plan.
6. Generalize the execution.
7. Update tests and documentation.

We will need a variety of skills to be effective, but this is the very stuff of statistical sciences. The approach needed is some combination of dogged and sensible. Perfect is very much the enemy of good enough when it comes to data cleaning. And to be specific, it is better to have 90 per cent of the data cleaned and prepared, and to start exploring that, before deciding whether it is worth the effort to clean and prepare the remaining 10 per cent because that remainder will likely take an awful lot of time and effort.

All data regardless of whether they were obtained from hunting, gathering, or farming, will have issues and it is critical that we have approaches that can deal with a variety of issues, and more importantly, understand how it might affect our modelling [@van2005data]. To clean data is to analyze data. This is because the process forces us to make choices about what we value in our results [@thatrandyauperson].





## Workflow

### Save a copy of the raw data

The first step is to save the raw data into a separate, local, folder. It is important to save this raw data, to the extent that is possible, because it establishes the foundation for reproducibility [@wilsongoodenough]. If we are obtaining our data from a third-party, such as a government website, then we have no control over whether they will continue to host that data, whether they will update it, and the address at which it will be available. We also want to reduce the burden that we impose on their servers, by saving a local copy.

Having locally saved the raw data we must maintain it in that state, and not modify it. As we begin to clean and prepare it, we instead create another dataset. Maintaining the initial, raw, state of the dataset, and using scripts to create the dataset that we are interested in analyzing, ensures that our entire workflow is reproducible. 


### Begin with an end in mind

Planning the end state or forcing yourself to begin with an end in mind is important for a variety of reasons. As with scraping data, it helps us to be proactive about scope-creep, but with data cleaning it additionally forces us to really think about what we want the final dataset to look like. 

The first step is to sketch the dataset that we are interested in. The key features of the sketch will be aspects such as the names of the columns, their class, and the possible range of values. For instance, we might be interested in the populations of US states. In which case our sketch might look like Figure \@ref(fig:sketchdataplan).

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/state_population_sketch.png" alt="Planned dataset of US states and their populations" width="40%" />
<p class="caption">(\#fig:sketchdataplan)Planned dataset of US states and their populations</p>
</div>

In this case, the sketch forces us to decide whether we want full names or abbreviations for the state names, and that the population has been measured in millions. The process of sketching this end-point has forced us to make decisions early on, and be clear about our desired end state.

We then implement that using code to simulate data. Again, this process forces us to think about what reasonable values look like in our dataset because we are literally forced to decide which functions to use. Thinking carefully about the membership of each column here, for instance if the column is meant to be 'gender' then values such as 'male', 'female', 'other', and 'unknown' may be expected, but a number such as '1,000' would likely be unexpected. It also forces us to be explicit about variable names because we have to assign the outputs of those functions to a variable. For instance, we could simulate some data for the population data. 


```r
library(tidyverse)

set.seed(853)

simulated_tfr <- 
  tibble(
    state = state.name,
    population = runif(n = 50, min = 0, max = 50) |> round(digits = 2)
  )

simulated_tfr
#> # A tibble: 50 × 2
#>    state       population
#>    <chr>            <dbl>
#>  1 Alabama          18.0 
#>  2 Alaska            6.01
#>  3 Arizona          24.2 
#>  4 Arkansas         15.8 
#>  5 California        1.87
#>  6 Colorado         20.2 
#>  7 Connecticut       6.54
#>  8 Delaware         12.1 
#>  9 Florida           7.9 
#> 10 Georgia           9.44
#> # … with 40 more rows
```

Our purpose, during data cleaning and preparation, is to then bring our raw data close to that plan. Ideally, we would plan so that the desired end-state of our dataset is 'tidy data', which was introduced in Chapter \@ref(r-essentials). 


<!-- 1. Each variable is a column. -->
<!-- 2. Each observation is a row. -->
<!-- 3. Each observational unit is a table. -->

<!-- The following is a reminder of data in a tidy format. -->

<!-- ```{r} -->
<!-- tibble( -->
<!--   name = c("Alfred", "Ben", "Chris", "Daniela", "Emma"), -->
<!--   age_group = c("0-9", "10-19", "0-9", "0-9", "10-19"), -->
<!--   response_time = c(0, 9, 3, 3, 8), -->
<!--   ) -->



### Start small

Having thoroughly planned we can turn to the raw data that we are dealing with. Usually, regardless of what the raw data look like, we want to manipulate them into a rectangular dataset as quickly as possible. This allows us to use our family `dplyr` verbs and `tidyverse` approaches. For instance, let us assume that we are starting with some `.txt` file.

The first step is to look for regularities in the dataset. We are wanting to end up with tabular data, which means that we need some type of delimiter to distinguish different columns. Ideally this might be features such as a comma, a semicolon, a tab, a double space, or a line break. 


```r
Alabama, 5
Alaska, 0.7
Arizona, 7
Arkansas, 3
California, 40
```

In worse cases there may be some regular feature of the dataset that we can take advantage of. For instance, sometimes various text is repeated.


```r
State is Alabama and population is 5 million.
State is Alaska and population is 0.7 million.
State is Arizona and population is 7 million.
State is Arkansas and population is 3 million.
State is California and population is 40 million.
```

In this case, although we do not have a traditional delimiter we can use the regularity of 'State is ' and ' and population is ' to get what we need. A more difficult case is when we do not have line breaks.


```r
Alabama 5 Alaska 0.7 Arizona 7 Arkansas 3 California 40
```

One way to approach this is to take advantage of the different classes and values that we are looking for. For instance, in this case, we know that we are after US states, so there are only 50 possible options, and we could use the existence of these as a delimiter. We could also use the fact that population is a number here, and so split based on a space followed by a number.

We will now go through the process of converting this last example into tidy data using `tidyr` [@citetidyr], 


```r
raw_data <-
  c('Alabama 5 Alaska 0.7 Arizona 7 Arkansas 3 California 40')

data_as_tibble <-
  tibble(raw = raw_data)

tidy_data <-
  data_as_tibble |>
  separate(col = raw,
           into = letters[1:5],
           sep = "(?<=[[:digit:]]) ") |>
  pivot_longer(cols = letters[1:5],
               names_to = "drop_me",
               values_to = "separate_me") |>
  separate(col = separate_me,
           into = c('state', 'population'),
           sep = " (?=[[:digit:]])") |>
  select(-drop_me)

tidy_data
#> # A tibble: 5 × 2
#>   state      population
#>   <chr>      <chr>     
#> 1 Alabama    5         
#> 2 Alaska     0.7       
#> 3 Arizona    7         
#> 4 Arkansas   3         
#> 5 California 40
```


### Write tests and documentation.

<!-- We are attempting to triangulate the situation. -->

Having established a rectangular dataset, albeit a messy one, we should begin to look at the classes that we have. We do not necessarily want to fix the classes at this point, because that can result in us losing data. But we look at the class to see what it is, and then compare it to our simulated dataset to see where it needs to get to. We note the columns where it is different.

Before changing the class and before going onto more bespoke issues, we should deal with some of the common issues in each class. Some common issues are:

- Commas and other punctuation, such as denomination signs in columns that should be numeric.
- Inconsistent formatting of dates, such as 'December' and 'Dec' and '12'.
- Unexpected characters, especially in unicode, which may not display consistently.

Typically, we want to fix anything immediately obvious. For instance, remove commas that have been used to group digits in currencies. However, the situation will typically quickly become dire. What we need to do is to look at the membership of each group, and then triage what we will fix. We should probably make the decision of how to triage based on what is likely to have the largest impact. That usually means starting with the counts, sorting in descending order, and then dealing with each as they come.

When the tests of membership are passed, then finally we can change the class, and run all the tests again. We are adapting this idea from the software development approach of unit testing. Tests are crucial because the enable us to understand whether software (or in this case data) is fit for purpose [@buildingsoftwaretogether].

Let us run through an example with a collection of strings, some of which are slightly wrong. This type of output is typical of OCR, which often gets most of the way there, but not quite.


```r
messy_string <-
  c('Patricia, Ptricia, PatricIa, Patncia, PatricIa, Patricia, Patricia, Patric1a, Patricia , 8atricia')

messy_string
#> [1] "Patricia, Ptricia, PatricIa, Patncia, PatricIa, Patricia, Patricia, Patric1a, Patricia , 8atricia"
```

As before, we first want to get this into a rectangular dataset.


```r
messy_data <- 
  tibble(names = messy_string) |> 
  separate_rows(names, sep = ", ") 

messy_data
#> # A tibble: 10 × 1
#>    names      
#>    <chr>      
#>  1 "Patricia" 
#>  2 "Ptricia"  
#>  3 "PatricIa" 
#>  4 "Patncia"  
#>  5 "PatricIa" 
#>  6 "Patricia" 
#>  7 "Patricia" 
#>  8 "Patric1a" 
#>  9 "Patricia "
#> 10 "8atricia"
```

We now need decide which of these errors we are going to fix. To help us decide which are most important, we will create a count.


```r
messy_data |> 
  count(names, sort = TRUE)
#> # A tibble: 7 × 2
#>   names           n
#>   <chr>       <int>
#> 1 "Patricia"      3
#> 2 "PatricIa"      2
#> 3 "8atricia"      1
#> 4 "Patncia"       1
#> 5 "Patric1a"      1
#> 6 "Patricia "     1
#> 7 "Ptricia"       1
```

The most common element is the correct one, which is great. The next one - 'PatricIa' - looks like the 'i' has been incorrectly capitalized, and the one after that - '8atricia' - is distinguished by an '8' instead of a 'P'. Let us quickly fix these issues and then redo the count.


```r
messy_data <- 
  messy_data |> 
  mutate(names = str_replace_all(names, 'PatricIa', 'Patricia'),
         names = str_replace_all(names, '8atricia', 'Patricia')
         )

messy_data |> 
  count(names, sort = TRUE)
#> # A tibble: 5 × 2
#>   names           n
#>   <chr>       <int>
#> 1 "Patricia"      6
#> 2 "Patncia"       1
#> 3 "Patric1a"      1
#> 4 "Patricia "     1
#> 5 "Ptricia"       1
```

Already this is much better and 60 per cent of the values are correct, compared with earlier where it was 30 per cent. There are two more obvious errors - 'Ptricia' and 'Patncia' - with the first missing an 'a' and the second having an 'n' where the 'ri' should be. Again, we can quickly update and fix those.


```r
messy_data <- 
  messy_data |> 
  mutate(names = str_replace_all(names, 'Ptricia', 'Patricia'),
         names = str_replace_all(names, 'Patncia', 'Patricia')
         )

messy_data |> 
  count(names, sort = TRUE)
#> # A tibble: 3 × 2
#>   names           n
#>   <chr>       <int>
#> 1 "Patricia"      8
#> 2 "Patric1a"      1
#> 3 "Patricia "     1
```

We have achieved an 80 per cent fix with not too much effort. The two remaining issues are more subtle. The first - 'Patric1a' - has occurred because the 'i' has been incorrectly coded as an '1'. In some fonts this will show up, but in others it will be more difficult to see. This is a common issue, especially with OCR, and something to be aware of. The second - 'Patricia ' - is similarly subtle and is occurring because there is a trailing space. Again, trailing and leading spaces are a common issue and we can address them with `str_trim()`. After we fix these two remaining issues then we will have all entries corrected.


```r
cleaned_data <- 
  messy_data |> 
  mutate(names = str_replace_all(names, 'Patric1a', 'Patricia'),
         names = str_trim(names, side = c("right"))
         )

cleaned_data |> 
  count(names, sort = TRUE)
#> # A tibble: 1 × 2
#>   names        n
#>   <chr>    <int>
#> 1 Patricia    10
```

We have been doing the tests in our head in this example. We know that we are hoping for 'Patricia'. But we can start to document this test as well. One way is to look to see if values other than 'Patricia' exist in the dataset.


```r
check_me <- 
  cleaned_data |> 
  filter(names != "Patricia")

if (nrow(check_me) > 0) {
  print("Still have values that are not Patricia!")
}
```

We can make things a little more imposing by stopping our code execution if the condition is not met with `stopifnot()`. To use that we define a condition that we would like met. We could implement this type of check throughout our code. For instance, if we expected there to be a certain number of rows in the dataset, or for a certain column to have various properties, such as being an integer, or a factor.


```r
stopifnot(nrow(check_me) == 0)
```

We can use `stopifnot()` to ensure that our script is working as expected as it goes through. Another way that is especially used

Another way to write tests for our dataset is to use `testthat` [@testthat]. Although developed for testing packages, we can use the same functionality to test our datasets. For instance, we can use `expect_length()` to check the length of a dataset and could use `expect_equal()` to check the content.


```r
library(testthat)

expect_length(check_me, 1)
expect_equal(class(cleaned_data$names), "character")
expect_equal(unique(cleaned_data$names), "Patricia")
```

If the tests pass then nothing happens, and if the tests fail then the script will stop.

### Iterate, generalize and update

We could now iterate the plan. In this most recent case, we started with 10 entries. There is no reason that we could not increase this to 100 or even 1,000. We may need to generalize the cleaning procedures and tests. But eventually we would start to being the dataset into some sort of order.

## Case study: Kenya census

### Gather and clean data

To make this all more clear, let us gather, clean, and prepare some data from the 2019 Kenyan census. The distribution of population by age, sex, and administrative unit from the 2019 Kenyan census can be downloaded [here](https://www.knbs.or.ke/?wpdmpro=2019-kenya-population-and-housing-census-volume-iii-distribution-of-population-by-age-sex-and-administrative-units). While this format as a PDF makes it easy to look up a particular result, it is not overly useful if we want to model the data. In order to be able to do that, we need to convert a PDF of Kenyan census results of counts, by age and sex, by county and sub-county, into a tidy dataset that can be analyzed. We will use `janitor` [@janitor], `pdftools` [@pdftools], `tidyverse` [@tidyverse], and `stringi` [@stringi]. 


```r
library(janitor)
library(pdftools)
library(purrr)
library(tidyverse)
library(stringi)
```

And we can then download^[If the Kenyan government link breaks then replace their URL with: https://www.tellingstorieswithdata.com/inputs/pdfs/2019_Kenya_census.pdf.] and read in the PDF of the 2019 Kenyan census. When we have a PDF and want to read the content into R, then `pdf_text()` from `pdftools` [@pdftools] is useful. It works well for many recently produced PDFs because the content is text which it can extract. But if the PDF is an image, then `pdf_text()` will not work. Instead, the PDF will first need to go through OCR, which was covered in Chapter \@ref(gather-data).


```r
download.file(
  "https://www.knbs.or.ke/download/2019-kenya-population-and-housing-census-volume-iii-distribution-of-population-by-age-sex-and-administrative-units/?wpdmdl=5729&refresh=620561f1ce3ad1644519921", 
  "2019_Kenya_census.pdf",
  mode="wb")

all_content <- pdf_text("2019_Kenya_census.pdf")
```



We can see an example page of the PDF of the 2019 Kenyan census (Figure \@ref(fig:examplekenyancensuspage)).

<div class="figure" style="text-align: center">
<img src="figures/2020-04-10-screenshot-of-census.png" alt="Example page from the 2019 Kenyan census" width="90%" />
<p class="caption">(\#fig:examplekenyancensuspage)Example page from the 2019 Kenyan census</p>
</div>

The first challenge is to get the dataset into a format that we can more easily manipulate. We will consider each page of the PDF and extract the relevant parts. To do this, we first write a function, and then apply it to each page. 


```r
# The function is going to take an input of a page
get_data <- function(i){
  # i = 467
  # Just look at the page of interest
  # Based on Bob Rudis: https://stackoverflow.com/a/47793617
  just_page_i <- stri_split_lines(all_content[[i]])[[1]] 
  
  just_page_i <- just_page_i[just_page_i != ""]
  
  # Grab the name of the location
  area <- just_page_i[3] |> str_squish()
  area <- str_to_title(area)
  
  # Grab the type of table
  type_of_table <- just_page_i[2] |> str_squish()
  
  # Get rid of the top matter
  # Manually for now, but could create some rules if needed
  just_page_i_no_header <- just_page_i[5:length(just_page_i)] 
  
  # Get rid of the bottom matter
  # Manually for now, but could create some rules if needed
  just_page_i_no_header_no_footer <- just_page_i_no_header[1:62] 
  
  # Convert into a tibble
  demography_data <- tibble(all = just_page_i_no_header_no_footer)
  
  # Split columns
  demography_data <-
    demography_data |>
    mutate(all = str_squish(all)) |> # Any space more than two spaces is reduced
    mutate(all = str_replace(all, "10 -14", "10-14")) |> # One specific issue
    mutate(all = str_replace(all, "Not Stated", "NotStated")) |> # And another
    separate(col = all,
             into = c("age", "male", "female", "total", "age_2", "male_2", "female_2", "total_2"),
             sep = " ", # Works fine because the tables are nicely laid out
             remove = TRUE,
             fill = "right",
             extra = "drop"
    )
  
  # They are side by side at the moment, need to append to bottom
  demography_data_long <-
    rbind(demography_data |> select(age, male, female, total),
          demography_data |>
            select(age_2, male_2, female_2, total_2) |>
            rename(age = age_2, male = male_2, female = female_2, total = total_2)
    )
  
  # There is one row of NAs, so remove it
  demography_data_long <- 
    demography_data_long |> 
    remove_empty(which = c("rows"))
  
  # Add the area and the page
  demography_data_long$area <- area
  demography_data_long$table <- type_of_table
  demography_data_long$page <- i
  
  rm(just_page_i,
     i,
     area,
     type_of_table,
     just_page_i_no_header,
     just_page_i_no_header_no_footer,
     demography_data)
  
  return(demography_data_long)
}
```

We now have a function that does what we need to each page of the PDF. We will use `map_dfr()` from `purrr` [@citepurrr] to apply that function to each page, and then combine all the outputs into one tibble.


```r
# Run through each relevant page and get the data
pages <- c(30:513)
all_tables <- map_dfr(pages, get_data)
rm(pages, get_data)
```


```r
all_tables
#> # A tibble: 59,532 × 7
#>    age   male    female  total     area    table        page
#>    <chr> <chr>   <chr>   <chr>     <chr>   <chr>       <int>
#>  1 Total 610,257 598,046 1,208,303 Mombasa Table 2.3:…    30
#>  2 0     15,111  15,009  30,120    Mombasa Table 2.3:…    30
#>  3 1     15,805  15,308  31,113    Mombasa Table 2.3:…    30
#>  4 2     15,088  14,837  29,925    Mombasa Table 2.3:…    30
#>  5 3     14,660  14,031  28,691    Mombasa Table 2.3:…    30
#>  6 4     14,061  13,993  28,054    Mombasa Table 2.3:…    30
#>  7 0-4   74,725  73,178  147,903   Mombasa Table 2.3:…    30
#>  8 5     13,851  14,023  27,874    Mombasa Table 2.3:…    30
#>  9 6     12,889  13,216  26,105    Mombasa Table 2.3:…    30
#> 10 7     13,268  13,203  26,471    Mombasa Table 2.3:…    30
#> # … with 59,522 more rows
```

Having got it into a rectangular format, we now need to clean the dataset to make it useful.

The first step is to make the numbers into actual numbers, rather than characters. Before we can convert the type, we need to remove anything that is not a number otherwise that cell will be converted into an NA. We first identify any values that are not numbers so that we can remove them. 


```r
# Need to convert male, female, and total to integers
# First find the characters that should not be in there
all_tables |> 
  select(male, female, total) |>
  mutate_all(~str_remove_all(., "[:digit:]")) |> 
  mutate_all(~str_remove_all(., ",")) |>
  mutate_all(~str_remove_all(., "_")) |>
  mutate_all(~str_remove_all(., "-")) |> 
  distinct()
#> # A tibble: 3 × 3
#>   male  female total
#>   <chr> <chr>  <chr>
#> 1 ""    ""     ""   
#> 2 "Aug" ""     ""   
#> 3 "Jun" ""     ""

# We clearly need to remove ",", "_", and "-". 
# This also highlights a few issues on p. 185 that need to be manually adjusted
# https://twitter.com/RohanAlexander/status/1244337583016022018
all_tables$male[all_tables$male == "23-Jun"] <- 4923
all_tables$male[all_tables$male == "15-Aug"] <- 4611
```

While we could use `janitor` here, it is worthwhile at least first looking at what is going on because sometimes there is odd stuff that `janitor` (and other packages) will deal with, but not in a way that we want. In this case, the Kenyan government used Excel or similar, and this has converted two entries into dates. If we just took the numbers from the column then we would have 23 and 15 here, but by inspecting the column we can use Excel to reverse the process and enter the correct values of 4,923 and 4,611, respectively.

Having identified everything that needs to be removed, we can do the actual removal and convert our character column of numbers to integers.


```r
all_tables <-
  all_tables |>
  mutate_at(vars(male, female, total), ~str_remove_all(., ",")) |>
  mutate_at(vars(male, female, total), ~str_replace(., "_", "0")) |>
  mutate_at(vars(male, female, total), ~str_replace(., "-", "0")) |>
  mutate_at(vars(male, female, total), ~as.integer(.))

all_tables
#> # A tibble: 59,532 × 7
#>    age     male female   total area    table            page
#>    <chr>  <int>  <int>   <int> <chr>   <chr>           <int>
#>  1 Total 610257 598046 1208303 Mombasa Table 2.3: Dis…    30
#>  2 0      15111  15009   30120 Mombasa Table 2.3: Dis…    30
#>  3 1      15805  15308   31113 Mombasa Table 2.3: Dis…    30
#>  4 2      15088  14837   29925 Mombasa Table 2.3: Dis…    30
#>  5 3      14660  14031   28691 Mombasa Table 2.3: Dis…    30
#>  6 4      14061  13993   28054 Mombasa Table 2.3: Dis…    30
#>  7 0-4    74725  73178  147903 Mombasa Table 2.3: Dis…    30
#>  8 5      13851  14023   27874 Mombasa Table 2.3: Dis…    30
#>  9 6      12889  13216   26105 Mombasa Table 2.3: Dis…    30
#> 10 7      13268  13203   26471 Mombasa Table 2.3: Dis…    30
#> # … with 59,522 more rows
```

The next thing to clean is the areas. We know that there are 47 counties in Kenya, and a large number of sub-counties. The Kenyan government purports to provide a list on pages 19 to 22 of the PDF (document pages 7 to 10). But this list is not complete, and there are a few minor issues that we will deal with later. In any case, we first need to fix a few inconsistencies.


```r
# Fix some area names
all_tables$area[all_tables$area == "Taita/ Taveta"] <- "Taita/Taveta"
all_tables$area[all_tables$area == "Elgeyo/ Marakwet"] <- "Elgeyo/Marakwet"
all_tables$area[all_tables$area == "Nairobi City"] <- "Nairobi"
```

Kenya has 47 counties, each of which has sub-counties. The PDF has them arranged as the county data then the sub-counties, without designating which is which. We can use the names, to a certain extent, but in a handful of cases, there is a sub-county that has the same name as a county, so we need to first fix that.

The PDF is made-up of three tables. So we can first get the names of the counties based on those final two tables and then reconcile them to get a list of the counties.



```r
all_tables$table |> 
  table()
#> 
#> Table 2.3: Distribution of Population by Age, Sex*, County and Sub- County 
#>                                                                      48216 
#>       Table 2.4a: Distribution of Rural Population by Age, Sex* and County 
#>                                                                       5535 
#>       Table 2.4b: Distribution of Urban Population by Age, Sex* and County 
#>                                                                       5781
```


```r
list_counties <- 
  all_tables |> 
  filter(table %in% c("Table 2.4a: Distribution of Rural Population by Age, Sex* and County",
                      "Table 2.4b: Distribution of Urban Population by Age, Sex* and County")
         ) |> 
  select(area) |> 
  distinct()

list_counties
#> # A tibble: 47 × 1
#>    area        
#>    <chr>       
#>  1 Kwale       
#>  2 Kilifi      
#>  3 Tana River  
#>  4 Lamu        
#>  5 Taita/Taveta
#>  6 Garissa     
#>  7 Wajir       
#>  8 Mandera     
#>  9 Marsabit    
#> 10 Isiolo      
#> # … with 37 more rows
```

As we hoped, there are 47 of them. But before we can add a flag based on those names, we need to deal with the sub-counties that share their name. We will do this based on the page, then looking it up and deciding which is the county page and which is the sub-county page.


```r
all_tables |> 
  filter(table == "Table 2.3: Distribution of Population by Age, Sex*, County and Sub- County") |> 
  filter(area %in% c("Busia",
                     "Garissa",
                     "Homa Bay",
                     "Isiolo",
                     "Kiambu",
                     "Machakos",
                     "Makueni",
                     "Samburu",
                     "Siaya",
                     "Tana River",
                     "Vihiga",
                     "West Pokot")
         ) |> 
  select(area, page) |> 
  distinct()
#> # A tibble: 24 × 2
#>    area        page
#>    <chr>      <int>
#>  1 Samburu       42
#>  2 Tana River    53
#>  3 Tana River    56
#>  4 Garissa       65
#>  5 Garissa       69
#>  6 Isiolo        98
#>  7 Isiolo       100
#>  8 Machakos     149
#>  9 Machakos     154
#> 10 Makueni      159
#> # … with 14 more rows
```

Now we can add the flag for whether the area is a county, and adjust for the ones that are troublesome,


```r
all_tables <- 
  all_tables |> 
  mutate(area_type = if_else(area %in% list_counties$area, "county", "sub-county"))

all_tables <- 
  all_tables |> 
  mutate(area_type = case_when(
    area == "Samburu" & page == 42 ~ "sub-county",
    area == "Tana River" & page == 56 ~ "sub-county",
    area == "Garissa" & page == 69 ~ "sub-county",
    area == "Isiolo" & page == 100 ~ "sub-county",
    area == "Machakos" & page == 154 ~ "sub-county",
    area == "Makueni" & page == 164 ~ "sub-county",
    area == "Kiambu" & page == 213 ~ "sub-county",
    area == "West Pokot" & page == 233 ~ "sub-county",
    area == "Vihiga" & page == 333 ~ "sub-county",
    area == "Busia" & page == 353 ~ "sub-county",
    area == "Siaya" & page == 360 ~ "sub-county",
    area == "Homa Bay" & page == 375 ~ "sub-county",
    TRUE ~ area_type
    )
  )

rm(list_counties)

all_tables
#> # A tibble: 59,532 × 8
#>    age     male female   total area    table  page area_type
#>    <chr>  <int>  <int>   <int> <chr>   <chr> <int> <chr>    
#>  1 Total 610257 598046 1208303 Mombasa Tabl…    30 county   
#>  2 0      15111  15009   30120 Mombasa Tabl…    30 county   
#>  3 1      15805  15308   31113 Mombasa Tabl…    30 county   
#>  4 2      15088  14837   29925 Mombasa Tabl…    30 county   
#>  5 3      14660  14031   28691 Mombasa Tabl…    30 county   
#>  6 4      14061  13993   28054 Mombasa Tabl…    30 county   
#>  7 0-4    74725  73178  147903 Mombasa Tabl…    30 county   
#>  8 5      13851  14023   27874 Mombasa Tabl…    30 county   
#>  9 6      12889  13216   26105 Mombasa Tabl…    30 county   
#> 10 7      13268  13203   26471 Mombasa Tabl…    30 county   
#> # … with 59,522 more rows
```

Having dealt with the areas, we can deal with the ages. First, we need to fix some clear errors.


```r
table(all_tables$age) |> head()
#> 
#>     0   0-4     1    10 10-14 10-19 
#>   484   484   484   484   482     1
unique(all_tables$age) |> head()
#> [1] "Total" "0"     "1"     "2"     "3"     "4"

# Looks like there should be 484, so need to follow up on some:
all_tables$age[all_tables$age == "NotStated"] <- "Not Stated"
all_tables$age[all_tables$age == "43594"] <- "5-9"
all_tables$age[all_tables$age == "43752"] <- "10-14"
all_tables$age[all_tables$age == "9-14"] <- "5-9"
all_tables$age[all_tables$age == "10-19"] <- "10-14"
```

The census has done some of the work of putting together age-groups for us, but we want to make it easy to just focus on the counts by single-year-age. As such we will add a flag as to the type of age it is: an age group, such as "ages 0 to 5", or a single age, such as "1".


```r
all_tables$age_type <-
  if_else(str_detect(all_tables$age, c("-")), "age-group", "single-year")
all_tables$age_type <-
  if_else(str_detect(all_tables$age, c("Total")),
          "age-group",
          all_tables$age_type)
```

At the moment, age is a character variable. We have a decision to make here. We do not want it to be a character variable (because it will not graph properly), but we do not want it to be numeric, because there is `total` and `100+` in there. For now, we will just make it into a factor, and at least that will be able to be nicely graphed.


```r
all_tables$age <- as_factor(all_tables$age)
```



### Check data

Having gathered and cleaned the data, we would like to run a few checks. Given the format of the data, we can check that 'total' is the sum of 'male' and 'female'. (While we would prefer to use different groupings, this is what the Kenyan government collected and makes available.)


```r
follow_up <- 
  all_tables |> 
  mutate(check_sum = male + female,
         totals_match = if_else(total == check_sum, 1, 0)
         ) |> 
  filter(totals_match == 0)
```

And we can adjust the one that looks to be wrong.


```r
# There is just one that looks wrong
all_tables$male[all_tables$age == "10" & all_tables$page == 187] <- as.integer(1)

rm(follow_up)
```

The Kenyan census provides different tables for the total of each county and sub-county; and then within each county, for the number in an urban area in that county, and the number in a urban area in that county. Some counties only have an urban count, but we would like to make sure that the sum of rural and urban counts equals the total count. This requires pivoting the data from long to wide.

First, we construct different tables for each of the three. 


```r
# Table 2.3
table_2_3 <- all_tables |> 
  filter(table == "Table 2.3: Distribution of Population by Age, Sex*, County and Sub- County")
table_2_4a <- all_tables |> 
  filter(table == "Table 2.4a: Distribution of Rural Population by Age, Sex* and County")
table_2_4b <- all_tables |> 
  filter(table == "Table 2.4b: Distribution of Urban Population by Age, Sex* and County")
```

Then having constructed the constituent parts, we can join then based on age, area, and whether it is a county.


```r
both_2_4s <-
  full_join(
    table_2_4a,
    table_2_4b,
    by = c("age", "area", "area_type"),
    suffix = c("_rural", "_urban")
  )

all <-
  full_join(
    table_2_3,
    both_2_4s,
    by = c("age", "area", "area_type"),
    suffix = c("_all", "_")
  )

all <-
  all |>
  mutate(
    page = glue::glue(
      'Total from p. {page}, rural from p. {page_rural}, urban from p. {page_urban}'
    )
  ) |>
  select(
    -page,
    -page_rural,
    -page_urban,-table,
    -table_rural,
    -table_urban,-age_type_rural,
    -age_type_urban
  )

rm(both_2_4s, table_2_3, table_2_4a, table_2_4b)
```

We can now check that the sum of rural and urban is the same as the total.


```r
follow_up <- 
  all |> 
  mutate(total_from_bits = total_rural + total_urban,
         check_total_is_rural_plus_urban = if_else(total == total_from_bits, 1, 0),
         total_from_bits - total) |> 
  filter(check_total_is_rural_plus_urban == 0)

head(follow_up)
#> # A tibble: 3 × 16
#>   age          male female  total area   area_type age_type 
#>   <fct>       <int>  <int>  <int> <chr>  <chr>     <chr>    
#> 1 Not Stated     31     10     41 Nakuru county    single-y…
#> 2 Total      434287 441379 875666 Bomet  county    age-group
#> 3 Not Stated      3      2      5 Bomet  county    single-y…
#> # … with 9 more variables: male_rural <int>,
#> #   female_rural <int>, total_rural <int>,
#> #   male_urban <int>, female_urban <int>,
#> #   total_urban <int>, total_from_bits <int>,
#> #   check_total_is_rural_plus_urban <dbl>,
#> #   `total_from_bits - total` <int>
rm(follow_up)
```

There are just a few, but as they only have a difference of 1, we will just move on.

Finally, we want to check that the single age counts sum to the age-groups.


```r
follow_up <- 
  all |> 
  mutate(groups = case_when(age %in% c("0", "1", "2", "3", "4", "0-4") ~ "0-4",
                            age %in% c("5", "6", "7", "8", "9", "5-9") ~ "5-9",
                            age %in% c("10", "11", "12", "13", "14", "10-14") ~ "10-14",
                            age %in% c("15", "16", "17", "18", "19", "15-19") ~ "15-19",
                            age %in% c("20", "21", "22", "23", "24", "20-24") ~ "20-24",
                            age %in% c("25", "26", "27", "28", "29", "25-29") ~ "25-29",
                            age %in% c("30", "31", "32", "33", "34", "30-34") ~ "30-34",
                            age %in% c("35", "36", "37", "38", "39", "35-39") ~ "35-39",
                            age %in% c("40", "41", "42", "43", "44", "40-44") ~ "40-44",
                            age %in% c("45", "46", "47", "48", "49", "45-49") ~ "45-49",
                            age %in% c("50", "51", "52", "53", "54", "50-54") ~ "50-54",
                            age %in% c("55", "56", "57", "58", "59", "55-59") ~ "55-59",
                            age %in% c("60", "61", "62", "63", "64", "60-64") ~ "60-64",
                            age %in% c("65", "66", "67", "68", "69", "65-69") ~ "65-69",
                            age %in% c("70", "71", "72", "73", "74", "70-74") ~ "70-74",
                            age %in% c("75", "76", "77", "78", "79", "75-79") ~ "75-79",
                            age %in% c("80", "81", "82", "83", "84", "80-84") ~ "80-84",
                            age %in% c("85", "86", "87", "88", "89", "85-89") ~ "85-89",
                            age %in% c("90", "91", "92", "93", "94", "90-94") ~ "90-94",
                            age %in% c("95", "96", "97", "98", "99", "95-99") ~ "95-99",
                            TRUE ~ "Other")
         ) |> 
  group_by(area_type, area, groups) |> 
  mutate(group_sum = sum(total, na.rm = FALSE),
         group_sum = group_sum / 2,
         difference = total - group_sum) |> 
  ungroup() |> 
  filter(age == groups) |> 
  filter(total != group_sum) 

head(follow_up)
#> # A tibble: 6 × 16
#>   age    male female total area           area_type age_type
#>   <fct> <int>  <int> <int> <chr>          <chr>     <chr>   
#> 1 0-4       1      5     6 Mt. Kenya For… sub-coun… age-gro…
#> 2 5-9       1      2     3 Mt. Kenya For… sub-coun… age-gro…
#> 3 10-14     6      0     6 Mt. Kenya For… sub-coun… age-gro…
#> 4 15-19     9      1    10 Mt. Kenya For… sub-coun… age-gro…
#> 5 20-24    21      4    25 Mt. Kenya For… sub-coun… age-gro…
#> 6 25-29    59      9    68 Mt. Kenya For… sub-coun… age-gro…
#> # … with 9 more variables: male_rural <int>,
#> #   female_rural <int>, total_rural <int>,
#> #   male_urban <int>, female_urban <int>,
#> #   total_urban <int>, groups <chr>, group_sum <dbl>,
#> #   difference <dbl>

rm(follow_up)
```

Mt. Kenya Forest, Aberdare Forest, Kakamega Forest are all slightly dodgy. It does not seem to be in the documentation, but it looks like the Kenyan government has apportioned these between various countries. This is understandable, and unlikely to be a big deal, so, again, we will just move on.

### Tidy-up

Now that we are confident that everything is looking good, we can just convert it to tidy format. This will make it easier to work with.


```r
all <-
  all |>
  rename(male_total = male,
         female_total = female,
         total_total = total) |>
  pivot_longer(
    cols = c(
      male_total,
      female_total,
      total_total,
      male_rural,
      female_rural,
      total_rural,
      male_urban,
      female_urban,
      total_urban
    ),
    names_to = "type",
    values_to = "number"
  ) |>
  separate(
    col = type,
    into = c("gender", "part_of_area"),
    sep = "_"
  ) |>
  select(area, area_type, part_of_area, age, age_type, gender, number)

head(all)
#> # A tibble: 6 × 7
#>   area  area_type part_of_area age   age_type gender  number
#>   <chr> <chr>     <chr>        <fct> <chr>    <chr>    <int>
#> 1 Momb… county    total        Total age-gro… male    610257
#> 2 Momb… county    total        Total age-gro… female  598046
#> 3 Momb… county    total        Total age-gro… total  1208303
#> 4 Momb… county    rural        Total age-gro… male        NA
#> 5 Momb… county    rural        Total age-gro… female      NA
#> 6 Momb… county    rural        Total age-gro… total       NA
```




The original purpose of cleaning this dataset was to make a table for @alexander2021bayesian. Just to bring this all together, we could make a graph of single-year counts, by gender, for Nairobi (Figure \@ref(fig:monicasnairobigraph)).


```r
monicas_dataset <- 
  all |> 
  filter(area_type == "county") |> 
  filter(part_of_area == "total") |>
  filter(age_type == "single-year") |> 
  select(area, age, gender, number)

head(monicas_dataset)
#> # A tibble: 6 × 4
#>   area    age   gender number
#>   <chr>   <fct> <chr>   <int>
#> 1 Mombasa 0     male    15111
#> 2 Mombasa 0     female  15009
#> 3 Mombasa 0     total   30120
#> 4 Mombasa 1     male    15805
#> 5 Mombasa 1     female  15308
#> 6 Mombasa 1     total   31113
```


```r
monicas_dataset |>
  filter(area == "Nairobi") |>
  filter(gender != "total") |>
  ggplot(aes(x = age, y = number, fill = gender)) +
  geom_col(aes(x = age, y = number, fill = gender), position = "dodge") +
  scale_y_continuous(labels = scales::comma) +
  scale_x_discrete(breaks = c(seq(from = 0, to = 99, by = 5), "100+")) +
  theme_classic()+
  scale_fill_brewer(palette = "Set1") +
  labs(y = "Number",
       x = "Age",
       fill = "Gender",
       caption = "Data source: 2019 Kenya Census")
```

<div class="figure">
<img src="30-clean_and_prepare_files/figure-html/monicasnairobigraph-1.png" alt="Distribution of age and gender in Nairobi in 2019, based on Kenyan census" width="672" />
<p class="caption">(\#fig:monicasnairobigraph)Distribution of age and gender in Nairobi in 2019, based on Kenyan census</p>
</div>

A variety of features are clear from Figure \@ref(fig:monicasnairobigraph), including age-heaping, a slight difference in the ratio of male-female birth, and a substantial difference between ages 15 and 25.





## Checks and tests

Robert Caro, the biographer of Lyndon Johnson, spent years tracking down everyone connected to the 36th President of the United States. He went to far as to live in Texas Hill Country for three years so that he could better understand where LBJ was from. When he heard a story that LBJ used to run to the Senate when he was a senator, he ran that route multiple times himself to try to understand why LBJ was running. Caro eventually understood it only when he ran the route as the sun was rising, just as LBJ had done, that the sun hits the Senate Rotunda in a particularly inspiring way [@caroonworking]. This background work enabled him to uncover aspects that no one else knew. For instance, it turns out that LBJ almost surely stole his first election win as a Texas Senator [@caroonworking]. We need to understand our data to this same extent. We must turn every page and go to every extreme.


The idea of negative space is well established in design. It refers to that which surrounds the subject. Sometimes negative space is used as an effect, for instance the logo of FedEx, an American logistics company, has negative space between the E and x that creates an arrow. In a similar way, we want to be cognizant of the data that we have, and the data that we do not have. We are worried that the data that we do not have somehow has meaning, potentially even to the extent of changing our conclusions. When we are cleaning data, we are looking for anomalies. We are interested in values that are in there that should not be, but also the opposite situation---values that are missing that should not be. There are four tools that we use to identify these situations: graphs, counts, green/red conditions, targets.

### Graphs

Graphs are an invaluable tool when cleaning data, because they show each point in the dataset, in relation to the other points. They are especially useful for identifying when a value does not belong. For instance, if a value is expected to be numerical, but it is still a character then it will not plot and a warning will be displayed.

Graphs will be especially useful for numerical data, but are still useful for text and categorical data. Let us pretend that we have a situation where we are interested in a person's age, for some youth survey. We have the following data:


```r
raw_data <- 
  tibble(ages = c(11, 17, 22, 13, 21, 16, 16, 6, 16, 11, 150))

raw_data |> 
  ggplot(aes(y = ages, x = 0)) +
  geom_point()
```

<img src="30-clean_and_prepare_files/figure-html/unnamed-chunk-40-1.png" width="672" />

The graph clearly shows the unexpected value of 150. The most likely explanation is that the data were incorrectly entered with a trailing 0, and should be 15. We can fix that, and document it, and then redo the graph, so as to see that everything seems more reasonable now.

### Counts

We want to focus on getting most of the data right. So we are interested in the counts of unique values. Hopefully a majority of the data are concentrated in the most common counts. But it can also be useful to invert it, and see what is especially uncommon. The extent to which we want to deal with these depends on what we need. Ultimately, each time we fix one we are getting very few additional observations, potentially even just one! Counts are especially useful with text or categorical data, but can be helpful with numerical as well.

Let us see an example.


```r
raw_data <- 
  tibble(country = c('Australie', 'Austrelia', 'Australie', 'Australie', 'Aeustralia', 'Austraia', 'Australia', 'Australia', 'Australia', 'Australia'
                  )
         )

raw_data |> 
  count(country, sort = TRUE)
#> # A tibble: 5 × 2
#>   country        n
#>   <chr>      <int>
#> 1 Australia      4
#> 2 Australie      3
#> 3 Aeustralia     1
#> 4 Austraia       1
#> 5 Austrelia      1
```

The use of this count clearly identifies where we should spend our time - changing 'Australie' to 'Australia' would almost double our amount of usable data.


### Go/no-go

Some things are so important that you require that your cleaned dataset have them. These are go/no-go conditions. They would typically come out of experience, expert knowledge, or the planning and simulation exercises. An example may be that there are no negative numbers in an age column, and no ages above 140.

For these we could specifically require that the condition is met. Other examples include:

- If doing cross-country analysis, then a list of country names that we know should be in our dataset would be useful. Our no-go conditions would then be if there were: 1) values not in that list in our dataset, or, vice versa; 2) countries that we expected to be in there that were not.

To have a concrete example, let us consider if we were doing some analysis about the five largest counties in Kenya: 'Nairobi', 'Kiambu', 'Nakuru', 'Kakamega', 'Bungoma'. Let us create that array first.


```r
correct_counties <- c('Nairobi', 'Kiambu', 'Nakuru', 'Kakamega', 'Bungoma')
```


We begin with the following dataset.


```r
top_five_kenya <- 
  tibble(county = c('Nairobi', 'Nairob1', 'Nakuru', 'Kakamega', 'Nakuru', 
                      'Kiambu', 'Kiambru', 'Kabamega', 'Bun8oma', 'Bungoma')
  )

top_five_kenya |> 
  count(county, sort = TRUE)
#> # A tibble: 9 × 2
#>   county       n
#>   <chr>    <int>
#> 1 Nakuru       2
#> 2 Bun8oma      1
#> 3 Bungoma      1
#> 4 Kabamega     1
#> 5 Kakamega     1
#> 6 Kiambru      1
#> 7 Kiambu       1
#> 8 Nairob1      1
#> 9 Nairobi      1
```

Based on the count we know that we have to fix some of them and there are two with numbers that are obvious fixes.


```r
top_five_kenya <- 
  top_five_kenya |> 
  mutate(county = str_replace_all(county, 'Nairob1', 'Nairobi'),
         county = str_replace_all(county, 'Bun8oma', 'Nairobi')
  )

top_five_kenya |> 
  count(county, sort = TRUE)
#> # A tibble: 7 × 2
#>   county       n
#>   <chr>    <int>
#> 1 Nairobi      3
#> 2 Nakuru       2
#> 3 Bungoma      1
#> 4 Kabamega     1
#> 5 Kakamega     1
#> 6 Kiambru      1
#> 7 Kiambu       1
```

At this point we can use our go/no-go conditions to decide whether we are finished or not.


```r
top_five_kenya$county |> unique()
#> [1] "Nairobi"  "Nakuru"   "Kakamega" "Kiambu"   "Kiambru" 
#> [6] "Kabamega" "Bungoma"

if(all(top_five_kenya$county |> unique() == top_five_kenya)) {
  "Oh no"
}
if(all(top_five_kenya==top_five_kenya$county |> unique()) ) {
  "Oh no"
}
```

And so it is clear that we still have cleaning to do!

We may also find similar conditions from experts and those with experience in the particular field.



<!-- ### Targets -->

<!-- We could clean data indefinitely, but we need an end state. Part of this is sketching an end-point, and simulating. But sometimes it helps to have a metric. This may be especially the case when we have a large dataset, a deadline, and a team, because the data cleaning stage is just one part of what needs to happen. One helpful aspect is to set targets against which we can judge a dataset and then just achieve those. -->

<!-- Let us turn to a common use-case which is merging two datasets. Of particular interest is the unique key between the two, which is  -->


<!-- Add in the notion of precision and recall. Maybe have a look at: -->

<!-- https://arxiv.org/pdf/2101.05308.pdf -->

<!-- ### Consistency -->

<!-- Consistency refers to the proportion -->

<!-- #### Internal consistency -->


<!-- #### External consistency -->



### Class

It is often said that American society is obsessed with money, while British society is obsessed with class. In the case of data cleaning and preparation we need to be British. Explicit checks of the class of variables are essential. Accidentally assigning the wrong class to a variable can have a large effect on subsequent analysis. In particular:

- check whether some value should be a number or a factor; and
- check that dates are correctly formatted.

To understand why it is important to be clear about whether a value is a number or a factor, consider the following situation:


```r
some_data <- 
  tibble(response = c(1, 1, 0, 1, 0, 1, 1, 0, 0),
         group = c(1, 2, 1, 1, 2, 3, 1, 2, 3)) |> 
  mutate(group_as_integer = as.integer(group),
         group_as_factor = as.factor(group),
         )
```

Let us start with 'group' as an integer and look at a logistic regression.


```r
lm(response~group_as_integer, data = some_data) |> 
  summary()
#> 
#> Call:
#> lm(formula = response ~ group_as_integer, data = some_data)
#> 
#> Residuals:
#>    Min     1Q Median     3Q    Max 
#>  -0.68  -0.52   0.32   0.32   0.64 
#> 
#> Coefficients:
#>                  Estimate Std. Error t value Pr(>|t|)
#> (Intercept)        0.8400     0.4495   1.869    0.104
#> group_as_integer  -0.1600     0.2313  -0.692    0.511
#> 
#> Residual standard error: 0.5451 on 7 degrees of freedom
#> Multiple R-squared:  0.064,	Adjusted R-squared:  -0.06971 
#> F-statistic: 0.4786 on 1 and 7 DF,  p-value: 0.5113
```

Now we can try it as a factor. The interpretation of the variable is completely different.


```r
lm(response~group_as_factor, data = some_data) |> 
  summary()
#> 
#> Call:
#> lm(formula = response ~ group_as_factor, data = some_data)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -0.7500 -0.3333  0.2500  0.2500  0.6667 
#> 
#> Coefficients:
#>                  Estimate Std. Error t value Pr(>|t|)  
#> (Intercept)        0.7500     0.2826   2.654   0.0378 *
#> group_as_factor2  -0.4167     0.4317  -0.965   0.3717  
#> group_as_factor3  -0.2500     0.4895  -0.511   0.6278  
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 0.5652 on 6 degrees of freedom
#> Multiple R-squared:  0.1375,	Adjusted R-squared:  -0.15 
#> F-statistic: 0.4783 on 2 and 6 DF,  p-value: 0.6416
```


Another critical aspect is to check the dates. In particular we want to try to make it into the following format: YYYY-MM-DD. There are of course differences of opinion as to what is an appropriate date format in the broader world, and reasonable people can differ on whether 1 July 2010 or July 1, 2020, is better, but YYYY-MM-DD is the format that is generally most appropriate for data.




## Naming things

> An improved scanning software we developed identified gene name errors in 30.9% (3,436/11,117) of articles with supplementary Excel gene lists; a figure significantly higher than previously estimated. This is due to gene names being converted not just to dates and floating-point numbers, but also to internal date format (five-digit numbers).
>
> @omggenes

Names matter. The land on which much of this book was written is today named Toronto, which is within a country named Canada, but for a long time before was known as Turtle Island. While not common, these days people will sometimes still refer to themselves as being on Turtle Island. That tells us something about them, and our use of the name Canada tells them something about us. There is a big rock in the center of Australia. For a long time, it was called Uluru, then it was known as Ayers Rock. Today it has a dual name that combines both, and the choice of which name you use tells someone something about you. Even the British Royal Family recognize the power of names. In 1917 they changed from the House of Saxe-Coburg and Gotha to the House of Windsor, due to a feeling that the former was too Germanic given World War I was ongoing. Names matter in everyday life. And they matter in data science too.

The importance of names, and of ignoring existing claims through re-naming was clear in those cases, but we see it in data science as well. We need to be very careful when we name our datasets, our variables, and our functions. There is a tendency, these days, to call the variable 'gender' even though it may only have male and female, because we do not want to say the word 'sex'. @tukey1962future essentially defines what we today call data science, but it was popularized by folks in computer science in the 2010s who ignored, either deliberately or through ignorance, what came before them. The past ten years has been characteristic by the renaming of concepts that were well-established in the fields that computer science has recently expanded into. For instance, the use of binary variables in regression, sometimes called 'dummy variables', is called one-hot encoding in computer science. Like all fashions, this one will pass also. We most recently saw this through the 1980s through to early 2010s with economics. Economists described themselves as the 'queen of the social sciences' and self-described as imperialistic [@lazear2000economic]. We are now recognizing the costs of this imperialism in social sciences, and in the future we will look back and count the cost of computer science imperialism in data science. The key here is that no area of study is ever *terra nullius*, or nobody's land. It is important to recognize, adopt, and use existing names, and practices.

Names give places meaning, and by ignoring existing names, we ignore what has come before us. @kimmerer2013[p. 34] describes how 'Tahawus is the Algonquin name for Mount Marcy, the highest peak in the Adirondacks. It's called Mount March to commemorate a governor who never set foot on those wild slopes.' She continues that '[w]hen we call a place by name it is transformed from wilderness to homeland.' She is talking with regard to physical places, but the same is true of our function names, our variable names and our dataset names. When we use gender instead of sex because we do not want to say sex in front of others, we ignore the preferences of those that provided data.

In addition to respecting the nature of the data, names need to satisfy two additional considerations: 

1) they need to be machine readable, and 
2) they need to be human readable.

Machine readable names is an easier standard to meet, but usually means avoiding spaces and special characters. A space can be replaced with a underbar. Usually, special characters should just be removed because they can be inconsistent between different computers and languages. The names should also be unique within a dataset, and unique within a collection of datasets unless that particular column is being deliberately used as a key to join different datasets.

An especially useful function to use to get closer to machine readable names is `janitor::clean_names()` which is from the `janitor` package [@janitor]. This deals with those issues mentioned above as well as a few others. We can see an example.



```r
bad_names_good_names <- 
  tibble(
    'First' = c(1),
    'second name has spaces' = c(1),
    'weird#symbol' = c(1),
    'InCoNsIsTaNtCaPs' = c(1)
  )

bad_names_good_names
#> # A tibble: 1 × 4
#>   First `second name has s…` `weird#symbol` InCoNsIsTaNtCaPs
#>   <dbl>                <dbl>          <dbl>            <dbl>
#> 1     1                    1              1                1

bad_names_good_names <- 
  bad_names_good_names |> 
  janitor::clean_names()
  
bad_names_good_names
#> # A tibble: 1 × 4
#>   first second_name_has_s… weird_number_sy… in_co_ns_is_ta_…
#>   <dbl>              <dbl>            <dbl>            <dbl>
#> 1     1                  1                1                1
```

Human readable names require an additional layer. We need to consider other cultures and how they may interpret some of the names that we are using. We also need to consider different experience levels that subsequent users of your dataset may have. This is both in terms of experience with programming and statistics, but also experience with similar datasets. For instance, a column of 'flag' is often used to signal that a column contains data that needs to be followed up with or treated carefully in some way. An experienced analyst will know this, but a beginner will not. Try to use meaningful names wherever possible [@lin2020ten]. It has been found that shorter names may take longer to comprehend [@shorternamestakelonger], and so it is often useful to avoid abbreviations where possible.

One interesting feature of R is that in certain cases partial matching on names is possible. For instance:


```r
never_use_partial_matching <- 
  data.frame(
    my_first_name = c(1, 2),
    another_name = c("wow", "great")
  )

never_use_partial_matching$my_first_name
#> [1] 1 2
never_use_partial_matching$my
#> [1] 1 2
```

This behavior is not possible within the `tidyverse`, for instance if `data.frame` were replaced with `tibble` in the above code. Partial matching should almost never be used. It makes it more difficult to understand code after a break, and for others to come to it fresh.

@columnnamesascontracts advises using column names as contracts, through establishing a controlled vocabulary for column names. In this way, we would define a set of words that we can use in column names. In the controlled vocabulary of @columnnamesascontracts a column could start with an abbreviation for its class, then something specific to what it pertains to, and then various details. For instance, in the Kenyan data example earlier we have the following column names:  "area", "age", "gender", and "number". If we were to use our column names as contracts, then these could be: "chr_area", "fctr_group_age", "chr_group_gender", and "int_group_count".


```r
column_names_as_contracts <- 
  monicas_dataset |> 
  rename(
    "chr_area" = "area",
    "fctr_group_age" = "age",
    "chr_group_gender" = "gender",
    "int_group_count" = "number"
  )
```

We can then use `pointblank` [@pointblank] to set-up tests for us.


```r
library(pointblank)

agent <-
  create_agent(tbl = column_names_as_contracts) |>
  col_is_character(columns = vars(chr_area, chr_group_gender)) |>
  col_is_factor(columns = vars(fctr_group_age)) |>
  col_is_integer(columns = vars(int_group_count)) |>
  col_vals_in_set(columns = chr_group_gender,
                  set = c("male", "female", "total")) |>
  interrogate()

agent
```

```{=html}
<div id="pb_agent" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>@import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
@import url("https://unpkg.com/balloon-css/balloon.min.css");
html {
  font-family: 'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#pb_agent .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 90%;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pb_agent .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pb_agent .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pb_agent .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pb_agent .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pb_agent .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pb_agent .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pb_agent .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pb_agent .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#pb_agent .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pb_agent .gt_from_md > :first-child {
  margin-top: 0;
}

#pb_agent .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pb_agent .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pb_agent .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#pb_agent .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pb_agent .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#pb_agent .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#pb_agent .gt_left {
  text-align: left;
}

#pb_agent .gt_center {
  text-align: center;
}

#pb_agent .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pb_agent .gt_font_normal {
  font-weight: normal;
}

#pb_agent .gt_font_bold {
  font-weight: bold;
}

#pb_agent .gt_font_italic {
  font-style: italic;
}

#pb_agent .gt_super {
  font-size: 65%;
}

#pb_agent .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}

#pb_agent {
  -webkit-font-smoothing: antialiased;
}

#pb_agent .gt_row {
  overflow: visible;
}

#pb_agent .gt_sourcenote {
  height: 35px;
  padding: 0;
}

#pb_agent code {
  font-family: 'IBM Plex Mono', monospace, courier;
  background-color: transparent;
  padding: 0;
}
</style>
<table class="gt_table" style="table-layout: fixed;; width: 0px">
  <colgroup>
    <col style="width:6px;"/>
    <col style="width:35px;"/>
    <col style="width:190px;"/>
    <col style="width:120px;"/>
    <col style="width:120px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:65px;"/>
  </colgroup>
  <thead class="gt_header">
    <tr>
      <th colspan="14" class="gt_heading gt_title gt_font_normal" style="color: #444444; font-size: 28px; text-align: left; font-weight: 500;">Pointblank Validation</th>
    </tr>
    <tr>
      <th colspan="14" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="font-size: 12px; text-align: left;"><span style="text-decoration-style:solid;text-decoration-color:#ADD8E6;text-decoration-line:underline;text-underline-position:under;color:#333333;font-variant-numeric:tabular-nums;padding-left:4px;margin-right:5px;padding-right:2px;">[2022-02-21|09:11:33]</span></p>
<div style="height:25px;"><span style="background-color:#F1D35A;color:#222222;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 5px;font-weight:bold;border:solid 1px #F1D35A;padding:2px 15px 2px 15px;font-size:smaller;">tibble</span>
<span style="background-color:none;color:#222222;padding:0.5em 0.5em;position:inherit;margin:5px 10px 5px -4px;font-weight:bold;border:solid 1px #F1D35A;padding:2px 15px 2px 15px;font-size:smaller;">column_names_as_contracts</span></div>
</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;"></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;"></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">STEP</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">COLUMNS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">VALUES</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">TBL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">EVAL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">UNITS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">PASS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">FAIL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">W</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">S</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;">EXT</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left" style="background-color: #4CA64C; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">1</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that column `chr_area` is of type: character. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs>        <path d="M10.712234,0.014669353 L56.712234,0.014669353 C62.2350815,0.014669353 66.712234,4.49182185 66.712234,10.0146694 L66.712234,66.0146694 L10.712234,66.0146694 C5.18938647,66.0146694 0.712233968,61.5375169 0.712233968,56.0146694 L0.712233968,10.0146694 C0.712233968,4.49182185 5.18938647,0.014669353 10.712234,0.014669353 Z" id="path-1"></path>    </defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_is_character" transform="translate(-0.397206, 0.151308)">            <g id="rectangle">                <use fill="#FFFFFF" fill-rule="evenodd" xlink:href="#path-1"></use>                <path stroke="#000000" stroke-width="2" d="M65.712234,65.0146694 L65.712234,10.0146694 C65.712234,5.0441066 61.6827967,1.01466935 56.712234,1.01466935 L10.712234,1.01466935 C5.74167122,1.01466935 1.71223397,5.0441066 1.71223397,10.0146694 L1.71223397,56.0146694 C1.71223397,60.9852321 5.74167122,65.0146694 10.712234,65.0146694 L65.712234,65.0146694 Z"></path>            </g>            <rect id="column" fill="#000000" x="12.2117153" y="12.0146694" width="20" height="42" rx="1"></rect>            <text id="c" font-family="LucidaGrande, Lucida Grande" font-size="26" font-weight="normal" fill="#000000">                <tspan x="39.9695669" y="43.0146694">c</tspan>            </text>        </g>    </g></svg></div>
  <code style="font-size:10px;">&nbsp;col_is_character()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="chr_area" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>chr_area</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px">&mdash;</td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>1</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>1</code><br><code>1.00</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>0</code><br><code>0.00</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td class="gt_row gt_left" style="background-color: #4CA64C; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">2</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that column `chr_group_gender` is of type: character. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs>        <path d="M10.712234,0.014669353 L56.712234,0.014669353 C62.2350815,0.014669353 66.712234,4.49182185 66.712234,10.0146694 L66.712234,66.0146694 L10.712234,66.0146694 C5.18938647,66.0146694 0.712233968,61.5375169 0.712233968,56.0146694 L0.712233968,10.0146694 C0.712233968,4.49182185 5.18938647,0.014669353 10.712234,0.014669353 Z" id="path-1"></path>    </defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_is_character" transform="translate(-0.397206, 0.151308)">            <g id="rectangle">                <use fill="#FFFFFF" fill-rule="evenodd" xlink:href="#path-1"></use>                <path stroke="#000000" stroke-width="2" d="M65.712234,65.0146694 L65.712234,10.0146694 C65.712234,5.0441066 61.6827967,1.01466935 56.712234,1.01466935 L10.712234,1.01466935 C5.74167122,1.01466935 1.71223397,5.0441066 1.71223397,10.0146694 L1.71223397,56.0146694 C1.71223397,60.9852321 5.74167122,65.0146694 10.712234,65.0146694 L65.712234,65.0146694 Z"></path>            </g>            <rect id="column" fill="#000000" x="12.2117153" y="12.0146694" width="20" height="42" rx="1"></rect>            <text id="c" font-family="LucidaGrande, Lucida Grande" font-size="26" font-weight="normal" fill="#000000">                <tspan x="39.9695669" y="43.0146694">c</tspan>            </text>        </g>    </g></svg></div>
  <code style="font-size:10px;">&nbsp;col_is_character()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="chr_group_gender" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>chr_group_gender</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px">&mdash;</td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>1</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>1</code><br><code>1.00</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>0</code><br><code>0.00</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td class="gt_row gt_left" style="background-color: #4CA64C; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">3</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that column `fctr_group_age` is of type: factor. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs>        <path d="M10.712234,0.014669353 L56.712234,0.014669353 C62.2350815,0.014669353 66.712234,4.49182185 66.712234,10.0146694 L66.712234,66.0146694 L10.712234,66.0146694 C5.18938647,66.0146694 0.712233968,61.5375169 0.712233968,56.0146694 L0.712233968,10.0146694 C0.712233968,4.49182185 5.18938647,0.014669353 10.712234,0.014669353 Z" id="path-1"></path>    </defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_is_factor" transform="translate(0.116964, 0.726017)">            <g id="rectangle">                <use fill="#FFFFFF" fill-rule="evenodd" xlink:href="#path-1"></use>                <path stroke="#000000" stroke-width="2" d="M65.712234,65.0146694 L65.712234,10.0146694 C65.712234,5.0441066 61.6827967,1.01466935 56.712234,1.01466935 L10.712234,1.01466935 C5.74167122,1.01466935 1.71223397,5.0441066 1.71223397,10.0146694 L1.71223397,56.0146694 C1.71223397,60.9852321 5.74167122,65.0146694 10.712234,65.0146694 L65.712234,65.0146694 Z"></path>            </g>            <rect id="column" fill="#000000" x="12.2117153" y="12.0146694" width="20" height="42" rx="1"></rect>            <text id="f" font-family="LucidaGrande, Lucida Grande" font-size="26" font-weight="normal" fill="#000000">                <tspan x="41.8484732" y="43.0146694">f</tspan>            </text>        </g>    </g></svg></div>
  <code style="font-size:11px;">&nbsp;col_is_factor()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="fctr_group_age" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>fctr_group_age</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px">&mdash;</td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>1</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>1</code><br><code>1.00</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>0</code><br><code>0.00</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td class="gt_row gt_left" style="background-color: #4CA64C; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">4</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that column `int_group_count` is of type: integer. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs>        <path d="M10.712234,0.014669353 L56.712234,0.014669353 C62.2350815,0.014669353 66.712234,4.49182185 66.712234,10.0146694 L66.712234,66.0146694 L10.712234,66.0146694 C5.18938647,66.0146694 0.712233968,61.5375169 0.712233968,56.0146694 L0.712233968,10.0146694 C0.712233968,4.49182185 5.18938647,0.014669353 10.712234,0.014669353 Z" id="path-1"></path>    </defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_is_integer" transform="translate(-0.397206, 0.726017)">            <g id="rectangle">                <use fill="#FFFFFF" fill-rule="evenodd" xlink:href="#path-1"></use>                <path stroke="#000000" stroke-width="2" d="M65.712234,65.0146694 L65.712234,10.0146694 C65.712234,5.0441066 61.6827967,1.01466935 56.712234,1.01466935 L10.712234,1.01466935 C5.74167122,1.01466935 1.71223397,5.0441066 1.71223397,10.0146694 L1.71223397,56.0146694 C1.71223397,60.9852321 5.74167122,65.0146694 10.712234,65.0146694 L65.712234,65.0146694 Z"></path>            </g>            <rect id="column" fill="#000000" x="12.2117153" y="12.0146694" width="20" height="42" rx="1"></rect>            <text id="i" font-family="LucidaGrande, Lucida Grande" font-size="26" font-weight="normal" fill="#000000">                <tspan x="42.8704458" y="43.0146694">i</tspan>            </text>        </g>    </g></svg></div>
  <code style="font-size:11px;">&nbsp;col_is_integer()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="int_group_count" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>int_group_count</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px">&mdash;</td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>1</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>1</code><br><code>1.00</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>0</code><br><code>0.00</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td class="gt_row gt_left" style="background-color: #4CA64C; height:  40px"></td>
<td class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height:  40px">5</td>
<td class="gt_row gt_left" style="height:  40px"><div class='gt_from_md'><div aria-label="Expect that values in `chr_group_gender` should be in the set of `male`, `female`, `total`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <defs>        <path d="M10.712234,0 L56.712234,0 C62.2350815,-1.01453063e-15 66.712234,4.4771525 66.712234,10 L66.712234,66 L10.712234,66 C5.18938647,66 0.712233968,61.5228475 0.712233968,56 L0.712233968,10 C0.712233968,4.4771525 5.18938647,1.01453063e-15 10.712234,0 Z" id="path-1"></path>    </defs>    <g id="pointblank" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_in_set" transform="translate(-0.487938, 0.859210)">            <g id="rectangle">                <use fill="#FFFFFF" fill-rule="evenodd" xlink:href="#path-1"></use>                <path stroke="#000000" stroke-width="2" d="M65.712234,65 L65.712234,10 C65.712234,5.02943725 61.6827967,1 56.712234,1 L10.712234,1 C5.74167122,1 1.71223397,5.02943725 1.71223397,10 L1.71223397,56 C1.71223397,60.9705627 5.74167122,65 10.712234,65 L65.712234,65 Z"></path>            </g>            <path d="M44.127969,41.1538382 L31.0814568,41.1538382 C29.9510748,41.1536429 28.8827052,40.9256134 27.9079888,40.5136953 C26.4467442,39.8960136 25.19849,38.8599685 24.3189894,37.5577099 C23.8792391,36.906727 23.5314818,36.1899233 23.2936866,35.4252675 C23.2130217,35.16589 23.1460289,34.9005554 23.0913409,34.6307286 L44.1278714,34.6307286 C45.028466,34.6306309 45.7586488,33.9004481 45.7586488,32.9998535 C45.7586488,32.0992589 45.028466,31.3690761 44.1278714,31.3690761 L23.0905596,31.3690761 C23.1990567,30.8337194 23.3597028,30.3180894 23.5675173,29.8264831 C24.185199,28.3652386 25.2212442,27.1169844 26.5236004,26.2374838 C27.1745833,25.7977334 27.891387,25.4499762 28.6560428,25.2122786 C29.4208939,24.9744833 30.2334994,24.8459665 31.0813591,24.8459665 L44.1277737,24.8459665 C45.0283683,24.8459665 45.7585511,24.1157837 45.7585511,23.2151891 C45.7585511,22.3145945 45.0283683,21.5844117 44.1277737,21.5844117 L31.0813591,21.5844117 C29.5096643,21.5844117 28.0039858,21.9038483 26.6373711,22.4820765 C24.5866678,23.3498583 22.8469049,24.7950871 21.6163267,26.616296 C20.3856508,28.4362354 19.665136,30.6413347 19.6658196,33.0000488 C19.6656243,34.5717436 19.9852563,36.0774222 20.5635822,37.4440369 C21.4312663,39.4947402 22.8765927,41.2345031 24.697704,42.4650813 C26.5176434,43.6957572 28.7227427,44.4155883 31.0814568,44.4155883 L44.1278714,44.4155883 C45.028466,44.4155883 45.7586488,43.6854055 45.7586488,42.7848109 C45.7586488,41.8842163 45.0285636,41.1538382 44.127969,41.1538382 Z" id="set_of" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div>
  <code style="font-size:11px;">&nbsp;col_vals_in_set()</code>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="chr_group_gender" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>chr_group_gender</code>
  </p>
</div>
</div></td>
<td class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height:  40px"><div class='gt_from_md'><div aria-label="male, female, total" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>male, female, total</code></p></div>
</div></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td class="gt_row gt_right" style="font-size: 11px; height:  40px"><code>14K</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>14K</code><br><code>1.00</code></td>
<td class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height:  40px"><code>0</code><br><code>0.00</code></td>
<td class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height:  40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td class="gt_row gt_center" style="height:  40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="14"><span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin-left:10px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;padding:2px 10px 2px 10px;">2022-02-21 09:11:33 EST</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;margin:5px 1px 5px 0;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">&lt; 1 s</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 1px 5px -1px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">2022-02-21 09:11:33 EST</span></td>
    </tr>
  </tfoot>
  
</table>
</div>
```





<!-- ## Pipelines -->

<!-- Following @suresh2020framework -->











## Exercises and tutorial

### Exercises

1. Is the following an example of tidy data? 

```r
tibble(name = c('Anne', 'Bethany', 'Stephen', 'William'),
       age_group = c('18-29', '30-44', '45-60', '60+'),
       )
#> # A tibble: 4 × 2
#>   name    age_group
#>   <chr>   <chr>    
#> 1 Anne    18-29    
#> 2 Bethany 30-44    
#> 3 Stephen 45-60    
#> 4 William 60+
```
2. If I am dealing with ages then what is the most likely class for the variable? [Select all that apply.]
    a. integer
    b. matrix
    c. numeric
    d. factor


### Tutorial

With regard to @Jordan2019Artificial, @datafeminism2020, Chapter 6, @thatrandyauperson, and other relevant work, to what extent do you think we should let the data speak for themselves? [Please write a page or two.]

