
# Farm data


**Required material**

- Read *Atlas of AI*, Chapter 3 'Data', [@crawford].
- Read *Guide to the Census of Population, 2016*, Chapter 10 'Data quality assessment', [@statcanhistory]. 


**Key concepts and skills**

- Obtain data from censuses and other datasets provided by governments.

**Key libraries**

- `cancensus` [@citecancensus]
- `canlang` [@canlang]
- `tidyverse` [@citetidyverse]

**Key functions**

- `cancensus::get_census()`
- `cancensus::list_census_datasets()`
- `cancensus::list_census_regions()`
- `cancensus::list_census_vectors()`
- `cancensus::set_api_key()`
- `canlang::can_lang`
- `canlang::region_lang`
- `dplyr::left_join()`
- `dplyr::mutate()`
- `dplyr::select()`
- `dplyr::slice_max()`
- `dplyr::slice_min()`
- `readr::read_csv()`




## Introduction

There are a variety of sources of data that have been produced for the purposes of being used as datasets. One thinks here especially of censuses. @whitby [p. 30-31] provides an enthralling overview, describing how the earliest censuses that we have written suggestions of are from China's Yellow River valley, and that they were used for more than just purposes of taxation and conscription. @whitby also highlights the links between censuses and religion, quoting from Book of Luke 'In those days Caesar Augustus issued a decree that a census should be taken of the entire Roman world', which led to David and Mary travelling to Bethlehem. 

Taxation was a substantial motivator for censuses. @jones1953census describes how census records survive that 'were probably engraved in the late third or early fourth century A.D., when Diocletian and his colleagues and successors are known to have been active in carrying out censuses to serve as the basis of their new system of taxation'. And detailed records of this sort have been abused. For instance, @luebke1994locating say how '(t)he Nazi regime gathered its information with two relatively conventional tools of modern administration: the national census and police registration'. 

Another source of data deliberately put together to be a dataset include economic conditions such as unemployment, inflation, and GDP. Interestingly, @rockoff2019controversies describes how these economic statistics were not actually developed by the federal government, even though federal governments typically eventually took over that role. Typically, these sources of data are put together by governments. They have the powers of the state behind them which enables them to be thorough in a way that other datasets cannot be, and similarly bring a specific perspective. 

Another, similarly, large and established source of data are from long-running large surveys. These are conducted on a regular basis, and while not usually directly conducted by the government, they are usually funded, one way or another, by the government. For instance, here we often think of electoral surveys, such as the Canadian Election Study, which has run in association with every federal election since 1965, and similarly the British Election Study which has been associated with every general election since 1964. 

Finally, there has been a large push toward open data in government. While the term has become contentious because of how it has occurred in practice, the underlying principle---that the government should make available the data that is has---is undeniable. 
In this chapter we cover these datasets, which we term 'farmed data'. They are typically fairly nicely put together and the work of collecting, preparing and cleaning these datasets has typically been done. They are also, usually, conducted on a known release cycle. For instance, most developed countries release unemployment and inflation dataset on a monthly basis, GDP on a quarterly basis, and a census every five to ten years.

While these datasets have always been useful, they were developed for a time when much analysis was conducted without the use of scripts and programming languages. A cottage industry of R package development has sprung up around making it easier to get these datasets into R. In this chapter we cover a few that are especially useful. 

It is important to recognize that data are not neutral. Thinking clearly about who is included in the dataset, and who is systematically excluded, is critical. As @crawford [p. 121] says: 

> The way data is understood, captured, classified, and named is fundamentally an act of world-making and containment.... The myth of data collection as a benevolent practice... has obscured its operations of power, protecting those who profit most while avoiding responsibility for its consequences.

## Censuses

### Canada

The first census in Canada was conducted in 1666. There were 3,215 inhabitants that were counted, and the census asked about age, sex, marital status, and occupation [@statcanhistory]. In association with Confederation, in 1867 a decennial census was required so that political representatives could be allocated for the new Parliament. Regular censuses have occurred since then, the most recent in 2021.

We can explore some data on languages spoken in Canada from the 2016 Census using `canlang` [@canlang]. This package is not yet available on CRAN, and so we install it from GitHub, using `devtools` [@citeDevtools]. 


```r
install.packages("devtools")
devtools::install_github("ttimbers/canlang")
```

We will start with the 'can_lang' dataset, which provides the number of Canadians who use that language for 214 languages.


```r
library(tidyverse)
library(canlang)

can_lang
#> # A tibble: 214 × 6
#>    category language mother_tongue most_at_home most_at_work
#>    <chr>    <chr>            <dbl>        <dbl>        <dbl>
#>  1 Aborigi… Aborigi…           590          235           30
#>  2 Non-Off… Afrikaa…         10260         4785           85
#>  3 Non-Off… Afro-As…          1150          445           10
#>  4 Non-Off… Akan (T…         13460         5985           25
#>  5 Non-Off… Albanian         26895        13135          345
#>  6 Aborigi… Algonqu…            45           10            0
#>  7 Aborigi… Algonqu…          1260          370           40
#>  8 Non-Off… America…          2685         3020         1145
#>  9 Non-Off… Amharic          22465        12785          200
#> 10 Non-Off… Arabic          419890       223535         5585
#> # … with 204 more rows, and 1 more variable:
#> #   lang_known <dbl>
```

We can quickly see the top-10 most common languages to have as mother tongue.


```r
can_lang |>
  slice_max(mother_tongue, n = 10) |>
  select(language, mother_tongue)
#> # A tibble: 10 × 2
#>    language                     mother_tongue
#>    <chr>                                <dbl>
#>  1 English                           19460850
#>  2 French                             7166700
#>  3 Mandarin                            592040
#>  4 Cantonese                           565270
#>  5 Punjabi (Panjabi)                   501680
#>  6 Spanish                             458850
#>  7 Tagalog (Pilipino, Filipino)        431385
#>  8 Arabic                              419890
#>  9 German                              384040
#> 10 Italian                             375635
```

We could combine two datasets together 'region_lang' and 'region_data', to see if the five most-common languages differ between the largest region, Toronto, and the smallest, Belleville.


```r
region_lang |>
  left_join(region_data, by = "region") |>
  slice_max(c(population)) |>
  slice_max(mother_tongue, n = 5) |>
  select(region, language, mother_tongue, population) |>
  mutate(prop = mother_tongue / population)
#> # A tibble: 5 × 5
#>   region  language          mother_tongue population   prop
#>   <chr>   <chr>                     <dbl>      <dbl>  <dbl>
#> 1 Toronto English                 3061820    5928040 0.516 
#> 2 Toronto Cantonese                247710    5928040 0.0418
#> 3 Toronto Mandarin                 227085    5928040 0.0383
#> 4 Toronto Punjabi (Panjabi)        171225    5928040 0.0289
#> 5 Toronto Italian                  151415    5928040 0.0255

region_lang |>
  left_join(region_data, by = "region") |>
  slice_min(c(population)) |>
  slice_max(mother_tongue, n = 5) |>
  select(region, language, mother_tongue, population) |>
  mutate(prop = mother_tongue / population)
#> # A tibble: 5 × 5
#>   region     language mother_tongue population    prop
#>   <chr>      <chr>            <dbl>      <dbl>   <dbl>
#> 1 Belleville English          93655     103472 0.905  
#> 2 Belleville French            2675     103472 0.0259 
#> 3 Belleville German             635     103472 0.00614
#> 4 Belleville Dutch              600     103472 0.00580
#> 5 Belleville Spanish            350     103472 0.00338
```

We can see a considerable difference between the proportions, with a little over 50 per cent of those in Toronto having English as their mother tongue, while that is the case for around 90 per cent of those in Belleville.

In general, data from Canadian censuses are not as easily available as in other countries. Statistics Canada, which is the government agency that is responsible for the census and other official statistics freely provides a Individuals File from the 2016 census as a Public Use Microdata File (PUMF), but only in response to a request. And while it is a 2.7 per cent sample from the 2016 census, this PUMF provides limited detail.

Another way to access data from the Canadian census is to use `cancensus` [@citecancensus]. This package can be installed from CRAN. It requires an API key, which can be requested by creating an [account](https://censusmapper.ca/users/sign_up) and then going to 'edit profile'. The package has a helper function `set_api_key("ADD_YOUR_API_KEY_HERE", install = TRUE)` that makes it easier to add the API key to an '.Renviron' file, in the same way that we did in Chapter \@ref(gather-data).

We can use `get_census()` to get census data. We need to specify a census of interest, and a variety of other arguments. For instance, we could get data from the 2016 census about Ontario, which is the largest Canadian province by population.


```r
library(tidyverse)
library(cancensus)

ontario_population <- 
  get_census(dataset = "CA16",
             level = "Regions",
             vectors = "v_CA16_1", 
             regions = list(PR=c('35')
                            )
             )
#> Downloading: 170 B     Downloading: 170 B     Downloading: 170 B     Downloading: 170 B     Downloading: 170 B     Downloading: 170 B

ontario_population
#> # A tibble: 1 × 9
#>   GeoUID Type  `Region Name` `Area (sq km)` Population
#>   <chr>  <fct> <fct>                  <dbl>      <dbl>
#> 1 35     PR    Ontario              986722.   13448494
#> # … with 4 more variables: Dwellings <dbl>,
#> #   Households <dbl>, C_UID <chr>,
#> #   `v_CA16_1: Age Stats` <dbl>
```

Data from the 1996, 2001, 2006, 2011, and 2016 censuses are available, and `list_census_datasets()` provides the metadata that we need to provide to `get_census()` to access these. Data are available based on a variety of regions, and `list_census_regions()` provides the metadata that we need. And finally, `list_census_vectors()` provides the metadata about the variables that available.

<!-- One especially nice aspect is that the package provides access to spatial data that can be mapped. For instance, -->

<!-- ```{r} -->
<!-- library(cancensus) -->
<!-- library(sf) -->
<!-- # retrieve sf dataframe -->
<!-- provincial_populations <-  -->
<!--   get_census( -->
<!--     dataset='CA16',  -->
<!--     level = "PR", -->
<!--     vectors = "v_CA16_1",  -->
<!--     geo_format = 'sf', -->
<!--     regions = list(PR=c("35")) -->
<!--     ) -->

<!-- list_census_regions(dataset = "CA16") -->
<!-- ``` -->






### USA

#### American Community Survey

The requirement for a US Census is included in the US Constitution, and decent, though clunky, access is provided. But the US is in the envious situation where there is usually a better approach than going through the national statistical agency of IPUMS. IPUMS provides access to a wide range of datasets, including international census microdata. In the specific case of the US, the American Community Survey (ACS) is a survey that is comparable to the questions asked on many censuses, but it is that are available on an annual basis, compared with a census which could be quite out-of-date by the time the data are available. It ends up with millions of responses each year. Although the ACS is smaller than a census, the advantage is that it is available on a more timely basis. We will access the ACS through IPUMS.

Go to [IPUMS](https://ipums.org), then 'IPUMS USA', and select 'get data' (Figure \@ref(fig:ipumsone)).

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/ipums_one.png" alt="The IPUMS homepage, with IPUMS USA shown in the top left box" width="85%" />
<p class="caption">(\#fig:ipumsone)The IPUMS homepage, with IPUMS USA shown in the top left box</p>
</div>

We are interested in a sample, so go to 'SELECT SAMPLE', and un-select 'Default sample from each year' and instead select '2019 ACS' and then 'SUBMIT SAMPLE SELECTIONS' (Figure \@ref(fig:ipumstwo)).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/ipums_two.png" alt="Selecting a sample from IPUMS USA and specifying interest in the 2019 ACS" width="45%" /><img src="/Users/rohanalexander/Documents/book/figures/ipums_three.png" alt="Selecting a sample from IPUMS USA and specifying interest in the 2019 ACS" width="45%" />
<p class="caption">(\#fig:ipumstwo)Selecting a sample from IPUMS USA and specifying interest in the 2019 ACS</p>
</div>

We might be interested in data based on state. So we would begin by looking at 'HOUSEHOLD' variables and selecting 'GEOGRAPHIC' (Figure \@ref(fig:ipumsfour)).

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/ipums_four.png" alt="Specifying that we are interested in the state" width="85%" />
<p class="caption">(\#fig:ipumsfour)Specifying that we are interested in the state</p>
</div>

We add 'STATEICP' to our 'cart' by clicking the plus, which will then turn into a tick (Figure \@ref(fig:ipumssix)).

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/ipums_six.png" alt="Adding STATEICP to our cart" width="85%" />
<p class="caption">(\#fig:ipumssix)Adding STATEICP to our cart</p>
</div>

We might then be interested in data on a 'PERSON' basis, for instance, 'DEMOGRAPHIC' variables such as 'AGE', which we should add to our cart. Still on a 'PERSON' basis, we might be interested in 'INCOME', for instance, 'Total personal income' 'INCTOT' and we could add that to our cart (Figure \@ref(fig:ipumsseven)).

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/ipums_seven.png" alt="Adding additional demographic variables that are available on an individual basis" width="85%" />
<p class="caption">(\#fig:ipumsseven)Adding additional demographic variables that are available on an individual basis</p>
</div>

When we are done, we can 'VIEW CART', and then 'CREATE DATA EXTRACT' (Figure \@ref(fig:ipumseight)). At this point there are two aspects that we likely want to change:

1. Change the 'DATA FORMAT' from dat to csv (Figure \@ref(fig:ipumsnine)).
2. Customize the sample size as we likely do not need three million responses, and could just change it to, say, 500,000 (Figure \@ref(fig:ipumsten)).

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/ipums_eight.png" alt="Beginning the checkout process" width="85%" />
<p class="caption">(\#fig:ipumseight)Beginning the checkout process</p>
</div>

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/ipums_nine.png" alt="Specifying that we are interested in CSV files" width="85%" />
<p class="caption">(\#fig:ipumsnine)Specifying that we are interested in CSV files</p>
</div>

<div class="figure" style="text-align: center">
<img src="/Users/rohanalexander/Documents/book/figures/ipums_ten.png" alt="Reducing the sample size from three million responses to half a million" width="85%" />
<p class="caption">(\#fig:ipumsten)Reducing the sample size from three million responses to half a million</p>
</div>

Finally, we want to include a descriptive name for the extract, for instance, '2022-02-06: Income based on state and age', which specifies the date we made the extract and what is in the extract. After that we can 'SUBMIT EXTRACT'.

We will be asked to log in or create an account, and after doing that will be able to submit the request. IPUMS will email when the extract is available, after which we can download it and read it into R in the usual way. It is critical that we cite this dataset when we use it [@ipumsusa].


```r
library(tidyverse)
ipums_extract <- read_csv("usa_00010.csv")

ipums_extract
```


```
#> # A tibble: 6 × 4
#>    YEAR STATEICP   AGE INCTOT
#>   <dbl>    <dbl> <dbl>  <dbl>
#> 1  2019       41    39   9000
#> 2  2019       41    35   9300
#> 3  2019       41    39  60000
#> 4  2019       41    32  14400
#> 5  2019       41    21      0
#> 6  2019       41    61  11100
```

Incredibly, full count, that is the entire census, data are available through IPUMS for the US censuses conducted on: 1850, 1860, 1870, 1880, 1900, 1910, 1920, 1930, and 1940. Most of the 1890 census records were destroyed due to a fire in 1921. 1 per cent samples are available for these years, and through to 1990. And then ACS data are available from 2000.




<!-- Measuring homelessness? -->

<!-- https://www.ncbi.nlm.nih.gov/books/NBK218229/ -->

<!-- "S-Night survey conducted by the US Census Bureau in 1990" -->

<!-- "Street count surveys are used in many cities to count the number of homeless people in the streets at a point in time and gain a better understanding of the needs of homeless populations. In surveys such as the S-Night survey conducted by the US Census Bureau in 1990, enumerators are sent to pre-identified sites to enumerate homeless people while other survey personnel (“plants”) are planted among homeless people and indistinguishable from actual homeless. The ratio of plants seen by the enumerators to the number of plants deployed is used to inform the detection probability of homeless and provide an adjustment to the homeless undercount.  In practice, one cannot know for sure which plants were seen because enumerators cannot distinguish between plants and homeless people. We can only rely on the plants’ judgement of whether (yes, no or maybe) they think they were seen by an enumerator. The presence of “maybes” in the data leads to more unknown parameters than data points, which makes estimation of detection probabilities difficult. We propose to solve this problem by developing a Bayesian hierarchical model that uses hierarchical priors on detection probabilities across survey years and/or across cities. Such hierarchical modeling of the data is challenging because the data is available at various aggregated levels of the population (e.g., `seen` = plant AND seen + homeless AND seen, `maybes` = plant AND seen AND not interviewed AND maybe + plant AND not seen AND maybe.) The new methodology will be applied to a simulated reconstruction of the original S-night survey data and our estimates will be compared to those of the original analysis of the S-night data." -->


<!-- ### Australia -->


<!-- ## Other government data -->

<!-- ### Unemployment -->

<!-- ### Weather -->

<!-- ### General Social Survey -->






<!-- ## Open Government Data -->


<!-- ### Canada -->

<!-- - Canadian Government Open Data: https://open.canada.ca/en/open-data. -->

<!-- - City of Toronto Open Data Portal  -->




<!-- ## Electoral Studies -->

<!-- ### Canadian Electoral Study -->

<!-- cesR -->

<!-- ### Australian Electoral Study -->

<!-- ### CCES -->





## Exercises and tutorial

### Exercises


1. Please identify three other sources of data that you are interested in and describe where are they available (please include a link or code)? 
2. Please focus on one of those sources. What steps do you have to go through in order to get a dataset that can be analyzed in R?
3. Let's say you take a job at RBC (a Canadian bank) and they already have some quantitative data for you to use. What are some questions that you should explore when deciding whether that data will be useful to you?
4. Write three points (you are welcome to use dot points) about why government data may be especially useful?
5. Please pick a government of interest and find their inflation statistics. To what extent do you know about how these data were gathered? 
6. With reference to @chen2019forensic and @martinez2019much to what extent do you think we can trust government statistics? Please mention at least three governments in your answer.
7. The 2021 census in Canada asked, firstly, 'What was this person's sex at birth? Sex refers to sex assigned at birth. Male/Female', and then 'What is this person's gender? Refers to current gender which may be different from sex assigned at birth and may be different from what is indicated on legal documents. Male/Female/Or please specify this person's gender (space for a typed or handwritten answer)'. With reference to @statcan2020, please discuss the extent to which you think this is an appropriate way for census to have proceeded. You are welcome to discuss the case of a different country if you are more familiar with that. 
8. Pretend that we have conducted a survey of everyone in Canada, where we asked for age, sex, and gender. Your friend claims that there is no need to worry about uncertainty 'because we have the whole population'. Is your friend right or wrong, and why?



### Tutorial

Use IPUMS to access the ACS. Download some data that are of interest and write a two-to-three page paper analyzing it.



### Paper

At about this point, Paper Three (Appendix \@ref(paper-three)) would be appropriate.

