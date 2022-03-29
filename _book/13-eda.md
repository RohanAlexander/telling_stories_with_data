
# (PART) Modelling {-}

# Exploratory data analysis

**Required material**

- Read *The Future of Data Analysis*, Part 1 'General Considerations', [@tukey1962future].

<!-- - DiCiccio, Thomas J., and Mary E. Thompson, 2004, 'A Conversation with Donald A. S. Fraser', *Statistical Science*, 19 (2) pp. 370-386, https://utstat.toronto.edu/craiu/DonFraser_SSInterview.pdf. -->
<!-- - Silge, Julia, 2018, 'Understanding PCA using Stack Overflow data', https://juliasilge.com/blog/stack-overflow-pca/. -->

**Key concepts and skills**

- Quickly coming to terms with a new dataset by constructing graphs and tables.
- Understanding the issues and features of the dataset and how this may affect analysis decisions.
- Thinking about missing values and outliers.


**Key libraries**

- `broom`
- `ggrepel`
- `here`
- `janitor`
- `lubridate`
- `opendatatoronto`
- `tidymodels`
- `tidyverse`
- `visdat`


**Key functions**

- `augment()`
- `clean_names()`
- `coord_flip()`
- `count()`
- `distinct()`
- `facet_grid()`
- `facet_wrap()`
- `geom_bar()`
- `geom_col()`
- `geom_density()`
- `geom_histogram()`
- `geom_line()`
- `geom_point()`
- `geom_smooth()`
- `geom_text_repel()`
- `get_dupes()`
- `glance()`
- `if_else()`
- `ifelse()`
- `initial_split()`
- `left_join()`
- `mutate()`
- `mutate_all()`
- `names()`
- `ncol()`
- `nrow()`
- `pivot_wider()`
- `scale_color_brewer()`
- `scale_fill_brewer()`
- `scale_x_log10()`
- `scale_y_log10()`
- `str_detect()`
- `str_extract()`
- `str_remove()`
- `str_split()`
- `str_starts()`
- `summarise()`
- `summarise_all()`
- `theme_classic()`
- `theme_minimal()`
- `vis_dat()`
- `vis_miss()`





## Introduction

> The future of data analysis can involve great progress, the overcoming of real difficulties, and the provision of a great service to all fields of science and technology. Will it? That remains to us, to our willingness to take up the rocky road of real problems in preference to the smooth road of unreal assumptions, arbitrary criteria, and abstract results without real attachments. Who is for the challenge?
> 
> @tukey1962future [p. 64].

Exploratory data analysis is never finished, you just die. It is the active process of exploring and becoming familiar with our data. Like a farmer with their hands in the earth, we need to know every contour and aspect of our data. We need to know how it changes, what it shows, hides, and what are its limits. Exploratory data analysis (EDA) is the unstructured process of doing this.

EDA is a means to an end. While it will inform the entire paper, especially the data section, it is not typically something that ends up in the final paper. 
The way to proceed is to make a separate R Markdown file, and add code as well as brief notes on-the-go. Do not delete previous code, just add to it. By the end of it we will have created a useful notebook that captures our exploration of the dataset. This is a document that will guide the subsequent analysis and modelling.

EDA draws on a variety of skills and there are a lot of options for EDA [@staniak2019landscape]. Every tool should be considered. Look at the data and scroll through it. Make tables, plots, summary statistics, even some models. The key is to iterate, move quickly rather than perfectly, and come to a thorough understanding of the data.

In this chapter we will go through various examples of EDA including TTC subway delays, and Airbnb.
<!-- , and something else? -->


## Case study: TTC subway delays 

We can use `opendatatoronto` [@citeSharla] and `tidyverse` [@citetidyverse] to obtain data about the Toronto subway system, and especially the delays that have occurred. The idea for this case study comes from Monica Alexander.


<!-- We will eprovides an interface to all data available on the [Open Data Portal](https://open.toronto.ca/) provided by the City of Toronto. We are going to use that to take a quick lo ok at the subway delays. We're additionally going to especially draw on the , as well as the `ggrepel` [@citeggrepel], `janitor` [@janitor], `lubridate` [@GrolemundWickham2011], and `visdat` [@citevisdat] packages. -->

<!-- ```{r, echo = TRUE, warning = FALSE, message = FALSE} -->
<!-- library(opendatatoronto) -->
<!-- library(tidyverse) -->
<!-- library(ggrepel) -->
<!-- library(janitor) -->
<!-- library(lubridate) -->
<!-- library(visdat) -->
<!-- ``` -->

To begin, we download the data on Toronto Transit Commission (TTC) subway delays in 2020. The data are available as a separate dataset for each month. We are interested in 2020, so we create a column that of the year, and then filter the resources to just those months that were in 2020. We download them using `get_resource()`, iterating through each month using `map_dfr` from `purrr` [@citepurrr] which brings each of the twelve datasets together, and then save them.
then save them. 


```r
library(janitor)
library(opendatatoronto)
library(tidyverse)

# We know this unique key by looking the 'id' of the interest.
ttc_resources <- 
  list_package_resources("996cfe8d-fb35-40ce-b569-698d51fc683b") |>
  mutate(year = str_extract(name, "20..?")) |>  
  filter(year == 2020)

all_2020_ttc_data <- 
  map_dfr(ttc_resources$id, get_resource)

all_2020_ttc_data <- clean_names(all_2020_ttc_data)

write_csv(all_2020_ttc_data, "all_2020_ttc_data.csv")

all_2020_ttc_data
```





The dataset has a variety of columns, and we can find out more about each of them by downloading the codebook. The reason for the delay is coded, and so we can also download the explanations. One particular variable of interest appears to be 'min_delay', which gives the extent of the delay in minutes. 


```r
# Data codebook
delay_data_codebook <- get_resource("54247e39-5a7d-40db-a137-82b2a9ab0708")
delay_data_codebook <- clean_names(delay_data_codebook)
write_csv(delay_data_codebook, "delay_data_codebook.csv")

# Explanation for delay codes
delay_codes <- get_resource("fece136b-224a-412a-b191-8d31eb00491e")
delay_codes <- clean_names(delay_codes)
write_csv(delay_codes, "delay_codes.csv")
```





There is no one way to explore a dataset while conducting EDA, but we are usually especially interested in: 

- What should the variables look like? For instance, what is their type, what are the values, and what does the distribution of these look like?
- What aspects are surprising, both in terms of data that are there that we do not expect, such as outliers, but also in terms of data that we may expect here but do not have such as missing data.
- Developing a goal for our analysis. For instance, in this case, it might be understanding the factors such as stations and the time of day, that are associated with delays.

It is important to document all aspects as we go through and make note of anything surprising. We are looking to create a record of the steps and assumptions that we made as we were going because these will be important when we come to modelling. 


### Checking data

We should check that the variables are what they say they are. If they are not, then we need to work out what to do, for instance, should we recode them, or even remove them? It is also important to ensure that the class of the variables is as we expect, for instance variables that should be a factor are a factor and those that should be a character are a character. And also that we do not accidentally have, say, factors as numbers, or vice versa. One way to do this is to use `unique()`, and another is to use `table()`.


```r
unique(all_2020_ttc_data$day)
#> [1] "Wednesday" "Thursday"  "Friday"    "Saturday" 
#> [5] "Sunday"    "Monday"    "Tuesday"

unique(all_2020_ttc_data$line)
#>  [1] "SRT"                    "YU"                    
#>  [3] "BD"                     "SHP"                   
#>  [5] "YU/BD"                  "YU / BD"               
#>  [7] "999"                    NA                      
#>  [9] "29 DUFFERIN"            "95 YORK MILLS"         
#> [11] "35 JANE"                "YU-BD"                 
#> [13] "BLOOR - DANFORTH"       "YU/BD LINE"            
#> [15] "YUS"                    "YUS/BD"                
#> [17] "40 JUNCTION-DUNDAS WES" "71 RUNNYMEDE"          
#> [19] "BD/YU"                  "102 MARKHAM ROAD"      
#> [21] "YUS/DB"                 "YU & BD"               
#> [23] "SHEP"

table(all_2020_ttc_data$day)
#> 
#>    Friday    Monday  Saturday    Sunday  Thursday   Tuesday 
#>      2174      2222      1867      1647      2353      2190 
#> Wednesday 
#>      2329

table(all_2020_ttc_data$line)
#> 
#>       102 MARKHAM ROAD            29 DUFFERIN 
#>                      1                      1 
#>                35 JANE 40 JUNCTION-DUNDAS WES 
#>                      1                      1 
#>           71 RUNNYMEDE          95 YORK MILLS 
#>                      1                      1 
#>                    999                     BD 
#>                      2                   5473 
#>                  BD/YU       BLOOR - DANFORTH 
#>                      1                      1 
#>                   SHEP                    SHP 
#>                      1                    619 
#>                    SRT                     YU 
#>                    644                   7620 
#>                YU / BD                YU & BD 
#>                     22                      2 
#>                  YU-BD                  YU/BD 
#>                      1                    338 
#>             YU/BD LINE                    YUS 
#>                      1                      2 
#>                 YUS/BD                 YUS/DB 
#>                      1                      1
```

It is clear that we have likely issues in terms of the lines. Some of them have a clear re-code, but not all. One option would be to drop them, but we would need to think about whether these errors might be correlated with something that is of interest, because if they were then we may be dropping important information. There is usually no one right answer, because it will usually depend on what we are using the data for. We would note the issue, as we continued with EDA and then decide later about what to do. For now, we will remove all the lines that are not the ones that we know to be correct.


```r
all_2020_ttc_data <- 
  all_2020_ttc_data |> 
  filter(line %in% c("BD", "YU", "SHP", "SRT"))
```


Exploring missing data could be a course in itself, but the presence, or lack, of missing values can haunt an analysis. To get started we could look at known-unknowns, which are the NAs for each variable. And `vis_dat()` and `vis_miss()` from `visdat` [@citevisdat] can be useful to get a feel for how the missing values are distributed.


```r
library(visdat)

all_2020_ttc_data |>
  summarise_all(list( ~ sum(is.na(.))))
#> # A tibble: 1 x 10
#>    date  time   day station  code min_delay min_gap bound
#>   <int> <int> <int>   <int> <int>     <int>   <int> <int>
#> 1     0     0     0       0     0         0       0  3272
#> # ... with 2 more variables: line <int>, vehicle <int>

vis_dat(x = all_2020_ttc_data,
         palette = "cb_safe"
         )
```

![](13-eda_files/figure-latex/unnamed-chunk-9-1.pdf)<!-- --> 

```r

vis_miss(all_2020_ttc_data)
```

![](13-eda_files/figure-latex/unnamed-chunk-9-2.pdf)<!-- --> 

In this case we have many missing values in 'bound' and two in 'line'. For these known-unknowns, we are interested in whether the they are missing at random. We want to, ideally, show that data happened to just drop out. This is unlikely, and so we are usually trying to look at what is systematic about how our data are missing.

Sometime data happen to be duplicated. If we did not notice this then our analysis would be wrong in ways that we'd not be able to consistently expect. There are a variety of ways to look for duplicated rows, but `get_dupes()` from `janitor` [@janitor] is especially useful.


```r
get_dupes(all_2020_ttc_data)
#> No variable names specified - using all columns.
#> # A tibble: 37 x 11
#>    date                time   day    station code  min_delay
#>    <dttm>              <time> <chr>  <chr>   <chr>     <dbl>
#>  1 2020-02-10 00:00:00 06:00  Monday TORONT~ MRO           0
#>  2 2020-02-10 00:00:00 06:00  Monday TORONT~ MRO           0
#>  3 2020-02-10 00:00:00 06:00  Monday TORONT~ MUO           0
#>  4 2020-02-10 00:00:00 06:00  Monday TORONT~ MUO           0
#>  5 2020-03-10 00:00:00 23:00  Tuesd~ YORK M~ MUO           0
#>  6 2020-03-10 00:00:00 23:00  Tuesd~ YORK M~ MUO           0
#>  7 2020-03-26 00:00:00 13:20  Thurs~ VAUGHA~ MUNOA         3
#>  8 2020-03-26 00:00:00 13:20  Thurs~ VAUGHA~ MUNOA         3
#>  9 2020-03-26 00:00:00 18:32  Thurs~ VAUGHA~ MUNOA         3
#> 10 2020-03-26 00:00:00 18:32  Thurs~ VAUGHA~ MUNOA         3
#> # ... with 27 more rows, and 5 more variables:
#> #   min_gap <dbl>, bound <chr>, line <chr>, vehicle <dbl>,
#> #   dupe_count <int>
```

This dataset has many duplicates. Again, we are interested in whether there is something systematic going on. Remembering that during EDA we are trying to quickly come to terms with a dataset, one way forward is to flag this as an issue to come back to and explore later, and to just remove duplicates for now using `distinct()`.


```r
all_2020_ttc_data <- 
  all_2020_ttc_data |> 
  distinct()
```

The station names are a mess. We could try to quickly bring a little order to the chaos by just taking just the first word (or, the first two if it starts with 'ST').


```r
all_2020_ttc_data <-
  all_2020_ttc_data |>
  mutate(station_clean = if_else(str_starts(station, "ST"), 
                                 word(station, 1, 2), 
                                 word(station, 1)))
```



### Visualizing data

We need to see the data in its original state to understand it and we use bar charts, scatterplots, line plots and histograms extensively for this. During EDA we are not as concerned with whether the graph is aesthetically pleasing, but are instead trying to acquire a sense of the data as quickly as possible. We can start by looking at the distribution of 'min_delay', which is one outcome of interest.


```r
all_2020_ttc_data |>
  ggplot(aes(x = min_delay)) + 
  geom_bar()
```

![](13-eda_files/figure-latex/unnamed-chunk-13-1.pdf)<!-- --> 

The largely empty graph suggests the presence of outliers. There are a variety of ways to try to understand what could be going on, but one quick way to proceed it to use a log, remembering that we would expect values of 0 to drop away.


```r
all_2020_ttc_data |>
  ggplot(aes(x = min_delay)) + 
  geom_bar() +
  scale_x_log10()
```

![](13-eda_files/figure-latex/unnamed-chunk-14-1.pdf)<!-- --> 

This initial exploration further hints at an issue that we might like to explore further. We will join this dataset with 'delay_codes' to understand what is going on. 


```r
all_2020_ttc_data <-
  all_2020_ttc_data |>
  left_join(
    delay_codes |>
      rename(code = sub_rmenu_code, 
             code_desc = code_description_3) |>
      select(code, code_desc),
    by = "code"
  )

all_2020_ttc_data <-
  all_2020_ttc_data |>
  mutate(code_srt = ifelse(line == "SRT", code, "NA")) |>
  left_join(
    delay_codes |>
      rename(code_srt = sub_rmenu_code, code_desc_srt = code_description_7) |>
      select(code_srt, code_desc_srt),
    by = "code_srt"
  ) |>
  mutate(
    code = ifelse(code_srt == "NA", code, code_srt),
    code_desc = ifelse(is.na(code_desc_srt), code_desc, code_desc_srt)
  ) |>
  select(-code_srt,-code_desc_srt)
```

And so we can see that the 450 minute delay was due to 'Transit Control Related Problems', the 446 minute delay was due to 'Miscellaneous Other', they seem to be outliers, even among the outliers.


```r
all_2020_ttc_data |> 
  left_join(delay_codes |> 
              rename(code = sub_rmenu_code, code_desc = code_description_3) |>
              select(code, code_desc)) |> 
  arrange(-min_delay) |> 
  select(date, time, station, line, min_delay, code, code_desc)
#> Joining, by = c("code", "code_desc")
#> # A tibble: 14,335 x 7
#>    date                time   station  line  min_delay code 
#>    <dttm>              <time> <chr>    <chr>     <dbl> <chr>
#>  1 2020-02-13 00:00:00 05:30  ST GEOR~ YU          450 TUCC 
#>  2 2020-05-08 00:00:00 16:16  ST CLAI~ YU          446 MUO  
#>  3 2020-01-22 00:00:00 05:57  KEELE S~ BD          258 EUTR 
#>  4 2020-03-19 00:00:00 11:26  ROYAL Y~ BD          221 MUPR1
#>  5 2020-11-12 00:00:00 23:10  SHEPPAR~ YU          197 PUCSC
#>  6 2020-12-13 00:00:00 21:37  MCCOWAN~ SRT         167 PRSP 
#>  7 2020-12-04 00:00:00 16:23  MCCOWAN~ SRT         165 PRSP 
#>  8 2020-01-18 00:00:00 05:48  SCARBOR~ SRT         162 PRSL 
#>  9 2020-02-22 00:00:00 05:16  SPADINA~ YU          159 PUSWZ
#> 10 2020-09-03 00:00:00 14:35  CASTLE ~ BD          150 MUPR1
#> # ... with 14,325 more rows, and 1 more variable:
#> #   code_desc <chr>
```

### Groups of small counts

Another thing that we are looking for is various groupings of the data, especially where sub-groups may end up with only a small numbers of observations in them. This is because any analysis could be especially influenced by them. One quick way to do this is to group the data by a variable that is of interest, for instance 'line', using color.


```r
ggplot(data = all_2020_ttc_data) + 
  geom_histogram(aes(x = min_delay, y = ..density.., fill = line), 
                 position = 'dodge', 
                 bins = 10) + 
  scale_x_log10()
```

![(\#fig:delaydensity)Density of the distribution of delay, in minutes](13-eda_files/figure-latex/delaydensity-1.pdf) 

Figure \@ref(fig:delaydensity) uses density so that we can look at the the distributions more comparably, but we should also be aware of differences in frequency (Figure \@ref(fig:delayfreq)). In this case, we will see that 'SHP' and 'SRT' have much smaller counts.


```r
ggplot(data = all_2020_ttc_data) + 
  geom_histogram(aes(x = min_delay, fill = line), 
                 position = 'dodge', 
                 bins = 10) + 
  scale_x_log10()
```

![(\#fig:delayfreq)Frequency of the distribution of delay, in minutes](13-eda_files/figure-latex/delayfreq-1.pdf) 

To group by another variable we can add facets (Figure \@ref(fig:delayfreqfacet)).


```r
ggplot(data = all_2020_ttc_data) + 
  geom_density(aes(x = min_delay, color = line), 
               bw = .08) + 
  scale_x_log10() + 
  facet_wrap(vars(day))
```

![(\#fig:delayfreqfacet)Frequency of the distribution of delay, in minutes, by day](13-eda_files/figure-latex/delayfreqfacet-1.pdf) 


We can now plot the top five stations by mean delay.


```r
all_2020_ttc_data |> 
  group_by(line, station_clean) |> 
  summarise(mean_delay = mean(min_delay), n_obs = n()) |> 
  filter(n_obs>1) |> 
  arrange(line, -mean_delay) |> 
  slice(1:5) |> 
  ggplot(aes(station_clean, mean_delay)) + 
    geom_col() + 
    coord_flip() + 
    facet_wrap(vars(line), 
               scales = "free_y")
#> `summarise()` has grouped output by 'line'. You can override
#> using the `.groups` argument.
```

![](13-eda_files/figure-latex/unnamed-chunk-17-1.pdf)<!-- --> 

### Dates

Dates are often difficult to work with because they are so prone to having issues. For this reason, it is especially important to consider them during EDA. We could create a graph by week, to see if there is any seasonality. When using dates, `lubridate` [@GrolemundWickham2011] is especially useful. For instance, we can look at the average delay, of those that were delayed, by week drawing on `week()` to construct the weeks (Figure \@ref(fig:delaybyweek)).


```r
library(lubridate)

all_2020_ttc_data |>
  filter(min_delay > 0) |>
  mutate(week = week(date)) |>
  group_by(week, line) |>
  summarise(mean_delay = mean(min_delay)) |>
  ggplot(aes(week, mean_delay, color = line)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(vars(line),
              scales = "free_y"
             )
```

![(\#fig:delaybyweek)Average delay, in minutes, by week, for the Toronto subway](13-eda_files/figure-latex/delaybyweek-1.pdf) 

Now let us look at the proportion of delays that were greater than 10 minutes (Figure \@ref(fig:longdelaybyweek)).


```r
all_2020_ttc_data |> 
  mutate(week = week(date)) |> 
  group_by(week, line) |> 
  summarise(prop_delay = sum(min_delay>10)/n()) |> 
  ggplot(aes(week, prop_delay, color = line)) + 
    geom_point() + 
    geom_smooth() + 
      facet_wrap(vars(line),
              scales = "free_y"
             )
```

![(\#fig:longdelaybyweek)Delays longer than ten minutes, by week, for the Toronto subway](13-eda_files/figure-latex/longdelaybyweek-1.pdf) 

These figures, tables, and analysis have no place in a final paper. Instead, they allow us to become comfortable with the data. We note aspects about each that stand out, as well as the warnings and any implications or aspects to return to.

### Relationships

We are also interested in looking at the relationship between two variables. Scatter plots are especially useful here for continuous variables, and are a good precursor to modeling. For instance, we may be interested in the relationship between the delay and the gap (Figure \@ref(fig:delayvsgap)).


```r
all_2020_ttc_data |>
  ggplot(aes(x = min_delay, y = min_gap)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10()
```

![(\#fig:delayvsgap)Relationship between delay and gap for the Toronto subway in 2020](13-eda_files/figure-latex/delayvsgap-1.pdf) 

The relationship between categorical variables takes more work, but we could also, for instance, look at the top five reasons for delay by station. In particular, we may be interested in whether they differ, and how any difference could be modeled (Figure \@ref(fig:categorical)).


```r
all_2020_ttc_data |>
  group_by(line, code_desc) |>
  summarise(mean_delay = mean(min_delay)) |>
  arrange(-mean_delay) |>
  slice(1:5) |>
  ggplot(aes(x = code_desc,
             y = mean_delay)) +
  geom_col() + 
  facet_wrap(vars(line), 
             scales = "free_y",
             nrow = 4) +
  coord_flip()
```

![(\#fig:categorical)Relationship between categorical variables for the Toronto subway in 2020](13-eda_files/figure-latex/categorical-1.pdf) 

Principal components analysis (PCA) is another powerful exploratory tool. It allows us to pick up potential clusters and outliers that can help to inform modeling. To see this, we can look at the types of delay by station. The delay categories are messy and there a lot of them, but as we are trying to come to terms with the dataset, we will just take the first word.


```r
all_2020_ttc_data <-
  all_2020_ttc_data |>
  mutate(code_red = case_when(
    str_starts(code_desc, "No") ~ word(code_desc, 1, 2),
    str_starts(code_desc, "Operator") ~ word(code_desc, 1, 2),
    TRUE ~ word(code_desc, 1)
  ))
```

Let us also just restrict the analysis to causes that happen at least 50 times over 2019. To do the PCA, the dataframe also needs to be switched to wide format.


```r
dwide <-
  all_2020_ttc_data |>
  group_by(line, station_clean) |>
  mutate(n_obs = n()) |>
  filter(n_obs > 1) |>
  group_by(code_red) |>
  mutate(tot_delay = n()) |>
  arrange(tot_delay) |>
  filter(tot_delay > 50) |>
  group_by(line, station_clean, code_red) |>
  summarise(n_delay = n()) |>
  pivot_wider(names_from = code_red, values_from = n_delay) |>
  mutate_all(.funs = funs(ifelse(is.na(.), 0, .)))
#> `summarise()` has grouped output by 'line', 'station_clean'. You can override using the `.groups` argument.
#> `mutate_all()` ignored the following grouping variables:
#> Columns `line`, `station_clean`
#> Use `mutate_at(df, vars(-group_cols()), myoperation)` to silence the message.
#> Warning: `funs()` was deprecated in dplyr 0.8.0.
#> Please use a list of either functions or lambdas: 
#> 
#>   # Simple named list: 
#>   list(mean = mean, median = median)
#> 
#>   # Auto named with `tibble::lst()`: 
#>   tibble::lst(mean, median)
#> 
#>   # Using lambdas
#>   list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.
```

Now we can quickly do some PCA.


```r
delay_pca <- prcomp(dwide[,3:ncol(dwide)])

df_out <- as_tibble(delay_pca$x)
df_out <- bind_cols(dwide |> select(line, station_clean), df_out)
head(df_out)
#> # A tibble: 6 x 32
#> # Groups:   line, station_clean [6]
#>   line  station_clean    PC1    PC2     PC3   PC4    PC5
#>   <chr> <chr>          <dbl>  <dbl>   <dbl> <dbl>  <dbl>
#> 1 BD    BATHURST       10.9   17.2   2.04   12.9   4.60 
#> 2 BD    BAY            14.6    6.54  4.76   14.4   0.406
#> 3 BD    BLOOR          22.8  -18.6  19.7    -7.37 -1.54 
#> 4 BD    BLOOR-DANFORTH 23.4  -20.2  20.4    -4.85 -0.429
#> 5 BD    BROADVIEW       9.29  22.0  -0.0365  6.72  4.31 
#> 6 BD    CASTLE         15.1    5.21  7.62   11.6  -1.17 
#> # ... with 25 more variables: PC6 <dbl>, PC7 <dbl>,
#> #   PC8 <dbl>, PC9 <dbl>, PC10 <dbl>, PC11 <dbl>,
#> #   PC12 <dbl>, PC13 <dbl>, PC14 <dbl>, PC15 <dbl>,
#> #   PC16 <dbl>, PC17 <dbl>, PC18 <dbl>, PC19 <dbl>,
#> #   PC20 <dbl>, PC21 <dbl>, PC22 <dbl>, PC23 <dbl>,
#> #   PC24 <dbl>, PC25 <dbl>, PC26 <dbl>, PC27 <dbl>,
#> #   PC28 <dbl>, PC29 <dbl>, PC30 <dbl>
```


We can plot the first two principal components, and add labels to some of the outlying stations.


```r
library(ggrepel)
ggplot(df_out,aes(x=PC1,y=PC2,color=line )) + 
  geom_point() + 
  geom_text_repel(data = df_out |> filter(PC2>100|PC1<100*-1), 
                  aes(label = station_clean)
                  )
```

![](13-eda_files/figure-latex/unnamed-chunk-21-1.pdf)<!-- --> 

We could also plot the factor loadings. We se some evidence that perhaps one is to do with the public, compared with another to do with the operator.


```r
df_out_r <- as_tibble(delay_pca$rotation)
df_out_r$feature <- colnames(dwide[,3:ncol(dwide)])

df_out_r
#> # A tibble: 30 x 31
#>         PC1    PC2      PC3      PC4      PC5     PC6
#>       <dbl>  <dbl>    <dbl>    <dbl>    <dbl>   <dbl>
#>  1 -0.0279  0.125  -0.0576   0.0679  -0.0133   0.0307
#>  2 -0.108   0.343  -0.150    0.205   -0.100    0.317 
#>  3 -0.0196  0.0604 -0.0207   0.0195   0.0189   0.0574
#>  4 -0.0244  0.0752 -0.0325  -0.0237   0.00121 -0.0263
#>  5 -0.0128  0.0113 -0.00340 -0.00977 -0.0255   0.0186
#>  6 -0.231   0.650  -0.309    0.245    0.222   -0.309 
#>  7 -0.0871  0.233  -0.0904  -0.692   -0.311   -0.414 
#>  8 -0.00377 0.0193 -0.00201 -0.0140  -0.0424   0.0751
#>  9 -0.0167  0.120  -0.0367  -0.578    0.336    0.563 
#> 10 -0.0708  0.276  -0.118    0.116   -0.368    0.435 
#> # ... with 20 more rows, and 25 more variables: PC7 <dbl>,
#> #   PC8 <dbl>, PC9 <dbl>, PC10 <dbl>, PC11 <dbl>,
#> #   PC12 <dbl>, PC13 <dbl>, PC14 <dbl>, PC15 <dbl>,
#> #   PC16 <dbl>, PC17 <dbl>, PC18 <dbl>, PC19 <dbl>,
#> #   PC20 <dbl>, PC21 <dbl>, PC22 <dbl>, PC23 <dbl>,
#> #   PC24 <dbl>, PC25 <dbl>, PC26 <dbl>, PC27 <dbl>,
#> #   PC28 <dbl>, PC29 <dbl>, PC30 <dbl>, feature <chr>

ggplot(df_out_r,aes(x=PC1,y=PC2,label=feature )) + geom_text_repel()
#> Warning: ggrepel: 22 unlabeled data points (too many
#> overlaps). Consider increasing max.overlaps
```

![](13-eda_files/figure-latex/unnamed-chunk-22-1.pdf)<!-- --> 







<!-- ## Case study - Opinions about a casino in Toronto -->

<!-- **This was written by [Michael Chong](https://michael-chong.github.io).** -->

<!-- ### Data preparation -->

<!-- Here we use the `opendatatoronto` package again. See the previous case study for a deeper explanation of how the code below works. -->

<!-- The dataset I'm extracting below are the results from a survey in 2012 regarding the establishment of a casino in Toronto. More info available by following [this link](https://open.toronto.ca/dataset/casino-survey-results/). In this analysis, we will be hoping to address the question: which demographic (age/gender) groups are more likely to be supportive of a new casino in Toronto? -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- # Get the data -->
<!-- casino_resource <-  -->
<!--   search_packages("casino survey")|> -->
<!--   list_package_resources() |> -->
<!--   filter(name == "toronto-casino-survey-results") |> -->
<!--   get_resource() -->
<!-- head(casino_resource) -->
<!-- ``` -->

<!-- The object `casino_resource` isn't quite useable yet, because it is (inconveniently) stored as a `list` of 2 data frames: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- # Check what kind of object the casino_resource object is -->
<!-- class(casino_resource) -->
<!-- ``` -->

<!-- If we just return the object, we can see that the second list item is empty, and we just want to keep the first one: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- casino_resource -->
<!-- ``` -->

<!-- So, let us only keep the first item by indexing the list with double square brackets: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- casino_data <- casino_resource[[1]] -->
<!-- ``` -->

<!-- Let us check out what the first couple rows of the dataframe looks like. By default, `head()` returns the first 6 rows: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- head(casino_data)  -->
<!-- ``` -->

<!-- Unfortunately the column names are not very informative. For simplicity, we will use the '.pdf' questionnaire that accompanies this dataset from the Toronto Open Data website. Alternatively, we could get and parse the 'readme' through the R package. [Here's a link to the questionnaire](https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/427ca4cd-168a-4a37-883d-4a574277caf5/resource/ae135d6a-6921-4905-bc79-516fcd428b7b/download/toronto-casino-survey-feedback-form.pdf).  -->

<!-- Question 1 indicates the level of support for a casino in Toronto. We will use this as the response variable. -->

<!-- Concerning potential predictor variables, most of the questions ask respondents about their opinions on different aspects of a potential casino development, which are not particularly useful towards our cause. The only demographic variables are `Age` and `Gender`, so let us choose these. -->

<!-- Here I'm also going to rename the columns so that my resulting data frame has columns 'opinion', 'age', and 'gender'. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- # Narrow down the dataframe to our variables of interest -->
<!-- casino_data <-  -->
<!--   casino_data |> -->
<!--   select(Q1_A, Age, Gender) |> -->
<!--   rename(opinion = Q1_A, age = Age, gender = Gender) -->

<!-- # Look at first couple rows: -->
<!-- head(casino_data) -->
<!-- ``` -->

<!-- ### Some visual exploration (and more cleanup, of course) -->

<!-- Let us first do some quick exploration to get a feel for what's going on in the data. We will first calculate proportions of casino support for each age-gender combination: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- # Calculate proportions -->
<!-- casino_summary <- casino_data |> -->
<!--   group_by(age, gender, opinion) |> -->
<!--   summarise(n = n()) |> # Count the number in each group and response -->
<!--   group_by(age, gender) |> -->
<!--   mutate(prop = n/sum(n)) # Calculate proportions within each group -->
<!-- ``` -->

<!-- Some notes: -->

<!-- * we use `geom_col()` to make a bar chart, -->
<!-- * `facet_grid()` modifies the plot so that the plot has panels that correspond only to certain values of discrete variables (in this case, we will "facet" by `age` and `gender`). This is helpful in this case because we are interested in how the distribution of `opinion`s changes by `age` and `gender`. -->

<!-- ```{r, fig.height = 8} -->
<!-- ggplot(casino_summary) + -->
<!--   geom_col(aes(x = opinion, y = prop)) + # Specify a histogram of opinion responses -->
<!--   facet_grid(age~gender) + #Facet by age and gender -->
<!--   theme(axis.text.x = element_text(angle = 90)) # Rotate the x-axis labels to be readable -->
<!-- ``` -->

<!-- Some things to note: -->

<!-- * the x-axis labels are out of order in the sense that they are not in a monotone order of increasing/decreasing support -->
<!-- * there are `NA` values in `opinion`, `age`, and `gender`, as well as "Prefer not to disclose" responses -->

<!-- ### Getting the data into a more model-suitable format -->

<!-- First we need to get rid of responses that are not suitable. For simplicity we will assume that `NA` values and "Prefer not to disclose" responses occur randomly, and remove them from our dataset (note in reality this assumption might not hold up and we might want to be more careful). Let us check how many rows are in the original dataset: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- # nrow() returns the number of rows in a dataframe: -->
<!-- nrow(casino_data) -->
<!-- ``` -->

<!-- Now let us `dplyr::filter()` accordingly to omit the responses we do not want. In case you're unfamiliar, I'm going to make use of: -->

<!-- * `is.na()`, which returns `TRUE` if the argument is `NA`, -->
<!-- * the `!` operator, which flips `TRUE` and `FALSE`. So for instance, `!is.na(x)` will return `TRUE` if `x` is NOT `NA`, which is what we want to keep.  -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- casino_data <- casino_data |> -->
<!--   # Only keep rows with non-NA: -->
<!--   filter(!is.na(opinion), !is.na(age), !is.na(gender)) |> -->
<!--   # Only keep rows where age and gender are disclosed: -->
<!--   filter(age != "Prefer not to disclose", gender != "Prefer not to disclose") -->
<!-- ``` -->

<!-- Let us check how many rows of data we are left with: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- nrow(casino_data) -->
<!-- ``` -->

<!-- Now we need to convert the response variable into binary. To clean up the first problem (response variables out of order), we might as well take this opportunity to convert these into a format suitable for our model. In a logistic regression, we would like our response variable to be binary, but in this case we have 5 possible categories ranging from "Strongly Opposed" to "Strongly in Favour". We will recategorize them into a new 'supportive_or_not' variable as follows.  -->

<!-- * 'supportive = 1' if "Strongly in Favour" or "Somewhat in Favour" -->
<!-- * 'supportive = 0' if "Neutral or Mixed Feelings", "Somewhat Opposed", or "Strongly Opposed" -->

<!-- We do this with the `dplyr::mutate()` function, which creates new columns (possibly as functions of existing columns), and `dplyr::case_when()`, which provides a way to assign values conditional on if-statements. The syntax here is a little strange. On the LHS of the `~` is the "if" condition, and the RHS of the tilde is the value to return. For example, 'x == 0 ~ 3' would return 3 when 'x' is 0. -->

<!-- Another commonly used operator here is the `%in%` operator, which checks whether something is an element of a vector, for instance, e.g.: -->

<!-- * `1 %in% c(1, 3, 4)` returns `TRUE` -->
<!-- * `2 %in% c(1, 3, 4)` returns `FALSE` -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- # Store possible opinions in vectors -->
<!-- yes_opinions <- c("Strongly in Favour", "Somewhat in Favour") -->
<!-- no_opinions <- c("Neutral or Mixed Feelings", "Somewhat Opposed", "Strongly Opposed") -->

<!-- # Create `supportive` column: -->
<!-- casino_data <-  -->
<!--   casino_data |> -->
<!--   mutate(supportive = case_when( -->
<!--     opinion %in% yes_opinions ~ TRUE, # Assign TRUE -->
<!--     opinion %in% no_opinions ~ FALSE  # Assign FALSE -->
<!--   )) -->
<!-- ``` -->

<!-- Now we need to convert age to a numeric variable. Age in this survey is given in age groups. Let us instead map it to a numeric variable so that we can more easily talk about trends with age. We will map the youngest age to `1`, and so on: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- casino_data <-  -->
<!--   casino_data |> -->
<!--   mutate(age_group = case_when( -->
<!--     age == "Under 15" ~ 0, -->
<!--     age == "15-24" ~ 1, -->
<!--     age == "25-34" ~ 2, -->
<!--     age == "35-44" ~ 3, -->
<!--     age == "45-54" ~ 4, -->
<!--     age == "55-64" ~ 5, -->
<!--     age == "65 or older" ~ 6 -->
<!--   )) -->
<!-- ``` -->

<!-- Now let us make the same plot again, with our new processed data: -->

<!-- ```{r, fig.height = 9} -->
<!-- casino_summary2 <-  -->
<!--   casino_data |> -->
<!--   group_by(age_group, gender, supportive) |> -->
<!--   summarise(n = n()) |> # Count the number in each group and response -->
<!--   group_by(age_group, gender) |> -->
<!--   mutate(prop = n/sum(n)) # Calculate proportions within each group -->

<!-- ggplot(casino_summary2) + -->
<!--   facet_grid(age_group ~ gender) + -->
<!--   geom_col(aes(x = supportive, y = prop))  -->
<!-- ``` -->

<!-- We can sort of see some difference in the distribution between different panels. To formalize this, we can run a logistic regression. -->

<!-- ### Logistic Regression -->

<!-- Now, we are set up to feed it to the regression. We can do this with `glm()`, which allows us to fit generalized linear models. -->

<!-- We use `family = "binomial"` to specify a logistic regression, and our formula is `supportive ~ age_group + gender`, which indicates that `supportive` is the (binary) response variable since it is on the LHS, and `age_group` and `gender` are our predictor variables. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- casino_glm <- glm(supportive ~ age_group + gender, data = casino_data, family = "binomial") -->
<!-- ``` -->

<!-- We can take a look at the results of running the GLM using `summary()`: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- summary(casino_glm) -->
<!-- ``` -->


<!-- Interpretation can be a little tricky. Here are some important things to note about our results: -->

<!-- Firstly, we have a numeric age group variable. Remember that we coded `age_group` as numbers 1 to 5. Because we've used age groups instead of age, we have to be careful with how we phrase our conclusion. The coefficient estimate corresponds to the effect of moving up a unit on the age group scale (e.g. from the 25-34 age group to the 35-44 age group), rather than 1 year in age (e.g. from age 28 to 29). -->

<!-- Secondly, the results are in log-odds ratios. The effect estimates are on the log-odds scale. This means the effect of -0.07983 for `age_group` is interpreted as: 'for each unit increase in `age_group`, we estimate a 0.07983 decrease in the log-odds of being supportive of a casino'. -->

<!-- We could exponentiate the coefficient estimate to make this at least a little easier to interpret. The number we get is interpreted as a factor for the odds. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- exp(-0.07983) -->
<!-- ``` -->

<!-- So our (cleaner) interpretation is: 'the odds of an individuals of the same gender being pro-casino are predicted to change by a factor of 0.9232733 for each unit increase in `age_group`' -->

<!-- Finally, we have a baseline category. First, note that because we have categorical variables, the `gender` coefficients are relative to a "baseline" category. The value of `gender`  that does not appear in the table, `Female`, is implicitly used as our baseline gender category. Technical note: if the variable is stored as a `character` class, then `glm()` will choose the alphabetically first value to use as the baseline. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- exp(0.70036) -->
<!-- ``` -->

<!-- So, the interpretation of the `genderMale` coefficient is: 'the odds of a male individual supporting a casino is 2.0144778 times higher than a female individual of the same `age_group`.' -->

<!-- We can make estimates in a variety of ways. First we will look at it manually. -->

<!-- Using the formula found in @islr [4.3.3], we can make estimates for an individual of certain characteristics. Suppose we wanted to predict the the probability of supporting a Toronto casino for an individual who was 36 and identified as transgender. Then: -->

<!-- * `age_group` takes a value of 3, since they are in the age group of 35-44 coded as 3, -->
<!-- * `genderTransgendered` takes a value of 1 -->

<!-- First, let us extract the coefficient estimates as a vector using `coefficients()`: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- coefs <- coefficients(casino_glm) -->
<!-- coefs -->
<!-- ``` -->

<!-- Since this vector is labeled, we can index it using square brackets and names. For instance: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- coefs["age_group"] -->
<!-- ``` -->

<!-- So first let us evaluate the exponent term $e^{\beta_0 + \cdots + \beta_p X_p}$: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- exp_term <- exp(coefs["(Intercept)"] + coefs["age_group"]*3 + coefs["genderTransgendered"]*1) -->
<!-- ``` -->

<!-- Now evaluate the expression that gives the probability of casino support: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- # The unname() command just takes off the label that it "inherited" from the coefs vector. -->
<!-- # (do not worry about it, does not affect any functionality) -->
<!-- unname(exp_term / (1 + exp_term)) -->
<!-- ``` -->


<!-- That works, but there are more stream-lined ways. Thankfully R comes with a convenient function to make prediction estimates from a `glm()`. We do this using the `predict()` function. First, we need to make a dataframe that has the relevant variables and values that we are interested in predicting. We will use the same values as before: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- prediction_df <- data.frame(age_group = 3, gender = "Transgendered") -->
<!-- ``` -->

<!-- The dataframe looks like this: -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- prediction_df -->
<!-- ``` -->


<!-- Then we feed it into the `predict()` function, along with our `glm` object. To get the probability, we need to specify `type = "response"`. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- predict(casino_glm, newdata = prediction_df, type = "response") -->
<!-- ``` -->

<!-- This matches the probability we got from doing this manually, yay! -->











<!-- ## Case study - Historical Canadian elections -->


<!-- https://twitter.com/semrasevi/status/1122889166008745985?s=21  -->




<!-- ```{r, include = TRUE, eval = FALSE} -->
<!-- library(tidyverse) -->

<!-- elections_data <- read_csv("inputs/federal_candidates-1.csv") -->


<!-- elections_data$Province |> table() -->

<!-- # There are inconsistencies in the province names -->
<!-- elections_data$Province[elections_data$Province == "Québec"] <- "Quebec" -->


<!-- elections_data <- elections_data |> -->
<!--   filter(!is.na(Province)) -->

<!-- # Check gender -->
<!-- elections_data$Gender |> table() -->

<!-- # Check occupation -->
<!-- elections_data$occupation |> table() -->
<!-- # Get a count of how many uniques there are -->
<!-- elections_data$occupation |> unique() |> length() -->

<!-- # Check party -->
<!-- elections_data$party_short |> table() -->
<!-- elections_data$party_short |> unique() |> length() -->

<!-- # Check incumbency -->
<!-- elections_data$incumbent_candidate |> table() -->
<!-- elections_data$party_short |> unique() |> length() -->


<!-- # Add year -->
<!-- elections_data <- -->
<!--   elections_data |> -->
<!--   mutate(year = year(edate)) -->

<!-- # Add a counter for year -->
<!-- elections_data <- -->
<!--   elections_data |> -->
<!--   mutate(counter = year - 1867) -->



<!-- #### Save #### -->
<!-- write_csv(elections_data, "outputs/elections.csv") -->
<!-- ``` -->



<!-- ```{r, include = TRUE, eval = FALSE} -->
<!-- library(lubridate) -->
<!-- library(tidyverse) -->

<!-- elections_data <- read_csv("outputs/elections.csv") -->

<!-- elections_data |> -->
<!--   ggplot(aes(x = edate)) + -->
<!--   geom_histogram() -->

<!-- elections_data |> -->
<!--   ggplot(aes(x = edate, y = Result, color = Gender)) + -->
<!--   geom_point() + -->
<!--   facet_wrap(vars(Province)) -->


<!-- elections_data |> -->
<!--   ggplot(aes(x = Province, fill = Gender)) + -->
<!--   geom_bar(position = "dodge") -->
<!-- # We discovered WW1! -->




<!-- ``` -->

<!-- ```{r, include = TRUE, eval = FALSE} -->

<!-- #### Set up workspace ### -->
<!-- library(broom) -->
<!-- library(tidyverse) -->

<!-- #### Read in data #### -->
<!-- elections_data <- read_csv("outputs/elections.csv") -->

<!-- #### Model #### -->
<!-- # Just gender -->
<!-- model1 <- lm(Result ~ Gender, data = elections_data) -->

<!-- tidy(model1) -->

<!-- # Gender and incumbent -->
<!-- model2 <- lm(Result ~ Gender + incumbent_candidate, data = elections_data) -->

<!-- tidy(model2) -->

<!-- # Gender and incumbent and province -->
<!-- model3 <- lm(Result ~ Gender + incumbent_candidate + Province, data = elections_data) -->

<!-- tidy(model3) -->

<!-- # Gender and incumbent and province and year -->
<!-- model4 <- lm(Result ~ Gender + incumbent_candidate + Province + year, data = elections_data) -->
<!-- model5 <- lm(Result ~ Gender + incumbent_candidate + Province + year*Gender, data = elections_data) -->

<!-- tidy(model4) -->
<!-- tidy(model5) -->

<!-- # CHange the year into a counter that increments one for each year -->
<!-- model6 <- lm(Result ~ Gender + incumbent_candidate + Province + counter + counter*Gender, data = elections_data) -->
<!-- tidy(model6) -->


<!-- ``` -->



## Case study: Airbnb listing in Toronto

<!-- - Kommenda, Niko, Helen Pidd and Libby Brooks, 2020, 'Revealed: the areas in the UK with one Airbnb for every four homes', *The Guardian*, 20 February, https://www.theguardian.com/technology/2020/feb/20/revealed-the-areas-in-the-uk-with-one-airbnb-for-every-four-homes. -->

In this case study we look at Airbnb listings in Toronto. The dataset is from Inside Airbnb [@airbnbdata] and we will read it from their website, and then save a local copy. We can give `read_csv()` a link to where the dataset is and it will download it. This helps with reproducibility because the source is clear. But, as that link could change at any time, longer-term reproducibility, as well as wanting to minimize the effect on the Inside Airbnb servers, suggest that we should also save a local copy of the data and then use that. As the original data is not ours, we should not make that public without first getting written permission. The 'guess_max' option in read_csv helps us avoid having to specify the column types. Usually `read_csv()` takes a best guess at the column types based on the first few rows. But sometimes those first ones are misleading and so 'guess_max' forces it to look at a larger number of rows to try to work out what is going on.


```r
library(tidyverse)

airbnb_data <- 
  read_csv("http://data.insideairbnb.com/canada/on/toronto/2021-01-02/data/listings.csv.gz", 
           guess_max = 20000)

write_csv(airbnb_data, "airbnb_data.csv")

airbnb_data
```



### Explore individual variables

There are a large number of columns, so we will just select a few.


```r
names(airbnb_data) |> 
  length()
#> [1] 74

airbnb_data_selected <- 
  airbnb_data |> 
  select(host_id, 
         host_since, 
         host_response_time, 
         host_is_superhost, 
         host_listings_count,
         host_total_listings_count,
         host_neighbourhood, 
         host_listings_count, 
         neighbourhood_cleansed, 
         room_type, 
         bathrooms, 
         bedrooms, 
         price, 
         number_of_reviews, 
         has_availability, 
         review_scores_rating, 
         review_scores_accuracy, 
         review_scores_cleanliness, 
         review_scores_checkin, 
         review_scores_communication, 
         review_scores_location, 
         review_scores_value
         )

airbnb_data_selected
#> # A tibble: 18,265 x 21
#>    host_id host_since host_response_time host_is_superhost
#>      <dbl> <date>     <chr>              <lgl>            
#>  1    1565 2008-08-08 N/A                FALSE            
#>  2   22795 2009-06-22 N/A                FALSE            
#>  3   48239 2009-10-25 N/A                FALSE            
#>  4   93825 2010-03-15 N/A                FALSE            
#>  5  118124 2010-05-04 within a day       FALSE            
#>  6   22795 2009-06-22 N/A                FALSE            
#>  7  174063 2010-07-20 within an hour     TRUE             
#>  8  183071 2010-07-28 within an hour     TRUE             
#>  9  187320 2010-08-01 within a few hours TRUE             
#> 10  192364 2010-08-05 N/A                FALSE            
#> # ... with 18,255 more rows, and 17 more variables:
#> #   host_listings_count <dbl>,
#> #   host_total_listings_count <dbl>,
#> #   host_neighbourhood <chr>, neighbourhood_cleansed <chr>,
#> #   room_type <chr>, bathrooms <lgl>, bedrooms <dbl>,
#> #   price <chr>, number_of_reviews <dbl>,
#> #   has_availability <lgl>, review_scores_rating <dbl>, ...
```

First we might be interested in price. It is a character at the moment and so we need to convert it to a numeric. This is a common problem, and we need to be a little careful that it does not all just convert to NAs. In our case if we just force the price data to be a numeric then it will go to NA because there are a lot of characters where it is unclear what the numeric equivalent is, such as '$'. So we need to remove those characters first.


```r
airbnb_data_selected$price |> head()
#> [1] "$469.00" "$96.00"  "$64.00"  "$70.00"  "$45.00" 
#> [6] "$127.00"

airbnb_data_selected$price |> str_split("") |> unlist() |> unique()
#>  [1] "$" "4" "6" "9" "." "0" "7" "5" "1" "2" "3" "8" ","

airbnb_data_selected |> 
  select(price) |> 
  filter(str_detect(price, ","))
#> # A tibble: 145 x 1
#>    price    
#>    <chr>    
#>  1 $1,724.00
#>  2 $1,000.00
#>  3 $1,100.00
#>  4 $1,450.00
#>  5 $1,019.00
#>  6 $1,000.00
#>  7 $1,300.00
#>  8 $2,142.00
#>  9 $2,000.00
#> 10 $1,200.00
#> # ... with 135 more rows

airbnb_data_selected <- 
  airbnb_data_selected |> 
  mutate(price = str_remove(price, "\\$"),
         price = str_remove(price, ","),
         price = as.integer(price)
         )
```

Now we can have a look at the distribution of prices (Figure \@ref(fig:airbnbpricesfirst)).


```r
airbnb_data_selected |>
  ggplot(aes(x = price)) +
  geom_histogram(binwidth = 10) +
  theme_classic() +
  labs(x = "Price per night",
       y = "Number of properties")
```

![(\#fig:airbnbpricesfirst)Distribution of prices of Toronto Airbnb rentals in January 2021](13-eda_files/figure-latex/airbnbpricesfirst-1.pdf) 

It is clear that there are outliers, so again we might like to consider it on the log scale (Figure \@ref(fig:airbnbpriceslog)). 

```r
airbnb_data_selected |>
  filter(price > 1000) |> 
  ggplot(aes(x = price)) +
  geom_histogram(binwidth = 10) +
  theme_classic() +
  labs(x = "Price per night",
       y = "Number of properties") +
  scale_y_log10()
```

![(\#fig:airbnbpriceslog)Distribution of log prices of Toronto Airbnb rentals in January 2021](13-eda_files/figure-latex/airbnbpriceslog-1.pdf) 


If we focus on prices that are less than $1,000 then we see that the majority of properties have a nightly price less than $250. Interestingly it looks like there is some bunching of prices, possible around numbers ending in zero or nine. Let us just zoom in on prices between $90 and $210, out of interest, but change the bins to be smaller (Figure \@ref(fig:airbnbpricesbunch)).


```r
airbnb_data_selected |>
  filter(price < 1000) |> 
  ggplot(aes(x = price)) +
  geom_histogram(binwidth = 10) +
  theme_classic() +
  labs(x = "Price per night",
       y = "Number of properties")

airbnb_data_selected |>
  filter(price > 90) |> 
  filter(price < 210) |> 
  ggplot(aes(x = price)) +
  geom_histogram(binwidth = 1) +
  theme_classic() +
  labs(x = "Price per night",
       y = "Number of properties")
```

\begin{figure}
\includegraphics[width=0.49\linewidth]{13-eda_files/figure-latex/airbnbpricesbunch-1} \includegraphics[width=0.49\linewidth]{13-eda_files/figure-latex/airbnbpricesbunch-2} \caption{Distribution of prices less than $1000 for Toronto Airbnb rentals in January 2021 shows bunching}(\#fig:airbnbpricesbunch)
\end{figure}

For now, we will just remove all prices that are more than $999.


```r
airbnb_data_selected <- 
  airbnb_data_selected |> 
  filter(price < 1000)
```

Superhosts are especially experienced Airbnb hosts, and we might be interested to learn more about them. For instance, a host either is or is not a superhost, and so we would not expect any NAs. But we can see that there are. It might be that the host removed a listing or similar. For now, we will remove them.


```r
airbnb_data_selected |>
  filter(is.na(host_is_superhost))
#> # A tibble: 11 x 21
#>      host_id host_since host_response_time host_is_superhost
#>        <dbl> <date>     <chr>              <lgl>            
#>  1  23472830 NA         <NA>               NA               
#>  2  31675651 NA         <NA>               NA               
#>  3  75779190 NA         <NA>               NA               
#>  4  47614482 NA         <NA>               NA               
#>  5 201103629 NA         <NA>               NA               
#>  6 111820893 NA         <NA>               NA               
#>  7  23472830 NA         <NA>               NA               
#>  8 196269219 NA         <NA>               NA               
#>  9  23472830 NA         <NA>               NA               
#> 10 266594170 NA         <NA>               NA               
#> 11 118516038 NA         <NA>               NA               
#> # ... with 17 more variables: host_listings_count <dbl>,
#> #   host_total_listings_count <dbl>,
#> #   host_neighbourhood <chr>, neighbourhood_cleansed <chr>,
#> #   room_type <chr>, bathrooms <lgl>, bedrooms <dbl>,
#> #   price <int>, number_of_reviews <dbl>,
#> #   has_availability <lgl>, review_scores_rating <dbl>,
#> #   review_scores_accuracy <dbl>, ...
```

We will also want to create a binary variable from this. It is true/false at the moment, which is fine for the modelling, but there are a handful of situations where it will be easier if we have a 0/1. And for now we will just remove anyone with an NA for whether they are a super host.


```r
airbnb_data_selected <- 
  airbnb_data_selected |>
  filter(!is.na(host_is_superhost)) |>
  mutate(host_is_superhost_binary = if_else(
    host_is_superhost == TRUE, 1, 0)
    )
```

On Airbnb, guests can give 1-5 star ratings across a variety of different aspects, including cleanliness, accuracy, value, and others. But when we look at the reviews in our dataset, it is less clear how this is being constructed, because it appears to be a rating between 20 and 100 and there are also NA values (Figure \@ref(fig:airbnbreviews)).


```r
airbnb_data_selected |>
  ggplot(aes(x = review_scores_rating)) +
  geom_bar() +
  theme_classic() +
  labs(x = "Reviews scores rating",
       y = "Number of properties")
```

![(\#fig:airbnbreviews)Distribution of review scores rating for Toronto Airbnb rentals in January 2021](13-eda_files/figure-latex/airbnbreviews-1.pdf) 

We would like to deal with the NAs in 'review_scores_rating', but this is more complicated as there are a lot of them. It may be that this is just because they do not have any reviews.


```r
airbnb_data_selected |>
  filter(is.na(review_scores_rating)) |>
  nrow()
#> [1] 4308

airbnb_data_selected |>
  filter(is.na(review_scores_rating)) |> 
  select(number_of_reviews) |> 
  table()
#> 
#>    0    1    2    3    4 
#> 4046  226   23   10    3
```

So these properties do not have a review rating yet because they do not have enough reviews. It is a large proportion of the total, at almost a fifth of them so we might like to look at this in more detail using `vis_miss()` from `visdat` [@citevisdat]. We are interested to see whether there is something systematic happening with these properties. For instance, if the NAs were being driven by, say, some requirement of a minimum number of reviews, then we would expect they would all be missing.


```r
library(visdat)
airbnb_data_selected |> 
  select(review_scores_rating, 
         review_scores_accuracy, 
         review_scores_cleanliness, 
         review_scores_checkin, 
         review_scores_communication, 
         review_scores_location, 
         review_scores_value) |> 
  vis_miss()
```

![](13-eda_files/figure-latex/unnamed-chunk-31-1.pdf)<!-- --> 

Given it looks convincing that in almost all cases, the different types of reviews are missing for the same observation. One approach would be to just focus on those that are not missing and the main review score. It is clear that almost all the reviews are more than 80. Let us just zoom in on that 60 to 80 range to check what the distribution looks like in that range (Figure \@ref(fig:airbnbreviewsselected)).


```r
airbnb_data_selected |>
  filter(!is.na(review_scores_rating)) |> 
  filter(review_scores_rating > 60) |>
  filter(review_scores_rating < 80) |> 
  ggplot(aes(x = review_scores_rating)) +
  geom_histogram(binwidth = 1) +
  theme_classic() +
  labs(x = "Average review score",
       y = "Number of properties")
```

![(\#fig:airbnbreviewsselected)Distribution of review scores, between 60 and 80, for Toronto Airbnb rentals in January 2021](13-eda_files/figure-latex/airbnbreviewsselected-1.pdf) 

For now, we will remove anyone with an NA in their main review score, even though this will remove roughly 20 per cent of observations. And we will also focus only on those hosts with a main review score of at least 70. If we ended up using this dataset for actual analysis, then we would want to justify this decision in an appendix or similar.


```r
airbnb_data_selected <- 
  airbnb_data_selected |>
  filter(!is.na(review_scores_rating)) |>
  filter(review_scores_rating >= 70)
```

Another important factor is how quickly a host responds to an enquiry. Airbnb allows hosts up to 24 hours to respond, but encourages responses within an hour.


```r
airbnb_data_selected |>
  count(host_response_time)
#> # A tibble: 5 x 2
#>   host_response_time     n
#>   <chr>              <int>
#> 1 a few days or more   494
#> 2 N/A                 5708
#> 3 within a day         952
#> 4 within a few hours  1649
#> 5 within an hour      4668
```

It is unclear a host could have a response time of NA. It may be that they are related to some other variable. Interestingly it seems like what looks like 'NAs' in 'host_response_time' variable are not coded as proper NAs, but are instead being treated as another category. We will recode them to be actual NAs and also change the variable to be a factor.


```r
airbnb_data_selected <- 
  airbnb_data_selected |>
  mutate(host_response_time = if_else(host_response_time == "N/A", NA_character_, host_response_time),
         host_response_time = factor(host_response_time)
  )
```

There is clearly an issue with NAs as there are a lot of them. For instance, we might be interested to see if there is a relationship with the review score (Figure \@ref(fig:airbnbreviewsselectednasresponse)). There are a lot that have an overall review of 100.


```r
airbnb_data_selected |> 
  filter(is.na(host_response_time)) |> 
  ggplot(aes(x = review_scores_rating)) +
  geom_histogram(binwidth = 1) +
  theme_classic() +
  labs(x = "Average review score",
       y = "Number of properties")
```

![(\#fig:airbnbreviewsselectednasresponse)Distribution of review scores for properties with NA response time, for Toronto Airbnb rentals in January 2021](13-eda_files/figure-latex/airbnbreviewsselectednasresponse-1.pdf) 

For now, we will remove anyone with a NA in their response time. This will again removes roughly another 20 per cent of the observations.


```r
airbnb_data_selected <- 
  airbnb_data_selected |> 
  filter(!is.na(host_response_time))
```

There are two versions of a variable that suggest how many properties a host has on Airbnb. We might be interested to know whether there is a difference between them.


```r
airbnb_data_selected |> 
  mutate(listings_count_is_same = if_else(host_listings_count == host_total_listings_count, 1, 0)) |> 
  filter(listings_count_is_same == 0)
#> # A tibble: 0 x 23
#> # ... with 23 variables: host_id <dbl>, host_since <date>,
#> #   host_response_time <fct>, host_is_superhost <lgl>,
#> #   host_listings_count <dbl>,
#> #   host_total_listings_count <dbl>,
#> #   host_neighbourhood <chr>, neighbourhood_cleansed <chr>,
#> #   room_type <chr>, bathrooms <lgl>, bedrooms <dbl>,
#> #   price <int>, number_of_reviews <dbl>, ...
```

As there are no differences in this dataset, we can just remove one variable for now and have a look at the other one (Figure \@ref(fig:airbnbhostlisting)).


```r
airbnb_data_selected <- 
  airbnb_data_selected |> 
  select(-host_listings_count)

airbnb_data_selected |> 
  ggplot(aes(x = host_total_listings_count)) +
  geom_bar() +
  scale_x_log10()
```

![(\#fig:airbnbhostlisting)Distribution of the number of properties a host has on Airbnb, for Toronto Airbnb rentals in January 2021](13-eda_files/figure-latex/airbnbhostlisting-1.pdf) 

There are a large number who have somewhere in the 2-10 properties range, but the usual long tail. The number with 0 listings is unexpected and worth following up on. And there are a bunch with NA that we will need to deal with.


```r
airbnb_data_selected |> 
  filter(host_total_listings_count == 0) |> 
  head()
#> # A tibble: 6 x 21
#>   host_id host_since host_response_time host_is_superhost
#>     <dbl> <date>     <fct>              <lgl>            
#> 1 3783106 2012-10-06 within an hour     FALSE            
#> 2 3814089 2012-10-09 within an hour     FALSE            
#> 3 3827668 2012-10-10 within a day       FALSE            
#> 4 2499198 2012-05-30 within a day       FALSE            
#> 5 3268493 2012-08-15 within a day       FALSE            
#> 6 8675040 2013-09-06 within an hour     TRUE             
#> # ... with 17 more variables:
#> #   host_total_listings_count <dbl>,
#> #   host_neighbourhood <chr>, neighbourhood_cleansed <chr>,
#> #   room_type <chr>, bathrooms <lgl>, bedrooms <dbl>,
#> #   price <int>, number_of_reviews <dbl>,
#> #   has_availability <lgl>, review_scores_rating <dbl>,
#> #   review_scores_accuracy <dbl>, ...
```

There is nothing that immediately jumps out as odd about the people with zero listings, but there must be something going on. For now, we will focus on only those with one property.


```r
airbnb_data_selected <- 
  airbnb_data_selected |> 
  add_count(host_id) |> 
  filter(n == 1) |> 
  select(-n)
```



### Explore relationships between variables

We might like to make some graphs to see if there are any relationships that become clear. Some aspects that come to mind is looking at prices and reviews and super hosts, and number of properties and neighborhood. 

Look at the relationship between price and reviews, and whether they are a super-host (Figure \@ref(fig:priceandreview)).


```r
airbnb_data_selected |>
  ggplot(aes(x = price, y = review_scores_rating, color = host_is_superhost)) +
  geom_point(size = 1, alpha = 0.1) + 
  theme_classic() +
  labs(x = "Price per night",
       y = "Average review score",
       color = "Super host") +
  scale_color_brewer(palette = "Set1")
```

![(\#fig:priceandreview)Relationship between price and review and whether a host is a super host, for Toronto Airbnb rentals in January 2021](13-eda_files/figure-latex/priceandreview-1.pdf) 

One of the aspects that may make someone a super host is how quickly they respond to inquiries. One could imagine that being a superhost involves quickly saying yes or no to inquiries. Let us look at the data. First, we want to look at the possible values of superhost by their response times. 


```r
airbnb_data_selected |> 
  count(host_is_superhost) |>
  mutate(proportion = n / sum(n),
         proportion = round(proportion, digits = 2))
#> # A tibble: 2 x 3
#>   host_is_superhost     n proportion
#>   <lgl>             <int>      <dbl>
#> 1 FALSE              1677       0.58
#> 2 TRUE               1234       0.42
```

Fortunately, it looks like when we removed the reviews rows we removed any NAs from whether they were a super host, but if we go back and look into that we may need to check again. 
We could build a table that looks at a hosts response time by whether they are a superhost using `tabyl()` from `janitor` [@janitor]. It is clear that is a host does not respond within an hour then it is unlikely that they are a super host.


```r
airbnb_data_selected |> 
  tabyl(host_response_time, host_is_superhost) |> 
  adorn_percentages("row") |>
  adorn_pct_formatting(digits = 0) |>
  adorn_ns() |> 
  adorn_title()
#>                     host_is_superhost          
#>  host_response_time             FALSE      TRUE
#>  a few days or more         90% (223) 10%  (26)
#>        within a day         70% (348) 30% (149)
#>  within a few hours         55% (354) 45% (284)
#>      within an hour         49% (752) 51% (775)
```

Finally, we could look at neighborhood. The data provider has attempted to clean the neighborhood variable for us, so will just use that variable for now. Although if we ended up using this variable for our actual analysis we would want to check they had not made any errors.


```r
airbnb_data_selected |> 
  tabyl(neighbourhood_cleansed) |> 
  adorn_totals("row") |> 
  adorn_pct_formatting() |> 
  nrow()
#> [1] 140
```


```r
airbnb_data_selected |> 
  tabyl(neighbourhood_cleansed) |> 
  adorn_pct_formatting() |> 
  arrange(-n) |> 
  filter(n > 100) |> 
  adorn_totals("row") |> 
  head()
#>             neighbourhood_cleansed   n percent
#>  Waterfront Communities-The Island 488   16.8%
#>                            Niagara 129    4.4%
#>                              Annex 102    3.5%
#>                              Total 719       -
```



### Explore multiple relationships with a model

We will now run some models on our dataset. We will cover modeling in more detail in Chapter \@ref(ijalm), but we can use models during EDA to help get a better sense of relationships that may exist between multiple variables in a dataset. For instance, we may like to see whether we can forecast whether someone is a super host, and the factors that go into explaining that. As the dependent variable is binary, this is a good opportunity to use logistic regression. We expect that better reviews will be associated with faster responses and higher reviews. Specifically, the model that we estimate is:

$$\mbox{Prob(Is super host} = 1) = \beta_0 + \beta_1 \mbox{Response time} + \beta_2 \mbox{Reviews} + \epsilon$$

We estimate the model using `glm` in the R language [@citeR].


```r
logistic_reg_superhost_response_review <- glm(host_is_superhost ~ 
                                                host_response_time + 
                                                review_scores_rating,
                                              data = airbnb_data_selected,
                                              family = binomial
                                              )
```

We can have a quick look at the results using `modelsummary()` from `modelsummary` [@citemodelsummary]


```r
library(modelsummary)
modelsummary(logistic_reg_superhost_response_review)
```

\begin{table}
\centering
\begin{tabular}[t]{lc}
\toprule
  & Model 1\\
\midrule
(Intercept) & \num{-18.931}\\
 & (\num{1.273})\\
host\_response\_timewithin a day & \num{1.334}\\
 & (\num{0.235})\\
host\_response\_timewithin a few hours & \num{1.932}\\
 & (\num{0.227})\\
host\_response\_timewithin an hour & \num{2.213}\\
 & (\num{0.219})\\
review\_scores\_rating & \num{0.173}\\
 & (\num{0.013})\\
\midrule
Num.Obs. & \num{2911}\\
AIC & \num{3521.4}\\
BIC & \num{3551.3}\\
Log.Lik. & \num{-1755.698}\\
F & \num{75.649}\\
\bottomrule
\end{tabular}
\end{table}

<!-- We might like to look at what our model predicts, compared with whether the person was actually a super host. We can do that in a variety of ways, but one way is to use `augment` from the `broom` package [@broom]. This will add the prediction and associated uncertainty to the data. For every row we will then have the probability that our model is estimating that they are a superhost. But ultimately, we need a binary forecast. There are a bunch of different options, but one is to just say that if the model estimates a probability of more than 0.5 then we bin it into a superhost, and other not. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- airbnb_data_filtered_logistic_fit_train <-  -->
<!--   augment(logistic_reg_superhost_response_review,  -->
<!--           data = airbnb_train |> select(host_is_superhost,  -->
<!--                                          host_is_superhost_binary, -->
<!--                                          host_response_time, -->
<!--                                          review_scores_rating -->
<!--                                          ), -->
<!--           type.predict = "response") |> # We use the "response" option here so that the function does the work of worrying about the exponential and log odds for us. Our result will be a probability. -->
<!--   select(-.hat, -.sigma, -.cooksd, -.std.resid) |>  -->
<!--   mutate(predict_host_is_superhost = if_else(.fitted > 0.5, 1, 0), # How do things change if we change the 0.5 cutoff? -->
<!--          host_is_superhost_binary = as.factor(host_is_superhost_binary), -->
<!--          predict_host_is_superhost_binary = as.factor(predict_host_is_superhost) -->
<!--          ) -->
<!-- ``` -->

<!-- We can look at how far off the model is. There are a bunch of ways of doing this, but one is to look at what probability the model has given each person. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- airbnb_data_filtered_logistic_fit_train |>  -->
<!--   ggplot(aes(x = .fitted, fill = host_is_superhost_binary)) + -->
<!--   geom_histogram(binwidth = 0.05, position = "dodge") + -->
<!--   theme_classic() + -->
<!--   labs(x = "Estimated probability that host is super host", -->
<!--        y = "Number", -->
<!--        fill = "Host is super host") + -->
<!--   scale_fill_brewer(palette = "Set1") -->
<!-- ``` -->


<!-- We can look at how the model probabilities change based on average review score, and their average time to respond. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- ggplot(airbnb_data_filtered_logistic_fit_train,  -->
<!--        aes(x = review_scores_rating,  -->
<!--            y = .fitted,  -->
<!--            color = host_response_time)) + -->
<!--   geom_line() + -->
<!--   geom_point() + -->
<!--   labs(x = "Average review score", -->
<!--        y = "Predicted probability of being a superhost", -->
<!--        color = "Host response time") + -->
<!--   theme_classic() + -->
<!--   scale_color_brewer(palette = "Set1") -->
<!-- ``` -->

<!-- This nice thing about this graph is that it illustrates nicely the effect of a host having an average response time of, say, 'within an hour' compared with 'within a few hours'.  -->

<!-- We can focus on how the model does in terms of raw classification using `confusionMatrix` from the caret package (Kuhn, 2020). This also gives a bunch of diagnostics (the help file explains what they are). In general, they suggest this isn't the best model that's ever existed. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- caret::confusionMatrix(data = airbnb_data_filtered_logistic_fit_train$predict_host_is_superhost_binary, -->
<!--                        reference = airbnb_data_filtered_logistic_fit_train$host_is_superhost_binary) -->
<!-- ``` -->

<!-- In any case, to this point we've been looking at how the model has done on the training set. It is also relevant how it does on the test set. Again, there are a bunch of ways to do this, but one is to again use the augment function, but to include a newdata argument. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- airbnb_data_filtered_logistic_fit_test <-  -->
<!--   augment(logistic_reg_superhost_response_review,  -->
<!--           data = airbnb_train |> select(host_is_superhost,  -->
<!--                                          host_is_superhost_binary, -->
<!--                                          host_response_time, -->
<!--                                          review_scores_rating -->
<!--                                          ), -->
<!--           newdata = airbnb_test |> select(host_is_superhost,  -->
<!--                                          host_is_superhost_binary, -->
<!--                                          host_response_time, -->
<!--                                          review_scores_rating -->
<!--                                          ), # I'm selecting just because the -->
<!--           # dataset is quite wide, and so this makes it easier to look at. -->
<!--           type.predict = "response") |>  -->
<!--   mutate(predict_host_is_superhost = if_else(.fitted > 0.5, 1, 0),  -->
<!--          host_is_superhost_binary = as.factor(host_is_superhost_binary), -->
<!--          predict_host_is_superhost_binary = as.factor(predict_host_is_superhost) -->
<!--          ) -->
<!-- ``` -->

<!-- We would expect the performance to be slightly worse on the test set. But it is actually fairly similar. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- caret::confusionMatrix(data = airbnb_data_filtered_logistic_fit_test$predict_host_is_superhost_binary, -->
<!--                        reference = airbnb_data_filtered_logistic_fit_test$host_is_superhost_binary) -->
<!-- ``` -->

<!-- We could compare the test with the training sets in terms of forecasts. -->

<!-- ```{r, eval = TRUE, include = TRUE} -->
<!-- training <- airbnb_data_filtered_logistic_fit_train |>  -->
<!--   select(host_is_superhost_binary, .fitted) |>  -->
<!--   mutate(type = "Training set") -->

<!-- test <- airbnb_data_filtered_logistic_fit_test |>  -->
<!--   select(host_is_superhost_binary, .fitted) |>  -->
<!--   mutate(type = "Test set") -->

<!-- both <- rbind(training, test) -->
<!-- rm(training, test) -->

<!-- both |>  -->
<!--   ggplot(aes(x = .fitted,  -->
<!--              fill = host_is_superhost_binary)) + -->
<!--   geom_histogram(binwidth = 0.05, position = "dodge") + -->
<!--   theme_minimal() + -->
<!--   labs(x = "Estimated probability that host is super host", -->
<!--        y = "Number", -->
<!--        fill = "Host is super host") + -->
<!--   scale_fill_brewer(palette = "Set1") + -->
<!--   facet_wrap(vars(type), -->
<!--              nrow = 2, -->
<!--              scales = "free_y") -->
<!-- ``` -->












## Exercises and tutorial


### Exercises


1. In your own words what is exploratory data analysis (this will be difficult, but please write only one nuanced paragraph)?
2. In Tukey's words, what is exploratory data analysis (please write one paragraph)?
3. Who was Tukey (please write a paragraph or two)? 
6. If you have a dataset called 'my_data', which has two columns: 'first_col' and 'second_col', then could you please write some rough R code that would generate a graph (the type of graph does not matter).
7. Consider a dataset that has 500 rows and 3 columns, so there are 1,500 cells. If 100 of the cells are missing data for at least one of the columns, then would you remove the whole row your dataset or try to run your analysis on the data as is, or some other procedure? What if your dataset had 10,000 rows instead, but the same number of missing cells?
8. Please note three ways of identifying unusual values.
9. What is the difference between a categorical and continuous variable?
10. What is the difference between a factor and an integer variable?
11. How can we think about who is systematically excluded from a dataset?
12. Using the `opendatatoronto` package, download the data on mayoral campaign contributions for 2014. (note: the 2014 file you will get from `get_resource`, so just keep the sheet that relates to the Mayor election). 
    1. Clean up the data format (fixing the parsing issue and standardizing the column names using `janitor`)
    2. Summarize the variables in the dataset. Are there missing values, and if so, should we be worried about them? Is every variable in the format it should be? If not, create new variable(s) that are in the right format.
    3. Visually explore the distribution of values of the contributions. What contributions are notable outliers? Do they share a similar characteristic(s)? It may be useful to plot the distribution of contributions without these outliers to get a better sense of the majority of the data. 
    4. List the top five candidates in each of these categories: 1) total contributions; 2) mean contribution; and 3) number of contributions.
    5. Repeat that process, but without contributions from the candidates themselves.
    6. How many contributors gave money to more than one candidate?
13. Name three geoms that produce graphs that have bars on them `ggplot()`.
14. Consider a dataset 10,000 observations and 27 variables. For each observation, there is at least one missing variable. Please discuss, in a paragraph or two, the steps that you would take to understand what is going on.
15. Known missing data, are those that leave holes in your dataset. But what about data that were never collected? Please look at @mcclelland2019lock and @luscombe2020policing. Look into how they gathered their dataset and what it took to put this together. What is in the dataset and why? What is missing and why? How could this affect the results? How might similar biases enter into other datasets that you have used or read about? 



### Tutorial

Redo the Airbnb EDA but for Paris. Please submit a PDF.

