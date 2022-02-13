
# Storing and retrieving data

**Required material**

- Read *Datasheets for datasets*, [@gebru2021datasheets].
- Read *Data and its (dis)contents: A survey of dataset development and use in machine learning research*, [@Paullada2021].

**Key concepts and skills**

- FAIR principles for data sharing and management.
- Sharing data using GitHub
- Creating R data packages
- Depositing data
- Data documentation and especially datasheets for datasets

<!-- **Key libraries** -->

<!-- -  -->

<!-- **Key functions** -->

<!-- -  -->


## Introduction

After we have put together a dataset, an important part of being responsible is storing it appropriately and enabling easy retrieval. While it is certainly possible to be especially concerned about this, and entire careers are based on the storage and retrieval of data, to a certain extent, the baseline is not onerous. If we can get our dataset off our own computer, then we are much of the way there. Further confirming that someone else can retrieve it and use it, puts us much further than most.

That said, the FAIR principles are useful when we come to think more formally about data sharing and management. These are [@wilkinson2016fair]:

1. Findable. There is one, unchanging, identifier for the dataset and the dataset has high-quality descriptions and explanations.
2. Accessible. Standardized approaches can be used to retrieve the data, and these are open and free, possibly with authentication, and that the metadata persists even if the dataset is removed.
3. Interoperable. The dataset and its metadata use a broadly applicable language, and vocabulary.
4. Reusable. There is plenty of description of the dataset and the usage conditions are made clear along with provenance.

It is important to recognize that just because a dataset is FAIR, it is not necessarily an unbiased representation of the world. FAIR reflects whether a dataset is appropriately available, not whether it is appropriate.

In this chapter we will consider how we plan and organize our datasets to meet essential requirements. To a large extent we put these in place to make our own life easier when we come back to use our dataset later. We then go through putting our dataset on GitHub, building R packages for data, and finally depositing it in various archives. Finally, we documentation, and in particular focus on datasheets.


## Plan

The storage and retrieval of information has a long history. This is especially connected with libraries which have existed since antiquity and have established protocols for deciding what information to store and what to discard, as well as its retrieval. One of the defining aspects of libraries is that deliberate curation and organization. The cataloging system ensures that books on similar topics are located close to each other, and there are typically also deliberate plans for ensuring the collection is up-to-date.

Vannevar Bush defines a 'memex' in 1945 as a device used to store books, records and communications, in a way that supplements memory [@vannevarbush]. And the key is the indexing, or linking together of items. We can see this concept echoed in Tim Berners-Lee proposal for hypertext [@berners1989information], which led to the World Wide Web. This is the way that resources are identified. They are then transported over the Internet, using HTTP.

At its most fundamental, this is about storing and retrieving data. For instance, we make various files on our computer available to others. The internet is famously brittle, but when we are considering the storage and retrieval of our datasets we want to consider especially, for how long it is important that the data are stored and for whom [@michener2015ten]. For instance, if we want some data to be available for a decade and widely available then it becomes important to store data in open and persistent formats, such as CSVs [@hart2016ten]. But if we are just using some data as part of an intermediate step, we have the raw data, and the scripts to create it, then it might be fine to not worry too much about such considerations.

Storing raw data is important and there are many cases where raw data have revealed or hinted at fraud [@simonsohn2013just]. Shared data also enhances the credibility of our work, by enabling others to verify it, and can lead to the generation of new knowledge as others use it to answer different questions [@christensen2019transparent]. Finally, research that shares its data may be more highly cited [@christensen2019study].




## GitHub

The easiest place to store our datasets will be GitHub because that is already built into our workflow. For instance, when we push, our dataset becomes available. One great benefit of this is that, if we have set-up our workspace appropriately, then we likely store our raw data, and the tidy data, as well as the scripts that are needed to transform one to the other. 

As an example of how we have stored some data, we can access the 'raw_data.csv' file from the 'starter_folder'. To get the file that we pass to `read_csv()` we navigate to the file in GitHub, and then click 'Raw'.


```r
library(tidyverse)

starter_data <- read_csv("https://raw.githubusercontent.com/RohanAlexander/starter_folder/main/inputs/data/raw_data.csv")

starter_data
#> # A tibble: 1 × 3
#>   first_col second_col third_col
#>   <chr>     <chr>      <chr>    
#> 1 some      raw        data
```

One issue with this is that the dataset does not have much documentation. While we can store and retrieve the dataset easily in this way, it lacks much explanation, a formal dictionary, and aspects such as a license that would bring our dataset closer to aligning with the FAIR principles.




## R Packages for data

To this point we have largely used R packages for their code, although we have seen a few that were focused on sharing data, for instance, @troopdata. We can build an R Package for our dataset and then add it to GitHub. This will make it easy to store and retrieve because we can obtain the dataset by loading the package. This will be the first R package that we build. In Chapter \@ref(deploying-models), will return to R packages and use them to deploy models.

To get started, create a new package ('File' -> 'New project' -> 'New Directory' -> 'R Package'). Give the package a name, such as 'favcolordata' and select 'Open in new session'. Create a new folder called 'data'. We will simulate a dataset that we will include.


```r
library(tidyverse)

set.seed(853)

color_data <-
    tibble(
        name =
            c("Edward",
              "Helen",
              "Hugo",
              "Ian",
              "Monica",
              "Myles",
              "Patricia",
              "Roger",
              "Rohan",
              "Ruth"
            ),
        fav_color =
            sample(
                x = c("Black", "White", "Rainbow"),
                size = 10,
                replace = TRUE
            )
    )
```

To this point we have largely been trying to use CSV files for our datasets. To include our data in this R package, we will save our dataset in a particular format, 'rda', using `save()`.


```r
save(color_data, file="data/color_data.rda")
```

Then create an R file 'data.R' in the 'R' folder. This R file will only contain documentation using `roxygen2` comments, which start with `#'`, and we follow the documentation for `troopdata` closely.


```r
#' Favorite color of various people data
#'
#' @description \code{favcolordata} returns a dataframe of the favorite color of various people.
#' 
#' @return Returns a dataframe of the favorite color of various people.
#' 
#' @docType data
#'
#' @usage data(color_data)
#'
#' @format An dataframe of individual-level observations with the following variables: 
#'
#' \describe{
#' \item{\code{name}}{A character vector of individual names.}
#' \item{\code{fav_color}}{A character vector of one of: black, white, rainbow.}
#' }
#'
#' @keywords datasets
#'
#' @source \url{https://www.tellingstorieswithdata.com/storing-and-retrieving-data.html}
#'
"color_data"

```

Finally, we should add a README which provides a summary of all of this for someone coming to the project from the outside.

At this we can go to the 'Build' tab and then 'Install and Restart'. After this happens, the package 'favcolordata', is loaded and the data can be accessed using 'color_data'. If we were to push this to GitHub, then anyone would be able to install the package using `devtools` [@citeDevtools] and then use our dataset.


```r
devtools::install_github("RohanAlexander/favcolordata")

library(favcolordata)

color_data
```

This has addressed many of the issues that we faced earlier. For instance, we have included a README and a data dictionary of sorts in terms of the descriptions that we added. But if we were to try to put this package onto CRAN, then we might face some issues. For instance, the maximum size of a package is 5MB and we would quickly come up against that. We have also largely forced users to use R, and while there are considerable benefits of that, we may like to be more language agnostic [@tierney2020realistic].


## Depositing data

While it is possible that a dataset will be cited if it is available through GitHub or an R package, this becomes more likely if the dataset is deposited somewhere. There are a number of reasons for this, but one is that it seems a bit more formal. Zenodo and Open Science Framework (OSF) are two that are commonly used. For instance, @chris_carleton_2021_4550688 use Zenodo to share the dataset and analysis supporting @carleton2021reassessment. Similarly @geuenich_michael_2021_5156049 use Zenodo to share the dataset that underpins @geuenich2021automated.
<!-- And Y use OSF to share all files. -->

Another option is a dataverse, such as the Harvard Dataverse, which is a common requirement for journal publications. One nice aspect of this is that we can use `dataverse` [@dataverse] to retrieve the dataset as part of a reproducible workflow.


## Documentation

Datasheets [@gebru2021datasheets] are an increasingly critical aspect of data science. Datasheets are basically nutrition labels for datasets. The process of creating them enables us to think more carefully about what we will feed our model. More importantly, they enable others to better understand what we fed our model. One important task is going back and putting together datasheets for datasets that are widely used. For instance, researchers went back and wrote a datasheet for one of the most popular datasets in computer science, and they found that around 30 per cent of the data were duplicated [@bandy2021addressing].

Instead of telling us how unhealthy various foods are, a datasheet tells us things like:

- Who put the dataset together?
- Who paid for the dataset to be created?
- How complete is the dataset?
- What fields are present, and equally not present, for particular observations?

Sometimes we have done a lot of work to create a dataset. In that case, we may like to publish and share it on its own, for instance @biderman2022datasheet and @bandy2021addressing. But typically a datasheet might live in an appendix to the paper, or be included in a file adjacent to the dataset.

We will put together a datasheet for the dataset that underpins @citeaustralianpoliticians. The text of the questions directly comes from @gebru2021datasheets. When we create datasheets for a dataset, especially a dataset that we did not put together ourselves, it is possible that the answer to some questions will simply be "Unknown".

**Motivation**

1. *For what purpose was the dataset created? Was there a specific task in mind? Was there a specific gap that needed to be filled? Please provide a description.*
    - The dataset was created to enable analysis of Australian politicians. We were unable to find a publicly available dataset in a structured format that had the biographical and political information on Australian politicians that was needed for modelling.
2. *Who created the dataset (for example, which team, research group) and on behalf of which entity (for example, company, institution, organization)?*
    - Rohan Alexander, while working at the Australian National University and the University of Toronto
3. *Who funded the creation of the dataset? If there is an associated grant, please provide the name of the grantor and the grant name and number.*
    - No direct funding was received for this project, but Rohan received a salary from University of Toronto.
4. *Any other comments?*
    - No.

**Composition**

1. *What do the instances that comprise the dataset represent (for example, documents, photos, people, countries)? Are there multiple types of instances (for example, movies, users, and ratings; people and interactions between them; nodes and edges)? Please provide a description.*
	- Each row of the main dataset is an individual, and these then link to other datasets where each row refers to various information about that person.
2. *How many instances are there in total (of each type, if appropriate)?*
	- A little more than 1700.
3. *Does the dataset contain all possible instances or is it a sample (not necessarily random) of instances from a larger set? If the dataset is a sample, then what is the larger set? Is the sample representative of the larger set (for example, geographic coverage)? If so, please describe how this representativeness was validated/verified. If it is not representative of the larger set, please describe why not (for example, to cover a more diverse range of instances, because instances were withheld or unavailable).*
	- All individuals elected or appointed to the Australian Federal Parliament are in the dataset.
4. *What data does each instance consist of? "Raw" data (for example, unprocessed text or images) or features? In either case, please provide a description.*
	- Each instance consists of biographical information such as birthdate, or political information, such as political party membership.
5. *Is there a label or target associated with each instance? If so, please provide a description.*
	- Yes there is a unique key comprising the surname and year of birth, with a few individuals needing additional demarcation.
6. *Is any information missing from individual instances? If so, please provide a description, explaining why this information is missing (for example, because it was unavailable). This does not include intentionally removed information, but might include, for example, redacted text.*
	- Birthdate is not available in all cases, especially earlier in the dataset.
7. *Are relationships between individual instances made explicit (for example, users' movie ratings, social network links)? If so, please describe how these relationships are made explicit.*
	- Yes, through the uniqueID.
8. *Are there recommended data splits (for example, training, development/validation, testing)? If so, please provide a description of these splits, explaining the rationale behind them.*
	- No.
9. *Are there any errors, sources of noise, or redundancies in the dataset? If so, please provide a description.*
	- There is some uncertainty about cabinet and ministries. For instance, different sources differ. There is also a little bit of uncertainty about birthdates.
10. *Is the dataset self-contained, or does it link to or otherwise rely on external resources (for example, websites, tweets, other datasets)? If it links to or relies on external resources, a) are there guarantees that they will exist, and remain constant, over time; b) are there official archival versions of the complete dataset (that is, including the external resources as they existed at the time the dataset was created); c) are there any restrictions (for example, licenses, fees) associated with any of the external resources that might apply to a dataset consumer? Please provide descriptions of all external resources and any restrictions associated with them, as well as links or other access points, as appropriate.*
	- Self-contained.
11. *Does the dataset contain data that might be considered confidential (for example, data that is protected by legal privilege or by doctor-patient confidentiality, data that includes the content of individuals' non-public communications)? If so, please provide a description.*
	- No, all data were gathered from public sources.
12. *Does the dataset contain data that, if viewed directly, might be offensive, insulting, threatening, or might otherwise cause anxiety? If so, please describe why.*
	- No.
13. *Does the dataset identify any sub-populations (for example, by age, gender)? If so, please describe how these subpopulations are identified and provide a description of their respective distributions within the dataset.*
	- Yes, age and gender.
14. *Is it possible to identify individuals (that is, one or more natural persons), either directly or indirectly (that is, in combination with other data) from the dataset? If so, please describe how.*
	- Yes, individuals are identified by name.
15. *Does the dataset contain data that might be considered sensitive in any way (for example, data that reveals race or ethnic origins, sexual orientations, religious beliefs, political opinions or union memberships, or locations; financial or health data; biometric or genetic data; forms of government identification, such as social security numbers; criminal history)? If so, please provide a description.*
	- The dataset contains sensitive information, such as political membership, however this is all public knowledge as they are federal politicians.
16. *Any other comments?*
	- No.

**Collection process**

1. *How was the data associated with each instance acquired? Was the data directly observable (for example, raw text, movie ratings), reported by subjects (for example, survey responses), or indirectly inferred/derived from other data (for example, part-of-speech tags, model-based guesses for age or language)? If the data was reported by subjects or indirectly inferred/derived from other data, was the data validated/verified? If so, please describe how.*
	- The data were gathered from the Australian Parliamentary Handbook in the first instance, and this was augmented with information from other parliaments, especially Victoria and New South Wales, and Wikipedia.
2. *What mechanisms or procedures were used to collect the data (for example, hardware apparatuses or sensors, manual human curation, software programs, software APIs)? How were these mechanisms or procedures validated?*
	- Scraping and parsing using R.
3. *If the dataset is a sample from a larger set, what was the sampling strategy (for example, deterministic, probabilistic with specific sampling probabilities)?*
	- The dataset is not a sample.
4. *Who was involved in the data collection process (for example, students, crowdworkers, contractors) and how were they compensated (for example, how much were crowdworkers paid)?*
	- Rohan Alexander. Paid as a post-doc and an assistant professor, although this was not tied to this specific project.
5. *Over what timeframe was the data collected? Does this timeframe match the creation timeframe of the data associated with the instances (for example, recent crawl of old news articles)? If not, please describe the timeframe in which the data associated with the instances was created.*
	- Three years, and then updated from time to time.
6. *Were any ethical review processes conducted (for example, by an institutional review board)? If so, please provide a description of these review processes, including the outcomes, as well as a link or other access point to any supporting documentation.*
	- No.
7. *Did you collect the data from the individuals in question directly, or obtain it via third parties or other sources (for example, websites)?*
	- Third parties in almost all cases.
8. *Were the individuals in question notified about the data collection? If so, please describe (or show with screenshots or other information) how notice was provided, and provide a link or other access point to, or otherwise reproduce, the exact language of the notification itself.*
	- No.
9. *Did the individuals in question consent to the collection and use of their data? If so, please describe (or show with screenshots or other information) how consent was requested and provided, and provide a link or other access point to, or otherwise reproduce, the exact language to which the individuals consented.*
	- No.
10. *If consent was obtained, were the consenting individuals provided with a mechanism to revoke their consent in the future or for certain uses? If so, please provide a description, as well as a link or other access point to the mechanism (if appropriate).*
	- Consent was not obtained.
11. *Has an analysis of the potential impact of the dataset and its use on data subjects (for example, a data protection impact analysis) been conducted? If so, please provide a description of this analysis, including the outcomes, as well as a link or other access point to any supporting documentation.*
	- No.
12. *Any other comments?*
	- No.

**Preprocessing/cleaning/labeling**

1. *Was any preprocessing/cleaning/labeling of the data done (for example, discretization or bucketing, tokenization, part-of-speech tagging, SIFT feature extraction, removal of instances, processing of missing values)? If so, please provide a description. If not, you may skip the remaining questions in this section.*
	- Yes cleaning of the data was done.
2. *Was the "raw" data saved in addition to the preprocessed/cleaned/labeled data (for example, to support unanticipated future uses)? If so, please provide a link or other access point to the "raw" data.*
	- In general, no. The scripts that got the data from the parliamentary handbook to CSV are not available. There are scripts that go through Wikipedia and check things and these are available.
3. *Is the software that was used to preprocess/clean/label the data available? If so, please provide a link or other access point.*
	- R was used.
4. *Any other comments?*
	- No

**Uses**

1. *Has the dataset been used for any tasks already? If so, please provide a description.*
	- Yes, a few papers about Australian politics, for instance, https://arxiv.org/abs/2111.09299.
2. *Is there a repository that links to any or all papers or systems that use the dataset? If so, please provide a link or other access point.*
	- No
3. *What (other) tasks could the dataset be used for?*
	- Linking with elections would be interesting.
4. *Is there anything about the composition of the dataset or the way it was collected and preprocessed/cleaned/labeled that might impact future uses? For example, is there anything that a dataset consumer might need to know to avoid uses that could result in unfair treatment of individuals or groups (for example, stereotyping, quality of service issues) or other risks or harms (for example, legal risks, financial harms)? If so, please provide a description. Is there anything a dataset consumer could do to mitigate these risks or harms?*
	- No.
5. *Are there tasks for which the dataset should not be used? If so, please provide a description.*
	- No.
6. *Any other comments?*
	- No.

**Distribution**

1. *Will the dataset be distributed to third parties outside of the entity (for example, company, institution, organization) on behalf of which the dataset was created? If so, please provide a description.*
	- The dataset is available through GitHub.
2. *How will the dataset be distributed (for example, tarball on website, API, GitHub)? Does the dataset have a digital object identifier (DOI)?*
	- GitHub for now, and eventually a deposit.
3. *When will the dataset be distributed?*
	- The dataset is available now.
4. *Will the dataset be distributed under a copyright or other intellectual property (IP) license, and/or under applicable terms of use (ToU)? If so, please describe this license and/ or ToU, and provide a link or other access point to, or otherwise reproduce, any relevant licensing terms or ToU, as well as any fees associated with these restrictions.*
	- No. MIT license.
5. *Have any third parties imposed IP-based or other restrictions on the data associated with the instances? If so, please describe these restrictions, and provide a link or other access point to, or otherwise reproduce, any relevant licensing terms, as well as any fees associated with these restrictions.*
	- None that are known.
6. *Do any export controls or other regulatory restrictions apply to the dataset or to individual instances? If so, please describe these restrictions, and provide a link or other access point to, or otherwise reproduce, any supporting documentation.*
	- None that are known.
7. *Any other comments?*
	- No.

**Maintenance**

1. *Who will be supporting/hosting/maintaining the dataset?*
	- Rohan Alexander
2. *How can the owner/curator/manager of the dataset be contacted (for example, email address)?*
	- rohan.alexander@utoronto
3. *Is there an erratum? If so, please provide a link or other access point.*
	- No, the dataset is just updated.
4. *Will the dataset be updated (for example, to correct labeling errors, add new instances, delete instances)? If so, please describe how often, by whom, and how updates will be communicated to dataset consumers (for example, mailing list, GitHub)?*
	- Yes, roughly quarterly.
5. *If the dataset relates to people, are there applicable limits on the retention of the data associated with the instances (for example, were the individuals in question told that their data would be retained for a fixed period of time and then deleted)? If so, please describe these limits and explain how they will be enforced.*
	- No.
6. *Will older versions of the dataset continue to be supported/hosted/maintained? If so, please describe how. If not, please describe how its obsolescence will be communicated to dataset consumers.*
	- No the dataset is just updated. Although a history is available through GitHub.
7. *If others want to extend/augment/build on/contribute to the dataset, is there a mechanism for them to do so? If so, please provide a description. Will these contributions be validated/verified? If so, please describe how. If not, why not? Is there a process for communicating/distributing these contributions to dataset consumers? If so, please provide a description.*
	- Pull request on GitHub.
8. *Any other comments?*
	- No




## Exercises and tutorial


### Exercises

1. According to @gebru2021datasheets, a datasheet should document a dataset's (please select all that apply):
    a. composition.
    b. recommended uses.
    c. motivation.
    d. collection process.
2. Following @wilkinson2016fair, which of the following are FAIR principles (please select all that apply)?
    a. Findable.
    b. Approachable.
    c. Interoperable.
    d. Reusable.
    e. Integrated.
    f. Fungible.
    g. Reduced.
    h. Accessible.
3. Please create an R package for a simulated dataset, push it to GitHub, and submit the link.


### Tutorial

Please identify an important dataset that does not have a datasheet [@gebru2021datasheets]. As a reminder, datasheets accompany datasets and document 'motivation, composition, collection process, recommended uses,' among other aspects. Please put together a datasheet for this dataset. You are welcome to use the template [here](https://github.com/RohanAlexander/starter_folder/blob/main/inputs/data/datasheet_template.Rmd) as a starting point. The datasheet should be completely contained in its own GitHub repository. Please submit a PDF.




<!-- Look into how IQ tests are conducted and what goes into them. To what extent do you think they measure intelligence? Some aspects that you may like to think about in answering that question include: Who decides what is intelligence? How is this updated? What is missing from that definition? To what extent is this generalisable? You should write a page or two. -->








<!-- The purpose of this tutorial is to ensure that it is clear in your mind how thoroughly you should know your dataset. It builds on the 'memory palace' technique used by professional memorisers, as described by @moonwalkingwitheinstein. -->

<!-- Please think about your childhood home, or another building that you know intimately. Imagine yourself standing at the front of it. Describe what it looks like. Then 'walk' into the front and throughout the house, again describing each aspect in as much detail as you can imagine. What are each of the rooms used for and what are their distinguishing features? How does it smell? What does this all evoke in you? Please write a page or two.  -->

<!-- Now think about a dataset that you are interested in. Please do this same exercise, but for the dataset. -->


