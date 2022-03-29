
# Gather data



**Required material**

- Read *Turning History into Data: Data Collection, Measurement, and Inference in HPE*, [@cirone].
- Read *Two Regimes of Prison Data Collection*, [@Johnson2021Two].



<!-- - Cardoso, Tom, 2019, 'Introduction to scraping', https://github.com/tomcardoso/intro-to-scraping. -->
<!-- - Clavelle, Tyler, 2017, 'Using R to extract data from web APIs', 5 June, https://www.tylerclavelle.com/code/2017/randapis/. -->
<!-- - Cooksey, Brian, 2014, 'An Introduction to APIs', Zapier, 22 April, https://zapier.com/learn/apis/. -->
<!-- - Dogucu, Mine, and Mine Çetinkaya-Runde, 2020 ,'Web Scraping in the Statistics and Data Science Curriculum: Challenges and Opportunities', 6 May. -->
<!-- - Gelfand, Sharla, 2019, 'Crying @ Sephora', 8 November, https://sharla.party/post/crying-sephora/. -->
<!-- - Goldman, Shayna, 2019, 'How Much Do NHL Players Really Make? Part 2: Taxes', https://hockey-graphs.com/2019/01/08/how-much-do-nhl-players-really-make-part-2-taxes/. -->
<!-- - Graham, Shawn, 2019, 'Scraping with rvest', 7 November, https://electricarchaeology.ca/2019/11/07/scraping-with-rvest/. -->
<!-- - Henze, Martin, 2020, 'Web Scraping with rvest + Astro Throwback', 23 January, https://heads0rtai1s.github.io/2020/01/23/rvest-intro-astro/. -->
<!-- - Hudon, Caitlin, 2017, ''Blue Christmas: A data-driven search for the most depressing Christmas song', 22 December, https://caitlinhudon.com/2017/12/22/blue-christmas/. -->
<!-- - Luscombe, Alex, 2020, 'A Gentle Introduction to Tesseract OCR', 3 June, https://alexluscombe.ca/post/ocr-tutorial/. -->
<!-- - Luscombe, Alex, 2020, 'Getting your .pdfs into R', 5 August, https://alexluscombe.ca/post/r-pdftools/. -->
<!-- - Luscombe, Alex, 2020, 'Parsing your .pdfs in R', 10 August, https://alexluscombe.ca/post/parsing-pdfs/. -->
<!-- - Marshall, James, 'HTML Made Really Easy', https://www.jmarshall.com/easy/html/. -->
<!-- - Marshall, James, 'HTTP Made Really Easy', https://www.jmarshall.com/easy/http/. -->
<!-- - Nakagawara, Ryo, 2020, 'Intro to {polite} Web Scraping of Soccer Data with R!', 14 May, https://ryo-n7.github.io/2020-05-14-webscrape-soccer-data-with-R/. -->
<!-- - Pavlik, Kaylin, 2020, 'How do fiber types appear together in yarn blends?', 17 February, https://www.kaylinpavlik.com/ravelry-yarn-fibers/. -->
<!-- - Silge, Julia and David Robinson, 2020, *Text Mining with R*, Chapters 1, 3, and 6, https://www.tidytextmining.com/. -->
<!-- - Silge, Julia, 2017, 'Scraping CRAN with rvest', 5 March, https://juliasilge.com/blog/scraping-cran/. -->
<!-- - Wickham, Hadley, 'Managing Secrets', https://cran.r-project.org/web/packages/httr/vignettes/secrets.html. -->
<!-- - Wickham, Hadley, 2014, 'rvest: easy web scraping with R', 24 November, https://blog.rstudio.com/2014/11/24/rvest-easy-web-scraping-with-r/. -->
<!-- - Wickham, Hadley, nd, 'Getting started with httr', https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html. -->


<!-- - D'Agostino McGowan, Lucy, 2020 'Harnessing the Power of the Web via R Clients for Web APIs', talk at ASA Joint Statistical Meeting 2018, https://www.lucymcgowan.com/talk/asa_joint_statistical_meeting_2018/. -->
<!-- - Tatman, Rachel, 2018, 'Character Encoding and You', 21 February, https://youtu.be/2U9EHYqc59Y. -->


**Key concepts and skills**

- Initial usage of APIs, both directly, including dealing with semi-structured data, and indirectly through R Packages. 
- Use R environments to manage keys.
- Web scraping, especially reasonable use and ethical concerns.
- Cleaning data from unstructured data to structured, tidy, data.
- Extracting data from PDFs, both those that are able to be parsed and those that are an image and require OCR.


**Key libraries**

- `babynames` [@citebabynames]
- `httr` [@citehttr]
- `jsonlite` [@jsonlite]
- `lubridate` [@GrolemundWickham2011]
- `pdftools` [@Ooms2018pdftools]
- `purrr` [@citepurrr]
- `rtweet` [@rtweet]
- `rvest` [@citervest]
- `spotifyr` [@spotifyr]
- `tesseract` [@Ooms2018tesseract]
- `tidyverse` [@citetidyverse]
- `usethis` [@citeusethis]
- `xml2` [@xml2]


**Key functions**

- `download.file()`
- `factor()`
- `function()`
- `httr::GET()`
- `pdftools::pdf_text()`
- `purrr::walk2()`
- `rtweet::get_favorites()`
- `rtweet::get_friends()`
- `rtweet::get_timelines()`
- `rtweet::search_tweets()`
- `rvest::html_nodes()`
- `rvest::html_text()`
- `set.seed()`
- `spotifyr::get_artist_audio_features()`
- `sys.sleep()`
- `tesseract::ocr()`
- `usethis::edit_r_environ()`


## Introduction



In this chapter we first 
go through a variety of approaches for gathering data, including the use of APIs and semi-structured data, such as JSON and XML, web scraping, converting PDFs,
and using optical character recognition, especially to obtain text data.




## APIs

In everyday language, and for our purposes, an Application Programming Interface (API) is a situation in which someone has set up specific files on their computer such that we can follow their instructions to get them. For instance, when we use a gif on Slack, Slack asks Giphy's server for the appropriate gif, Giphy's server gives that gif to Slack and then Slack inserts it into your chat. The way in which Slack and Giphy interact is determined by Giphy's API. More strictly, an API is just an application that runs on a server that we access using the HTTP protocol. 

We focus on using APIs for gathering data. And so, with that focus, an API is a website that is set-up for another computer to be able to access, rather than a person. For instance, we could go to Google Maps: https://www.google.com/maps. And we could then scroll and click and drag to center the map on Canberra, Australia. Or we could paste this into the browser: https://www.google.com/maps/@-35.2812958,149.1248113,16z. We just used the Google Maps API, and the result should be a map similar to Figure \@ref(fig:focuson2020).

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/googlemaps} 

}

\caption{Example of Google Maps, as at 29 January 2022}(\#fig:focuson2020)
\end{figure}

The advantage of using an API is that the data provider specifies exactly the data that they are willing to provide, and the terms under which they will provide it. These terms may include aspects such as rate limits (i.e. how often we can ask for data), and what we can do with the data, for instance, we might not be allowed to use it for commercial purposes, or to republish it. Additionally, because the API is being provided specifically for us to use it, it is less likely to be subject to unexpected changes or legal issues. Because of this it is ethically and legally clear that when an API is available we should try to use it rather than web scraping.

We will now go through a few case studies of using APIs. In the first we deal directly with an API using `httr` [@citehttr]. In the second we access data from Twitter using `rtweet` [@rtweet]. And in the third we access data from Spotify using `spotifyr` [@spotifyr]. Developing comfort with gathering data through APIs enables access to exciting datasets. For instance, @facebookapitrump use the Facebook Political Ad API to gather all 218,100 of the Trump 2020 campaign ads to better understand the campaign.



### Case study: Gathering data from arXiv, NASA, and Dataverse

We use `GET()` from `httr` [@citehttr] to obtain data from an API directly. This will try to get some specific data and the main argument is 'url'. In a way, this is very similar to the earlier Google Maps example. In that example, the specific information that we were interested in was a map. 

In this case study we will use an API provided by arXiv: https://arxiv.org. arXiv is an online repository for academic papers before they go through peer-review, and these are typically referred to as 'pre-prints'. After installing and loading `httr`, we use `GET()` to ask arXiv to obtain some information about the pre-print of @Alexander2020. 


```r
library(httr)
library(tidyverse)
#> -- Attaching packages ------------------- tidyverse 1.3.1 --
#> v ggplot2 3.3.5     v purrr   0.3.4
#> v tibble  3.1.6     v dplyr   1.0.7
#> v tidyr   1.2.0     v stringr 1.4.0
#> v readr   2.1.1     v forcats 0.5.1
#> -- Conflicts ---------------------- tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
library(xml2)

arxiv <-
  GET("http://export.arxiv.org/api/query?id_list=2111.09299")

status_code(arxiv)
#> [1] 200
```

We can use `status_code()` to check whether we received an error from the server. And assuming we received something back from the server, we can use `content()` to display the information. In this case we have received XML formatted data, which we can read using `read_xml()` from `xml2` [@xml2]. XML is a semi-formatted structure, and it can be useful to start by having a look at it using `html_structure()`.


```r
content(arxiv) |>
  read_xml() |>
  html_structure()
#> <feed [xmlns]>
#>   <link [href, rel, type]>
#>   <title [type]>
#>     {text}
#>   <id>
#>     {text}
#>   <updated>
#>     {text}
#>   <totalResults [xmlns:opensearch]>
#>     {text}
#>   <startIndex [xmlns:opensearch]>
#>     {text}
#>   <itemsPerPage [xmlns:opensearch]>
#>     {text}
#>   <entry>
#>     <id>
#>       {text}
#>     <updated>
#>       {text}
#>     <published>
#>       {text}
#>     <title>
#>       {text}
#>     <summary>
#>       {text}
#>     <author>
#>       <name>
#>         {text}
#>     <author>
#>       <name>
#>         {text}
#>     <comment [xmlns:arxiv]>
#>       {text}
#>     <link [href, rel, type]>
#>     <link [title, href, rel, type]>
#>     <primary_category [term, scheme, xmlns:arxiv]>
#>     <category [term, scheme]>
```

Or we might be interested to create a dataset based on extracting various aspects of this XML tree. For instance, we might be interested to look at the 'entry', which is the eighth item, and in particular to obtain the title and the URL, which are the fourth and ninth items, respectively, within entry. 


```r
data_from_arxiv <-
  tibble(
    title = content(arxiv) |>
      read_xml() |>
      xml_child(search = 8) |>
      xml_child(search = 4) |>
      xml_text(),
    link = content(arxiv) |>
      read_xml() |>
      xml_child(search = 8) |>
      xml_child(search = 9) |>
      xml_attr("href")
  )
data_from_arxiv
#> # A tibble: 1 x 2
#>   title                                                link 
#>   <chr>                                                <chr>
#> 1 "The Increased Effect of Elections and Changing Pri~ http~
```

Each day NASA provides the Astronomy Picture of the Day (APOD) through its APOD API. We can again use `GET()` to obtain the URL for the photo on particular dates and then display it. 


```r
NASA_APOD_20211226 <-
  GET("https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2021-12-26")

NASA_APOD_20190719 <-
  GET("https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2019-07-19")
```

Examining the returned data using `content()`, we can see that we are provided with various fields, such as date, title, explanation, and a URL. And we can provide that URL to `include_graphics()` from `knitr` to display it (Figure \@ref(fig:nasaone)).


```r
content(NASA_APOD_20211226)$date
#> [1] "2021-12-26"
content(NASA_APOD_20211226)$title
#> [1] "James Webb Space Telescope over Earth"
content(NASA_APOD_20211226)$explanation
#> [1] "There's a big new telescope in space. This one, the James Webb Space Telescope (JWST), not only has a mirror over five times larger than Hubble's in area, but can see better in infrared light. The featured picture shows JWST high above the Earth just after being released by the upper stage of an Ariane V rocket, launched yesterday from French Guiana. Over the next month, JWST will move out near the Sun-Earth L2 point where it will co-orbit the Sun with the Earth. During this time and for the next five months, JWST will unravel its segmented mirror and an array of sophisticated scientific instruments -- and test them. If all goes well, JWST will start examining galaxies across the universe and planets orbiting stars across our Milky Way Galaxy in the summer of 2022.   APOD Gallery: Webb Space Telescope Launch"
content(NASA_APOD_20211226)$url
#> [1] "https://apod.nasa.gov/apod/image/2112/JwstLaunch_Arianespace_1080.jpg"

content(NASA_APOD_20190719)$date
#> [1] "2019-07-19"
content(NASA_APOD_20190719)$title
#> [1] "Tranquility Base Panorama"
content(NASA_APOD_20190719)$explanation
#> [1] "On July 20, 1969 the Apollo 11 lunar module Eagle safely touched down on the Moon. It landed near the southwestern corner of the Moon's Mare Tranquillitatis at a landing site dubbed Tranquility Base. This panoramic view of Tranquility Base was constructed from the historic photos taken from the lunar surface. On the far left astronaut Neil Armstrong casts a long shadow with Sun is at his back and the Eagle resting about 60 meters away ( AS11-40-5961). He stands near the rim of 30 meter-diameter Little West crater seen here to the right ( AS11-40-5954). Also visible in the foreground is the top of the camera intended for taking stereo close-ups of the lunar surface."
content(NASA_APOD_20190719)$url
#> [1] "https://apod.nasa.gov/apod/image/1907/apollo11TranquilitybasePan600h.jpg"
```

\begin{figure}

{\centering \includegraphics[width=0.5\linewidth]{/Users/rohanalexander/Documents/book/figures/JwstLaunch_Arianespace_1080} \includegraphics[width=0.5\linewidth]{/Users/rohanalexander/Documents/book/figures/apollo11TranquilitybasePan} 

}

\caption{Photo of the James Webb Space Telescope over Earth and another of Tranquility Base obtained from the NASA APOD API}(\#fig:nasaone)
\end{figure}

Finally, another common API response in semi-structured form is JSON. We can parse JSON with `jsonlite` [@jsonlite]. A Dataverse is a web application that makes it easier to share dataset. We can use an API go query a demonstration dataverse. For instance we might be interested in datasets related to politics.


```r
library(jsonlite)

politics_datasets <- fromJSON("https://demo.dataverse.org/api/search?q=politics")
```

We can also look at the dataset using `View(politics_datasets)`, which allows us to expand the tree based on what we are interested in and even get the code that we need to focus on different aspects by hovering on the item and then clicking the icon with the green arrow (Figure \@ref(fig:jsonfirst)).

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/jsonlite} 

}

\caption{Example of hovering over an JSON element, 'items', where the icon with a green arrow can be clicked on to get the code that would focus on that element}(\#fig:jsonfirst)
\end{figure}

This tells us how to obtain the dataset of interest.


```r
as_tibble(politics_datasets[["data"]][["items"]])
#> # A tibble: 1 x 6
#>   name       type  url   identifier description published_at
#>   <chr>      <chr> <chr> <chr>      <chr>       <chr>       
#> 1 China Arc~ data~ http~ china-arc~ Introducti~ 2016-12-09T~
```




### Case study: Gathering data from Twitter

Twitter is a rich source of text and other data. The Twitter API is the way in which Twitter asks that we gather these data. And `rtweet` [@rtweet] is built around this API and allows us to interact with it in ways that are similar to using any other R package. Initially, we can use the Twitter API with just a regular Twitter account. 

Begin by installing and loading `rtweet` and `tidyverse`. We then need to authorize `rtweet` and we start that process by calling a function from the package, for instance `get_favorites()` which will return a tibble of a user's favorites. This will open a browser, and we then log into a regular Twitter account (Figure \@ref(fig:rtweetlogin)).


```r
library(rtweet)
library(tidyverse)
```


```r
get_favorites(user = "RohanAlexander")
```

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/rtweet} 

}

\caption{rtweet authorisation page}(\#fig:rtweetlogin)
\end{figure}

Once the application is authorized, then we can use `get_favorites()` to actually get the favorites of a user and save them.


```r
rohans_favorites <- get_favorites("RohanAlexander")

saveRDS(rohans_favorites, "rohans_favorites.rds")
```





We could then look at some recent favorites, keeping in mind that they may be different depending on when they are being accessed.


```r
rohans_favorites |> 
  arrange(desc(created_at)) |> 
  slice(1:10) |> 
  select(screen_name, text)
#> # A tibble: 10 x 2
#>    screen_name text                                         
#>    <chr>       <chr>                                        
#>  1 EconAndrew  "How much better are the investment opportun~
#>  2 simonpcouch "There's a new release of #rstats broom up o~
#>  3 MineDogucu  "🚨 New manuscript🚨\n📕 Content and Computi~
#>  4 reid_nancy  "Latest issue. From the intro: \"... it has ~
#>  5 tjmahr      "bathing is good, folks"                     
#>  6 andrewheiss "finished hand washing that load in the bath~
#>  7 monkmanmh   "@CMastication https://t.co/3Eh0mLy44v"      
#>  8 eplusgg     "Stares from Ontario https://t.co/swzYhaptF9"
#>  9 ryancbriggs "Same. https://t.co/C9pNpXO0F9"              
#> 10 flynnpolsci "I’m not great at coming up with assignments~
```

We can use `search_tweets()` to search for tweets about a particular topic. For instance, we could look at tweets using a hashtag commonly associated with R: '#rstats'. 


```r
rstats_tweets <- search_tweets(
  q = "#rstats",
  include_rts = FALSE
)

saveRDS(rstats_tweets, "rstats_tweets.rds")
```






```r
rstats_tweets |> 
  select(screen_name, text) |> 
  head()
#> # A tibble: 6 x 2
#>   screen_name     text                                      
#>   <chr>           <chr>                                     
#> 1 SuccessAnalytiX "The Science of Success \n\nhttps://t.co/~
#> 2 babycoin_dev    "BabyCoin (BABY)\n\nGUI wallet v2.05 =&gt~
#> 3 rstatsdata      "#rdata #rstats: Yield of 6 barley variet~
#> 4 PDH_SciTechNews "#Coding Arm Puts Security Architecture t~
#> 5 PDH_SciTechNews "#Coding Network Engineer: Skills, Roles ~
#> 6 PDH_SciTechNews "#Coding CockroachDB Strengthens Change D~
```

Other useful functions that can be used include `get_friends()` to get all the accounts that a user follows, and `get_timelines()` to get a user's recent tweets. Registering as a developer enables access to more API functionality. 

When using APIs, even when they are wrapped in an R package, in this case `rtweet`, it is important to read the terms under which access is provided. The Twitter API docs are surprisingly readable, and the developer policy is especially clear: https://developer.twitter.com/en/developer-terms/policy. To see how easy it is to violate the terms under which an API provider makes data available, consider that we saved the tweets that we downloaded. If we were to push these to GitHub, then it is possible that we may have accidentally stored sensitive information if there happened to be some in the tweets. Twitter is also explicit about asking those that use their API to be especially careful about sensitive information and not matching Twitter users with off-Twitter folks. Again, the documentation around these restricted uses is clear and readable: https://developer.twitter.com/en/developer-terms/more-on-restricted-use-cases.



### Case study: Gathering data from Spotify

For the final case study, we will use `spotifyr` [@spotifyr], which is a wrapper around the Spotify API. Install `install.packages('spotifyr')` and load the package.


```r
library(spotifyr)
```

To access the Spotify API, we need a Spotify Developer Account: https://developer.spotify.com/dashboard/. This will require logging in with a Spotify account and then accepting the Developer Terms (Figure \@ref(fig:spotifyaccept)).

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/spotify} 

}

\caption{Spotify Developer Account Terms agreement page}(\#fig:spotifyaccept)
\end{figure}

Continuing with the registration process, in our case, we 'do not know' what we are building and so Spotify requires us to use a non-commercial agreement. To use the Spotify API we need a 'Client ID' and a 'Client Secret'. These are things that we want to keep to ourselves because anyone with the details could use our developer account as though they were us. One way to keep these details secret with a minimum of hassle is to keep them in our 'System Environment'. In this way, when we push to GitHub they should not be included. (We followed this process without explanation in Chapter \@ref(interactive-communication) when we used `mapdeck`.) We will use `usethis` [@citeusethis] to modify our System Environment. In particular, there is a file called '.Renviron' which we will open using `edit_r_environ()` and add our 'Client ID' and 'Client Secret' to.


```r
library(usethis)

edit_r_environ()
```

When we run `edit_r_environ()`, our '.Renviron' file will open and we can add our 'Spotify Client ID' and 'Client Secret'. It is important to use the same names, because `spotifyr` will look in our environment for keys with those specific names. 


```r
SPOTIFY_CLIENT_ID = 'PUT_YOUR_CLIENT_ID_HERE'
SPOTIFY_CLIENT_SECRET = 'PUT_YOUR_SECRET_HERE'
```

Save the '.Renviron' file, and then restart R ('Session' -> 'Restart R'). We can now use our 'Spotify Client ID' and 'Client Secret' as needed. And functions that require those details as arguments will work without them being explicitly specified again. We will get and save some information about Radiohead, the English rock band, using `get_artist_audio_features()`. One of the required arguments is `authorization`, but as that is set, by default, to look at the '.Renviron' file, we do not need to specify it here. 


```r
radiohead <- get_artist_audio_features('radiohead')
saveRDS(radiohead, "radiohead.rds")
```






```r
radiohead <- readRDS("radiohead.rds")
```

There is a variety of information available based on songs. We might be interested to see whether their songs are getting longer over time (Figure \@ref(fig:readioovertime)).


```r
radiohead |> 
  select(artist_name, track_name, album_name) |> 
  head()
#>   artist_name                    track_name   album_name
#> 1   Radiohead Everything In Its Right Place KID A MNESIA
#> 2   Radiohead                         Kid A KID A MNESIA
#> 3   Radiohead           The National Anthem KID A MNESIA
#> 4   Radiohead   How to Disappear Completely KID A MNESIA
#> 5   Radiohead                   Treefingers KID A MNESIA
#> 6   Radiohead                    Optimistic KID A MNESIA
```


```r
library(lubridate)

radiohead |> 
  mutate(album_release_date = ymd(album_release_date)) |> 
  ggplot(aes(x = album_release_date, y = duration_ms)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Album release date",
       y = "Duration of song (ms)"
       ) 
```

![(\#fig:readioovertime)Length of each Radiohead song, over time, as gathered from Spotify](09-gather_files/figure-latex/readioovertime-1.pdf) 

One interesting variable provided by Spotify about each song is 'valence'. The Spotify documentation describe this as a measure between 0 and 1 that signals the 'the musical positiveness' of the track with higher values being more positive. Further details are available at the documentation: https://developer.spotify.com/documentation/web-api/reference/#/operations/get-audio-features. We might be interested to compare valence over time between a few artists, for instance, the American rock band The National, and the American singer Taylor Swift.

First, we need to gather the data.


```r
taylor_swift <- get_artist_audio_features('taylor swift')
the_national <- get_artist_audio_features('the national')

saveRDS(taylor_swift, "taylor_swift.rds")
saveRDS(the_national, "the_national.rds")
```







Then we can bring them together and make the graph (Figure \@ref(fig:swiftyvsnationalvsradiohead)). This appears to show that while Taylor Swift and Radiohead have largely maintained their level of valence overtime, The National has decreased theirs.


```r
three_artists <-
  rbind(taylor_swift, the_national, radiohead) |>
  select(artist_name, album_release_date, valence) |>
  mutate(album_release_date = ymd(album_release_date))

three_artists |>
  ggplot(aes(x = album_release_date,
             y = valence,
             color = artist_name)) +
  geom_point(alpha = 0.5) +
  geom_smooth() +
  theme_minimal() +
  labs(x = "Album release date",
       y = "Valence",
       color = "Artist") +
  scale_color_brewer(palette = "Set1")
```

![(\#fig:swiftyvsnationalvsradiohead)Comparing valence, over time, for Radiohead, Taylor Swift, and The National](09-gather_files/figure-latex/swiftyvsnationalvsradiohead-1.pdf) 

How amazing that we live in a world that all that information is available with very little effort or cost. And having gathered the data, there is a lot that could be done. For instance, @kaylinpavlik uses an expanded dataset to classify musical genres and @theeconomistonspotify looks at how language is associated with music streaming on Spotify. Our ability to gather such data enables us to answer questions that had to be considered experimentally in the past, for instance @salganik2006experimental had to use experimental data rather than the real data we are able to access. But at the same time, it is worth thinking about what valence is purporting to represent. Little information is available in the Spotify documentation about how this is being created. And it is doubtful that one number can completely represent how positive a song is. 


<!-- ## NBA statistics -->

<!-- NBA: https://github.com/toddwschneider/ballr -->




<!-- ## tidyquant -->

<!-- Financial markets data: tidyquant -->

<!-- ## Danish statistics -->

<!-- https://cran.r-project.org/web/packages/danstat/vignettes/Introduction_to_danstat.html -->














## Web scraping


Web scraping is a way to get data from websites. Rather than going to a website using a browser the copy and pasting, we write code that does it for us. This opens a lot of data to us, but on the other hand, it is not typically data that is being made available for these purposes. This means that it is important to be respectful of it. While generally not illegal, the specifics about the legality of web scraping depend on jurisdictions and the specifics of what we are doing, and so it is also important to be mindful of this. While our use would rarely be commercially competitive, of particular concern is the conflict between the need for our work to be reproducible with the need to respect terms of service that may disallow data republishing [@luscombe2021algorithmic]. And finally, web scraping imposes a cost on the website host, and so it is important to reduce this to the extent possible.

That all said, web scraping is an invaluable source of data. But they are typically datasets that can be created as a by-product of someone trying to achieve another aim. For instance, a retailer may have a website with their products and their prices. That has not been created deliberately as a source of data, but we can scrape it to create a dataset. As such, the following principles are useful to guide web scraping.

1. Avoid it. Try to use an API wherever possible.
2. Abide by their desires. Some websites have a 'robots.txt' file that contains information about what they are comfortable with scrapers doing, for instance 'https://www.google.com/robots.txt'. 
3. Reduce the impact. 
    - Firstly, slow down the scraper, for instance, rather than having it visit the website every second, slow it down using `sys.sleep()`. If we only need a few hundred files, then why not just have it visit the website a few times a minute, running in the background overnight?
   - Secondly, consider the timing of when we run our scraper. For instance, if we are scraping a retailer then maybe we should set our script to run from 10pm through to the morning, when fewer customers are likely using the site. Similarly, if it is a government website and they have a big monthly release, then it might be polite to avoid that day.
4. Take only what is needed. For instance, we do not need to scrape the entire of Wikipedia if all we need is the names of the ten largest cities in Croatia. This reduces the impact on the website, and allows us to more easily justify our actions.
5. Only scrape once. This means we should save everything as we go so that we do not have to re-collect data. Similarly, once we have the data, we should keep that separate and not modify it. Of course, if we need data over time then we will need to go back, but this is different to needlessly re-scraping a page.
6. Do not republish the pages that were scraped. (This contrasts with datasets that we create from it.)
7. Take ownership and ask permission if possible. At a minimum level all scripts should have our contact details in them. Depending on the circumstances, it may be worthwhile asking for permission before you scrape.



Web scraping is possible by taking advantage of the underlying structure of a webpage. We use patterns in the HTML/CSS to get the data that we want. To look at the underlying HTML/CSS we can either: 

1) open a browser, right-click, and choose something like 'Inspect'; or 
2) save the website and then open it with a text editor rather than a browser.

HTML/CSS is a markup language comprised of matching tags. If we want text to be bold, then we would use something like:


```css
<b>My bold text</b>
```

Similarly, if we want a list then we start and end the list, as well as each item. 


```css
<ul>
  <li>Learn webscraping</li>
  <li>Do data science</li>
  <li>Proft</li>
</ul>
```

When scraping we will search for these tags.

To get started, we can pretend that we obtained some HTML from a website, and that we want to get the name from it. We can see that the name is in bold, so we want to focus on that feature and extract it.


```r
website_extract <- "<p>Hi, I’m <b>Rohan</b> Alexander.</p>"
```

We will use `read_html()` from `rvest` [@citervest] to read in the data. 


```r
# install.packages("rvest")
library(rvest)

rohans_data <- read_html(website_extract)

rohans_data
#> {html_document}
#> <html>
#> [1] <body><p>Hi, I’m <b>Rohan</b> Alexander.</p></body>
```

The language used by `rvest` to look for tags is 'node', so we focus on bold nodes. By default `html_nodes()` returns the tags as well. We can focus on the text that they contain, with `html_text()`.


```r
rohans_data |> 
  html_nodes("b")
#> {xml_nodeset (1)}
#> [1] <b>Rohan</b>

first_name <- 
  rohans_data |> 
  html_nodes("b") |>
  html_text()

first_name
#> [1] "Rohan"
```



### Case study: Web scraping book information

In this case study we will scrape a list of books from: https://rohanalexander.com/bookshelf.html. We will then clean the data and look at the distribution of the first letters of author surnames. It is slightly more complicated than the example above, but the underlying approach is the same: download the website, look for the nodes of interest, extract the information, clean it.

We use `rvest` [@citervest] to download a website, and to then navigate the html to find the aspects that we are interested in. And we use `tidyverse` to clean the dataset. We first need to go to the website and then save a local copy.




```r
library(rvest)
library(tidyverse)
library(xml2)

books_data <- read_html("https://rohanalexander.com/bookshelf.html")

write_html(books_data, "raw_data.html") 
```

Now we need to navigate the HTML to get the aspects that we want, and to then put them into some sensible structure. We will start with trying to get the data into a tibble as quickly as possible because this will allow us to more easily use `dplyr` verbs and `tidyverse` functions.


```r
books_data <- read_html("inputs/my_website/raw_data.html")
```


```r
books_data
#> {html_document}
#> <html xmlns="http://www.w3.org/1999/xhtml" lang="" xml:lang="">
#> [1] <head>\n<meta http-equiv="Content-Type" content="text ...
#> [2] <body>\n\n<!--radix_placeholder_front_matter-->\n\n<s ...
```

To get the data into a tibble we first need to identify the data that we are interested in using html tags. If we look at the website then we need to focus on list items (Figure \@ref(fig:rohansbooks)). And we can look at the source, focusing particularly on looking for a list (Figure \@ref(fig:rohanssourceone)).

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/rohansbooks} 

}

\caption{Books website as displayed}(\#fig:rohansbooks)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=0.5\linewidth]{/Users/rohanalexander/Documents/book/figures/sourcetop} \includegraphics[width=0.5\linewidth]{/Users/rohanalexander/Documents/book/figures/sourcelist} 

}

\caption{HTML for the top of the books website and the list of books}(\#fig:rohanssourceone)
\end{figure}

The tag for a list item is 'li', so we can use that to focus on the list.


```r
text_data <- 
  books_data |>
  html_nodes("li") |>
  html_text()

all_books <- 
  tibble(books = text_data)

head(all_books)
#> # A tibble: 6 x 1
#>   books                     
#>   <chr>                     
#> 1 Academic                  
#> 2 Non-fiction               
#> 3 Fiction                   
#> 4 Cookbooks                 
#> 5 Want to buy               
#> 6 Best books that I read in:
```

We now need to clean the data. First we want to separate the title and the author using `separate()` and then clean up the author and title columns.


```r
all_books <-
  all_books |>
  slice(7:nrow(all_books)) |>
  separate(books, into = c("author", "title"), sep = ", ‘")

all_books <-
  all_books |>
  separate(title, into = c("title", "debris"), sep = "’.") |>
  select(-debris) |>
  mutate(author = str_remove_all(author, "^, "),
         author = str_squish(author),
         title = str_remove(title, "“"),
         title = str_remove(title, "^-")
         )

head(all_books)
#> # A tibble: 6 x 2
#>   author                               title                
#>   <chr>                                <chr>                
#> 1 Bryant, John, and Junni L. Zhang     Bayesian Demographic~
#> 2 Chan, Ngai Hang                      Time Series          
#> 3 Clark, Greg                          The Son Also Rises   
#> 4 Duflo, Esther                        Expérience, science ~
#> 5 Foster, Ghani, Jarmin, Kreuter, Lane Big Data and Social ~
#> 6 Francois Chollet with JJ Allaire     Deep Learning with R
```

<!-- Finally, some specific cleaning is needed. -->

<!-- ```{r, include = TRUE, eval = TRUE, echo = TRUE} -->
<!-- all_books <- -->
<!--   all_books |> -->
<!--   mutate(author = str_replace_all(author, -->
<!--                               c("J. K. Rowling." = "J K Rowling.", -->
<!--                                 "M. Mitchell Waldrop." = "M Mitchell Waldrop.", -->
<!--                                 "David A. Price" = "David A Price") -->
<!--                               ) -->
<!--          ) |> -->
<!--   separate(author, into = c("author_correct", "throw_away"), sep = "\\.", extra = "drop") |> -->
<!--   select(-throw_away) |> -->
<!--   rename(author = author_correct) -->

<!-- # One has multiple authors: -->
<!-- # "Daniela Witten, Gareth James, Robert Tibshirani, and Trevor Hastie" -->
<!-- all_books <- -->
<!--   all_books |> -->
<!--   mutate(author = str_replace(author, -->
<!--                               "Daniela Witten, Gareth James, Robert Tibshirani, and Trevor Hastie", -->
<!--                               "Daniela Witten and Gareth James and Robert Tibshirani and Trevor Hastie")) |> -->
<!--   separate(author, into = c("author_first", "author_second", "author_third", "author_fourth"), sep = " and ", fill = "right") |> -->
<!--   pivot_longer(cols = starts_with("author_"), -->
<!--                names_to = "author_position", -->
<!--                values_to = "author") |> -->
<!--   select(-author_position) |> -->
<!--   filter(!is.na(author)) -->

<!-- head(all_books) -->
<!-- ``` -->

There are some at the end that we need to get rid of because they are from a 'best of'. 


```r
all_books <- 
  all_books |> 
  slice(1:142) |>
  filter(author != "‘150 Years of Stats Canada!’.")
```

Finally, we could make a table of the distribution of the first letter of the names (Table \@ref(tab:lettersofbooks)).


```r
all_books |> 
  mutate(
    first_letter = str_sub(author, 1, 1)
    ) |> 
  group_by(first_letter) |> 
  count() |>
  knitr::kable(
    caption = "Distribution of first letter of author names in a collection of books",
    col.names = c("First letter", "Number of times"),
    booktabs = TRUE, 
    linesep = ""
    )
```

\begin{table}

\caption{(\#tab:lettersofbooks)Distribution of first letter of author names in a collection of books}
\centering
\begin{tabular}[t]{lr}
\toprule
First letter & Number of times\\
\midrule
⭐ & 12\\
A & 6\\
B & 8\\
C & 13\\
D & 7\\
E & 5\\
F & 6\\
G & 13\\
H & 6\\
I & 3\\
J & 1\\
K & 3\\
l & 1\\
L & 4\\
M & 8\\
N & 2\\
O & 4\\
P & 7\\
R & 3\\
S & 12\\
T & 6\\
W & 9\\
Y & 1\\
Z & 1\\
\bottomrule
\end{tabular}
\end{table}




### Case study: Web scraping UK Prime Ministers from Wikipedia

In this case study we are interested in how long UK prime ministers lived, based on the year that they were born. We will scrape data from Wikipedia using `rvest` [@citervest], clean it, and then make a graph. Every time we scrape a website things will change. Each scrape will largely be bespoke, even if we can borrow some code from earlier projects. It is completely normal to feel frustrated at times. It helps to begin with an end in mind. 

To that end, we can start by generating some simulated data. Ideally, we want a table that has a row for each prime minister, a column for their name, and a column each for the birth and death years. If they are still alive, then that death year can be empty. We know that birth and death years should be somewhere between 1700 and 1990, and that death year should be larger than birth year. Finally, we also know that the years should be integers, and the names should be characters. So, we want something that looks roughly like this:


```r
library(babynames)

set.seed(853)

simulated_dataset <-
  tibble(
    prime_minister = sample(
      x = babynames |> filter(prop > 0.01) |>
        select(name) |> unique() |> unlist(),
      size = 10,
      replace = FALSE
    ),
    birth_year = sample(
      x = c(1700:1990),
      size = 10,
      replace = TRUE
    ),
    years_lived = sample(
      x = c(50:100),
      size = 10,
      replace = TRUE
    ),
    death_year = birth_year + years_lived
  ) |>
  select(prime_minister, birth_year, death_year, years_lived) |>
  arrange(birth_year)
```

One of the advantages of generating a simulated dataset is that if we are working in groups then one person can start making the graph, using the simulated dataset, while the other person gathers the data. In terms of a graph, we are aiming for something like Figure \@ref(fig:pmsgraphexample).

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/pms_graph_plan} 

}

\caption{Sketch of planned graph showing how long UK prime ministers lived}(\#fig:pmsgraphexample)
\end{figure}

We are starting with a question that is of interest, which how long each UK prime minister lived. As such, we need to identify a source of data While there are plenty of data sources that have the births and deaths of each prime minister, we want one that we can trust, and as we are going to be scraping, we want one that has some structure to it. The Wikipedia page about UK prime ministers fits both these criteria: https://en.wikipedia.org/wiki/List_of_prime_ministers_of_the_United_Kingdom. As it is a popular page the information is more likely to be correct, and the data are available in a table.

We load `rvest` and then download the page using `read_html()`. Saving it locally provides us with a copy that we need for reproducibility in case the website changes, and also means that we do not have to keep visiting the website. But it is likely not our property, and so this is typically not something that should be necessarily redistributed.


```r
library(rvest)
library(tidyverse)
```




```r
raw_data <-
  read_html("https://en.wikipedia.org/wiki/List_of_prime_ministers_of_the_United_Kingdom")
write_html(raw_data, "pms.html")
```

As with the earlier case study we are looking for patterns in the HTML that we can use to help us get closer to the data that we want. This is an iterative process and requires a lot of trial and error. Even simple examples will take time. 

One tool that may help is the SelectorGadget: https://rvest.tidyverse.org/articles/articles/selectorgadget.html. This allows us to pick and choose the elements that we want, and then gives us the input to give to `html_nodes()` (Figure \@ref(fig:selectorgadget))

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/uk_pms} 

}

\caption{Using the Selector Gadget to identify the tag, as at 13 March 2020.}(\#fig:selectorgadget)
\end{figure}





```r
# Read in our saved data
raw_data <- read_html("pms.html")
```




```r
# We can parse tags in order
parse_data_selector_gadget <- 
  raw_data |> 
  html_nodes("td:nth-child(3)") |> 
  html_text()

head(parse_data_selector_gadget)
#> [1] "\nSir Robert Walpole(1676–1745)\n"                       
#> [2] "\nSpencer Compton1st Earl of Wilmington(1673–1743)\n"    
#> [3] "\nHenry Pelham(1694–1754)\n"                             
#> [4] "\nThomas Pelham-Holles1st Duke of Newcastle(1693–1768)\n"
#> [5] "\nWilliam Cavendish4th Duke of Devonshire(1720–1764)\n"  
#> [6] "\nThomas Pelham-Holles1st Duke of Newcastle(1693–1768)\n"
```

In this case there is are a few blank lines that  we will need to filter away.


```r
parsed_data <-
  tibble(raw_text = parse_data_selector_gadget) |>
  filter(raw_text != "—\n") |>
  filter(
    !raw_text %in% c(
      "\n1868\n",
      "\n1874\n",
      "\n1880\n",
      "\n1885\n",
      "\n1892\n",
      "\n1979\n",
      "\n1997\n",
      "\n2010\n"
    )
  ) |>
  filter(
    !raw_text %in% c(
      "\nNational Labour\n",
      "\nWilliam Pulteney1st Earl of Bath(1684–1764)\n",
      "\nJames Waldegrave2nd Earl Waldegrave(1715–1763)\n",
      "\nEdward VII\n\n\n1901–1910\n\n", 
      "\nGeorge V\n\n\n1910–1936\n\n"
    )
  )

head(parsed_data)
#> # A tibble: 6 x 1
#>   raw_text                                                  
#>   <chr>                                                     
#> 1 "\nSir Robert Walpole(1676–1745)\n"                       
#> 2 "\nSpencer Compton1st Earl of Wilmington(1673–1743)\n"    
#> 3 "\nHenry Pelham(1694–1754)\n"                             
#> 4 "\nThomas Pelham-Holles1st Duke of Newcastle(1693–1768)\n"
#> 5 "\nWilliam Cavendish4th Duke of Devonshire(1720–1764)\n"  
#> 6 "\nThomas Pelham-Holles1st Duke of Newcastle(1693–1768)\n"
```

Now that we have the parsed data, we need to clean it to match what we wanted. In particular we want a names column, as well as columns for birth year and death year. We will use `separate()` to take advantage of the fact that it looks like the dates are distinguished by brackets.


```r
initial_clean <- 
  parsed_data |> 
  mutate(raw_text = str_remove_all(raw_text, "\n")) |>
  separate(raw_text, 
            into = c("Name", "not_name"), 
            sep = "\\(",
            remove = FALSE) |> # The remove = FALSE option here means that we 
  # keep the original column that we are separating.
  separate(not_name, 
            into = c("Date", "all_the_rest"), 
            sep = "\\)",
            remove = FALSE)

head(initial_clean)
#> # A tibble: 6 x 5
#>   raw_text                 Name  not_name Date  all_the_rest
#>   <chr>                    <chr> <chr>    <chr> <chr>       
#> 1 Sir Robert Walpole(1676~ Sir ~ 1676–17~ 1676~ ""          
#> 2 Spencer Compton1st Earl~ Spen~ 1673–17~ 1673~ ""          
#> 3 Henry Pelham(1694–1754)  Henr~ 1694–17~ 1694~ ""          
#> 4 Thomas Pelham-Holles1st~ Thom~ 1693–17~ 1693~ ""          
#> 5 William Cavendish4th Du~ Will~ 1720–17~ 1720~ ""          
#> 6 Thomas Pelham-Holles1st~ Thom~ 1693–17~ 1693~ ""
```

Finally, we need to clean up the columns.


```r
initial_clean <- 
 initial_clean |> 
  separate(col = Name, 
           into = c("Name", "Title"),
           sep = "[[:digit:]]",
           extra = "merge",
           fill = "right") |>
  separate(col = Name, 
           into = c("Name", "Title"),
           sep = "MP for",
           extra = "merge",
           fill = "right") |>
  mutate(Name = str_remove(Name, "\\[b\\]"))

head(initial_clean)
#> # A tibble: 6 x 6
#>   raw_text           Name  Title not_name Date  all_the_rest
#>   <chr>              <chr> <chr> <chr>    <chr> <chr>       
#> 1 Sir Robert Walpol~ Sir ~ <NA>  1676–17~ 1676~ ""          
#> 2 Spencer Compton1s~ Spen~ <NA>  1673–17~ 1673~ ""          
#> 3 Henry Pelham(1694~ Henr~ <NA>  1694–17~ 1694~ ""          
#> 4 Thomas Pelham-Hol~ Thom~ <NA>  1693–17~ 1693~ ""          
#> 5 William Cavendish~ Will~ <NA>  1720–17~ 1720~ ""          
#> 6 Thomas Pelham-Hol~ Thom~ <NA>  1693–17~ 1693~ ""
```



```r
cleaned_data <- 
  initial_clean |> 
  select(Name, Date) |> 
  separate(Date, into = c("Birth", "Died"), sep = "–", remove = FALSE) |> # The 
  # PMs who have died have their birth and death years separated by a hyphen, but 
  # we need to be careful with the hyphen as it seems to be a slightly odd type of 
  # hyphen and we need to copy/paste it.
  mutate(Birth = str_remove_all(Birth, "born"),
         Birth = str_trim(Birth)
         ) |> # Alive PMs have slightly different format
  select(-Date) |> 
  mutate(Name = str_remove(Name, "\n")) |> # Remove some html tags that remain
  mutate_at(vars(Birth, Died), ~as.integer(.)) |> # Change birth and death to integers
  mutate(Age_at_Death = Died - Birth) |>  # Add column of the number of years they lived
  distinct() # Some of the PMs had two goes at it.

head(cleaned_data)
#> # A tibble: 6 x 4
#>   Name                 Birth  Died Age_at_Death
#>   <chr>                <int> <int>        <int>
#> 1 Sir Robert Walpole    1676  1745           69
#> 2 Spencer Compton       1673  1743           70
#> 3 Henry Pelham          1694  1754           60
#> 4 Thomas Pelham-Holles  1693  1768           75
#> 5 William Cavendish     1720  1764           44
#> 6 John Stuart           1713  1792           79
```

Our dataset looks similar to the one that we said we wanted at the start (Table \@ref(tab:canadianpmscleanddata)).


```r
cleaned_data |> 
  knitr::kable(
    caption = "UK Prime Ministers, by how old they were when they died",
    col.names = c("Prime Minister", "Birth year", "Death year", "Age at death"),
    booktabs = TRUE, 
    linesep = ""
    )
```

\begin{table}

\caption{(\#tab:canadianpmscleanddata)UK Prime Ministers, by how old they were when they died}
\centering
\begin{tabular}[t]{lrrr}
\toprule
Prime Minister & Birth year & Death year & Age at death\\
\midrule
Sir Robert Walpole & 1676 & 1745 & 69\\
Spencer Compton & 1673 & 1743 & 70\\
Henry Pelham & 1694 & 1754 & 60\\
Thomas Pelham-Holles & 1693 & 1768 & 75\\
William Cavendish & 1720 & 1764 & 44\\
John Stuart & 1713 & 1792 & 79\\
George Grenville & 1712 & 1770 & 58\\
Charles Watson-Wentworth & 1730 & 1782 & 52\\
William Pitt the Elder & 1708 & 1778 & 70\\
Augustus FitzRoy & 1735 & 1811 & 76\\
Frederick NorthLord North & 1732 & 1792 & 60\\
William Petty & 1737 & 1805 & 68\\
William Cavendish-Bentinck & 1738 & 1809 & 71\\
William Pitt the Younger & 1759 & 1806 & 47\\
Henry Addington & 1757 & 1844 & 87\\
William Grenville & 1759 & 1834 & 75\\
Spencer Perceval & 1762 & 1812 & 50\\
Robert Jenkinson & 1770 & 1828 & 58\\
George Canning & 1770 & 1827 & 57\\
F. J. Robinson & 1782 & 1859 & 77\\
Arthur Wellesley & 1769 & 1852 & 83\\
Charles Grey & 1764 & 1845 & 81\\
William Lamb & 1779 & 1848 & 69\\
Sir Robert Peel & 1788 & 1850 & 62\\
Lord John Russell & 1792 & 1878 & 86\\
Edward Smith-Stanley & 1799 & 1869 & 70\\
George Hamilton-Gordon & 1784 & 1860 & 76\\
Henry John Temple & 1784 & 1865 & 81\\
John Russell & 1792 & 1878 & 86\\
Benjamin Disraeli & 1804 & 1881 & 77\\
William Ewart Gladstone & 1809 & 1898 & 89\\
Robert Gascoyne-Cecil & 1830 & 1903 & 73\\
Archibald Primrose & 1847 & 1929 & 82\\
Arthur Balfour & 1848 & 1930 & 82\\
Sir Henry Campbell-Bannerman & 1836 & 1908 & 72\\
H. H. Asquith & 1852 & 1928 & 76\\
David Lloyd George & 1863 & 1945 & 82\\
Bonar Law & 1858 & 1923 & 65\\
Stanley Baldwin & 1867 & 1947 & 80\\
Ramsay MacDonald & 1866 & 1937 & 71\\
Neville Chamberlain & 1869 & 1940 & 71\\
Winston Churchill & 1874 & 1965 & 91\\
Clement Attlee & 1883 & 1967 & 84\\
Sir Winston Churchill & 1874 & 1965 & 91\\
Sir Anthony Eden & 1897 & 1977 & 80\\
Harold Macmillan & 1894 & 1986 & 92\\
Sir Alec Douglas-Home & 1903 & 1995 & 92\\
Harold Wilson & 1916 & 1995 & 79\\
Edward Heath & 1916 & 2005 & 89\\
James Callaghan & 1912 & 2005 & 93\\
Margaret Thatcher & 1925 & 2013 & 88\\
John Major & 1943 & NA & NA\\
Tony Blair & 1953 & NA & NA\\
Gordon Brown & 1951 & NA & NA\\
David Cameron & 1966 & NA & NA\\
Theresa May & 1956 & NA & NA\\
Boris Johnson & 1964 & NA & NA\\
\bottomrule
\end{tabular}
\end{table}


At this point we would like to make a graph that illustrates how long each prime minister lived. If they are still alive then we would like them to run to the end, but we would like to color them differently.


```r
cleaned_data |> 
  mutate(still_alive = if_else(is.na(Died), "Yes", "No"),
         Died = if_else(is.na(Died), as.integer(2022), Died)) |> 
  mutate(Name = as_factor(Name)) |> 
  ggplot(aes(x = Birth, 
             xend = Died,
             y = Name,
             yend = Name, 
             color = still_alive)) +
  geom_segment() +
  labs(x = "Year of birth",
       y = "Prime minister",
       color = "PM is alive",
       title = "How long each UK Prime Minister lived, by year of birth") +
  theme_minimal() +
  scale_color_brewer(palette = "Set1")
```

![](09-gather_files/figure-latex/unnamed-chunk-45-1.pdf)<!-- --> 


### Case study: Downloading multiple files

Considering text as data is exciting and opens up a lot of different research questions. Many guides assume that we already have a nicely formatted text dataset, but that is rarely actually the case. In this case study we will download files from a few different pages. While we have already seen two examples of web scraping, those were focused on just one page, whereas we often need many. Here we will focus on this iteration. We will use `download.file()` to do the download, and `purrr` [@citepurrr] to apply this function across multiple sites.

The Reserve Bank of Australia (RBA) is Australia's central bank and sets monetary policy. It has responsibility for setting the cash rate, which is the interest rate used for loans between banks. This interest rate is an especially important one, and has a large impact on the other interest rates in the economy. Four times a year -- February, May, August, and November -- the RBA publishes a statement on monetary policy, and these are available as PDFs. In this example we will download the four statements published in 2021.

First we set-up a dataframe that has the information that we need.


```r
library(tidyverse)

statements_of_interest <- 
  tibble(
    address = c("https://www.rba.gov.au/publications/smp/2021/nov/pdf/00-overview.pdf",
                "https://www.rba.gov.au/publications/smp/2021/aug/pdf/00-overview.pdf",
                "https://www.rba.gov.au/publications/smp/2021/may/pdf/00-overview.pdf",
                "https://www.rba.gov.au/publications/smp/2021/feb/pdf/00-overview.pdf"
                ),
    local_save_name = c(
      "2021-11.pdf",
      "2021-08.pdf",
      "2021-05.pdf",
      "2021-02.pdf"
    )
  )

statements_of_interest
#> # A tibble: 4 x 2
#>   address                                    local_save_name
#>   <chr>                                      <chr>          
#> 1 https://www.rba.gov.au/publications/smp/2~ 2021-11.pdf    
#> 2 https://www.rba.gov.au/publications/smp/2~ 2021-08.pdf    
#> 3 https://www.rba.gov.au/publications/smp/2~ 2021-05.pdf    
#> 4 https://www.rba.gov.au/publications/smp/2~ 2021-02.pdf
```

Then we can apply the function `download.files()` to these four 

Then we can write a function that will download the file, let us know that it was downloaded, wait a polite amount of time, and then go get the next file. 



```r
visit_download_and_wait <-
  function(the_address_to_visit, where_to_save_it_locally) {
    
    download.file(url = the_address_to_visit,
                  destfile = where_to_save_it_locally
                  )

    print(paste("Done with", the_address_to_visit, "at", Sys.time()))
    
    Sys.sleep(sample(5:10, 1))
  }
```

We now apply that function to our list of URLs.


```r
walk2(statements_of_interest$address,
      statements_of_interest$local_save_name,
      ~visit_download_and_wait(.x, .y))
```

The result is that we have downloaded these four PDFs and saved them to our computer. In the next section we will build on this to discuss getting information from these PDFs.


## PDFs

In contrast to an API, a PDF is usually only produced for human rather than computer consumption. The nice thing about PDFs is that they are static and constant. And it is nice that they make data available at all. But the trade-off is that:

- It is not overly useful to do larger-scale statistical analysis.
- We do not know how the PDF was put together so we do not know whether we can trust it.
- We cannot manipulate the data to get results that we are interested in.



Indeed, sometimes governments publish data as PDFs because they do not actually want us to be able to analyze it. Being able to get data from PDFs opens up a large number of datasets.

There are two important aspects to keep in mind when approaching a PDF with a mind to extracting data from it:

1. Begin with an end in mind. Planning and then literally sketching out what we want from a final dataset/graph/paper stops us wasting time and keeps us focused. 
2. Start simple, then iterate. The quickest way to make a complicated model is often to first build a simple model and then complicate it. Start with just trying to get one page of the PDF working or even just one line. Then iterate from there.

We will start by walking through several examples and then go through a case study where we will gather data on US Total Fertility Rate, by state.

Figure \@ref(fig:firstpdfexample) is a PDF that consists of just the first sentence from Jane Eyre taken from Project Gutenberg [@janeeyre].

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/inputs/pdfs/first_example} 

}

\caption{First sentence of Jane Eyre}(\#fig:firstpdfexample)
\end{figure}

If assume that it was saved as 'first_example.pdf', then we can `pdftools` [@citepdftools] to get the text from this one-page PDF into R.



```r
library(pdftools)
library(tidyverse)

first_example <- pdf_text("first_example.pdf")

first_example

class(first_example)
```



We can see that the PDF has been correctly read in, as a character vector.

We will now try a slightly more complicated example that consists of the first few paragraphs of Jane Eyre (Figure \@ref(fig:secondpdfexample)). Also notice that now we have the chapter heading as well.

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/inputs/pdfs/second_example} 

}

\caption{First few paragraphs of Jane Eyre}(\#fig:secondpdfexample)
\end{figure}

We use the same function as before.


```r
second_example <- pdftools::pdf_text("second_example.pdf")

second_example

class(second_example)
```



Again, we have a character vector. The end of each line is signaled by '\\n', but other than that it looks pretty good. Finally, we consider the first two pages.


```r
third_example <- pdftools::pdf_text("third_example.pdf")

third_example

class(third_example)
```




Notice that the first page is the first element of the character vector, and the second page is the second element. As we are most familiar with rectangular data, we will try to get it into that format as quickly as possible. And then we can use our regular `tidyverse` functions to deal with it.

First we want to convert the character vector into a tibble. At this point we may like to add page numbers as well.


```r
jane_eyre <- tibble(raw_text = third_example,
                    page_number = c(1:2))
```

We then want to separate the lines so that each line is an observation. We can do that by looking for '\\n' remembering that we need to escape the backslash as it is a special character.


```r
jane_eyre <- 
  separate_rows(jane_eyre, raw_text, sep = "\\n", convert = FALSE)
jane_eyre
#> # A tibble: 93 x 2
#>    raw_text                                      page_number
#>    <chr>                                               <int>
#>  1 "CHAPTER I"                                             1
#>  2 "There was no possibility of taking a walk t~           1
#>  3 "leafless shrubbery an hour in the morning; ~           1
#>  4 "company, dined early) the cold winter wind ~           1
#>  5 "penetrating, that further out-door exercise~           1
#>  6 ""                                                      1
#>  7 "I was glad of it: I never liked long walks,~           1
#>  8 "coming home in the raw twilight, with nippe~           1
#>  9 "chidings of Bessie, the nurse, and humbled ~           1
#> 10 "Eliza, John, and Georgiana Reed."                      1
#> # ... with 83 more rows
```







### Case-study: Gathering data on the US Total Fertility Rate

The US Department of Health and Human Services Vital Statistics Report provides information about the total fertility rate (the average number of births per woman if women experience the current age-specific fertility rates throughout their reproductive years) for each state for nineteen years. The US persists in only making this data available in PDFs, which hinders research. But we can use the approaches above to get the data into a nice dataset.

For instance, in the case of the year 2000 the table that we are interested in is on page 40 of a PDF that is available at https://www.cdc.gov/nchs/data/nvsr/nvsr50/nvsr50_05.pdf. The column of interest is labelled: "Total fertility rate" (Figure \@ref(fig:dhsexample)). 

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/dhs_example} 

}

\caption{Example Vital Statistics Report, from 2000}(\#fig:dhsexample)
\end{figure}

The first step when getting data out of a PDF is to sketch out what we eventually want. A PDF typically contains a lot of information, and so it is handy to be very clear about what you need. This helps keep you focused, and prevents scope creep, but it is also helpful when thinking about data checks. We literally write down on paper what we have in mind. In this case, what is needed is a table with a column for state, year and TFR (Figure \@ref(fig:tfrdesired)). 

\begin{figure}

{\centering \includegraphics[width=0.4\linewidth]{/Users/rohanalexander/Documents/book/figures/tfr_dataset_sketch} 

}

\caption{Planned dataset of TFR for each year and US state}(\#fig:tfrdesired)
\end{figure}

There are 19 different PDFs, and we are interested in a particular column in a particular table in each of them. Unfortunately, there is nothing magical about what is coming. This first step requires working out the link for each, and the page and column name that is of interest. In the end, this looks like this.





```r
summary_tfr_dataset |> 
  select(year, page, table, column_name, url) |> 
  gt()
```

\captionsetup[table]{labelformat=empty,skip=1pt}
\begin{longtable}{rrrll}
\toprule
year & page & table & column\_name & url \\ 
\midrule
2000 & 40 & 10 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr50/nvsr50\_05.pdf \\ 
2001 & 41 & 10 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr51/nvsr51\_02.pdf \\ 
2002 & 46 & 10 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr52/nvsr52\_10.pdf \\ 
2003 & 45 & 10 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr54/nvsr54\_02.pdf \\ 
2004 & 52 & 11 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr55/nvsr55\_01.pdf \\ 
2005 & 52 & 11 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr56/nvsr56\_06.pdf \\ 
2006 & 49 & 11 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr57/nvsr57\_07.pdf \\ 
2007 & 41 & 11 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr58/nvsr58\_24.pdf \\ 
2008 & 43 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr59/nvsr59\_01.pdf \\ 
2009 & 43 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr60/nvsr60\_01.pdf \\ 
2010 & 42 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr61/nvsr61\_01.pdf \\ 
2011 & 40 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr62/nvsr62\_01.pdf \\ 
2012 & 38 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr62/nvsr62\_09.pdf \\ 
2013 & 37 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr64/nvsr64\_01.pdf \\ 
2014 & 38 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr64/nvsr64\_12.pdf \\ 
2015 & 42 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr66/nvsr66\_01.pdf \\ 
2016 & 29 & 8 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr67/nvsr67\_01.pdf \\ 
2016 & 30 & 8 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr67/nvsr67\_01.pdf \\ 
2017 & 23 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr67/nvsr67\_08-508.pdf \\ 
2017 & 24 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr67/nvsr67\_08-508.pdf \\ 
2018 & 23 & 12 & Total fertility rate & https://www.cdc.gov/nchs/data/nvsr/nvsr68/nvsr68\_13-508.pdf \\ 
 \bottomrule
\end{longtable}

The first step is to get some code that works for one of them. I'll step through the code in a lot more detail than normal because we're going to use these pieces a lot. 

We will choose the year 2000. We first download and save the PDF using `download.file()`.


```r
download.file(url = summary_tfr_dataset$url[1], 
              destfile = "year_2000.pdf")
```


```r
# INTERNAL
download.file(url = summary_tfr_dataset$url[1], 
              destfile = "inputs/pdfs/dhs/year_2000.pdf")
```

We then read the PDF in as a character vector using `pdf_text()` from `pdftools`. And then convert it to a tibble, so that we can use familiar verbs on it.


```r
library(pdftools)
dhs_2000 <- pdf_text("year_2000.pdf")
```




```r
dhs_2000 <- tibble(raw_data = dhs_2000)

head(dhs_2000)
#> # A tibble: 6 x 1
#>   raw_data                                                  
#>   <chr>                                                     
#> 1 "Volume 50, Number 5                                     ~
#> 2 "2   National Vital Statistics Report, Vol. 50, No. 5, Fe~
#> 3 "                                                        ~
#> 4 "4   National Vital Statistics Report, Vol. 50, No. 5, Fe~
#> 5 "                                                        ~
#> 6 "6   National Vital Statistics Report, Vol. 50, No. 5, Fe~
```

Grab the page that is of interest (remembering that each page is a element of the character vector, hence a row in the tibble).


```r
dhs_2000 <- 
  dhs_2000 |> 
  slice(summary_tfr_dataset$page[1])

head(dhs_2000)
#> # A tibble: 1 x 1
#>   raw_data                                                  
#>   <chr>                                                     
#> 1 "40 National Vital Statistics Report, Vol. 50, No. 5, Rev~
```

Now we want to separate the rows.


```r
dhs_2000 <- 
  dhs_2000 |> 
  separate_rows(raw_data, sep = "\\n", convert = FALSE)

head(dhs_2000)
#> # A tibble: 6 x 1
#>   raw_data                                                  
#>   <chr>                                                     
#> 1 "40 National Vital Statistics Report, Vol. 50, No. 5, Rev~
#> 2 ""                                                        
#> 3 "Table 10. Number of births, birth rates, fertility rates~
#> 4 "United States, each State and territory, 2000"           
#> 5 "[By place of residence. Birth rates are live births per ~
#> 6 "estimated in each area; total fertility rates are sums o~
```

Now we are searching for patterns that we can use. Let us look at the first ten lines of content.


```r
dhs_2000[13:22,]
#> # A tibble: 10 x 1
#>    raw_data                                                 
#>    <chr>                                                    
#>  1 "                                  State                ~
#>  2 "                                                       ~
#>  3 "                                                       ~
#>  4 ""                                                       
#>  5 ""                                                       
#>  6 "United States 1 .......................................~
#>  7 ""                                                       
#>  8 "Alabama ...............................................~
#>  9 "Alaska ................................................~
#> 10 "Arizona ...............................................~
```

It does not get much better than this:

1. We have dots separating the states from the data.
2. We have a space between each of the columns.

So we can now separate this in to separate columns. First we want to match on when there is at least two dots (remembering that the dot is a special character and so needs to be escaped).


```r
dhs_2000 <- 
  dhs_2000 |> 
  separate(col = raw_data, 
           into = c("state", "data"), 
           sep = "\\.{2,}", 
           remove = FALSE,
           fill = "right"
           )

head(dhs_2000)
#> # A tibble: 6 x 3
#>   raw_data                                       state data 
#>   <chr>                                          <chr> <chr>
#> 1 "40 National Vital Statistics Report, Vol. 50~ "40 ~ <NA> 
#> 2 ""                                             ""    <NA> 
#> 3 "Table 10. Number of births, birth rates, fer~ "Tab~ <NA> 
#> 4 "United States, each State and territory, 200~ "Uni~ <NA> 
#> 5 "[By place of residence. Birth rates are live~ "[By~ <NA> 
#> 6 "estimated in each area; total fertility rate~ "est~ <NA>
```

We get the expected warnings about the top and the bottom as they do not have multiple dots. (Another option here is to use `pdf_data()` which would allow us to use location rather than delimiters.)

We can now separate the data based on spaces. There is an inconsistent number of spaces, so we first squish any example of more than one space into just one.


```r
dhs_2000 <- 
  dhs_2000 |>
  mutate(data = str_squish(data)) |> 
  tidyr::separate(col = data, 
           into = c("number_of_births", 
                    "birth_rate", 
                    "fertility_rate", 
                    "TFR", 
                    "teen_births_all", 
                    "teen_births_15_17", 
                    "teen_births_18_19"), 
           sep = "\\s", 
           remove = FALSE
           )

head(dhs_2000)
#> # A tibble: 6 x 10
#>   raw_data           state data  number_of_births birth_rate
#>   <chr>              <chr> <chr> <chr>            <chr>     
#> 1 "40 National Vita~ "40 ~ <NA>  <NA>             <NA>      
#> 2 ""                 ""    <NA>  <NA>             <NA>      
#> 3 "Table 10. Number~ "Tab~ <NA>  <NA>             <NA>      
#> 4 "United States, e~ "Uni~ <NA>  <NA>             <NA>      
#> 5 "[By place of res~ "[By~ <NA>  <NA>             <NA>      
#> 6 "estimated in eac~ "est~ <NA>  <NA>             <NA>      
#> # ... with 5 more variables: fertility_rate <chr>,
#> #   TFR <chr>, teen_births_all <chr>,
#> #   teen_births_15_17 <chr>, teen_births_18_19 <chr>
```

This is all looking fairly great. The only thing left is to clean up.


```r
dhs_2000 <- 
  dhs_2000 |> 
  select(state, TFR) |> 
  slice(13:69) |> 
  mutate(year = 2000)

dhs_2000
#> # A tibble: 57 x 3
#>    state                                         TFR    year
#>    <chr>                                         <chr> <dbl>
#>  1 "                                  State    ~ <NA>   2000
#>  2 "                                           ~ <NA>   2000
#>  3 "                                           ~ <NA>   2000
#>  4 ""                                            <NA>   2000
#>  5 ""                                            <NA>   2000
#>  6 "United States 1 "                            2,13~  2000
#>  7 ""                                            <NA>   2000
#>  8 "Alabama "                                    2,02~  2000
#>  9 "Alaska "                                     2,43~  2000
#> 10 "Arizona "                                    2,65~  2000
#> # ... with 47 more rows
```

And we're done for that year. Now we want to take these pieces, put them into a function and then run that function over all 19 years.

The first part is downloading each of the 19 PDFs that we need. We are going to build on the code that we used before. That code was:


```r
download.file(url = summary_tfr_dataset$url[1], destfile = "year_2000.pdf")
```


To modify this we need:

1. To have it iterate through each of the lines in the dataset that contains our CSVs (i.e. where it says 1, we want 1, then 2, then 3, etc.). 
2. Where it has a filename, we need it to iterate through our desired filenames (i.e. year_2000, then year_2001, then year_2002, etc). 
3. We would like for it to do all of this in a way that is a little robust to errors. For instance, if one of the URLs is wrong or the internet drops out then we would like it to just move onto the next PDF, and then warn us at the end that it missed one, not to stop. (This does not really matter because it is only 19 files, but it is easy to find oneself doing this for thousands of files). 

We will draw on `purrr` for this [@citepurrr].


```r
library(purrr)

summary_tfr_dataset <- 
  summary_tfr_dataset |> 
  mutate(pdf_name = paste0("dhs/year_", year, ".pdf"))
```




```r
walk2(
  summary_tfr_dataset$url,
  summary_tfr_dataset$pdf_name,
  safely( ~ download.file(.x , .y))
)
```

Here we take `download.file()` and pass it two arguments: `.x` and `.y`. Then `walk2()` applies that function to the inputs that we give it, in this case the URLs columns is the `.x` and the pdf_names column is the `.y`. Finally, `safely()` means that if there are any failures then it just moves onto the next file instead of throwing an error.

We now have each of the PDFs saved and we can move onto getting the data from them.

Now we need to get the data from the PDFs. As before, we are going to build on the code that we used before. That code (overly condensed) was:


```r
dhs_2000 <- pdftools::pdf_text("year_2000.pdf")

dhs_2000 <-
  tibble(raw_data = dhs_2000) |>
  slice(summary_tfr_dataset$page[1]) |>
  separate_rows(raw_data, sep = "\\n", convert = FALSE) |>
  separate(
    col = raw_data,
    into = c("state", "data"),
    sep = "\\.{2,}",
    remove = FALSE
  ) |>
  mutate(data = str_squish(data)) |>
  separate(
    col = data,
    into = c(
      "number_of_births",
      "birth_rate",
      "fertility_rate",
      "TFR",
      "teen_births_all",
      "teen_births_15_17",
      "teen_births_18_19"
    ),
    sep = "\\s",
    remove = FALSE
  ) |>
  select(state, TFR) |>
  slice(13:69) |>
  mutate(year = 2000)

dhs_2000
```

The first thing that we want to iterate is the argument to `pdf_text()`, then the number in in `slice()` will also need to change (that is doing the work to get only the page that we are interested in).

Two aspects are hardcoded, and these may need to be updated. In particular: 

1) The separate only works if each of the tables has the same columns in the same order; and 
2) the slice (which restricts the data to just the states) only works in this case. 

Finally, we add the year only at the end, whereas we would need to bring that up earlier in the process. 

We will start by writing a function that will go through all the files, grab the data, get the page of interest, and then expand the rows. We will then use `pmap_dfr()` from `purrr` to apply that function to all of the PDFs and to output a tibble.


```r
get_pdf_convert_to_tibble <- function(pdf_name, page, year){
  
  dhs_table_of_interest <- 
    tibble(raw_data = pdftools::pdf_text(pdf_name)) |> 
    slice(page) |> 
    separate_rows(raw_data, sep = "\\n", convert = FALSE) |> 
    separate(col = raw_data, 
             into = c("state", "data"), 
             sep = "[�|\\.]\\s+(?=[[:digit:]])", 
             remove = FALSE) |> 
    mutate(
      data = str_squish(data),
      year_of_data = year)

  print(paste("Done with", year))
  
  return(dhs_table_of_interest)
}

raw_dhs_data <- purrr::pmap_dfr(summary_tfr_dataset |> select(pdf_name, page, year),
                                get_pdf_convert_to_tibble)
#> [1] "Done with 2000"
#> [1] "Done with 2001"
#> [1] "Done with 2002"
#> [1] "Done with 2003"
#> [1] "Done with 2004"
#> [1] "Done with 2005"
#> [1] "Done with 2006"
#> [1] "Done with 2007"
#> [1] "Done with 2008"
#> [1] "Done with 2009"
#> [1] "Done with 2010"
#> [1] "Done with 2011"
#> [1] "Done with 2012"
#> [1] "Done with 2013"
#> [1] "Done with 2014"
#> [1] "Done with 2015"
#> [1] "Done with 2016"
#> [1] "Done with 2016"
#> [1] "Done with 2017"
#> [1] "Done with 2017"
#> [1] "Done with 2018"

head(raw_dhs_data)
#> # A tibble: 6 x 4
#>   raw_data                          state data  year_of_data
#>   <chr>                             <chr> <chr>        <dbl>
#> 1 "40 National Vital Statistics Re~ "40 ~ 50, ~         2000
#> 2 ""                                ""    <NA>          2000
#> 3 "Table 10. Number of births, bir~ "Tab~ <NA>          2000
#> 4 "United States, each State and t~ "Uni~ <NA>          2000
#> 5 "[By place of residence. Birth r~ "[By~ <NA>          2000
#> 6 "estimated in each area; total f~ "est~ <NA>          2000
```

Now we need to clean up the state names and then filter on them.


```r
states <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", 
            "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", 
            "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
            "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", 
            "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", 
            "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", 
            "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", 
            "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", 
            "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", 
            "Wyoming", "District of Columbia")

raw_dhs_data <- 
  raw_dhs_data |> 
  mutate(state = str_remove_all(state, "\\."),
         state = str_remove_all(state, "�"),
         state = str_remove_all(state, "\u0008"),
         state = str_replace_all(state, "United States 1", "United States"),
         state = str_replace_all(state, "United States1", "United States"),
         state = str_replace_all(state, "United States 2", "United States"),
         state = str_replace_all(state, "United States2", "United States"),
         state = str_replace_all(state, "United States²", "United States"),
         ) |> 
  mutate(state = str_squish(state)) |> 
  filter(state %in% states)

head(raw_dhs_data)
#> # A tibble: 6 x 4
#>   raw_data                          state data  year_of_data
#>   <chr>                             <chr> <chr>        <dbl>
#> 1 Alabama ........................~ Alab~ 63,2~         2000
#> 2 Alaska .........................~ Alas~ 9,97~         2000
#> 3 Arizona ........................~ Ariz~ 85,2~         2000
#> 4 Arkansas .......................~ Arka~ 37,7~         2000
#> 5 California .....................~ Cali~ 531,~         2000
#> 6 Colorado .......................~ Colo~ 65,4~         2000
```

The next step is to separate the data and get the correct column from it. We are going to separate based on spaces once it is cleaned up.



```r
raw_dhs_data <- 
  raw_dhs_data |> 
  mutate(data = str_remove_all(data, "\\*")) |> 
  separate(data, into = c("col_1", "col_2", "col_3", "col_4", "col_5", 
                          "col_6", "col_7", "col_8", "col_9", "col_10"), 
           sep = " ",
           remove = FALSE)
head(raw_dhs_data)
#> # A tibble: 6 x 14
#>   raw_data   state data  col_1 col_2 col_3 col_4 col_5 col_6
#>   <chr>      <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#> 1 Alabama .~ Alab~ 63,2~ 63,2~ 14.4  65.0  2,02~ 62.9  37.9 
#> 2 Alaska ..~ Alas~ 9,97~ 9,974 16.0  74.6  2,43~ 42.4  23.6 
#> 3 Arizona .~ Ariz~ 85,2~ 85,2~ 17.5  84.4  2,65~ 69.1  41.1 
#> 4 Arkansas ~ Arka~ 37,7~ 37,7~ 14.7  69.1  2,14~ 68.5  36.7 
#> 5 Californi~ Cali~ 531,~ 531,~ 15.8  70.7  2,18~ 48.5  28.6 
#> 6 Colorado ~ Colo~ 65,4~ 65,4~ 15.8  73.1  2,35~ 49.2  28.6 
#> # ... with 5 more variables: col_7 <chr>, col_8 <chr>,
#> #   col_9 <chr>, col_10 <chr>, year_of_data <dbl>
```

We can now grab the correct column.


```r
tfr_data <- 
  raw_dhs_data |> 
  mutate(TFR = if_else(year_of_data < 2008, col_4, col_3)) |> 
  select(state, year_of_data, TFR) |> 
  rename(year = year_of_data)
head(tfr_data)
#> # A tibble: 6 x 3
#>   state       year TFR    
#>   <chr>      <dbl> <chr>  
#> 1 Alabama     2000 2,021.0
#> 2 Alaska      2000 2,437.0
#> 3 Arizona     2000 2,652.5
#> 4 Arkansas    2000 2,140.0
#> 5 California  2000 2,186.0
#> 6 Colorado    2000 2,356.5
```


Finally, we need to convert the case.


```r
head(tfr_data)
#> # A tibble: 6 x 3
#>   state       year TFR    
#>   <chr>      <dbl> <chr>  
#> 1 Alabama     2000 2,021.0
#> 2 Alaska      2000 2,437.0
#> 3 Arizona     2000 2,652.5
#> 4 Arkansas    2000 2,140.0
#> 5 California  2000 2,186.0
#> 6 Colorado    2000 2,356.5

tfr_data <- 
  tfr_data |> 
  mutate(TFR = str_remove_all(TFR, ","),
         TFR = as.numeric(TFR))

head(tfr_data)
#> # A tibble: 6 x 3
#>   state       year   TFR
#>   <chr>      <dbl> <dbl>
#> 1 Alabama     2000 2021 
#> 2 Alaska      2000 2437 
#> 3 Arizona     2000 2652.
#> 4 Arkansas    2000 2140 
#> 5 California  2000 2186 
#> 6 Colorado    2000 2356.
```

And run some checks.


```r
tfr_data$state %>% unique() %>% length() == 51
#> [1] TRUE

tfr_data$year %>% unique() %>% length() == 19
#> [1] TRUE
```

In particular we want for there to be 51 states and for there to be 19 years.

And we are done (Table \@ref(tab:tfrforthewin))!


```r
tfr_data |>
  slice(1:10) |>
  knitr:: kable(
    caption = "First ten rows of a dataset of TFR by US state, 2000-2019",
    col.names = c("State", "Year", "TFR"),
    digits = 0,
    booktabs = TRUE, 
    linesep = "",
    format.args = list(big.mark = ",")
  )
```

\begin{table}

\caption{(\#tab:tfrforthewin)First ten rows of a dataset of TFR by US state, 2000-2019}
\centering
\begin{tabular}[t]{lrr}
\toprule
State & Year & TFR\\
\midrule
Alabama & 2,000 & 2,021\\
Alaska & 2,000 & 2,437\\
Arizona & 2,000 & 2,652\\
Arkansas & 2,000 & 2,140\\
California & 2,000 & 2,186\\
Colorado & 2,000 & 2,356\\
Connecticut & 2,000 & 1,932\\
Delaware & 2,000 & 2,014\\
District of Columbia & 2,000 & 1,976\\
Florida & 2,000 & 2,158\\
\bottomrule
\end{tabular}
\end{table}







<!-- ## Semi-structured -->

<!-- ### JSON and XML -->














<!-- @benoit2020text -->



<!-- Text data is all around us, and in many cases is some of the earliest types of data that we are exposed to. Recent increases in computational power, the development of new methods, and the enormous availability of text, means that there has been a great deal of interest in using text as data. Initial methods tend to focus, essentially, on converting text into numbers and then analyzing them using traditional methods. More recent methods have begun to take advantage of the structure that is inherent in text, to draw additional meaning. The difference is perhaps akin to a child who can group similar colors, compared with a child who knows what objects are; although both crocodiles and trees are green, and you can do something with that knowledge, you can do more by knowing that a crocodile could eat you, and a tree probably won't. -->

<!-- Here we cover a variety of techniques designed to equip you with the basics of using text as data. One of the great things about text data is that it is typically not generated for the purposes of our analysis. That is great because it removes one of the unobservable variables that we typically have to worry about. The trade-off is that we typically have to do a bunch more work to get it into a form that we can work with. -->



### Optical Character Recognition

All of the above is predicated on having a PDF that is already 'digitized'. But what if it is images? In that case we need to first use Optical Character Recognition (OCR) using `tesseract` [@citetesseract]. This is a R wrapper around the Tesseract open-source OCR engine.

Let us see an example with a scan from the first page of Jane Eyre (Figure \@ref(fig:janescan)).

\begin{figure}

{\centering \includegraphics[width=0.9\linewidth]{/Users/rohanalexander/Documents/book/figures/jane_scan} 

}

\caption{Scan of first page of Jane Eyre}(\#fig:janescan)
\end{figure}


```r
library(tesseract)

text <- tesseract::ocr(here::here("jane_scan.png"), engine = tesseract("eng"))
cat(text)
```








## Exercises and tutorial

### Exercises

1. What are some types of probability sampling, and in what circumstances might you want to implement them (write two or three pages)?
2. There have been some substantial political polling 'misses' in recent years (Trump and Brexit come to mind). To what extent do you think non-response bias was the cause of this (write a page or two, being sure to ground your writing with citations)?
3. It seems like a lot of businesses have closed since the pandemic. To investigate this, we walk along some blocks downtown and count the number of businesses that are closed and open. To decide which blocks to walk, we open a map, start at the lake, and then pick every 10th street. This type of sampling is (pick one)?
    a. Cluster sampling.
    b.  Systematic sampling.
    c. Stratified sampling.
    d. Convenience sampling.
4. Please name some reasons why you may wish to use cluster sampling (select all)?
    a. Balance in responses.
    b. Administrative convenience.
    c. Efficiency in terms of money.
    d. Underlying systematic concerns.
    e. Estimation of sub-populations.
5. Please consider Beaumont, 2020, 'Are probability surveys bound to disappear for the production of official statistics?'. With reference to that paper, do you think that probability surveys will disappear, and why or why not (please write a paragraph or two)?
6. In your own words, what is an API (write a paragraph or two)?
7. Find two APIs and discuss how you could use them to tell interesting stories (write a paragraph or two for each)?
8. Find two APIs that have an R packages written around them. How could you use these to tell interesting stories (write a paragraph or two)?
9. What is the main argument to `httr::GET()` (pick one)?
    a.  'url'
    b. 'website'
    c. 'domain'
    d. 'location'
10. What are three reasons why we should be respectful when getting scraping data from websites  (write a paragraph or two)?
11. What features of a website do we typically take advantage of when we parse the code (pick on)?
    a. HTML/CSS mark-up.
    b. Cookies.
    c. Facebook beacons.
    d. Code comments.
12. What are three advantages and three disadvantages of scraping compared with using an API (write a paragraph or two)?
13. What are three delimiters that could be useful when trying to bring order to the PDF that you read in as a character vector (write a paragraph or two)?
9. Which of the following, used as part of a regular expression, would match a full stop (hint: see the 'strings' cheat sheet) (pick one)? 
    a. '.'
    b. '\.'
    c.  '\\.'
    d. '\\\.'
10. Name three reasons for sketching out what you want before starting to try to extract data from a PDF (write a paragraph or two for each)?
11. What are three checks that we might like to use for demographic data, such as the number of births in a country in a particular year (write a paragraph or two for check)?
12. What are three checks that we might like to use for economic data, such as GDP for a particular country in a particular year (write a paragraph or two for check)?
13. What does the `purrr` package do (select all that apply)?
    a.  Enhances R's functional programming toolkit.
    b.  Makes loops easier to code and read.
    c. Checks the consistency of datasets.
    d. Identifies issues in data structures and proposes replacements.
14. Which of these are functions from the `purrr` package (select all that apply)?
    a.  `map()`
    b.  `walk()`
    c. `run()`
    d.  `safely()`
15. What are some principles to follow when scraping (select all that apply)?
    a. Avoid it if possible
    b. Follow the site’s guidance
    c. Slow down
    d. Use a scalpel not an axe.  
16. What is a robots.txt file (pick one)?
    a. The instructions that Frankenstein followed.
    b. Notes that web scrapers should follow when scraping.
17. What is the html tag for an item in list (pick one)?
    a. `li`
    b. `body`
    c. `b`
    d. `em`
18. Which function should we use if we have the following text data: 'rohan_alexander' in a column called 'names' and want to split it into first name and surname based on the underbar (pick one)?
    a.  `separate()`
    b. `slice()`
    c. `spacing()`
    d. `text_to_columns()`



### Tutorial

Please redo the web scraping example, but for one of: [Australia](https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Australia), [Canada](https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Canada), [India](https://en.wikipedia.org/wiki/List_of_prime_ministers_of_India), or [New Zealand](https://en.wikipedia.org/wiki/List_of_prime_ministers_of_New_Zealand). 

Plan, gather, and clean the data, and then use it to create a similar table to the one created above. Write a few paragraphs about your findings. Then write a few paragraphs about the data source, what you gathered, and how you went about it. What took longer than you expected? When did it become fun? What would you do differently next time you do this? Your submission should be at least two pages and likely more.

Please submit a link to a PDF produced using R Markdown that includes a link to the GitHub repo.

