


# (PART) Preparation {-}

# Cleaning and preparing data

**STATUS: Under construction.**

**Required reading**

- *Data Feminism*, Chapter 5 [@datafeminism2020].
- *R for Data Science*, Chapter 9 [@r4ds].

**Recommended reading**

- *We Gave Four Good Pollsters the Same Raw Data. They Had Four Different Results*, [@cohn2016].
- *Data Cleaning Procedures for the 1993 Robert Wood Johnson Foundation Employer Health Insurance Survey*, [@euller1997data].
- *Data Cleaning*, [@ilyas2019data].


**Key concepts/skills/etc**

- Planning an end-point, and simulating the data that you'd like, are key elements of cleaning and preparing data.
- Begin on a small sample of the dataset, write code to fix that, and then iterate and generalize to additional tranches.
- Develop a series of tests and checks that your final dataset should pass so that the features of the dataset are clear.
- Be especially concerned about the class of variables, having clear names, and that the values of each variable are as expected given all this.


**Key libraries**

- `janitor` [@janitor]
- `stringr` [@citestringr]
- `tidyr` [@citetidyr]

**Key functions/etc**

- `dplyr::count()`
- `dplyr::mutate()`
- `dplyr::select()`
- `janitor::clean_names()`
- `stringr::str_replace_all()`
- `stringr::str_trim()`
- `tidyr::pivot_longer()`
- `tidyr::separate()`
- `tidyr::separate_rows()`


<!-- Beaumont, Jean-François, 2020, 'Are probability surveys bound to disappear for the production of official statistics?' -->
<!-- Gelman, Andrew, 2019, 'Model Building and expansion for golf putting' -->
<!-- Hanretty, Chris, 2019, 'An introduction to multilevel regression and post-stratification for estimating constituency opinion' -->
<!-- Hillygus, D. Sunshine, 2011, 'The evolution of election polling in the United States' -->
<!-- Kennedy, Lauren, and Andrew Gelman, 2019, 'Know your population and know your model: Using model-based regression and poststratification to generalize findings beyond the observed sample' -->
<!-- Kennedy, Lauren, Katharine Khanna, Dan Simpson, and Andrew Gelman, 2020 'Using sex and gender in survey adjustment'. -->
<!-- Nelder, John A., 1999, 'From Statistics to Statistical Science' -->


## Introduction

> "Well, Lyndon, you may be right and they may be every bit as intelligent as you say," said Rayburn, "but I'd feel a whole lot better about them if just one of them had run for sheriff once."
> 
> Sam Rayburn's reaction to Lyndon Johnson's enthusiasm about Kennedy's incoming cabinet, as quoted by @halberstam [p. 41].

In earlier chapters we have done data cleaning and preparation, but in this chapter, we get into the weeds. I do not trust anyone who works with data who has not spent time, at some point in their career, cleaning data. And by the end of this chapter I think that you'll feel the same way. To clean and prepare data is to make a lot of different decisions, many of which are important.

For a long time, data cleaning and preparation was largely overlooked. We now realise that was a mistake. It is no longer possible to trust almost any result in disciplines that apply statistics. The reproducibility crisis, which started in psychology but has now extended to many other fields in the physical and social sciences, has brought to light issues such as p-value 'hacking', researcher degrees of freedom, file-drawer issues, and even data and results fabrication [@gelman2013garden]. Steps are now being put in place to address these. However, there has been relatively little focus on the data gathering, cleaning, and preparation aspects of applied statistics, despite evidence that decisions made during these steps greatly affect statistical results [@huntington2020influence]. In this chapter we focus on these issues.

While the statistical practices that underpin data science are themselves correct and robust when applied to 'fake' datasets created in a simulated environment, data science is typically not conducted with these types of datasets. For instance, data scientists are interested in: 

>...the kind of messy, unfiltered, and possibly unclean data---tainted by heteroskedasticity, complex dependence and missingness patterns---that until recently were avoided in polite conversations between more traditional statisticians... 
>
>[@craiu2019hiring]. 

Big data does not resolve this issue, and may even exacerbate it, for instance 'without taking data quality into account, population inferences with Big Data are subject to a Big Data Paradox: the more the data, the surer we fool ourselves' [@meng2018statistical]. It is important to note that the issues that are found in much applied statistics research are not necessarily associated with researcher quality, or their biases [@silberzahn2018many]. Instead, they are a result of the environment within which data science is conducted. This chapter aims to give you the tools to explicitly think about this work.

@gelman2020most writing about the most important statistical ideas of the past 50 years say that: 

> ...each of them was not so much a method for solving an existing problem, as an opening to new ways of thinking about statistics and new ways of data analysis. To put it another way, each of these ideas was a codification, bringing inside the tent an approach that had been considered more a matter of taste or philosophy than statistics.

I see the focus on data cleaning and preparation in this chapter as analogous, insofar, as it represents a codification, or bringing inside the tent, of aspects that are typically (incorrectly) considered those of taste rather than statistics.

The approach that I recommend that you follow is:

1. Duplicate.
2. Plan the end state.
3. Execute that plan on a tiny sample.
4. Write tests and documentation.
5. Iterate the plan.
6. Generalize the execution.
7. Update tests and documentation.

You will need to use all your skills to this point to be effective, but this is the very stuff of statistical sciences! Be dogged, but sensible. The best is the enemy of the good here. It's better to have 90 per cent of the data cleaned and prepared, and to start exploring that, before deciding whether it's worth the effort to clean and prepare the remaining 10 per cent because that remainder will likely take an awful lot of time and effort.

As @van2005data say, all data regardless of whether they were obtained from hunting, gathering, or farming, will have issues and it is critical that you understand how to 'deal with errors from various sources' and understand 'their effects on study results'. To clean data is to analyze data. As @thatrandyauperson says 'The act of cleaning data is the act of preferentially transforming data so that your chosen analysis algorithm produces interpretable results. That is also the act of data analysis.'.


## Workflow

### Save a copy of the raw data

The first step is to save the raw data into a separate folder location. It is critical that you save the raw data to the extent that is possible [@wilsongoodenough]. In an ideal situation, duplicate the folder that contains the raw data, and then rename the duplicated folder 'cleaned' and then only ever modify the data in that cleaned folder.

### Begin with an end in mind

Planning the end state, or forcing yourself to begin with an end in mind is important for a variety of reasons. As with scraping data, it helps us to be pre-active about scope-creep, but with data cleaning I see a bigger benefit being that it forces us to really think about what we want the final dataset to look like. As before, I recommend first sketching the dataset. The key features of your sketch will be aspects such as the names of the columns, their class, and the possible range of values. It might look something like Figure \@ref(fig:sketchdataplan) .

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/sketchofdataset.png" alt="Example of a dataset end plan" width="90%" />
<p class="caption">(\#fig:sketchdataplan)Example of a dataset end plan</p>
</div>

Notice that this process has made it clear that we want the full names of the states, rather than abbreviations. And that population should be in millions, rather than some other units. The process of sketching out an end-point forces us to make decisions and be clear about our desired end state.

We then implement that using code to simulate data. Again, this process forces us to think about what reasonable values look like in our dataset because we are literally forced to decide which functions to use. Thinking carefully about the membership of each column here, for instance if the column is meant to be 'gender' then values such as  'male', 'female', 'other', and 'unknown' may be expected, but a number such as '1,000' would likely be unexpected. It also forces us to be explicit about variable names because we have to assign the outputs of those functions to a variable.

Building on the example above, perhaps it might look something like this.


```r
library(tidyverse)

simulated_states_population <- 
  tibble(
    state = c('Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California'),
    population = c(5, 0.7, 7, 3, 40)
  )

simulated_states_population
#> # A tibble: 5 × 2
#>   state      population
#>   <chr>           <dbl>
#> 1 Alabama           5  
#> 2 Alaska            0.7
#> 3 Arizona           7  
#> 4 Arkansas          3  
#> 5 California       40
```

Our purpose, during data cleaning and preparation is to then bring our dataset close to that plan.

The desired end-state will typically be 'tidy data' where [@wickham2014tidy, p. 4]:

1. Each variable is a column
2. Each observation is a row
3. Each observational unit is a table.

The following is an example of data in a tidy format:


```r
tibble(
  name = c("Alfred", "Ben", "Chris", "Daniela", "Emma"),
  age_group = c("0-9", "10-19", "0-9", "0-9", "10-19"),
  response_time = c(0, 9, 3, 3, 8),
  )
#> # A tibble: 5 × 3
#>   name    age_group response_time
#>   <chr>   <chr>             <dbl>
#> 1 Alfred  0-9                   0
#> 2 Ben     10-19                 9
#> 3 Chris   0-9                   3
#> 4 Daniela 0-9                   3
#> 5 Emma    10-19                 8
```



### Start small

At this point, we then have our first look at the data that we are dealing with. Regardless of what the raw data look like we want to try to get it into a rectangular dataset as quickly as possible because then we can use our familiar verbs. Let's assume here that we're starting with some `.txt` file.

The first step is to look for regularities in the dataset. We are wanting to end up with tabular data, which means that we need some type of deliminator to distinguish different columns. Ideally this might be features such as a comma, a semicolon, a tab, a double space, or a line break. 


```r
# Alabama, 5 million.
# Alaska, 0.7 million.
# Arizona, 7 million.
# Arkansas, 3 million.
# California, 40 million.
```


In worse cases there may be a feature of the dataset that we can take advantage of. For instance, possibly the data look like the following:


```r
# State is Alabama and population is 5 million.
# State is Alaska and population is 0.7 million.
# State is Arizona and population is 7 million.
# State is Arkansas and population is 3 million.
# State is California and population is 40 million.
```

In this case, although we don't have a traditional deliminator we can use the regularity of 'State is ' and ' and population is ' to get what we need.

A more difficult case is this following:


```r
# Alabama 5 Alaska 0.7 Arizona 7 Arkansas 3 California 40
```

One way to approach this is to take advantage of the different classes and values that we're looking for. For instance, in this case, we know that we're after US states, so there are only 50 possible options and we could use the existence of these as a deliminator. We could also use the fact that population is a number here, and so split based on a space followed by a number.


To move forward, I'll assume that last example and move it into a rectangular dataset.


```r
raw_data <- c('Alabama 5 Alaska 0.7 Arizona 7 Arkansas 3 California 40')

data <- 
  tibble(raw = raw_data)

data <- 
  data %>% 
  tidyr::separate(col = raw, 
                  into = letters[1:5],
                  sep = "(?<=[[:digit:]]) ") %>% 
  pivot_longer(cols = letters[1:5],
               names_to = "drop_me",
               values_to = "separate_me") %>% 
  tidyr::separate(col = separate_me, 
                  into = c('state', 'population'),
                  sep = " (?=[[:digit:]])") %>% 
  select(-drop_me)

data
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

Having established a rectangular dataset, albeit a messy one, we should begin to look at the classes that we have. We don't necessarily want to fix the classes at this point, because that can result in us losing data. But we look at the class to see what it is, and then compare it to our simulated dataset to see where it needs to get to. We note the columns where it is different.

Before changing the class and before going onto more bespoke issues, you should deal with some of the common issues in each class. Some common issues are:

- Commas and other punctuation, such as denomination signs in columns that should be numeric.
- Inconsistent formatting of dates, such as 'December' and also 'Dec' and '12'.
- Unexpected characters, especially in unicode, which may not display consistently.

Typically, we want to fix anything immediately obvious. For instance, remove commas that have been used to group digits in currencies. However, the situation will typically quickly become dire. What we need to do is to look at the membership of each group, and then triage what we will fix. We should probably make the decision of how to triage based on what is likely to have the largest impact. That usually means starting with the counts, sorting in descending order, and then dealing with each as they come.

When the tests of membership are passed, then finally change the class, and run all the tests again. We're adapting this idea from the software development approach of unit testing. Tests are crucial because the enable us to understand whether software (or in this case data) is fit for purpose [@buildingsoftwaretogether], Chapter 'Testing'.

Let's run through an example with a collection of strings, some of which are slightly wrong. This type of output is typical of OCR, which often gets most of the way there, but not quite.


```r
messy_string <- c('Rohan, Rhan, ROhan, Roham, ROhan, Rohan, Rohan, R0han, Rohan , 5Ohan')
messy_string
#> [1] "Rohan, Rhan, ROhan, Roham, ROhan, Rohan, Rohan, R0han, Rohan , 5Ohan"
```

As before, we first want to get this into a rectangular dataset.


```r
my_data <- 
  tibble(names = messy_string) %>% 
  tidyr::separate_rows(names, sep = ", ") 
my_data
#> # A tibble: 10 × 1
#>    names   
#>    <chr>   
#>  1 "Rohan" 
#>  2 "Rhan"  
#>  3 "ROhan" 
#>  4 "Roham" 
#>  5 "ROhan" 
#>  6 "Rohan" 
#>  7 "Rohan" 
#>  8 "R0han" 
#>  9 "Rohan "
#> 10 "5Ohan"
```

We now need decide which of these errors we are going to fix. To help us decide which are most important, we'll create a count.


```r
my_data %>% 
  count(names, sort = TRUE)
#> # A tibble: 7 × 2
#>   names        n
#>   <chr>    <int>
#> 1 "Rohan"      3
#> 2 "ROhan"      2
#> 3 "5Ohan"      1
#> 4 "R0han"      1
#> 5 "Rhan"       1
#> 6 "Roham"      1
#> 7 "Rohan "     1
```

The most common element is the correct one, which is great. The next one - 'ROhan' - looks like the 'o' has been incorrectly capitalized, and the one after that - '5Ohan' - is distinguished by the '5' instead of an 'R'. Let's quickly fix these issues and then redo the count.


```r
my_data <- 
  my_data %>% 
  mutate(names = str_replace_all(names, 'ROhan', 'Rohan'),
         names = str_replace_all(names, '5Ohan', 'Rohan')
         )

my_data %>% 
  count(names, sort = TRUE)
#> # A tibble: 5 × 2
#>   names        n
#>   <chr>    <int>
#> 1 "Rohan"      6
#> 2 "R0han"      1
#> 3 "Rhan"       1
#> 4 "Roham"      1
#> 5 "Rohan "     1
```

Already this is much better and 60 per cent of the values are correct, compared with earlier where it was 30 per cent. There are two more obvious errors - 'Rhan' and 'Roham' - with the first missing an 'o' and the second having an 'm' where the 'n' should be. Again, we can quickly update and fix those.



```r
my_data <- 
  my_data %>% 
  mutate(names = str_replace_all(names, 'Rhan', 'Rohan'),
         names = str_replace_all(names, 'Roham', 'Rohan')
         )

my_data %>% 
  count(names, sort = TRUE)
#> # A tibble: 3 × 2
#>   names        n
#>   <chr>    <int>
#> 1 "Rohan"      8
#> 2 "R0han"      1
#> 3 "Rohan "     1
```

We have achieved an 80 per cent fix with not too much effort. The two remaining issues are more subtle. The first - 'R0han' - has occurred because the 'o' has been incorrectly coded as an '0'. In some fonts this will show up, but in others it will be more difficult to see. This is a common issue, especially with OCR, and something to be aware of. The second - 'Rohan ' - is similarly subtle and is occurring because there is a trailing space. Again, trailing and leading spaces are a common issue. After we fix these two remaining issues then we will have all entries corrected.


```r
my_data <- 
  my_data %>% 
  mutate(names = str_replace_all(names, 'R0han', 'Rohan'),
         names = stringr::str_trim(names, side = c("right"))
         )

my_data %>% 
  count(names, sort = TRUE)
#> # A tibble: 1 × 2
#>   names     n
#>   <chr> <int>
#> 1 Rohan    10
```

I've been doing the tests in my head in this example - I know that we're hoping for 'Rohan'. But we can start to document this test as well. One way is to look to see if values other than 'Rohan' exist in the dataset.


```r
check_me <- 
  my_data %>% 
  filter(names != "Rohan")

if (nrow(check_me) > 0) {
  print("Still have values that are not Rohan!")
}
```


### Iterate, generalize and update

We could now iterate the plan. In this most recent case we started with 10 entries. There is no reason that we couldn't increase this to 100 or even 1,000. We may need to generalize the cleaning proceedures and tests. But eventually we would start to being the dataset into some sort of order.



## Case study - Kenya census

To make this all more clear, let's return to the Kenyan census that we downloaded as PDFs in Chapter \@ref(gather-data).


The distribution of population by age, sex, and administrative unit from the 2019 Kenyan census can be downloaded here: https://www.knbs.or.ke/?wpdmpro=2019-kenya-population-and-housing-census-volume-iii-distribution-of-population-by-age-sex-and-administrative-units. 

And while it is great that they make it easily available, and it is easy to look-up a particular result, it is not overly useful to do larger-scale data analysis, such as building a Bayesian hierarchical model. 

In this section we will convert a PDF of Kenyan census results of counts, by age and sex, by county and sub-county, into a tidy dataset that can be analysed. I will draw on and introduce a bunch of handy packages including: `janitor` by @janitor, `pdftools` by @pdftools, `tidyverse` by @tidyverse, and `stringi` by @stringi. 


### Set-up

To get started I need to load the necessary packages.


```r
library(janitor)
library(pdftools)
library(tidyverse)
library(stringi)
```

And then I need to read in the PDF that I want to convert. 


```r
# Read in the PDF
all_content <- pdftools::pdf_text("inputs/pdfs/2019_Kenya_census.pdf")
```

The `pdf_text` function from `pdftools` is useful when you have a PDF and you want to read the content into R. For many recently produced PDFs it'll work pretty well, but there are alternatives. If the PDF is an image, then it won't work, and you'll need to turn to OCR.

You can see a page of the PDF here:


```r
knitr::include_graphics("figures/2020-04-10-screenshot-of-census.png") 
```

<img src="figures/2020-04-10-screenshot-of-census.png" width="85%" />



### Extract

The first challenge is to get the dataset into a format that we can more easily manipulate. The way that I am going to do this is to consider each page of the PDF and extract the relevant parts. To do this, I first write a function that I want to apply to each page. 


```r
# The function is going to take an input of a page
get_data <- function(i){
  # Just look at the page of interest
  # Based on https://stackoverflow.com/questions/47793326/tabulize-function-in-r
  just_page_i <- stringi::stri_split_lines(all_content[[i]])[[1]] 
  
  # Grab the name of the location
  area <- just_page_i[3] %>% str_squish()
  area <- str_to_title(area)
  
  # Grab the type of table
  type_of_table <- just_page_i[2] %>% str_squish()
  
  # Get rid of the top matter
  just_page_i_no_header <- just_page_i[5:length(just_page_i)] # Just manually for now, but could create some rules if needed
  
  # Get rid of the bottom matter
  just_page_i_no_header_no_footer <- just_page_i_no_header[1:62] # Just manually for now, but could create some rules if needed
  
  # Convert into a tibble
  demography_data <- tibble(all = just_page_i_no_header_no_footer)
  
  # # Split columns
  demography_data <-
    demography_data %>%
    mutate(all = str_squish(all)) %>% # Any space more than two spaces is squished down to one
    mutate(all = str_replace(all, "10 -14", "10-14")) %>% 
    mutate(all = str_replace(all, "Not Stated", "NotStated")) %>% # Any space more than two spaces is squished down to one
    separate(col = all,
             into = c("age", "male", "female", "total", "age_2", "male_2", "female_2", "total_2"),
             sep = " ", # Just looking for a space. Seems to work fine because the tables are pretty nicely laid out
             remove = TRUE,
             fill = "right"
    )
  
  # They are side by side at the moment, need to append to bottom
  demography_data_long <-
    rbind(demography_data %>% select(age, male, female, total),
          demography_data %>%
            select(age_2, male_2, female_2, total_2) %>%
            rename(age = age_2, male = male_2, female = female_2, total = total_2)
    )
  
  # There is one row of NAs, so remove it
  demography_data_long <- 
    demography_data_long %>% 
    janitor::remove_empty(which = c("rows"))
  
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

At this point, I have a function that does what I need to each page of the PDF. I'm going to use the function `map_dfr` from the `purrr` package to apply that function to each page, and then combine all the outputs into one tibble.


```r
# Run through each relevant page and get the data
pages <- c(30:513)
all_tables <- map_dfr(pages, get_data)
rm(pages, get_data, all_content)
```


### Clean

I now need to clean the dataset to make it useful.

#### Values

The first step is to make the numbers into actual numbers, rather than characters. Before I can convert the type I need to remove anything that is not a number otherwise it'll be converted into an NA. I first identify any values that are not numbers so that I can remove them. 


```r
# Need to convert male, female, and total to integers
# First find the characters that should not be in there
all_tables %>% 
  select(male, female, total) %>%
  mutate_all(~str_remove_all(., "[:digit:]")) %>% 
  mutate_all(~str_remove_all(., ",")) %>%
  mutate_all(~str_remove_all(., "_")) %>%
  mutate_all(~str_remove_all(., "-")) %>% 
  distinct()
#> # A tibble: 39 × 3
#>    male    female         total  
#>    <chr>   <chr>          <chr>  
#>  1  <NA>    <NA>           <NA>  
#>  2 ".:"    "Distribution" "of"   
#>  3 "Male"  "Female"       "Total"
#>  4 ""      ""             ""     
#>  5 "by"    "Age"          "Sex*" 
#>  6 "LUNGA"  <NA>           <NA>  
#>  7 "NORTH"  <NA>           <NA>  
#>  8 "SOUTH"  <NA>           <NA>  
#>  9 "RIVER"  <NA>           <NA>  
#> 10 "DELTA"  <NA>           <NA>  
#> # … with 29 more rows
# We clearly need to remove ",", "_", and "-". 
# This also highlights a few issues on p. 185 that need to be manually adjusted
# https://twitter.com/RohanAlexander/status/1244337583016022018
all_tables$male[all_tables$male == "23-Jun"] <- 4923
all_tables$male[all_tables$male == "15-Aug"] <- 4611
```


While you could use the `janitor` package here, it is worthwhile at least first looking at what is going on because sometimes there is odd stuff that janitor (and other packages) will deal with, but not in a way that you want. In this case, they've used Excel or similar and this has converted a couple of their entries into dates. If we just took the numbers from the column then we'd have 23 and 15 here, but by inspecting the column we can use Excel to reverse the process and enter the correct values of 4,923 and 4,611, respectively.

Having identified everything that needs to be removed, we can do the actual removal and convert our character column of numbers to integers.


```r
all_tables <-
  all_tables %>%
  mutate_at(vars(male, female, total), ~str_remove_all(., ",")) %>% # First get rid of commas
  mutate_at(vars(male, female, total), ~str_replace(., "_", "0")) %>%
  mutate_at(vars(male, female, total), ~str_replace(., "-", "0")) %>%
  mutate_at(vars(male, female, total), ~as.integer(.))
```


#### Areas

The next thing to clean is the areas. We know that there are 47 counties in Kenya, and a whole bunch of sub-counties. They give us a list on pages 19 to 22 of the PDF (document pages 7 to 10). However, this list is not complete, and there are a few minor issues that we'll deal with later.

In any case, I first need to fix a few inconsistencies.


```r
# Fix some area names
all_tables$area[all_tables$area == "Taita/ Taveta"] <- "Taita/Taveta"
all_tables$area[all_tables$area == "Elgeyo/ Marakwet"] <- "Elgeyo/Marakwet"
all_tables$area[all_tables$area == "Nairobi City"] <- "Nairobi"
```

Kenya has 47 counties, each of which has sub-counties. The PDF has them arranged as the county data then the sub-counties, without designating which is which. We can use the names, to a certain extent, but in a handful of cases, there is a sub-county that has the same name as a county so we need to first fix that.

The PDF is made-up of three tables.


```r
all_tables$table %>% table()
#> .
#>       
#> 59185
```

So I can first get the names of the counties based on those first two tables and then reconcile them to get a list of the counties.


```r
# Get a list of the counties 
list_counties <- 
  all_tables %>% 
  filter(table %in% c("Table 2.4a: Distribution of Rural Population by Age, Sex* and County",
                      "Table 2.4b: Distribution of Urban Population by Age, Sex* and County")
         ) %>% 
  select(area) %>% 
  distinct()
```

As I hoped, there are 47 of them. But before I can add a flag based on those names, I need to deal with the sub-counties that share their name. We will do this based on the page, then looking it up and deciding which is the county page and which is the sub-county page.


```r
# The following have the issue of the name being used for both a county and a sub-county:
all_tables %>% 
  filter(table == "Table 2.3: Distribution of Population by Age, Sex*, County and Sub- County") %>% 
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
         ) %>% 
  select(area, page) %>% 
  distinct()
#> # A tibble: 0 × 2
#> # … with 2 variables: area <chr>, page <int>
```

Now we can add the flag for whether the area is a county and adjust for the ones that are troublesome,


```r
# Add flag for whether it is a county or a sub-county
all_tables <- 
  all_tables %>% 
  mutate(area_type = if_else(area %in% list_counties$area, "county", "sub-county"))
# Fix the flag for the ones that have their names used twice
all_tables <- 
  all_tables %>% 
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
```



#### Ages

Now we can deal with the ages.

First we need to fix some errors.


```r
# Clean up ages
table(all_tables$age) %>% head()
#> 
#>           0   0-4     1    10 10-14 
#>   392   484   484   484   484   482
unique(all_tables$age) %>% head()
#> [1] ""        "Table"   "MOMBASA" "Age"     "Total"   "0"
# Looks like there should be 484, so need to follow up on some:
all_tables$age[all_tables$age == "NotStated"] <- "Not Stated"
all_tables$age[all_tables$age == "43594"] <- "5-9"
all_tables$age[all_tables$age == "43752"] <- "10-14"
all_tables$age[all_tables$age == "9-14"] <- "5-9"
all_tables$age[all_tables$age == "10-19"] <- "10-14"
```

The census has done some of the work of putting together age-groups for us, but we want to make it easy to just focus on the counts by single-year-age. As such I'll add a flag as to the type of age it is: an age group, such as ages 0 to 5, or a single age, such as 1.


```r
# Add a flag as to whether it's a summary or not
all_tables$age_type <- if_else(str_detect(all_tables$age, c("-")), "age-group", "single-year")
all_tables$age_type <- if_else(str_detect(all_tables$age, c("Total")), "age-group", all_tables$age_type)
```

At the moment, age is a character variable. We have a decision to make here, because we don't want it to be a character variable (because it won't graph properly), but we don't want it to be a numeric, because there is `total` and also `100+` in there. For now, we'll just make it into a factor, and at least that will be able to be nicely graphed.


```r
all_tables$age <- as_factor(all_tables$age)
```



### Check

#### Gender sum

Given the format of the data, at this point it is easy to check that `total` is the sum of `male` and `female`.


```r
# Check the parts and the sums
follow_up <- 
  all_tables %>% 
  mutate(check_sum = male + female,
         totals_match = if_else(total == check_sum, 1, 0)
         ) %>% 
  filter(totals_match == 0)
```

There is just one that seems wrong.


```r
# There is just one that looks wrong
all_tables$male[all_tables$age == "10" & all_tables$page == 187] <- as.integer(1)

rm(follow_up)
```


#### Rural-urban split

The census provides different tables for the total of each county and sub-county; and then within each county, for the number in an urban area in that county, and the number in a urban area in that county. Some counties only have an urban count, but we'd like to make sure that the sum of rural and urban counts equals the total count. This requires reshaping the data from a long to wide format.

First, construct different tables for each of the three. I just do it manually, but I could probably do this a nicer way.


```r
# Table 2.3
table_2_3 <- all_tables %>% 
  filter(table == "Table 2.3: Distribution of Population by Age, Sex*, County and Sub- County")
table_2_4a <- all_tables %>% 
  filter(table == "Table 2.4a: Distribution of Rural Population by Age, Sex* and County")
table_2_4b <- all_tables %>% 
  filter(table == "Table 2.4b: Distribution of Urban Population by Age, Sex* and County")
```

Having constructed the constituent parts, I now join then based on age, area, and whether it is a county.


```r
both_2_4s <- full_join(table_2_4a, table_2_4b, by = c("age", "area", "area_type"), suffix = c("_rural", "_urban"))

all <- full_join(table_2_3, both_2_4s, by = c("age", "area", "area_type"), suffix = c("_all", "_"))

all <- 
  all %>% 
  mutate(page = glue::glue('Total from p. {page}, rural from p. {page_rural}, urban from p. {page_urban}')) %>% 
  select(-page, -page_rural, -page_urban,
         -table, -table_rural, -table_urban,
         -age_type_rural, -age_type_urban
         )

rm(both_2_4s, table_2_3, table_2_4a, table_2_4b)
```

We can now check that the sum of rural and urban is the same as the total.


```r
# Check that the urban + rural = total
follow_up <- 
  all %>% 
  mutate(total_from_bits = total_rural + total_urban,
         check_total_is_rural_plus_urban = if_else(total == total_from_bits, 1, 0),
         total_from_bits - total) %>% 
  filter(check_total_is_rural_plus_urban == 0)

head(follow_up)
#> # A tibble: 0 × 16
#> # … with 16 variables: age <fct>, male <int>, female <int>, total <int>,
#> #   area <chr>, area_type <chr>, age_type <chr>, male_rural <int>,
#> #   female_rural <int>, total_rural <int>, male_urban <int>,
#> #   female_urban <int>, total_urban <int>, total_from_bits <int>,
#> #   check_total_is_rural_plus_urban <dbl>, total_from_bits - total <int>
rm(follow_up)
```

There are just a few, but they only have a difference of 1, so I'll just move on.


#### Ages sum to age-groups

Finally, I want to check that the single age counts sum to the age-groups.


```r
# One last thing to check is that the ages sum to their age-groups.
follow_up <- 
  all %>% 
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
         ) %>% 
  group_by(area_type, area, groups) %>% 
  mutate(group_sum = sum(total, na.rm = FALSE),
         group_sum = group_sum / 2,
         difference = total - group_sum) %>% 
  ungroup() %>% 
  filter(age == groups) %>% 
  filter(total != group_sum) 

head(follow_up)
#> # A tibble: 0 × 16
#> # … with 16 variables: age <fct>, male <int>, female <int>, total <int>,
#> #   area <chr>, area_type <chr>, age_type <chr>, male_rural <int>,
#> #   female_rural <int>, total_rural <int>, male_urban <int>,
#> #   female_urban <int>, total_urban <int>, groups <chr>, group_sum <dbl>,
#> #   difference <dbl>

rm(follow_up)
```

Mt. Kenya Forest, Aberdare Forest, Kakamega Forest are all slightly dodgy. I can't see it in the documentation, but it looks like they have apportioned these between various countries. It's understandable why they'd do this and it's probably not a big deal, so I'll just move on. 


### Tidy-up

Now that we are confident that everything is looking good, we can just convert it to long-format so that it is easy to work with. 


```r
all <- 
  all %>% 
  rename(male_total = male,
         female_total = female,
         total_total = total) %>% 
  pivot_longer(cols = c(male_total, female_total, total_total, male_rural, female_rural, total_rural, male_urban, female_urban, total_urban),
               names_to = "type",
               values_to = "number"
               ) %>% 
  separate(col = type, into = c("gender", "part_of_area"), sep = "_") %>% 
  select(area, area_type, part_of_area, age, age_type, gender, number)

write_csv(all, path = "outputs/data/cleaned_kenya_2019_census.csv")

head(all)
#> # A tibble: 0 × 7
#> # … with 7 variables: area <chr>, area_type <chr>, part_of_area <chr>,
#> #   age <fct>, age_type <chr>, gender <chr>, number <int>
```





### Make Monica's dataset

The original purpose of all of this was to make a table for Monica. She needed single-year counts, by gender, for the counties.


```r
monicas_dataset <- 
  all %>% 
  filter(area_type == "county") %>% 
  filter(part_of_area == "total") %>%
  filter(age_type == "single-year") %>% 
  select(area, age, gender, number)

head(monicas_dataset)
#> # A tibble: 0 × 4
#> # … with 4 variables: area <chr>, age <fct>, gender <chr>, number <int>
```



```r
write_csv(monicas_dataset, "outputs/data/monicas_dataset.csv")
```

I'll leave the fancy stats to Monica, but I'll just make a quick graph of Nairobi.


```r
# monicas_dataset %>% 
#   filter(area == "Nairobi") %>%
#   ggplot() +
#   geom_col(aes(x = age, y = number, fill = gender), position = "dodge") + 
#   scale_y_continuous(labels = scales::comma) +
#   scale_x_discrete(breaks = c(seq(from = 0, to = 99, by = 5), "100+")) +
#   theme_classic()+
#   scale_fill_brewer(palette = "Set1") +
#   labs(y = "Number",
#        x = "Age",
#        fill = "Gender",
#        title = "Distribution of age and gender in Nairobi in 2019",
#        caption = "Data source: 2019 Kenya Census")
```







## Checks and tests

Robert Caro, the biographer of Lyndon Johnson, spent years tracking down everyone connected to the 36th President of the United States. He went to far as to live in Texas Hill Country for X years so that he could better understand where LBJ was from. When he heard a story that LBJ used to run to the Senate when he worked as a Y, he ran that route multiple times himself to try to understand why LBJ was running. Caro eventually understood it only when he ran the route as the sun was rising, just as LBJ had done, and found that at that time the sun hits the Senate Rotunda and it looks amazing (CITE). This background work enabled him to uncover aspects that no one else knew. For instance, it turns out that LBJ almost surely stole his first election win as a Texas Senator. You need to understand your data to this same extent. Turn every page and go to every extreme.

When we are cleaning data, we are looking for anomalies. We are interested in values that are in there that should not be, but also the opposite situation---values that are missing that should not be. I've I talked fairly generally about checks, tests and other considerations. Here I'd like to be more specific about what I mean. There are four tools that you should use to identify these situations: plots, counts, green/red conditions, targets.

### Plots

Plots are an invaluable tool when cleaning data, because they show each point in the dataset, in relation to the other points. They are especially useful for identifying when a value doesn't belong. For instance, if a value is expected to be numerical, but it is still a character then it will not plot and a warning will be displayed.

Plots will be especially useful for numerical data, but are still useful for text and categorical data. Let's pretend that we have a situation where we are interested in a person's age, for some youth survey. We have the following data:


```r
raw_data <- 
  tibble(ages = c(11, 17, 22, 13, 21, 16, 16, 6, 16, 11, 150))

raw_data %>% 
  ggplot(aes(y = ages, x = 0)) +
  geom_point()
```

<img src="30-clean_and_prepare_files/figure-html/unnamed-chunk-40-1.png" width="672" />

The graph clearly shows the unexpected value of 150. The most likely explanation is that the data were incorrectly entered with a trailing 0, and should be 15.

We can fix that, and document it, and then redo the graph, so see that everything seems more reasonable now.



### Counts

We want to focus on getting most of the data right. So we are interested in the counts of unique values. Hopefully a majority of the data are concentrated in the most common counts. But it can also be useful to invert it, and see what is especially uncommon. The extent to which we want to deal with these depends on what we need. Ultimately, each time we fix one we are getting very few additional observations, potentially even just one! Counts are especially useful with text or categorical data, but can be helpful with numerical as well.

Let's see an example.


```r
raw_data <- 
  tibble(country = c('Australie', 'Austrelia', 'Australie', 'Australie', 'Aeustralia', 'Austraia', 'Australia', 'Australia', 'Australia', 'Australia'
                  )
         )

raw_data %>% 
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

The use of this count clearly identifies where we should spend our time - changing 'Australie' to 'Australia' would almost double our amount of useable data.


### Go/no-go

Some things are so important that you require that your cleaned dataset have them. These are go/no-go conditions. They would typically come out of experience, expert knowledge, or the planning and simulation exercises. An example may be that there are no negative numbers in an age column, and no ages above 140.

For these we could specifically require that the condition is met. Other examples include:

- If doing cross-country analysis, then a list of country names that we know should be in our dataset would be useful. Our no-go conditions would then be if there were: 1) values not in that list in our dataset, or, vice versa; 2) countries that we expected to be in there that were not.

To have a concrete example, let's consider if we were doing some analysis about the five largest counties in Kenya: 'Nairobi', 'Kiambu', 'Nakuru', 'Kakamega', 'Bungoma'. Let's create that array first:


```r
correct_counties <- c('Nairobi', 'Kiambu', 'Nakuru', 'Kakamega', 'Bungoma')
```


We begin with the following dataset:


```r
top_five_kenya <- 
  tibble(county = c('Nairobi', 'Nairob1', 'Nakuru', 'Kakamega', 'Nakuru', 
                      'Kiambu', 'Kiambru', 'Kabamega', 'Bun8oma', 'Bungoma')
  )

top_five_kenya %>% 
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

Based on the count we know that we have to fix some of them and there are two with numbers that are obvious fixes:


```r
top_five_kenya <- 
  top_five_kenya %>% 
  mutate(county = str_replace_all(county, 'Nairob1', 'Nairobi'),
         county = str_replace_all(county, 'Bun8oma', 'Nairobi')
  )

top_five_kenya %>% 
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
top_five_kenya$county %>% unique()
#> [1] "Nairobi"  "Nakuru"   "Kakamega" "Kiambu"   "Kiambru"  "Kabamega" "Bungoma"

if(all(top_five_kenya$county %>% unique() == top_five_kenya)) {
  "Oh no"
}
if(all(top_five_kenya==top_five_kenya$county %>% unique()) ) {
  "Oh no"
}
```

And so it is clear that we still have cleaning to do!

We may also find similar conditions from experts and those with experience in the particular field.



<!-- ### Targets -->

<!-- We could clean data indefinitely, but we need an end state. Part of this is sketching an end-point, and simulating. But sometimes it helps to have a metric. This may be especially the case when we have a large dataset, a deadline, and a team, because the data cleaning stage is just one part of what needs to happen. One helpful aspect is to set targets against which we can judge a dataset and then just achieve those. -->

<!-- Let's turn to a common use-case which is merging two datasets. Of particular interest is the unique key between the two, which is  -->


<!-- Add in the notion of precision and recall. Maybe have a look at: -->

<!-- https://arxiv.org/pdf/2101.05308.pdf -->

<!-- ### Consistency -->

<!-- Consistency refers to the proportion -->

<!-- #### Internal consistency -->


<!-- #### External consistency -->



### Class

I can't emphasize this enough, but it is vital that you put in place explicit checks of class because getting this wrong can have a large effect on your analysis. In particular:

- check whether some value should be a number or a factor.
- check that dates are correctly formatted.

To understand why it is important to be clear about whether a value is a number or a factor, consider the following situation:


```r
some_data <- 
  tibble(response = c(1, 1, 0, 1, 0, 1, 1, 0, 0),
         group = c(1, 2, 1, 1, 2, 3, 1, 2, 3))
```

Let's start with `group` as an integer and look at a logistic regression.


```r
some_data %>% 
  mutate(group = as.integer(group)) %>% 
  lm(response~group, data = .) %>% 
  summary()
#> 
#> Call:
#> lm(formula = response ~ group, data = .)
#> 
#> Residuals:
#>    Min     1Q Median     3Q    Max 
#>  -0.68  -0.52   0.32   0.32   0.64 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)
#> (Intercept)   0.8400     0.4495   1.869    0.104
#> group        -0.1600     0.2313  -0.692    0.511
#> 
#> Residual standard error: 0.5451 on 7 degrees of freedom
#> Multiple R-squared:  0.064,	Adjusted R-squared:  -0.06971 
#> F-statistic: 0.4786 on 1 and 7 DF,  p-value: 0.5113
```

Now we can try it as a factor. The intepretation of the variable is completely different.


```r
some_data %>% 
  mutate(group = as.factor(group)) %>% 
  lm(response~group, data = .) %>% 
  summary()
#> 
#> Call:
#> lm(formula = response ~ group, data = .)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -0.7500 -0.3333  0.2500  0.2500  0.6667 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)  
#> (Intercept)   0.7500     0.2826   2.654   0.0378 *
#> group2       -0.4167     0.4317  -0.965   0.3717  
#> group3       -0.2500     0.4895  -0.511   0.6278  
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 0.5652 on 6 degrees of freedom
#> Multiple R-squared:  0.1375,	Adjusted R-squared:  -0.15 
#> F-statistic: 0.4783 on 2 and 6 DF,  p-value: 0.6416
```



Another critical aspect is to check the dates. In particular we want to try to make it into the following format: YYYY-MM-DD. There are of course differences of opinion as to what is an appropriate date format in the broader world, and reasonable people can differ on whether 1 July 2010 or July 1, 2020, is better, but YYYY-MM-DD is the format that is generally most appropriate for data.




## Naming things

Names matter. I wrote this book on land that is today named Toronto, which is within a country named Canada, but for a long time before was known as Turtle Island. While not common, these days people will sometimes still refer to themselves as being on Turtle Island. That tells us something about them, and our use of the name Canada tells them something about us. There is a big rock in the centre of the country that I'm from, Australia. For a long time, it was called Uluru, then it was known as Ayers Rock. Today it has a dual name the combines both, and the choice of which name you use tells someone something about you. Even the British Royal Family recognise the power of names. In 1917 they changed from the House of Saxe-Coburg and Gotha to the House of Windsor, due to a feeling that the former was too Germanic given World War I was ongoing. Names matter in everyday life. And they matter in data science too.

The importance of names, and of ignoring existing claims through re-naming was clear in those cases, but we see it in data science as well. We need to be very careful when we name our datasets, our variables, and our functions. There is a tendency, these days, to call the variable 'gender' even though it may only have male and female, because we do not want to say the word 'sex'. [@tukey1962future] essentially defines what we today call data science, but it was popularised by folks in computer science in the 2010s who ignored, either deliberately or through ignorance, what came before them. The past ten years has been characteristic by the renaming of concepts that were well-established in the fields that computer science has recently expanded into. For instance, the use of binary variables in regression, sometimes called 'dummy variables', is called one-hot encoding in computer science. Like all fashions, this one will pass also. We most recently saw this through the 1980s through to early 2010s with economics. Economists described themselves as the 'queen of the social sciences' and self-described as imperialistic [@lazear2000economic]. We are now recognising the costs of this imperialism in social sciences, and in the future we will look back and count the cost of computer science imperialism in data science. The key here is that no area of study is ever *terra nullius*, or nobody's land. It is important to recognise, adopt, and use existing names, and practices.

Names give places meaning, and by ignoring existing names, we ignore what has come before us. @kimmerer2013[p. 34] describes how 'Tahawus is the Algonquin name for Mount Marcy, the highest peak in the Adirondacks. It's called Mount March to commemorate a governor who never set foot on those wild slopes.' She continues that '[w]hen we call a place by name it is transformed from wilderness to homeland.' She is talking with regard to physical places, but the same is true of our function names, our variable names and our dataset names. When we use gender instead of sex because we don't want to say sex in front of others, we ignore the preferences of those that provided data.

In addition to respecting the nature of the data, names need to satisfy two additional considerations: 1) they need to be machine readable, and 2) they need to be human readable.

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
#>   First `second name has spaces` `weird#symbol` InCoNsIsTaNtCaPs
#>   <dbl>                    <dbl>          <dbl>            <dbl>
#> 1     1                        1              1                1

bad_names_good_names <- 
  bad_names_good_names %>% 
  janitor::clean_names()
  
bad_names_good_names
#> # A tibble: 1 × 4
#>   first second_name_has_spaces weird_number_symbol in_co_ns_is_ta_nt_ca_ps
#>   <dbl>                  <dbl>               <dbl>                   <dbl>
#> 1     1                      1                   1                       1
```

Human readable names require an additional layer! You need to consider other cultures and how they may interpret some of the names that you're using. You also need to consider different experience levels that subsequent users of your dataset may have. This is both in terms of experience with programming and statistics, but also experience with similar datasets. For instance, a column of 'flag' is often used to signal that a column contains data that needs to be followed up with or treated carefully in some way. An experienced analyst will know this, but a beginner will not. Try to use meaningful names wherever possible [@lin2020ten].

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


This behaviour is not possible within the `tidyverse` (for instance if `data.frame` were replaced with `tibble` in the above code) and I recommend never using this feature. It makes it more difficult to understand your code after a break, and for others to come to it fresh.




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

