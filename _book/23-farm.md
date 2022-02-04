
# Farm data

**STATUS: Under construction.**




**Required reading**

- @crawford, Chapter 3.
- @statcanhistory, Chapter 10 - Data quality assessment.


**Recommended reading**

- 

**Key concepts/skills/etc**

- 

**Key libraries**

- 

**Key functions/etc**

- 




## Overview

There are a variety of sources of data that have been produced for the purposes of being used as datasets. One thinks here especially of censuses. @whitby [p. 30-31] provides an enthralling overview,  describing how '(t)he earliest censuses suggested in writing come... from China's Yellow River valley' and that they were used for more than just purposes of taxation and conscription. He continues, highlighting the links between the census and Christianity, for instance from the Book of Luke 'In those days Caesar Augustus issued a decree that a census should be taken of the entire Roman world', which led to David and Mary travelling to Bethlehem. 

Taxation was a substantial motivator for censuses. @jones1953census describes how census records survive that 'were probably engraved in the late third or early fourth century A.D., when Diocletian and his colleagues and successors are known to have been active in carrying out censuses to serve as the basis of their new system of taxation'. And detailed records of this sort have been abused. For instance, @luebke1994locating say how '(t)he Nazi regime gathered its information with two relatively conventional tools of modern administration: the national census and police registration'. 

Another source of data deliberately put together to be a dataset include economic conditions such as unemployment, inflation, and GDP. Interestingly, @rockoff2019controversies describes how these economic statistics were not actually developed by the federal government, even though it 'eventually took over the role of producing these statistics on a regular basis.' The broader point is that these types of datasets and censuses are typically put together by governments. They have the powers of the state behind them. 

Another, similarly large and established source of data are from long-running large surveys. These are conducted on a regular basis, and while not usually directly conducted by the government, they are usually funded, one way or another, by the government. For instance, here we often think of electoral surveys, such as the Canadian Election Study, which has run in association with every federal election since 1965, and similarly the British Election Study which has been associated with every general election since 1964. 

Finally, there has been a large push toward open data in government. While the term has become contentious because of how it has occurred in practice, the underlying principle - that the government should make available the data that is has - is undeniable. 

In this chapter we cover these datasets, which I term 'farmed data'. They are typically fairly nicely put together and the work of collecting, preparing and cleaning these datasets has typically been done. They are also, usually, conducted on a set release cycle. For instance, most developed countries release unemployment and inflation dataset on a monthly basis, GDP on a quarterly basis, and a census every five to ten years.

While these datasets have always been useful, they were developed for a time when much analysis was conducted without the use of scripts and programming languages. A cottage industry of R package development has sprung up around making it easier to get these datasets into R. In this chapter we cover a few that are especially useful. 

It is important to recognise that data are not neutral. Thinking clearly about who is included in the dataset, and who is systematically excluded, is critical. As @crawford [p. 121] says: 

> The way data is understood, captured, classified, and named is fundamentally an act of world-making and containment. It has enormous ramifications for the way artificial intelligence works in the world and which communities are most affected. The myth of data collection as a benevolent practice in computer science has obscured its operations of power, protecting those who profit most while avoiding responsibility for its consequences.

## Censuses

MEasuring homelessness?

https://www.ncbi.nlm.nih.gov/books/NBK218229/

"S-Night survey conducted by the US Census Bureau in 1990"

"Street count surveys are used in many cities to count the number of homeless people in the streets at a point in time and gain a better understanding of the needs of homeless populations. In surveys such as the S-Night survey conducted by the US Census Bureau in 1990, enumerators are sent to pre-identified sites to enumerate homeless people while other survey personnel (“plants”) are planted among homeless people and indistinguishable from actual homeless. The ratio of plants seen by the enumerators to the number of plants deployed is used to inform the detection probability of homeless and provide an adjustment to the homeless undercount.  In practice, one cannot know for sure which plants were seen because enumerators cannot distinguish between plants and homeless people. We can only rely on the plants’ judgement of whether (yes, no or maybe) they think they were seen by an enumerator. The presence of “maybes” in the data leads to more unknown parameters than data points, which makes estimation of detection probabilities difficult. We propose to solve this problem by developing a Bayesian hierarchical model that uses hierarchical priors on detection probabilities across survey years and/or across cities. Such hierarchical modeling of the data is challenging because the data is available at various aggregated levels of the population (e.g., `seen` = plant AND seen + homeless AND seen, `maybes` = plant AND seen AND not interviewed AND maybe + plant AND not seen AND maybe.) The new methodology will be applied to a simulated reconstruction of the original S-night survey data and our estimates will be compared to those of the original analysis of the S-night data."

### Canada

The first census in Canada was conducted in 1666. There were 3,215 inhabitants that were counted and the census 'recorded their age, sex, marital status and occupation' [@statcanhistory]. In 1867 a decennial census was required to 'determine representation by population in the new Parliament.' Regular censuses have occurred since then, the most recent in 2021.

In general, data from the Canadian census is not as easily available as in other countries. The 'Individuals File, 2016 Census Public Use Microdata Files (PUMF)' - https://www150.statcan.gc.ca/n1/en/catalogue/98M0001X - is probably the best first step, although it does not provide much detail. It is a 2.7 per cent sample from the 2016 census. It is free, but must be requested, after which Statistics Canada will email access details.

Another way to access data from the Canadian census is to use `cancensus`, which is an R package that provides access to the Canadian census [@citecancensus]. The use of this package requires an API key, which can be requested by creating an account here: https://censusmapper.ca/users/sign_up and then clicking 'edit profile'. The package has a helper function `cancensus::set_api_key("ADD_YOUR_API_KEY_HERE", install = TRUE)` that makes it easier to add the key to your '.Renviron' file. Once that is done you can use the package to access the data.

The main function in the package is `cancensus::get_census()`, and that requires an argument for the census of interest, and a variety of other factors. In this example we will use the 2016 census


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

head(ontario_population)
#> # A tibble: 1 × 9
#>   GeoUID Type  `Region Name` `Area (sq km)` Population Dwellings Households
#>   <chr>  <fct> <fct>                  <dbl>      <dbl>     <dbl>      <dbl>
#> 1 35     PR    Ontario              986722.   13448494   5598391    5169174
#> # … with 2 more variables: C_UID <chr>, v_CA16_1: Age Stats <dbl>
```

The package is fiddly, however it is worthwhile to ensure a reproducible workflow if the data that you are interested in are included. The two helper functions--- `list_census_regions()` and `list_census_vectors()` --- may be useful identify the arguments of interest.


### USA

The requirement for a US Census is included in their constitution, and there is fairly decent, although clunky, general access. However, the US is in an interesting situation where there may actually be better options. For instance, the American Community Survey (ACS) is a survey that is comparable to the questions asked on many censuses that is conducted monthly. By the end of the year, it ends up with millions of responses. Although the ACS is smaller than a census, the advantage is that it is available on a more timely basis.

The best way to access the ACS is to use the Integrated Public Use Microdata Series (IPUMS). You will need to create an account, but it is free and easy to do.

Lol, just use IPUMS.

### Australia


## Other government data

### Unemployment

### Weather

### That Canadian survey that we used in STA304 from the library






## Open Government Data


### Canada

- Canadian Government Open Data: https://open.canada.ca/en/open-data.

- City of Toronto Open Data Portal 




## Electoral Studies

### Canadian Electoral Study

### Australian Electoral Study

### CCES


## Other


- University of Toronto Dataverse: https://dataverse.scholarsportal.info/dataverse/toronto.
- Data is Plural structured archive: https://docs.google.com/spreadsheets/d/1wZhPLMCHKJvwOkP4juclhjFgqIY8fQFMemwKL2c64vk/edit#gid=0.
- Kaggle Datasets: https://www.kaggle.com/datasets.
- Figure Eight: https://www.figure-eight.com/data-for-everyone/.
- Google dataset search: https://datasetsearch.research.google.com/.
- Awesome Data: https://github.com/awesomedata/awesome-public-datasets.





## Exercises and tutorial

### Exercises


1. Please identify three other sources of data that you are interested in and describe where are they available (please include a link or code)? 
2. Please focus on one of those sources. What steps do you have to go through in order to get a dataset that can be analysed in R?
3. Let's say you take a job at RBC (a Canadian bank) and they already have some quantitative data for you to use. What are some questions that you should explore when deciding whether that data will be useful to you?
4. Write three points (you are welcome to use dot points) about why government data may be especially useful?
5. Please pick a government of interest and find their inflation statistics. To what extent do you know about how these data were gathered? 
6. With reference to @chen2019forensic and @martinez2019much to what extent do you think we can trust government statistics? Please mention at least three governments in your answer.
7. The 2021 census in Canada asked, firstly, 'What was this person's sex at birth? Sex refers to sex assigned at birth. Male/Female', and then 'What is this person's gender? Refers to current gender which may be different from sex assigned at birth and may be different from what is indicated on legal documents. Male/Female/Or please specify this person's gender (space for a typed or handwritten answer)'. With reference to @statcan2020, please discuss the extent to which you think this is an appropriate way for census to have proceeded. You are welcome to discuss the case of a different country if you are more familiar with that. 
8. Pretend that we have conducted a survey of everyone in Canada, where we asked for age, sex, and gender. Your friend claims that there is no need to worry about uncertainty 'because we have the whole population'. Is your friend right or wrong, and why?



### Tutorial





### Paper

At about this point, Paper Three (Appendix \@ref(paper-three)) would be appropriate.

