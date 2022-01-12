


# (PART) Measure and acquire {-}

# Gather data

**STATUS: Under construction.**

**Recommended reading**

- Benoit, Kenneth, 2019, 'Text as data: An overview', 17 July, https://kenbenoit.net/pdfs/28%20Benoit%20Text%20as%20Data%20draft%202.pdf.
- Bolton, Liza, 2019, 'A quick look at museums per capita', 26 March, http://blog.dataembassy.co.nz/museums-per-capita/.
- Bryan, Jennifer, and Jim Hester, 2020, *What They Forgot to Teach You About R*, Chapter 7, https://rstats.wtf/index.html.
- Cardoso, Tom, 2019, 'Introduction to scraping', https://github.com/tomcardoso/intro-to-scraping.
- Clavelle, Tyler, 2017, 'Using R to extract data from web APIs', 5 June, https://www.tylerclavelle.com/code/2017/randapis/.
- Cooksey, Brian, 2014, 'An Introduction to APIs', Zapier, 22 April, https://zapier.com/learn/apis/.
- Dogucu, Mine, and Mine Çetinkaya-Runde, 2020 ,'Web Scraping in the Statistics and Data Science Curriculum: Challenges and Opportunities', 6 May.
- Gelfand, Sharla, 2019, 'Crying @ Sephora', 8 November, https://sharla.party/post/crying-sephora/.
- Goldman, Shayna, 2019, 'How Much Do NHL Players Really Make? Part 2: Taxes', https://hockey-graphs.com/2019/01/08/how-much-do-nhl-players-really-make-part-2-taxes/.
- Graham, Shawn, 2019, 'Scraping with rvest', 7 November, https://electricarchaeology.ca/2019/11/07/scraping-with-rvest/.
- Henze, Martin, 2020, 'Web Scraping with rvest + Astro Throwback', 23 January, https://heads0rtai1s.github.io/2020/01/23/rvest-intro-astro/.
- Hudon, Caitlin, 2017, ''Blue Christmas: A data-driven search for the most depressing Christmas song', 22 December, https://caitlinhudon.com/2017/12/22/blue-christmas/.
- Luscombe, Alex, 2020, 'A Gentle Introduction to Tesseract OCR', 3 June, https://alexluscombe.ca/post/ocr-tutorial/.
- Luscombe, Alex, 2020, 'Getting your .pdfs into R', 5 August, https://alexluscombe.ca/post/r-pdftools/.
- Luscombe, Alex, 2020, 'Parsing your .pdfs in R', 10 August, https://alexluscombe.ca/post/parsing-pdfs/.
- Marshall, James, 'HTML Made Really Easy', https://www.jmarshall.com/easy/html/.
- Marshall, James, 'HTTP Made Really Easy', https://www.jmarshall.com/easy/http/.
- Nakagawara, Ryo, 2020, 'Intro to {polite} Web Scraping of Soccer Data with R!', 14 May, https://ryo-n7.github.io/2020-05-14-webscrape-soccer-data-with-R/.
- Pavlik, Kaylin, 2020, 'How do fiber types appear together in yarn blends?', 17 February, https://www.kaylinpavlik.com/ravelry-yarn-fibers/.
- Silge, Julia and David Robinson, 2020, *Text Mining with R*, Chapters 1, 3, and 6, https://www.tidytextmining.com/.
- Silge, Julia, 2017, 'Scraping CRAN with rvest', 5 March, https://juliasilge.com/blog/scraping-cran/.
- Smale, David, 2020, 'Daniel Johnston', https://davidsmale.netlify.com/portfolio/daniel-johnston/. 
- Taddy, Matt, 2019, *Business Data Science*, Chapter 8, pp. 231-259.
- Wickham, Hadley, 'Managing Secrets', https://cran.r-project.org/web/packages/httr/vignettes/secrets.html.
- Wickham, Hadley, 2014, 'rvest: easy web scraping with R', 24 November, https://blog.rstudio.com/2014/11/24/rvest-easy-web-scraping-with-r/.
- Wickham, Hadley, nd, 'Getting started with httr', https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html.


**Recommended viewing**

- D'Agostino McGowan, Lucy, 2020 'Harnessing the Power of the Web via R Clients for Web APIs', talk at ASA Joint Statistical Meeting 2018, https://www.lucymcgowan.com/talk/asa_joint_statistical_meeting_2018/.
- Tatman, Rachel, 2018, 'Character Encoding and You', 21 February, https://youtu.be/2U9EHYqc59Y.

**Key concepts/skills/etc**

- Use APIs where possible because the data provider has specified the data they would like to make available to you, and the conditions under which they are making it available.
- Often R packages have been written to make it easier to use APIs.
- Use R environments to manage your keys.
- Using the verb GET ('a GET request') means providing a URL and the server will return something, using the verb POST (a POST request') means providing some data and the server will deal with that data.
- Cleaning data
- Graphing data to tell a story
- Respectfully scraping data
- Approaching extracting text from PDFs as a workflow.
- Planning what is needed at the start.
- Starting small and then iterating.
- Putting in place checks.
- Gathering text data.
- Preparing text datasets.


**Key libraries**

- `babynames`
- `broom`
- `dplyr`
- `ggplot2`
- `gutenbergr`
- `janitor`
- `jsonlite`
- `pdftools`
- `purrr`
- `rtweet`
- `rvest`
- `spotifyr`
- `stringi`
- `tidymodels`
- `tidytext`
- `tidyverse`
- `usethis`


**Key functions/etc**

- `as_factor()`
- `as_tibble()`
- `bind_tf_idf()`
- `c()`
- `case_when()`
- `cat()`
- `edit_r_environ()`
- `file()`
- `fromJSON()`
- `function()`
- `GET()`
- `get_artist_audio_features()`
- `get_favorites()`
- `get_my_top_artists_or_tracks()`
- `html_node()`
- `html_nodes()`
- `html_text()`
- `pdf_data()`
- `pdf_text()`
- `pmap_dfr()`
- `read_html()`
- `readRDS()`
- `safely()`
- `search_tweets()`
- `sleep()`
- `tesseract()`
- `unnest_tokens()`
- `walk2()`
- `write_html()`
- `write_lines()`







## APIs

In everyday language, and for our purposes, an Application Programming Interface (API) is simply a situation in which someone has set up specific files on their computer such that you can follow their instructions to get them. For instance, when you use a gif on Slack, Slack asks Giphy's server for the appropriate gif, Giphy's server gives that gif to Slack and then Slack inserts it into your chat. The way in which Slack and Giphy interact is determined by Giphy's API. More strictly, an API is just an application that runs on a server that we access using the HTTP protocol. 

In our case, we are going to focus on using APIs for gathering data. I'll tailor the language that I use toward that:

> [a]n API is the tool that makes a website's data digestible for a computer. Through it, a computer can view and edit data, just like a person can by loading pages and submitting forms. 
>
> @zapierapis, Chapter 1.

For instance, you could go to [Google Maps](https://www.google.ca/maps) and then scroll and click and drag to center the map on Canberra, Australia, or you could just paste this into your browser: https://www.google.ca/maps/@-35.2812958,149.1248113,16z. You just used the Google Maps API.^[There are at least six great coffee shops shown just in this section of map including: Mocan & Green Grout; The Cupping Room; Barrio Collective Coffee; Lonsdale Street Cafe; Two Before Ten; and Red Brick. There are also two coffee shops that I love but that most wouldn't classify as 'great' including: The Street Theatre Cafe; and the CBE Cafe.] The result should be a map that looks something like Figure \@ref(fig:focuson2020) .

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/googlemaps.png" alt="Example of Google Maps, as at 25 January 2021." width="90%" />
<p class="caption">(\#fig:focuson2020)Example of Google Maps, as at 25 January 2021.</p>
</div>

The advantage of using an API is that the data provider specifies exactly the data that they are willing to provide, and the terms under which they will provide it. These terms may include things like rate limits (i.e. how often you can ask for data), and what you can do with the data (e.g. maybe you're not allowed to use it for commercial purposes, or to republish it, or whatever). Additionally, because the API is being provided specifically for you to use it, it is less likely to be subject to unexpected changes. Because of this it is ethically and legally clear that when an API is available you should try to use it.

We're going to run through some case studies interacting with APIs in R. In the first we will deal directly with an API. That works and is a handy skill to have, but there are a lot of R packages that wrap around APIs making it easier for you to use an API within 'familiar surroundings'. I'll also run through two fun APIs that have R packages built around them.





## Case study - arXiv

In this section we introduce GET requests in which we use an API directly. We will use the `httr` package [@citehttr]. A GET request tries to obtain some specific data and the main argument is `url`. Exactly as before with the Google Maps example! In that case, the specific information was a map and some information about it. 

For this example we'll look at [arXiv](https://arxiv.org), which is a repository for academic articles before they go through peer-review. I'll ask arXiv to return some information about a paper that I recently uploaded with a former student. The content that is returned will be a series of information about that paper.


```r
# install.packages('httr')
library(httr)
arxiv <- httr::GET('http://export.arxiv.org/api/query?id_list=2101.05225')
class(arxiv)
#> [1] "response"
content(arxiv, "text") %>% 
  cat("\n")
#> <?xml version="1.0" encoding="UTF-8"?>
#> <feed xmlns="http://www.w3.org/2005/Atom">
#>   <link href="http://arxiv.org/api/query?search_query%3D%26id_list%3D2101.05225%26start%3D0%26max_results%3D10" rel="self" type="application/atom+xml"/>
#>   <title type="html">ArXiv Query: search_query=&amp;id_list=2101.05225&amp;start=0&amp;max_results=10</title>
#>   <id>http://arxiv.org/api/p9UZyl2Vt0cHwPSKinDSThE23qI</id>
#>   <updated>2022-01-12T00:00:00-05:00</updated>
#>   <opensearch:totalResults xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/">1</opensearch:totalResults>
#>   <opensearch:startIndex xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/">0</opensearch:startIndex>
#>   <opensearch:itemsPerPage xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/">10</opensearch:itemsPerPage>
#>   <entry>
#>     <id>http://arxiv.org/abs/2101.05225v1</id>
#>     <updated>2021-01-13T17:37:07Z</updated>
#>     <published>2021-01-13T17:37:07Z</published>
#>     <title>On consistency scores in text data with an implementation in R</title>
#>     <summary>  In this paper, we introduce a reproducible cleaning process for the text
#> extracted from PDFs using n-gram models. Our approach compares the originally
#> extracted text with the text generated from, or expected by, these models using
#> earlier text as stimulus. To guide this process, we introduce the notion of a
#> consistency score, which refers to the proportion of text that is expected by
#> the model. This is used to monitor changes during the cleaning process, and
#> across different corpuses. We illustrate our process on text from the book Jane
#> Eyre and introduce both a Shiny application and an R package to make our
#> process easier for others to adopt.
#> </summary>
#>     <author>
#>       <name>Ke-Li Chiu</name>
#>     </author>
#>     <author>
#>       <name>Rohan Alexander</name>
#>     </author>
#>     <arxiv:comment xmlns:arxiv="http://arxiv.org/schemas/atom">13 pages, 0 figures</arxiv:comment>
#>     <link href="http://arxiv.org/abs/2101.05225v1" rel="alternate" type="text/html"/>
#>     <link title="pdf" href="http://arxiv.org/pdf/2101.05225v1" rel="related" type="application/pdf"/>
#>     <arxiv:primary_category xmlns:arxiv="http://arxiv.org/schemas/atom" term="cs.CL" scheme="http://arxiv.org/schemas/atom"/>
#>     <category term="cs.CL" scheme="http://arxiv.org/schemas/atom"/>
#>   </entry>
#> </feed>
#> 
```

We get a variety of information about this paper including the title, abstract, and authors.


## Case study - rtweet

Twitter is a rich source of text and other data. The Twitter API is the way in which Twitter ask that you interact with Twitter in order to gather these data. The `rtweet` package [@rtweet-package] is built around this API and allows us to interact with it in ways that are similar to using any other R package. Initially all you need a regular Twitter account.

Get started by install the library if you need and then calling it.


```r
# install.packages('rtweet')
library(rtweet)
library(tidyverse)
```

To get started we need to authorise rtweet. We start that process by calling a function from the package. 


```r
get_favorites(user = "RohanAlexander")
```

This will open a browser on your computer, and you will then have to log into your regular Twitter account as shown in Figure \@ref(fig:rtweetlogin).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/rtweet.png" alt="rtweet authorisation page" width="90%" />
<p class="caption">(\#fig:rtweetlogin)rtweet authorisation page</p>
</div>

Once that is done we can actually get my favourites and then save them.


```r
rohans_favs <- get_favorites("RohanAlexander")

saveRDS(rohans_favs, "dont_push/rohans_favs.rds")
```



And then looking at the most recent favourite, we can see it was when Professor Bolton tweeted about one of the stellar students in ISSC.


```r
rohans_favs %>% 
  arrange(desc(created_at)) %>% 
  slice(1) %>% 
  select(screen_name, text)
#> # A tibble: 1 × 2
#>   screen_name text                                                              
#>   <chr>       <chr>                                                             
#> 1 les_ja      I've signed an offer letter, so I think I can formally announce: …
```

Let's look at who is tweeting about R, using one of the common R hashtags: #rstats. I've removed retweets so that we hopefully get some actual interesting projects.


```r
rstats_tweets <- search_tweets(
  q = "#rstats",
  include_rts = FALSE
)

saveRDS(rstats_tweets, "dont_push/rstats_tweets.rds")
```




And then have a look at them.


```r
names(rstats_tweets)
#>  [1] "user_id"                 "status_id"              
#>  [3] "created_at"              "screen_name"            
#>  [5] "text"                    "source"                 
#>  [7] "display_text_width"      "reply_to_status_id"     
#>  [9] "reply_to_user_id"        "reply_to_screen_name"   
#> [11] "is_quote"                "is_retweet"             
#> [13] "favorite_count"          "retweet_count"          
#> [15] "quote_count"             "reply_count"            
#> [17] "hashtags"                "symbols"                
#> [19] "urls_url"                "urls_t.co"              
#> [21] "urls_expanded_url"       "media_url"              
#> [23] "media_t.co"              "media_expanded_url"     
#> [25] "media_type"              "ext_media_url"          
#> [27] "ext_media_t.co"          "ext_media_expanded_url" 
#> [29] "ext_media_type"          "mentions_user_id"       
#> [31] "mentions_screen_name"    "lang"                   
#> [33] "quoted_status_id"        "quoted_text"            
#> [35] "quoted_created_at"       "quoted_source"          
#> [37] "quoted_favorite_count"   "quoted_retweet_count"   
#> [39] "quoted_user_id"          "quoted_screen_name"     
#> [41] "quoted_name"             "quoted_followers_count" 
#> [43] "quoted_friends_count"    "quoted_statuses_count"  
#> [45] "quoted_location"         "quoted_description"     
#> [47] "quoted_verified"         "retweet_status_id"      
#> [49] "retweet_text"            "retweet_created_at"     
#> [51] "retweet_source"          "retweet_favorite_count" 
#> [53] "retweet_retweet_count"   "retweet_user_id"        
#> [55] "retweet_screen_name"     "retweet_name"           
#> [57] "retweet_followers_count" "retweet_friends_count"  
#> [59] "retweet_statuses_count"  "retweet_location"       
#> [61] "retweet_description"     "retweet_verified"       
#> [63] "place_url"               "place_name"             
#> [65] "place_full_name"         "place_type"             
#> [67] "country"                 "country_code"           
#> [69] "geo_coords"              "coords_coords"          
#> [71] "bbox_coords"             "status_url"             
#> [73] "name"                    "location"               
#> [75] "description"             "url"                    
#> [77] "protected"               "followers_count"        
#> [79] "friends_count"           "listed_count"           
#> [81] "statuses_count"          "favourites_count"       
#> [83] "account_created_at"      "verified"               
#> [85] "profile_url"             "profile_expanded_url"   
#> [87] "account_lang"            "profile_banner_url"     
#> [89] "profile_background_url"  "profile_image_url"

rstats_tweets %>% 
  select(screen_name, text) %>% 
  head()
#> # A tibble: 6 × 2
#>   screen_name    text                                                           
#>   <chr>          <chr>                                                          
#> 1 RahaPhD        "#WFH multitasking woes:  I was just sitting here, working on …
#> 2 AmandaKMontoya "Teaching with the #PublishingPaidMe data this week in my intr…
#> 3 digitalke1     "130 #MachineLearning ProjectsSolved and Explained\n@ruben_arc…
#> 4 digitalke1     "#Infographic: 6 simple steps to effectively analyse data.\nVi…
#> 5 dataclaudius   "When Did the US Senate Best Reflect the US Population? via #r…
#> 6 alexpghayes    "has anyone written an #rstats package to interface with SNAP …
```


There is a bunch of other things that you can do just using a regular user account, and if you're interested then you should try the examples in the `rtweet` package documentation: https://rtweet.info/index.html. But more is available once you register as a developer (https://developer.twitter.com/en/apply-for-access). The Twitter API document is surprisingly readable, and you may enjoy some of it: https://developer.twitter.com/en/docs. 

When I introduced APIs I said that the 'data provider specifies exactly the data that they are willing to provide...' and we have certainly been able to take advantage of what they provide But I continued '...and the terms under which they will provide it' and here we haven't done our part. In particular, I took some tweets and saved them. If I had pushed these to GitHub, then it's possible I may have accidently stored sensitive information if there happened to be some in the tweets. Or if I had taken enough tweets to start to do some reasonable statistical analysis then even if there wasn't sensitive information, I may have violated the terms if I had pushed those saved tweets to GitHub. Finally, I linked a Twitter username, in this case `@Liza_Bolton` with Professor Bolton. I happened to ask her if this was okay, but if I hadn't done that then I would have been violating the Twitter terms of service.

If you use Twitter data, please take a moment to look at the terms: https://developer.twitter.com/en/developer-terms/more-on-restricted-use-cases.



## Case study - spotifyr

For the next example I will introduce the `spotifyr` package [@spotifyr]. Again, this is a wrapper that has been developed around an API, in this case the Spotify API. You should install the package from the developer's GitHub repo using `devtools` [@citeDevtools].


```r
# devtools::install_github('charlie86/spotifyr')
library(spotifyr)
```


In order to use this account, you need a Spotify Developer Account, which you can set-up here: https://developer.spotify.com/dashboard/. That'll have you log in with your Spotify details and then accept their terms (it's worth looking at some of these and I'll follow up on a few below) as in Figure \@ref(fig:spotifyaccept).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/spotify.png" alt="rtweet authorisation page" width="90%" />
<p class="caption">(\#fig:spotifyaccept)rtweet authorisation page</p>
</div>

What we need from here is a 'Client ID' and you can just fill out some basic details. In our case we probably 'don't know' what we're building, which means that Spotify requires us to use a non-commercial agreement, which is fine. In order to use the Spotify API we need a Client ID and a Client Secret. 

These are things that you want to keep to yourself. There are a variety of ways of keeping this secret, (and my understanding is that a helpful package is on its way) but we'll keep them in our System Environment. In this way, when we push to GitHub they won't be included. To do this we need to be careful about the naming, because `spotifyr` will look in our environment for specifically named keys. 

To do this we are going to use the `usethis` package [@citeusethis]. If you don't have that then please install it. There is a file called '.Renviron' which we will open and add our secrets to. This file also controls things like your default library location and more information is available at @renvironrstudio and @whattheyforgot. 


```r
usethis::edit_r_environ() 
```

When you run that function it will open a file. There you can add your Spotify secrets.


```r
SPOTIFY_CLIENT_ID = 'PUT_YOUR_CLIENT_ID_HERE'
SPOTIFY_CLIENT_SECRET = 'PUT_YOUR_SECRET_HERE'
```

Save your '.Renviron' file, and then restart R (Session -> Restart R). You can now draw on that variable when you need.

Some functions that require your secrets as arguments will now just work. For instance, we will get information about Radiohead using `get_artist_audio_features()`. One of the arguments is `authorization`, but as that is set to default to look at the R Environment, we don't need to do anything further.



```r
radiohead <- get_artist_audio_features('radiohead')
saveRDS(radiohead, "inputs/radiohead.rds")
```


```r
radiohead <- readRDS("inputs/radiohead.rds")

names(radiohead)
#>  [1] "artist_name"                  "artist_id"                   
#>  [3] "album_id"                     "album_type"                  
#>  [5] "album_images"                 "album_release_date"          
#>  [7] "album_release_year"           "album_release_date_precision"
#>  [9] "danceability"                 "energy"                      
#> [11] "key"                          "loudness"                    
#> [13] "mode"                         "speechiness"                 
#> [15] "acousticness"                 "instrumentalness"            
#> [17] "liveness"                     "valence"                     
#> [19] "tempo"                        "track_id"                    
#> [21] "analysis_url"                 "time_signature"              
#> [23] "artists"                      "available_markets"           
#> [25] "disc_number"                  "duration_ms"                 
#> [27] "explicit"                     "track_href"                  
#> [29] "is_local"                     "track_name"                  
#> [31] "track_preview_url"            "track_number"                
#> [33] "type"                         "track_uri"                   
#> [35] "external_urls.spotify"        "album_name"                  
#> [37] "key_name"                     "mode_name"                   
#> [39] "key_mode"

radiohead %>% 
  select(artist_name, track_name, album_name) %>% 
  head()
#>   artist_name                               track_name
#> 1   Radiohead                      Airbag - Remastered
#> 2   Radiohead            Paranoid Android - Remastered
#> 3   Radiohead Subterranean Homesick Alien - Remastered
#> 4   Radiohead     Exit Music (For a Film) - Remastered
#> 5   Radiohead                    Let Down - Remastered
#> 6   Radiohead                Karma Police - Remastered
#>                      album_name
#> 1 OK Computer OKNOTOK 1997 2017
#> 2 OK Computer OKNOTOK 1997 2017
#> 3 OK Computer OKNOTOK 1997 2017
#> 4 OK Computer OKNOTOK 1997 2017
#> 5 OK Computer OKNOTOK 1997 2017
#> 6 OK Computer OKNOTOK 1997 2017
```

Let's just make a quick graph looking at track length over time.


```r
radiohead %>% 
  ggplot(aes(x = album_release_year, y = duration_ms)) +
  geom_point()
```

<img src="20-gather_files/figure-html/unnamed-chunk-10-1.png" width="672" />

Just because we can, let's settle an argument. I've always said that Radiohead of quite depressing, but they're my wife's favourite band. Let's see how depressing they are. Spotify provides various information about each track, including 'valence', which Spotify [define](https://developer.spotify.com/documentation/web-api/reference/tracks/get-audio-features/) as '(a) measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).' Higher values are happier. Let's compare someone who we know it likely to be happy - Taylor Swift - with Radiohead.


```r
swifty <- get_artist_audio_features('taylor swift')
saveRDS(swifty, "inputs/swifty.rds")
```


```r
swifty <- readRDS("inputs/swifty.rds")

tibble(name = c(swifty$artist_name, radiohead$artist_name),
       year = c(swifty$album_release_year, radiohead$album_release_year),
       valence = c(swifty$valence, radiohead$valence)
               ) %>% 
  ggplot(aes(x = year, y = valence, color = name)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Year",
       y = "Valence",
       color = "Name") +
  scale_color_brewer(palette = "Set1")
```

<img src="20-gather_files/figure-html/unnamed-chunk-12-1.png" width="672" />

Finally, for the sake of embarrassment, let's look at our most played artists.


```r
top_artists <- get_my_top_artists_or_tracks(type = 'artists', time_range = 'long_term', limit = 20)

saveRDS(top_artists, "inputs/top_artists.rds")
```




```r
top_artists <- readRDS("inputs/top_artists.rds")

top_artists %>% 
  select(name, popularity)
#>                   name popularity
#> 1            Radiohead         81
#> 2  Bombay Bicycle Club         66
#> 3                Drake        100
#> 4        Glass Animals         74
#> 5                JAY-Z         85
#> 6        Laura Marling         65
#> 7       Sufjan Stevens         75
#> 8      Vampire Weekend         73
#> 9     Sturgill Simpson         65
#> 10          Nick Drake         66
#> 11        Dire Straits         78
#> 12               Lorde         80
#> 13         Marian Hill         65
#> 14       José González         68
#> 15       Stevie Wonder         79
#> 16          Disclosure         82
#> 17      Ben Folds Five         52
#> 18       Ainslie Wills         40
#> 19            Coldplay         89
#> 20               alt-J         75
```

So pretty much my wife and I like what everyone else likes, with the exception of Ainslie Wills, who is an Australian and I suspect we used to listen to her when we were homesick.


How amazing that we live in a world that all that information is available with very little effort or cost.

Again, there is a lot more at the package's website: https://www.rcharlie.com/spotifyr/. A very nice little application of the Spotify API using some statistical analysis is @kaylinpavlik.


<!-- ## NBA statistics -->

<!-- NBA: https://github.com/toddwschneider/ballr -->




<!-- ## tidyquant -->

<!-- Financial markets data: tidyquant -->

<!-- ## Danish statistics -->

<!-- https://cran.r-project.org/web/packages/danstat/vignettes/Introduction_to_danstat.html -->














## Scraping



### Introduction

Web-scraping is a way to get data from websites into R. Rather than going to a website ourselves through a browser, we write code that does it for us. This opens up a lot of data to us, but on the other hand, it is not typically data that is being made available for these purposes and so it is important to be respectful of it. While generally not illegal, the specifics with regard to the legality of web-scraping depends on jurisdictions and the specifics of what you're doing, and so it is also important to be mindful of this. And finally, web-scraping imposes a cost on the website host, and so it is important to reduce this to the extent that it's possible.

That all said, web-scraping is an invaluable source of data. But they are typically datasets that can be created as a by-product of someone trying to achieve another aim. For instance, a retailer may have a website with their products and their prices. That has not been created deliberately as a source of data, but we can scrape it to create a dataset. As such, the following principles guide my web-scraping.

1. Avoid it. Try to use an API wherever possible.
2. Abide by their desires. Some websites have a file 'robots.txt' that contains information about what they are comfortable with scrapers doing, for instance 'https://www.google.com/robots.txt'. If they have one of these then you should read it and abide by it.
3. Reduce the impact. 
    - Firstly, slow down your scraper, for instance, rather than having it visit the website every second, slow it down (using `sys.sleep()`). If you're only after a few hundred files then why not just have it visit once a minute, running in the background overnight?
   - Secondly, consider the timing of when you run the scraper. For instance, if it's a retailer then why not set your script to run from 10pm through to the morning, when fewer customers are likely to need the site? If it's a government website and they have a big monthly release then why not avoid that day?
4. Take only what you need. For instance, don't scrape the entire of Wikipedia if all you need is to know the names of the 10 largest cities in Canada. This reduces the impact on their website and allows you to more easily justify what you are doing.
5. Only scrape once. Save everything as you go so that you don't have to re-collect data. Similarly, once you have the data, you should keep that separate and not modify it. Of course, if you need data over time then you will need to go back, but this is different to needlessly re-scraping a page.
6. Don't republish the pages that you scraped. (This is in contrast to datasets that you create from it.)
7. Take ownership and ask permission if possible. At a minimum level your scripts should have your contact details in them. Depending on the circumstances, it may be worthwhile asking for permission before you scrape.


### Getting started


Web-scraping is possible by taking advantage of the underlying structure of a webpage. We use patterns in the HTML/CSS to get the data that we want. To look at the underlying HTML/CSS you can either: 1) open a browser, right-click, and choose something like 'Inspect'; or 2) save the website and then open it with a text editor rather than a browser.

HTML/CSS is a markup language comprised of matching tags. If you want text to be bold then you would use something like:


```css
<b>My bold text</b>
```

Similarly, if you want a list then you start and end the list as well as each item. 


```css
<ul>
  <li>Learn webscraping</li>
  <li>Do data science</li>
  <li>Proft</li>
</ul>
```

When scraping we will search for these tags.

To get started, this is some HTML/CSS from my website. Let's say that we want to grab my name from it. We can see that the name is in bold, so we want to probably focus on that feature and extract it.


```r
website_extract <- "<p>Hi, I’m <b>Rohan</b> Alexander.</p>"
```

We will use the `rvest` package @citervest. 


```r
# install.packages("rvest")
library(rvest)

rohans_data <- read_html(website_extract)

rohans_data
#> {html_document}
#> <html>
#> [1] <body><p>Hi, I’m <b>Rohan</b> Alexander.</p></body>
```

The language used by `rvest` to look for tags is 'node', so we will focus on bold nodes. By default `html_nodes()` returns the tags as well. We can focus on the text that they contain, using `html_text()`.


```r
rohans_data %>% 
  html_nodes("b")
#> {xml_nodeset (1)}
#> [1] <b>Rohan</b>

first_name <- 
  rohans_data %>% 
  html_nodes("b") %>%
  html_text()

first_name
#> [1] "Rohan"
```

The result is that we learn my first name.








## Case study - Rohan's books


### Introduction

In this case study we are going to scrape a list of books that I own, clean it, and look at the distribution of the first letters of author surnames. It is slightly more complicated than the example above, but the underlying approach is the same - download the website, look for the nodes of interest, extract the information, clean it.


### Gather

Again, the key library that we are using is the `rvest` library. This makes it easier to download a website, and to then navigate the html to find the aspects that we are interested in. You should create a new project in a new folder (File -> New Project). Within that new folder you should make three new folders: `inputs`, `outputs`, and `scripts.`

In the scripts folder you should write and save a script along these lines. This script loads the libraries that we need, then visits my website, and saves a local copy.



```r
#### Contact details ####
# Title: Get data from rohanalexander.com
# Purpose: This script gets data from Rohan's website about the books that he 
# owns. It calls his website and then saves the dataset to inputs.
# Author: Rohan Alexander
# Contact: rohan.alexander@utoronto.ca
# Last updated: 20 May 2020


#### Set up workspace ####
library(rvest)
library(tidyverse)


#### Get html ####
rohans_data <- read_html("https://rohanalexander.com/bookshelf.html")
# This takes a website as an input and will read it into R, in the same way that we 
# can read a, say, CSV into R.

write_html(rohans_data, "inputs/my_website/raw_data.html") 
# Always save your raw dataset as soon as you get it so that you have a record 
# of it. This is the equivalent of, say, write_csv() that we have used earlier.
```



### Clean

Now we need to navigate the HTML to get the aspects that we want, and to then put them into some sensible structure. I always try to get the data into a tibble as early as possible. While it's possible to work with the nested data, I move to a tibble so that the usual verbs that I'm used to can be used.

In the scripts folder you should write and save a new R script along these lines. First, we need to add the top matter, read in the libraries and the data that we scraped.


```r
#### Contact details ####
# Title: Clean data from rohanaledander.com
# Purpose: This script cleans data that was downloaded in 01-get_data.R.
# Author: Rohan Alexander
# Contact: rohan.alexander@utoronto.ca
# Pre-requisites: Need to have run 01_get_data.R and have saved the data.
# Last updated: 20 May 2020


#### Set up workspace ####
library(tidyverse)
library(rvest)

rohans_data <- read_html("inputs/my_website/raw_data.html")

rohans_data
#> {html_document}
#> <html xmlns="http://www.w3.org/1999/xhtml" lang="" xml:lang="">
#> [1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 ...
#> [2] <body>\n\n<!--radix_placeholder_front_matter-->\n\n<script id="distill-fr ...
```


Now we need to identify the data that we are interested in using html tags and convert it to a tibble. If you look at the website, then you should notice that we are likely trying to focus on list items (Figure \@ref(fig:rohansbooks)).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/rohansbooks.png" alt="Some of Rohan's books" width="90%" />
<p class="caption">(\#fig:rohansbooks)Some of Rohan's books</p>
</div>

Let's look at the source (Figure \@ref(fig:rohanssourceone)).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/sourcetop.png" alt="Source code for top of the page" width="90%" />
<p class="caption">(\#fig:rohanssourceone)Source code for top of the page</p>
</div>

There's a lot of debris, but scrolling down we eventually get to a list (Figure \@ref(fig:rohanssourcetwo)).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/sourcelist.png" alt="Source code for list" width="90%" />
<p class="caption">(\#fig:rohanssourcetwo)Source code for list</p>
</div>


The tag for a list item is 'li', so we modify the earlier code to focus on that and to get the text.


```r
#### Clean data ####
# Identify the lines that have books on them based on the list html tag
text_data <- rohans_data %>%
  html_nodes("li") %>%
  html_text()

all_books <- tibble(books = text_data)

head(all_books)
#> # A tibble: 6 × 1
#>   books                                                                         
#>   <chr>                                                                         
#> 1 "-“A Little Life”, Hanya Yanighara. Recommended by Lauren."                   
#> 2 "“The Andromeda Strain”, Michael Crichton."                                   
#> 3 "“Is There Life After Housework”, Don Aslett.\nGot given this at the Museum o…
#> 4 "“The Chosen”, Chaim Potok."                                                  
#> 5 "“The Forsyth Saga”, John Galsworthy."                                        
#> 6 "“Freakonomics”, Steven Levitt and Stephen Dubner."
```

We now need to clean the data. First we want to separate the title and the author


```r
# All content is just one string, so need to separate title and author
all_books <-
  all_books %>%
  separate(books, into = c("title", "author"), sep = "”")

# Remove leading comma and clean up the titles a little
all_books <-
  all_books %>%
  mutate(author = str_remove_all(author, "^, "),
         author = str_squish(author),
         title = str_remove(title, "“"),
         title = str_remove(title, "^-")
         )

head(all_books)
#> # A tibble: 6 × 2
#>   title                         author                                          
#>   <chr>                         <chr>                                           
#> 1 A Little Life                 Hanya Yanighara. Recommended by Lauren.         
#> 2 The Andromeda Strain          Michael Crichton.                               
#> 3 Is There Life After Housework Don Aslett. Got given this at the Museum of Cle…
#> 4 The Chosen                    Chaim Potok.                                    
#> 5 The Forsyth Saga              John Galsworthy.                                
#> 6 Freakonomics                  Steven Levitt and Stephen Dubner.
```

Finally, some specific cleaning is needed.


```r
# Some authors have comments after their name, so need to get rid of them, although there are some exceptions that will not work
# J. K. Rowling.
# M. Mitchell Waldrop.
# David A. Price
all_books <-
  all_books %>%
  mutate(author = str_replace_all(author,
                              c("J. K. Rowling." = "J K Rowling.",
                                "M. Mitchell Waldrop." = "M Mitchell Waldrop.",
                                "David A. Price" = "David A Price")
                              )
         ) %>%
  separate(author, into = c("author_correct", "throw_away"), sep = "\\.", extra = "drop") %>%
  select(-throw_away) %>%
  rename(author = author_correct)

# Some books have multiple authors, so need to separate them
# One has multiple authors:
# "Daniela Witten, Gareth James, Robert Tibshirani, and Trevor Hastie"
all_books <-
  all_books %>%
  mutate(author = str_replace(author,
                              "Daniela Witten, Gareth James, Robert Tibshirani, and Trevor Hastie",
                              "Daniela Witten and Gareth James and Robert Tibshirani and Trevor Hastie")) %>%
  separate(author, into = c("author_first", "author_second", "author_third", "author_fourth"), sep = " and ", fill = "right") %>%
  pivot_longer(cols = starts_with("author_"),
               names_to = "author_position",
               values_to = "author") %>%
  select(-author_position) %>%
  filter(!is.na(author))

head(all_books)
#> # A tibble: 6 × 2
#>   title                         author          
#>   <chr>                         <chr>           
#> 1 A Little Life                 Hanya Yanighara 
#> 2 The Andromeda Strain          Michael Crichton
#> 3 Is There Life After Housework Don Aslett      
#> 4 The Chosen                    Chaim Potok     
#> 5 The Forsyth Saga              John Galsworthy 
#> 6 Freakonomics                  Steven Levitt
```

It looks there is some at the end because I have a best of. I'll just get rid of those manually because it's not the focus.


```r
all_books <- 
  all_books %>% 
  slice(1:118)
```


### Explore

Finally, just because we have the data now, so we may as well try to do something with it, let's look at the distribution of the first letter of the author names. 


```r
all_books %>% 
  mutate(
    first_letter = str_sub(author, 1, 1)
    ) %>% 
  group_by(first_letter) %>% 
  count()
#> # A tibble: 21 × 2
#> # Groups:   first_letter [21]
#>    first_letter     n
#>    <chr>        <int>
#>  1 ""               1
#>  2 "A"              8
#>  3 "B"              5
#>  4 "C"              4
#>  5 "D"             10
#>  6 "E"              3
#>  7 "F"              1
#>  8 "G"             10
#>  9 "H"              6
#> 10 "I"              1
#> # … with 11 more rows
```











## Case study - Canadian Prime Ministers


### Introduction

In this case study we are interested in how long Canadian prime ministers lived, based on the year that they were born. We will scrape data from Wikipedia, clean it, and then make a graph.

The key library that we will use for scraping is `rvest`. This adds a lot of functions that will make life easier. That said, every time you scrape a website things will change. Each scrape will largely be bespoke, even if you can borrow some code from earlier projects that you have completed. It is completely normal to feel frustrated at times. It helps to begin with an end in mind. 

To that end, let's generate some simulated data. Ideally, we want a table that has a row for each prime minister, a column for their name, and a column each for the birth and death years. If they are still alive, then that death year can be empty. We know that birth and death years should be somewhere between 1700 and 1990, and that death year should be larger than birth year. Finally, we also know that the years should be integers, and the names should be characters. So, we want something that looks roughly like this:


```r
library(babynames)
library(tidyverse)

simulated_dataset <- 
  tibble(prime_minister = sample(x = babynames %>% filter(prop > 0.01) %>% 
                                   select(name) %>% unique() %>% unlist(), 
                                 size = 10, replace = FALSE),
         birth_year = sample(x = c(1700:1990), size = 10, replace = TRUE),
         years_lived = sample(x = c(50:100), size = 10, replace = TRUE),
         death_year = birth_year + years_lived) %>% 
  select(prime_minister, birth_year, death_year, years_lived) %>% 
  arrange(birth_year)

head(simulated_dataset)
#> # A tibble: 6 × 4
#>   prime_minister birth_year death_year years_lived
#>   <chr>               <int>      <int>       <int>
#> 1 Arthur               1752       1818          66
#> 2 Lillian              1753       1808          55
#> 3 Marie                1757       1809          52
#> 4 Michelle             1800       1851          51
#> 5 Harry                1807       1886          79
#> 6 Lauren               1837       1898          61
```

One of the advantages of generating a simulated dataset is that if you are working in groups then one person can start making the graph, using the simulated dataset, while the other person gathers the data. In terms of a graph, we want something like Figure \@ref(fig:pmsgraphexample).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/IMG_4185.jpeg" alt="Sketch of planned graph." width="90%" />
<p class="caption">(\#fig:pmsgraphexample)Sketch of planned graph.</p>
</div>




### Gather

We are starting with a question that is of interest, which how long each Canadian prime minister lived. As such, we need to identify a source of data While there are likely to be plenty of data sources that have the births and deaths of each prime minister, we want one that we can trust, and as we are going to be scraping, we want one that has some structure to it. The Wikipedia page (https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Canada) fits both these criteria. As it is a popular page the information is more likely to be correct, and the data are available in a table.

We load the library and then we read in the data from the relevant page. The key function here is `read_html()`, which you can use in the same way as, say, `read_csv()`, except that it takes a html page as an input. Once you call `read_html()` then the page is downloaded to your own computer, and it is usually a good idea to save this, using `write_html()` as it is your raw data. Saving it also means that we don't have to keep visiting the website when we want to start again with our cleaning, and so it is part of being polite. However, it is likely not our property (in the case of Wikipedia, we might be okay), and so you should probably not share it. 


```r
library(rvest)
```


```r
raw_data <- read_html("https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Canada")
write_html(raw_data, "inputs/wiki/pms.html") # Note that we save the file as a html file.
```


### Clean

Websites are made up of html, which is a markup language. We are looking for patterns in the mark-up that we can use to help us get closer to the data that we want. This is an iterative process and requires a lot of trial and error. Even simple examples will take time. You can look at the html by using a browser, right clicking, and then selecting `view page source`. Similarly, you could open the html file using a text editor.

#### By inspection

We are looking for patterns that we can use to select the information that is of interest - names, birth year, and death year. When we look at the html it looks like there is something going on with `<tr>`, and then `<td>` (thanks to Thomas Rosenthal for identifying this). We select those nodes using `html_nodes()`, which takes the tags as an input. If you only want the first one then there is a singular version, `html_node()`.


```r
# Read in our saved data
raw_data <- read_html("inputs/wiki/pms.html")

# We can parse tags in order
parse_data_inspection <- 
  raw_data %>% 
  html_nodes("tr") %>% 
  html_nodes("td") %>% 
  html_text() # html_text removes any remaining html tags

# But this code does exactly the same thing - the nodes are just pushed into 
# the one function call
parse_data_inspection <- 
  raw_data %>% 
  html_nodes("tr td") %>% 
  html_text()

head(parse_data_inspection)
#> [1] "Abbreviation key:"                                                                                                                                                                                                                              
#> [2] "No.: Incumbent number, Min.: Ministry, Refs: References\n"                                                                                                                                                                                      
#> [3] "Colour key:"                                                                                                                                                                                                                                    
#> [4] "\n\n  Liberal Party of Canada\n \n  Historical Conservative parties (including Liberal-Conservative, Conservative (Historical),     Unionist, National Liberal and Conservative, Progressive Conservative) \n  Conservative Party of Canada\n\n"
#> [5] "Provinces key:"                                                                                                                                                                                                                                 
#> [6] "AB: Alberta, BC: British Columbia, MB: Manitoba, NS: Nova Scotia,ON: Ontario, QC: Quebec, SK: Saskatchewan\n"
```

At this point our data is in a character vector, we want to convert it to a table, and reduce the data down to just the information that we want. The key that is going to allow us to do this is the fact that there seems to be a blank line (which in html is denoted by `\n`) before the key information that we need. So, once we identify that line then we can filter to just the line below it!


```r
parsed_data <- 
  tibble(raw_text = parse_data_inspection) %>% # Convert the character vector to a table
  mutate(is_PM = if_else(raw_text == "\n\n", 1, 0), # Look for the blank line that is 
         # above the row that we want
         is_PM = lag(is_PM, n = 1)) %>% # Identify the actual row that we want
  filter(is_PM == 1) # Just get the rows that we want

head(parsed_data)
#> # A tibble: 6 × 2
#>   raw_text                                                                 is_PM
#>   <chr>                                                                    <dbl>
#> 1 "\nSir John A. MacDonald(1815–1891)MP for Kingston, ON\n"                    1
#> 2 "\nAlexander Mackenzie(1822–1892)MP for Lambton, ON\n"                       1
#> 3 "\nSir John A. MacDonald(1815–1891)MP for Victoria, BC until 1882MP for…     1
#> 4 "\nSir John Abbott(1821–1893)Senator for Quebec\n"                           1
#> 5 "\nSir John Thompson(1845–1894)MP for Antigonish, NS\n"                      1
#> 6 "\nSir Mackenzie Bowell(1823–1917)Senator for Ontario\n"                     1
```


#### Using the selector gadget

If you are comfortable with html then you might be able to see patterns, but one tool that may help is the SelectorGadget: https://cran.r-project.org/web/packages/rvest/vignettes/selectorgadget.html. This allows you to pick and choose the elements that you want, and then gives you the input to give to `html_nodes()` (Figure \@ref(fig:selectorgadget))

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/selectorgadget.png" alt="Using the Selector Gadget to identify the tag, as at 13 March 2020." width="90%" />
<p class="caption">(\#fig:selectorgadget)Using the Selector Gadget to identify the tag, as at 13 March 2020.</p>
</div>





```r
# Read in our saved data
raw_data <- read_html("inputs/wiki/pms.html")

# We can parse tags in order
parse_data_selector_gadget <- 
  raw_data %>% 
  html_nodes("td:nth-child(3)") %>% 
  html_text() # html_text removes any remaining html tags

head(parse_data_selector_gadget)
#> [1] "\nSir John A. MacDonald(1815–1891)MP for Kingston, ON\n"                                                            
#> [2] "\nAlexander Mackenzie(1822–1892)MP for Lambton, ON\n"                                                               
#> [3] "\nSir John A. MacDonald(1815–1891)MP for Victoria, BC until 1882MP for Carleton, ON until 1887MP for Kingston, ON\n"
#> [4] "\nSir John Abbott(1821–1893)Senator for Quebec\n"                                                                   
#> [5] "\nSir John Thompson(1845–1894)MP for Antigonish, NS\n"                                                              
#> [6] "\nSir Mackenzie Bowell(1823–1917)Senator for Ontario\n"
```

In this case there is one prime minister - Robert Borden - who changed party and we would need to filter away that row: `\nUnionist Party\n"`.


#### Clean data

Now that we have the parsed data, we need to clean it to match what we wanted. In particular we want a names column, as well as columns for birth year and death year. We will use `separate()` to take advantage of the fact that it looks like the dates are distinguished by brackets.


```r
initial_clean <- 
  parsed_data %>% 
  separate(raw_text, 
            into = c("Name", "not_name"), 
            sep = "\\(",
            remove = FALSE) %>% # The remove = FALSE option here means that we 
  # keep the original column that we are separating.
  separate(not_name, 
            into = c("Date", "all_the_rest"), 
            sep = "\\)",
            remove = FALSE)

head(initial_clean)
#> # A tibble: 6 × 6
#>   raw_text           Name     not_name          Date  all_the_rest         is_PM
#>   <chr>              <chr>    <chr>             <chr> <chr>                <dbl>
#> 1 "\nSir John A. Ma… "\nSir … "1815–1891)MP fo… 1815… "MP for Kingston, O…     1
#> 2 "\nAlexander Mack… "\nAlex… "1822–1892)MP fo… 1822… "MP for Lambton, ON…     1
#> 3 "\nSir John A. Ma… "\nSir … "1815–1891)MP fo… 1815… "MP for Victoria, B…     1
#> 4 "\nSir John Abbot… "\nSir … "1821–1893)Senat… 1821… "Senator for Quebec…     1
#> 5 "\nSir John Thomp… "\nSir … "1845–1894)MP fo… 1845… "MP for Antigonish,…     1
#> 6 "\nSir Mackenzie … "\nSir … "1823–1917)Senat… 1823… "Senator for Ontari…     1
```

Finally, we need to clean up the columns.


```r
cleaned_data <- 
  initial_clean %>% 
  select(Name, Date) %>% 
  separate(Date, into = c("Birth", "Died"), sep = "–", remove = FALSE) %>% # The 
  # PMs who have died have their birth and death years separated by a hyphen, but 
  # you need to be careful with the hyphen as it seems to be a slightly odd type of 
  # hyphen and you need to copy/paste it.
  mutate(Birth = str_remove(Birth, "b. ")) %>% # Alive PMs have slightly different format
  select(-Date) %>% 
  mutate(Name = str_remove(Name, "\n")) %>% # Remove some html tags that remain
  mutate_at(vars(Birth, Died), ~as.integer(.)) %>% # Change birth and death to integers
  mutate(Age_at_Death = Died - Birth) %>%  # Add column of the number of years they lived
  distinct() # Some of the PMs had two goes at it.

head(cleaned_data)
#> # A tibble: 6 × 4
#>   Name                  Birth  Died Age_at_Death
#>   <chr>                 <int> <int>        <int>
#> 1 Sir John A. MacDonald  1815  1891           76
#> 2 Alexander Mackenzie    1822  1892           70
#> 3 Sir John Abbott        1821  1893           72
#> 4 Sir John Thompson      1845  1894           49
#> 5 Sir Mackenzie Bowell   1823  1917           94
#> 6 Sir Charles Tupper     1821  1915           94
```


### Explore

At this point we'd like to make a graph that illustrates how long each prime minister lived. If they are still alive then we would like them to run to the end, but we would like to colour them differently.


```r
cleaned_data %>% 
  mutate(still_alive = if_else(is.na(Died), "Yes", "No"),
         Died = if_else(is.na(Died), as.integer(2020), Died)) %>% 
  mutate(Name = as_factor(Name)) %>% 
  ggplot(aes(x = Birth, 
             xend = Died,
             y = Name,
             yend = Name, 
             color = still_alive)) +
  geom_segment() +
  labs(x = "Year of birth",
       y = "Prime minister",
       color = "PM is alive",
       title = "Canadian Prime Minister, by year of birth") +
  theme_minimal() +
  scale_color_brewer(palette = "Set1")
```

<img src="20-gather_files/figure-html/unnamed-chunk-35-1.png" width="672" />
















## PDFs



### Introduction

In contrast to an API, a PDF is usually only produced for human (not computer) consumption. The nice thing about PDFs is that they are static and constant. And it is nice that they make data available at all. But the trade-off is that:

- It is not overly useful to do larger-scale statistical analysis.
- We don't know how the PDF was put together so we don't know whether we can trust it.
- We can't manipulate the data to get results that we are interested in.

Indeed, sometimes governments publish data as PDFs because they don't actually want you to be able to analyse it! Being able to get data from PDFs opens up a large number of datasets for you, some of which we'll see in this chapter. 

There are two important aspects to keep in mind when approaching a PDF with a mind to extracting data from it:

1. Begin with an end in mind. Planning and then literally sketching out what you want from a final dataset/graph/paper stops you wasting time and keeps you focused. 
2. Start simple, then iterate. The quickest way to make a complicated model is often to first build a simple model and then complicate it. Start with just trying to get one page of the PDF working or even just one line. Then iterate from there.

In this chapter we start by walking through several examples and then go through three case studies of varying difficulty.


### Getting started

Figure \@ref(fig:firstpdfexample) is a PDF that consists of just the first sentence from Jane Eyre taken from Project Gutenberg @janeeyre.

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/inputs/pdfs/first_example.png" alt="First sentence of Jane Eyre" width="90%" />
<p class="caption">(\#fig:firstpdfexample)First sentence of Jane Eyre</p>
</div>

We will use the package `pdftools` @citepdftools to get the text in this one page PDF into R.


```r
# install.packages("pdftools")
library(pdftools)
library(tidyverse)

first_example <- pdftools::pdf_text("inputs/pdfs/first_example.pdf")

first_example
#> [1] "There was no possibility of taking a walk that day.\n"

class(first_example)
#> [1] "character"
```

We can see that the PDF has been correctly read in, as a character vector.

We will now try a slightly more complicated example that consists of the first few paragraphs of Jane Eyre (Figure \@ref(fig:secondpdfexample)). Also notice that now we have the chapter heading as well.

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/inputs/pdfs/second_example.png" alt="First few paragraphs of Jane Eyre" width="90%" />
<p class="caption">(\#fig:secondpdfexample)First few paragraphs of Jane Eyre</p>
</div>

We use the same function as before.


```r
second_example <- pdftools::pdf_text("inputs/pdfs/second_example.pdf")

second_example
#> [1] "CHAPTER I\nThere was no possibility of taking a walk that day. We had been wandering, indeed, in the\nleafless shrubbery an hour in the morning; but since dinner (Mrs. Reed, when there was no\ncompany, dined early) the cold winter wind had brought with it clouds so sombre, and a rain so\npenetrating, that further out-door exercise was now out of the question.\n\nI was glad of it: I never liked long walks, especially on chilly afternoons: dreadful to me was the\ncoming home in the raw twilight, with nipped fingers and toes, and a heart saddened by the\nchidings of Bessie, the nurse, and humbled by the consciousness of my physical inferiority to\nEliza, John, and Georgiana Reed.\n\nThe said Eliza, John, and Georgiana were now clustered round their mama in the drawing-room:\nshe lay reclined on a sofa by the fireside, and with her darlings about her (for the time neither\nquarrelling nor crying) looked perfectly happy. Me, she had dispensed from joining the group;\nsaying, “She regretted to be under the necessity of keeping me at a distance; but that until she\nheard from Bessie, and could discover by her own observation, that I was endeavouring in good\nearnest to acquire a more sociable and childlike disposition, a more attractive and sprightly\nmanner—something lighter, franker, more natural, as it were—she really must exclude me from\nprivileges intended only for contented, happy, little children.”\n\n“What does Bessie say I have done?” I asked.\n\n“Jane, I don’t like cavillers or questioners; besides, there is something truly forbidding in a child\ntaking up her elders in that manner. Be seated somewhere; and until you can speak pleasantly,\nremain silent.”\n\nA breakfast-room adjoined the drawing-room, I slipped in there. It contained a bookcase: I soon\npossessed myself of a volume, taking care that it should be one stored with pictures. I mounted\ninto the window-seat: gathering up my feet, I sat cross-legged, like a Turk; and, having drawn the\nred moreen curtain nearly close, I was shrined in double retirement.\n\nFolds of scarlet drapery shut in my view to the right hand; to the left were the clear panes of\nglass, protecting, but not separating me from the drear November day. At intervals, while\nturning over the leaves of my book, I studied the aspect of that winter afternoon. Afar, it offered\na pale blank of mist and cloud; near a scene of wet lawn and storm-beat shrub, with ceaseless\nrain sweeping away wildly before a long and lamentable blast.\n"

class(second_example)
#> [1] "character"
```

Again, we have a character vector. The end of each line is signalled by '\\n', but other than that it looks pretty good.

Finally, we consider the first two pages.

We use the same function as before.


```r
third_example <- pdftools::pdf_text("inputs/pdfs/third_example.pdf")

third_example
#> [1] "CHAPTER I\nThere was no possibility of taking a walk that day. We had been wandering, indeed, in the\nleafless shrubbery an hour in the morning; but since dinner (Mrs. Reed, when there was no\ncompany, dined early) the cold winter wind had brought with it clouds so sombre, and a rain so\npenetrating, that further out-door exercise was now out of the question.\n\nI was glad of it: I never liked long walks, especially on chilly afternoons: dreadful to me was the\ncoming home in the raw twilight, with nipped fingers and toes, and a heart saddened by the\nchidings of Bessie, the nurse, and humbled by the consciousness of my physical inferiority to\nEliza, John, and Georgiana Reed.\n\nThe said Eliza, John, and Georgiana were now clustered round their mama in the drawing-room:\nshe lay reclined on a sofa by the fireside, and with her darlings about her (for the time neither\nquarrelling nor crying) looked perfectly happy. Me, she had dispensed from joining the group;\nsaying, “She regretted to be under the necessity of keeping me at a distance; but that until she\nheard from Bessie, and could discover by her own observation, that I was endeavouring in good\nearnest to acquire a more sociable and childlike disposition, a more attractive and sprightly\nmanner—something lighter, franker, more natural, as it were—she really must exclude me from\nprivileges intended only for contented, happy, little children.”\n\n“What does Bessie say I have done?” I asked.\n\n“Jane, I don’t like cavillers or questioners; besides, there is something truly forbidding in a child\ntaking up her elders in that manner. Be seated somewhere; and until you can speak pleasantly,\nremain silent.”\n\nA breakfast-room adjoined the drawing-room, I slipped in there. It contained a bookcase: I soon\npossessed myself of a volume, taking care that it should be one stored with pictures. I mounted\ninto the window-seat: gathering up my feet, I sat cross-legged, like a Turk; and, having drawn the\nred moreen curtain nearly close, I was shrined in double retirement.\n\nFolds of scarlet drapery shut in my view to the right hand; to the left were the clear panes of\nglass, protecting, but not separating me from the drear November day. At intervals, while\nturning over the leaves of my book, I studied the aspect of that winter afternoon. Afar, it offered\na pale blank of mist and cloud; near a scene of wet lawn and storm-beat shrub, with ceaseless\nrain sweeping away wildly before a long and lamentable blast.\n\nI returned to my book—Bewick’s History of British Birds: the letterpress thereof I cared little\nfor, generally speaking; and yet there were certain introductory pages that, child as I was, I could\nnot pass quite as a blank. They were those which treat of the haunts of sea-fowl; of “the solitary\nrocks and promontories” by them only inhabited; of the coast of Norway, studded with isles from\nits southern extremity, the Lindeness, or Naze, to the North Cape—\n\n“Where the Northern Ocean, in vast whirls,\nBoils round the naked, melancholy isles\n"
#> [2] "Of farthest Thule; and the Atlantic surge\nPours in among the stormy Hebrides.”\n\nNor could I pass unnoticed the suggestion of the bleak shores of Lapland, Siberia, Spitzbergen,\nNova Zembla, Iceland, Greenland, with “the vast sweep of the Arctic Zone, and those forlorn\nregions of dreary space,—that reservoir of frost and snow, where firm fields of ice, the\naccumulation of centuries of winters, glazed in Alpine heights above heights, surround the pole,\nand concentre the multiplied rigours of extreme cold.” Of these death-white realms I formed an\nidea of my own: shadowy, like all the half-comprehended notions that float dim through\nchildren’s brains, but strangely impressive. The words in these introductory pages connected\nthemselves with the succeeding vignettes, and gave significance to the rock standing up alone in\na sea of billow and spray; to the broken boat stranded on a desolate coast; to the cold and ghastly\nmoon glancing through bars of cloud at a wreck just sinking.\n\nI cannot tell what sentiment haunted the quite solitary churchyard, with its inscribed headstone;\nits gate, its two trees, its low horizon, girdled by a broken wall, and its newly-risen crescent,\nattesting the hour of eventide.\n\nThe two ships becalmed on a torpid sea, I believed to be marine phantoms.\n\nThe fiend pinning down the thief’s pack behind him, I passed over quickly: it was an object of\nterror.\n\nSo was the black horned thing seated aloof on a rock, surveying a distant crowd surrounding a\ngallows.\n\nEach picture told a story; mysterious often to my undeveloped understanding and imperfect\nfeelings, yet ever profoundly interesting: as interesting as the tales Bessie sometimes narrated on\nwinter evenings, when she chanced to be in good humour; and when, having brought her ironing-\ntable to the nursery hearth, she allowed us to sit about it, and while she got up Mrs. Reed’s lace\nfrills, and crimped her nightcap borders, fed our eager attention with passages of love and\nadventure taken from old fairy tales and other ballads; or (as at a later period I discovered) from\nthe pages of Pamela, and Henry, Earl of Moreland.\n\nWith Bewick on my knee, I was then happy: happy at least in my way. I feared nothing but\ninterruption, and that came too soon. The breakfast-room door opened.\n\n“Boh! Madam Mope!” cried the voice of John Reed; then he paused: he found the room\napparently empty.\n\n“Where the dickens is she!” he continued. “Lizzy! Georgy! (calling to his sisters) Joan is not\nhere: tell mama she is run out into the rain—bad animal!”\n\n“It is well I drew the curtain,” thought I; and I wished fervently he might not discover my hiding-\nplace: nor would John Reed have found it out himself; he was not quick either of vision or\nconception; but Eliza just put her head in at the door, and said at once—\n"

class(third_example)
#> [1] "character"
```

Now, notice that the first page is the first element of the character vector and the second page is the second element. 

As we're most familiar with rectangular data we'll try to get it into that format as quickly as possible. And then we can use our regular tools to deal with it.

First we want to convert the character vector into a tibble. At this point we may like to add page numbers as well.


```r
jane_eyre <- tibble(raw_text = third_example,
                    page_number = c(1:2))
```

We probably now want to separate the lines so that each line is an observation. We can do that by looking for the '\\n' remembering that we need to escape the backslash as it's a special character.


```r
jane_eyre <- separate_rows(jane_eyre, raw_text, sep = "\\n", convert = FALSE)
head(jane_eyre)
#> # A tibble: 6 × 2
#>   raw_text                                                           page_number
#>   <chr>                                                                    <int>
#> 1 "CHAPTER I"                                                                  1
#> 2 "There was no possibility of taking a walk that day. We had been …           1
#> 3 "leafless shrubbery an hour in the morning; but since dinner (Mrs…           1
#> 4 "company, dined early) the cold winter wind had brought with it c…           1
#> 5 "penetrating, that further out-door exercise was now out of the q…           1
#> 6 ""                                                                           1
```







## Case-study: US Total Fertility Rate, by state and year (2000-2018)

### Introduction

If you're married to a demographer it is not too long until you are asked to look at a US Department of Health and Human Services Vital Statistics Report. In this case we are interested in trying to get the total fertility rate (the average number of births per woman assuming that woman experience the current age-specific fertility rates throughout their reproductive years)^[And if you'd like to know more about this then I'd recommend starting a PhD with [Monica Alexander](https://www.monicaalexander.com/).] for each state for nineteen years. Annoyingly, the US persists in only making this data available in PDFs, but it makes a nice case study.


In the case of the year 2000 the table that we are interested in is on page 40 of a PDF that is available https://www.cdc.gov/nchs/data/nvsr/nvsr50/nvsr50_05.pdf and it is the column labelled: "Total fertility rate" (Figure \@ref(fig:dhsexample)). 

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/dhs_example.png" alt="Example Vital Statistics Report, from 2000" width="90%" />
<p class="caption">(\#fig:dhsexample)Example Vital Statistics Report, from 2000</p>
</div>


### Begin with an end in mind

The first step when getting data out of a PDF is to sketch out what you eventually want. A PDF typically contains a lot of information, and so it is handy to be very clear about what you need. This helps keep you focused, and prevents scope creep, but it is also helpful when thinking about data checks. Literally write down on paper what you have in mind.

In this case, what is needed is a table with a column for state, year and TFR (Figure \@ref(fig:tfrdesired)). 

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/tfr_desired.jpeg" alt="Desired output from the PDF" width="90%" />
<p class="caption">(\#fig:tfrdesired)Desired output from the PDF</p>
</div>



### Start simple, then iterate. 

There are 19 different PDFs, and we are interested in a particular column in a particular table in each of them. Unfortunately, there is nothing magical about what is coming. This first step requires working out the link for each, and the page and column name that is of interest. In the end, this looks like this.


```r
monicas_data <- read_csv("inputs/tfr_tables_info.csv")

monicas_data %>% 
  select(year, page, table, column_name, url) %>% 
  gt()
```

```{=html}
<div id="jvfdyxzdyo" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#jvfdyxzdyo .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
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

#jvfdyxzdyo .gt_heading {
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

#jvfdyxzdyo .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#jvfdyxzdyo .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#jvfdyxzdyo .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jvfdyxzdyo .gt_col_headings {
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

#jvfdyxzdyo .gt_col_heading {
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

#jvfdyxzdyo .gt_column_spanner_outer {
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

#jvfdyxzdyo .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#jvfdyxzdyo .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#jvfdyxzdyo .gt_column_spanner {
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

#jvfdyxzdyo .gt_group_heading {
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

#jvfdyxzdyo .gt_empty_group_heading {
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

#jvfdyxzdyo .gt_from_md > :first-child {
  margin-top: 0;
}

#jvfdyxzdyo .gt_from_md > :last-child {
  margin-bottom: 0;
}

#jvfdyxzdyo .gt_row {
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

#jvfdyxzdyo .gt_stub {
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

#jvfdyxzdyo .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jvfdyxzdyo .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#jvfdyxzdyo .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jvfdyxzdyo .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#jvfdyxzdyo .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#jvfdyxzdyo .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jvfdyxzdyo .gt_footnotes {
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

#jvfdyxzdyo .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#jvfdyxzdyo .gt_sourcenotes {
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

#jvfdyxzdyo .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#jvfdyxzdyo .gt_left {
  text-align: left;
}

#jvfdyxzdyo .gt_center {
  text-align: center;
}

#jvfdyxzdyo .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#jvfdyxzdyo .gt_font_normal {
  font-weight: normal;
}

#jvfdyxzdyo .gt_font_bold {
  font-weight: bold;
}

#jvfdyxzdyo .gt_font_italic {
  font-style: italic;
}

#jvfdyxzdyo .gt_super {
  font-size: 65%;
}

#jvfdyxzdyo .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">page</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">table</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">column_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">url</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_right">2000</td>
<td class="gt_row gt_right">40</td>
<td class="gt_row gt_right">10</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr50/nvsr50_05.pdf</td></tr>
    <tr><td class="gt_row gt_right">2001</td>
<td class="gt_row gt_right">41</td>
<td class="gt_row gt_right">10</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr51/nvsr51_02.pdf</td></tr>
    <tr><td class="gt_row gt_right">2002</td>
<td class="gt_row gt_right">46</td>
<td class="gt_row gt_right">10</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr52/nvsr52_10.pdf</td></tr>
    <tr><td class="gt_row gt_right">2003</td>
<td class="gt_row gt_right">45</td>
<td class="gt_row gt_right">10</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr54/nvsr54_02.pdf</td></tr>
    <tr><td class="gt_row gt_right">2004</td>
<td class="gt_row gt_right">52</td>
<td class="gt_row gt_right">11</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr55/nvsr55_01.pdf</td></tr>
    <tr><td class="gt_row gt_right">2005</td>
<td class="gt_row gt_right">52</td>
<td class="gt_row gt_right">11</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr56/nvsr56_06.pdf</td></tr>
    <tr><td class="gt_row gt_right">2006</td>
<td class="gt_row gt_right">49</td>
<td class="gt_row gt_right">11</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr57/nvsr57_07.pdf</td></tr>
    <tr><td class="gt_row gt_right">2007</td>
<td class="gt_row gt_right">41</td>
<td class="gt_row gt_right">11</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr58/nvsr58_24.pdf</td></tr>
    <tr><td class="gt_row gt_right">2008</td>
<td class="gt_row gt_right">43</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr59/nvsr59_01.pdf</td></tr>
    <tr><td class="gt_row gt_right">2009</td>
<td class="gt_row gt_right">43</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr60/nvsr60_01.pdf</td></tr>
    <tr><td class="gt_row gt_right">2010</td>
<td class="gt_row gt_right">42</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr61/nvsr61_01.pdf</td></tr>
    <tr><td class="gt_row gt_right">2011</td>
<td class="gt_row gt_right">40</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr62/nvsr62_01.pdf</td></tr>
    <tr><td class="gt_row gt_right">2012</td>
<td class="gt_row gt_right">38</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr62/nvsr62_09.pdf</td></tr>
    <tr><td class="gt_row gt_right">2013</td>
<td class="gt_row gt_right">37</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr64/nvsr64_01.pdf</td></tr>
    <tr><td class="gt_row gt_right">2014</td>
<td class="gt_row gt_right">38</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr64/nvsr64_12.pdf</td></tr>
    <tr><td class="gt_row gt_right">2015</td>
<td class="gt_row gt_right">42</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr66/nvsr66_01.pdf</td></tr>
    <tr><td class="gt_row gt_right">2016</td>
<td class="gt_row gt_right">29</td>
<td class="gt_row gt_right">8</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr67/nvsr67_01.pdf</td></tr>
    <tr><td class="gt_row gt_right">2016</td>
<td class="gt_row gt_right">30</td>
<td class="gt_row gt_right">8</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr67/nvsr67_01.pdf</td></tr>
    <tr><td class="gt_row gt_right">2017</td>
<td class="gt_row gt_right">23</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr67/nvsr67_08-508.pdf</td></tr>
    <tr><td class="gt_row gt_right">2017</td>
<td class="gt_row gt_right">24</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr67/nvsr67_08-508.pdf</td></tr>
    <tr><td class="gt_row gt_right">2018</td>
<td class="gt_row gt_right">23</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Total fertility rate</td>
<td class="gt_row gt_left">https://www.cdc.gov/nchs/data/nvsr/nvsr68/nvsr68_13-508.pdf</td></tr>
  </tbody>
  
  
</table>
</div>
```

The first step is to get some code that works for one of them. I'll step through the code in a lot more detail than normal because we're going to use these pieces a lot. 

We will choose the year 2000. We first download the data and save it.


```r
download.file(url = monicas_data$url[1], 
              destfile = "inputs/pdfs/dhs/year_2000.pdf")
```

We now want to read the PDF in as a character vector.


```r
dhs_2000 <- pdftools::pdf_text("inputs/pdfs/dhs/year_2000.pdf")
```

Convert it to a tibble, so that we can use familiar verbs on it.


```r
dhs_2000 <- tibble(raw_data = dhs_2000)

head(dhs_2000)
#> # A tibble: 6 × 1
#>   raw_data                                                                      
#>   <chr>                                                                         
#> 1 "Volume 50, Number 5                                                         …
#> 2 "2   National Vital Statistics Report, Vol. 50, No. 5, February 12, 2002\n\n\…
#> 3 "                                                                            …
#> 4 "4   National Vital Statistics Report, Vol. 50, No. 5, February 12, 2002\n\n\…
#> 5 "                                                                            …
#> 6 "6   National Vital Statistics Report, Vol. 50, No. 5, February 12, 2002\n\n …
```

Grab the page that is of interest (remembering that each page is a element of the character vector, hence a row in the tibble).


```r
dhs_2000 <- 
  dhs_2000 %>% 
  slice(monicas_data$page[1])

head(dhs_2000)
#> # A tibble: 1 × 1
#>   raw_data                                                                      
#>   <chr>                                                                         
#> 1 "40 National Vital Statistics Report, Vol. 50, No. 5, Revised May 15, 20022\n…
```

Now we want to separate the rows.


```r
dhs_2000 <- 
  dhs_2000 %>% 
  separate_rows(raw_data, sep = "\\n", convert = FALSE)

head(dhs_2000)
#> # A tibble: 6 × 1
#>   raw_data                                                                      
#>   <chr>                                                                         
#> 1 "40 National Vital Statistics Report, Vol. 50, No. 5, Revised May 15, 20022"  
#> 2 ""                                                                            
#> 3 "Table 10. Number of births, birth rates, fertility rates, total fertility ra…
#> 4 "United States, each State and territory, 2000"                               
#> 5 "[By place of residence. Birth rates are live births per 1,000 estimated popu…
#> 6 "estimated in each area; total fertility rates are sums of birth rates for 5-…
```

Now we are searching for patterns that we can use. (If you have a lot of tables that you are interested in grabbing from PDFs then it may also be worthwhile considering the `tabulizer` package which is specifically designed for that [@citetabulizergross]. The issue is that it depends on Java and I always seem to run into trouble when I need to use Java so I avoid it when I can.)

Let's look at the first ten lines of content.


```r
dhs_2000[13:22,]
#> # A tibble: 10 × 1
#>    raw_data                                                                     
#>    <chr>                                                                        
#>  1 "                                  State                                    …
#>  2 "                                                                           …
#>  3 "                                                                           …
#>  4 ""                                                                           
#>  5 ""                                                                           
#>  6 "United States 1 ......................................................     …
#>  7 ""                                                                           
#>  8 "Alabama ...............................................................    …
#>  9 "Alaska ................................................................... …
#> 10 "Arizona .................................................................  …
```

It doesn't get much better than this:

1. We have dots separating the states from the data.
2. We have a space between each of the columns.

So we can now separate this in to separate columns. First we want to match on when there is at least two dots (remembering that the dot is a special character and so needs to be escaped).


```r
dhs_2000 <- 
  dhs_2000 %>% 
  separate(col = raw_data, 
           into = c("state", "data"), 
           sep = "\\.{2,}", 
           remove = FALSE,
           fill = "right"
           )

head(dhs_2000)
#> # A tibble: 6 × 3
#>   raw_data                              state                              data 
#>   <chr>                                 <chr>                              <chr>
#> 1 "40 National Vital Statistics Report… "40 National Vital Statistics Rep… <NA> 
#> 2 ""                                    ""                                 <NA> 
#> 3 "Table 10. Number of births, birth r… "Table 10. Number of births, birt… <NA> 
#> 4 "United States, each State and terri… "United States, each State and te… <NA> 
#> 5 "[By place of residence. Birth rates… "[By place of residence. Birth ra… <NA> 
#> 6 "estimated in each area; total ferti… "estimated in each area; total fe… <NA>
```

We get the expected warnings about the top and the bottom as they don't have multiple dots.

(Another option here is to use the `pdf_data()` function which would allow us to use location rather than delimiters.)

We can now separate the data based on spaces. There is an inconsistent number of spaces, so we first squish any example of more than one space into just one.


```r
dhs_2000 <- 
  dhs_2000 %>%
  mutate(data = str_squish(data)) %>% 
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
#> # A tibble: 6 × 10
#>   raw_data      state     data  number_of_births birth_rate fertility_rate TFR  
#>   <chr>         <chr>     <chr> <chr>            <chr>      <chr>          <chr>
#> 1 "40 National… "40 Nati… <NA>  <NA>             <NA>       <NA>           <NA> 
#> 2 ""            ""        <NA>  <NA>             <NA>       <NA>           <NA> 
#> 3 "Table 10. N… "Table 1… <NA>  <NA>             <NA>       <NA>           <NA> 
#> 4 "United Stat… "United … <NA>  <NA>             <NA>       <NA>           <NA> 
#> 5 "[By place o… "[By pla… <NA>  <NA>             <NA>       <NA>           <NA> 
#> 6 "estimated i… "estimat… <NA>  <NA>             <NA>       <NA>           <NA> 
#> # … with 3 more variables: teen_births_all <chr>, teen_births_15_17 <chr>,
#> #   teen_births_18_19 <chr>
```




This is all looking fairly great. The only thing left is to clean up.


```r
dhs_2000 <- 
  dhs_2000 %>% 
  select(state, TFR) %>% 
  slice(13:69) %>% 
  mutate(year = 2000)

dhs_2000
#> # A tibble: 57 × 3
#>    state                                                            TFR     year
#>    <chr>                                                            <chr>  <dbl>
#>  1 "                                  State                       … <NA>    2000
#>  2 "                                                              … <NA>    2000
#>  3 "                                                              … <NA>    2000
#>  4 ""                                                               <NA>    2000
#>  5 ""                                                               <NA>    2000
#>  6 "United States 1 "                                               2,130…  2000
#>  7 ""                                                               <NA>    2000
#>  8 "Alabama "                                                       2,021…  2000
#>  9 "Alaska "                                                        2,437…  2000
#> 10 "Arizona "                                                       2,652…  2000
#> # … with 47 more rows
```



And we're done for that year. Now we want to take these pieces, put them into a function and then run that function over all 19 years.



### Iterating

#### Get the PDFs

The first part is downloading each of the 19 PDFs that we need. We're going to build on the code that we used before. That code was:


```r
download.file(url = monicas_data$url[1], destfile = "inputs/pdfs/dhs/year_2000.pdf")
```




To modify this we need:

1. To have it iterate through each of the lines in the dataset that contains our CSVs (i.e. where it says 1, we want 1, then 2, then 3, etc.). 
2. Where it has a filename, we need it to iterate through our desired filenames (i.e. year_2000, then year_2001, then year_2002, etc). 
3. We'd like for it to do all of this in a way that is a little robust to errors. For instance, if one of the URLs is wrong or the internet drops out then we'd like it to just move onto the next PDF, and then warn us at the end that it missed one, not to stop. (This doesn't really matter because it's only 19 files, but it's pretty easy to find yourself doing this for thousands of files). 

We will draw on the `purrr` package for this @citepurrr.


```r
library(purrr)
monicas_data <- 
  monicas_data %>% 
  mutate(pdf_name = paste0("inputs/pdfs/dhs/year_", year, ".pdf"))
```




```r
purrr::walk2(monicas_data$url, monicas_data$pdf_name, purrr::safely(~download.file(.x , .y)))
```

What this code does it take the function `download.file()` and give it two arguments: `.x` and `.y`. The function `walk2()` then applies that function to the inputs that we give it, in this case the URLs columns is the `.x` and the pdf_names column is the `.y`. Finally, the `safely()` function means that if there are any failures then it just moves onto the next file instead of throwing an error.

We now have each of the PDFs saved and we can move onto getting the data from them.



#### Get data from the PDFs

Now we need to get the data from the PDFs. As before, we're going to build on the code that we used before. That code (overly condensed) was:


```r
dhs_2000 <- pdftools::pdf_text("inputs/pdfs/dhs/year_2000.pdf")

dhs_2000 <- 
  tibble(raw_data = dhs_2000) %>% 
  slice(monicas_data$page[1]) %>% 
  separate_rows(raw_data, sep = "\\n", convert = FALSE) %>% 
  separate(col = raw_data, into = c("state", "data"), sep = "\\.{2,}", remove = FALSE) %>% 
  mutate(data = str_squish(data)) %>% 
  separate(col = data, 
           into = c("number_of_births", "birth_rate", "fertility_rate", "TFR", "teen_births_all", "teen_births_15_17", "teen_births_18_19"), 
           sep = "\\s", 
           remove = FALSE) %>% 
  select(state, TFR) %>% 
  slice(13:69) %>% 
  mutate(year = 2000)

dhs_2000
```




There are a bunch of aspects here that have been hardcoded, but the first thing that we want to iterate is the argument to `pdf_text()`, then the number in in `slice()` will also need to change (that is doing the work to get only the page that we are interested in).

Two aspects are hardcoded, and these may need to be updated. In particular: 1) The separate only works if each of the tables has the same columns in the same order; and 2) the slice (which restricts the data to just the states) only works in this particular case. Finally, we add the year only at the end, whereas we'd need to bring that up earlier in the process. 

We'll start by writing a function that will go through all the files, grab the data, get the page of interest, and then expand the rows. We'll then use a function from `purrr` to apply that function to all of the PDFs and to output a tibble.


```r
get_pdf_convert_to_tibble <- function(pdf_name, page, year){
  
  dhs_table_of_interest <- 
    tibble(raw_data = pdftools::pdf_text(pdf_name)) %>% 
    slice(page) %>% 
    separate_rows(raw_data, sep = "\\n", convert = FALSE) %>% 
    separate(col = raw_data, 
             into = c("state", "data"), 
             sep = "[�|\\.]\\s+(?=[[:digit:]])", 
             remove = FALSE) %>% 
    mutate(
      data = str_squish(data),
      year_of_data = year)

  print(paste("Done with", year))
  
  return(dhs_table_of_interest)
}

raw_dhs_data <- purrr::pmap_dfr(monicas_data %>% select(pdf_name, page, year),
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
#> # A tibble: 6 × 4
#>   raw_data                       state                        data  year_of_data
#>   <chr>                          <chr>                        <chr>        <dbl>
#> 1 "40 National Vital Statistics… "40 National Vital Statisti… 50, …         2000
#> 2 ""                             ""                           <NA>          2000
#> 3 "Table 10. Number of births, … "Table 10. Number of births… <NA>          2000
#> 4 "United States, each State an… "United States, each State … <NA>          2000
#> 5 "[By place of residence. Birt… "[By place of residence. Bi… <NA>          2000
#> 6 "estimated in each area; tota… "estimated in each area; to… <NA>          2000
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
  raw_dhs_data %>% 
  mutate(state = str_remove_all(state, "\\."),
         state = str_remove_all(state, "�"),
         state = str_remove_all(state, "\u0008"),
         state = str_replace_all(state, "United States 1", "United States"),
         state = str_replace_all(state, "United States1", "United States"),
         state = str_replace_all(state, "United States 2", "United States"),
         state = str_replace_all(state, "United States2", "United States"),
         state = str_replace_all(state, "United States²", "United States"),
         ) %>% 
  mutate(state = str_squish(state)) %>% 
  filter(state %in% states)

head(raw_dhs_data)
#> # A tibble: 6 × 4
#>   raw_data                              state   data                year_of_data
#>   <chr>                                 <chr>   <chr>                      <dbl>
#> 1 Alabama ............................… Alabama 63,299 14.4 65.0 2…         2000
#> 2 Alaska .............................… Alaska  9,974 16.0 74.6 2,…         2000
#> 3 Arizona ............................… Arizona 85,273 17.5 84.4 2…         2000
#> 4 Arkansas ...........................… Arkans… 37,783 14.7 69.1 2…         2000
#> 5 California .........................… Califo… 531,959 15.8 70.7 …         2000
#> 6 Colorado ...........................… Colora… 65,438 15.8 73.1 2…         2000
```

The next step is to separate the data and get the correct column from it. We're going to separate based on spaces once it is cleaned up.



```r
raw_dhs_data <- 
  raw_dhs_data %>% 
  mutate(data = str_remove_all(data, "\\*")) %>% 
  separate(data, into = c("col_1", "col_2", "col_3", "col_4", "col_5", 
                          "col_6", "col_7", "col_8", "col_9", "col_10"), 
           sep = " ",
           remove = FALSE)
head(raw_dhs_data)
#> # A tibble: 6 × 14
#>   raw_data    state data   col_1 col_2 col_3 col_4 col_5 col_6 col_7 col_8 col_9
#>   <chr>       <chr> <chr>  <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#> 1 Alabama ..… Alab… 63,29… 63,2… 14.4  65.0  2,02… 62.9  37.9  97.3  <NA>  <NA> 
#> 2 Alaska ...… Alas… 9,974… 9,974 16.0  74.6  2,43… 42.4  23.6  69.4  <NA>  <NA> 
#> 3 Arizona ..… Ariz… 85,27… 85,2… 17.5  84.4  2,65… 69.1  41.1  111.3 <NA>  <NA> 
#> 4 Arkansas .… Arka… 37,78… 37,7… 14.7  69.1  2,14… 68.5  36.7  114.1 <NA>  <NA> 
#> 5 California… Cali… 531,9… 531,… 15.8  70.7  2,18… 48.5  28.6  75.6  <NA>  <NA> 
#> 6 Colorado .… Colo… 65,43… 65,4… 15.8  73.1  2,35… 49.2  28.6  79.8  <NA>  <NA> 
#> # … with 2 more variables: col_10 <chr>, year_of_data <dbl>
```

We can now grab the correct column.


```r
tfr_data <- 
  raw_dhs_data %>% 
  mutate(TFR = if_else(year_of_data < 2008, col_4, col_3)) %>% 
  select(state, year_of_data, TFR) %>% 
  rename(year = year_of_data)
head(tfr_data)
#> # A tibble: 6 × 3
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
#> # A tibble: 6 × 3
#>   state       year TFR    
#>   <chr>      <dbl> <chr>  
#> 1 Alabama     2000 2,021.0
#> 2 Alaska      2000 2,437.0
#> 3 Arizona     2000 2,652.5
#> 4 Arkansas    2000 2,140.0
#> 5 California  2000 2,186.0
#> 6 Colorado    2000 2,356.5

tfr_data <- 
  tfr_data %>% 
  mutate(TFR = str_remove_all(TFR, ","),
         TFR = as.numeric(TFR))

head(tfr_data)
#> # A tibble: 6 × 3
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
# tfr_data %>% 
#   skimr::skim()
```

In particular we want for there to be 51 states and for there to be 19 years.

And we're done.


```r
head(tfr_data)
#> # A tibble: 6 × 3
#>   state       year   TFR
#>   <chr>      <dbl> <dbl>
#> 1 Alabama     2000 2021 
#> 2 Alaska      2000 2437 
#> 3 Arizona     2000 2652.
#> 4 Arkansas    2000 2140 
#> 5 California  2000 2186 
#> 6 Colorado    2000 2356.

write_csv(tfr_data, "outputs/monicas_tfr.csv")
```





## Semi-structured

### JSON and XML










## Optical Character Recognition

All of the above is predicated on having a PDF that is already 'digitized'. But what if it is images? In that case you need to first use Optical Character Recognition (OCR). The go-to package is Tesseract [@citetesseract]. This is a R wrapper around the Tesseract open-source OCR engine.

Let's see an example with a scan from the first page of Jane Eyre (Figure \@ref(fig:janescan)).

<div class="figure">
<img src="/Users/rohanalexander/Documents/book/figures/jane_scan.png" alt="Scan of first page of Jane Eyre." width="90%" />
<p class="caption">(\#fig:janescan)Scan of first page of Jane Eyre.</p>
</div>



```r
# install.packages('tesseract')
library(tesseract)
text <- tesseract::ocr(here::here("figures/jane_scan.png"), engine = tesseract("eng"))
cat(text)
#> 1 THERE was no possibility of taking a walk that day. We had
#> been wandering, indeed, in the leafless shrubbery an hour in
#> the morning; but since dinner (Mrs Reed, when there was no com-
#> pany, dined early) the cold winter wind had brought with it clouds
#> so sombre, and a rain so penetrating, that further out-door exercise
#> 
#> was now out of the question.
#> 
#> I was glad of it: I never liked long walks, especially on chilly
#> afternoons: dreadful to me was the coming home in the raw twi-
#> light, with nipped fingers and toes, and a heart saddened by the
#> chidings of Bessie, the nurse, and humbled by the consciousness of
#> my physical inferiority to Eliza, John, and Georgiana Reed.
#> 
#> The said Eliza, John, and Georgiana were now clustered round
#> their mama in the drawing-room: she lay reclined on a sofa by the
#> fireside, and with her darlings about her (for the time neither quar-
#> relling nor crying) looked perfectly happy. Me, she had dispensed
#> from joining the group; saying, ‘She regretted to be under the
#> necessity of keeping me at a distance; but that until she heard from
#> Bessie, and could discover by her own observation that I was
#> endeavouring in good earnest to acquire a more sociable and
#> child-like disposition, a more attractive and sprightly manner—
#> something lighter, franker, more natural as it were—she really
#> must exclude me from privileges intended only for contented,
#> happy, littie children.’
#> 
#> ‘What does Bessie say I have done?’ I asked.
#> 
#> ‘Jane, I don’t like cavillers or questioners: besides, there is
#> something truly forbidding in a child taking up her elders in that
#> manner. Be seated somewhere; and until you can speak pleasantly,
#> remain silent.’
#> 
#> . Bs aT sae] eae
#> 
#> i; AN TCM TAN | Beal | Sees
#> a) } ; | i)
#> i i 4 | | A ae | i | eee eek?
#> 
#> a an eames yi | bee
#> 1 nea elem | | oe pee
#> i i ae BC i i Hale
#> oul | ec hi
#> pan || i re a al! |
#> 
#> ase } Oty 2 RIES ORT Sata ariel
#> SEEN BE — =——_
#> 15
```





## Text

*Aspects of this section have been previously published.*



### Introduction

Text data is all around us, and in many cases is some of the earliest types of data that we are exposed to. Recent increases in computational power, the development of new methods, and the enormous availability of text, means that there has been a great deal of interest in using text as data. Initial methods tend to focus, essentially, on converting text into numbers and then analysing them using traditional methods. More recent methods have begun to take advantage of the structure that is inherent in text, to draw additional meaning. The difference is perhaps akin to a child who can group similar colors, compared with a child who knows what objects are; although both crocodiles and trees are green, and you can do something with that knowledge, you can do more by knowing that a crocodile could eat you, and a tree probably won't.

In this section we cover a variety of techniques designed to equip you with the basics of using text as data. One of the great things about text data is that it is typically not generated for the purposes of our analysis. That's great because it removes one of the unobservable variables that we typically have to worry about. The trade-off is that we typically have to do a bunch more work to get it into a form that we can work with.





### Getting text data

Text as data is an exciting tool to apply. But many guides assume that you already have a nice dataset. Because we've focused on workflow in these notes, we know that's not likely to be true! In this section we will scrape some text from a website. We've already seen examples of scraping, but in general those were focused on exploiting tables in the website. Here we're going to instead focus on paragraphs of text, hence we'll focus on different html/css tags. 

We're going to us the `rvest` package to make it easier to scrape data. We're also going to use the `purrr` package to apply a function to a bunch of different URLs. For those of you with a little bit of programming, this is an alternative to using a for loop. For those of you with a bit of CS, this is a package that adds functional programming to R. 


```r
library(rvest)
library(tidyverse)

# Some websites
address_to_visit <- c("https://www.rba.gov.au/monetary-policy/rba-board-minutes/2020/2020-03-03.html",
                    "https://www.rba.gov.au/monetary-policy/rba-board-minutes/2020/2020-02-04.html",
                    "https://www.rba.gov.au/monetary-policy/rba-board-minutes/2019/2019-12-03.html",
                    "https://www.rba.gov.au/monetary-policy/rba-board-minutes/2019/2019-11-05.html",
                    "https://www.rba.gov.au/monetary-policy/rba-board-minutes/2019/2019-10-01.html",
                    "https://www.rba.gov.au/monetary-policy/rba-board-minutes/2019/2019-09-03.html"
                    )

# Save names
save_name <- address_to_visit %>% 
  str_remove("https://www.rba.gov.au/monetary-policy/rba-board-minutes/") %>% 
  str_remove(".html") %>%
  str_remove("20[:digit:]{2}/") %>% 
  str_c("inputs/rba/", ., ".csv")
```


Create the function that will visit address_to_visit and save to save_name files.


```r
visit_address_and_save_content <-
  function(name_of_address_to_visit,
           name_of_file_to_save_as) {
    # The function takes two inputs
    name_of_address_to_visit <- address_to_visit[1]
    name_of_file_to_save_as <- save_name[1]
    
    read_html(name_of_address_to_visit) %>% # Go to the website and read the html
      html_node("#content") %>% # Find the content part
      html_text() %>% # Extract the text of the content part
      write_lines(name_of_file_to_save_as) # Save as a text file
    print(paste("Done with", name_of_address_to_visit, "at", Sys.time()))  
    # Helpful so that you know progress when running it on all the records
    Sys.sleep(sample(30:60, 1)) # Space out each request by somewhere between 
    # 30 and 60 seconds each so that we don't overwhelm their server
  }

# If there is an error then ignore it and move to the next one
visit_address_and_save_content <-
  safely(visit_address_and_save_content)
```

We now apply that function to our list of URLs.


```r
# Walk through the addresses and apply the function to each
walk2(address_to_visit,
      save_name,
      ~ visit_address_and_save_content(.x, .y))
```

The result is a bunch of files with saved text data. 

In this case we used scraping, but there are, of course, many ways. We may be able to use APIs, for instance, In the case of the Airbnb dataset that we examined earlier in the notes. If you are lucky then it may simply be that there is a column that contains text data in your dataset. 


### Preparing text datasets

*This section draws on Sharla Gelfand's blog post, linked in the required readings.*

As much as I would like to stick with Australian economics and politics examples, I realise that this is probably only of limited interest to most of you. As such, in this section we will consider a dataset of Sephora reviews. Please read Sharla's blog post (https://sharla.party/post/crying-sephora/) for another take on this dataset.

In this section we assume that there is some text data that you have gathered. At this point we need to change it into a form that we can work with. For some applications this will be counts of words. For others it may be some variant of this. The dataset that we are going to use is from Sephora, was scraped by [Connie](https://twitter.com/crabbage_/) and I originally became aware of it because of [Sharla](https://sharla.party/post/crying-sephora/).

First let's read in the data.


```r
# This code is taken from https://sharla.party/post/crying-sephora/
library(dplyr)
library(jsonlite)
library(tidytext)

crying <- 
  jsonlite::fromJSON("https://raw.githubusercontent.com/everestpipkin/datagardens/master/students/khanniie/5_newDataSet/crying_dataset.json",
  simplifyDataFrame = TRUE
)

crying <- as_tibble(crying[["reviews"]])

head(crying)
#> # A tibble: 6 × 6
#>   date        product_info$bra… $name $type $url  review_body review_title stars
#>   <chr>       <chr>             <chr> <chr> <chr> <chr>       <chr>        <chr>
#> 1 29 Mar 2016 Too Faced         Bett… Masc… http… "Now I can… AWESOME      5 st…
#> 2 29 Sep 2016 Too Faced         Bett… Masc… http… "This hold… if you're s… 5 st…
#> 3 23 May 2017 Too Faced         Bett… Masc… http… "I just bo… Hate it      1 st…
#> 4 15 Aug 2017 Too Faced         Bett… Masc… http… "To start … Nearly perf… 5 st…
#> 5 21 Sep 2016 Too Faced         Bett… Masc… http… "This masc… Amazing!!    5 st…
#> 6 30 May 2016 Too Faced         Bett… Masc… http… "Let's tal… Tricky but … 5 st…
#> # … with 1 more variable: userid <dbl>
```


```r
names(crying)
#> [1] "date"         "product_info" "review_body"  "review_title" "stars"       
#> [6] "userid"
```

We'll focus on the `review_body` variable and the number of stars `stars` that the reviewer gave. Most of them are 5 stars, so we'll just focus on whether or not the review is five stars.


```r
crying <- 
  crying %>% 
  select(review_body, stars) %>% 
  mutate(stars = str_remove(stars, " stars?"),  # The question mark at the end means it'l get rid of 'star' and 'stars'.
         stars = as.integer(stars)
         ) %>% 
  mutate(five_stars = if_else(stars == 5, 1, 0))

table(crying$stars)
#> 
#>  1  2  3  4  5 
#>  6  2  4 14 79
```

In this example we are going to split everything into separate words. When we do this it is just searching for a space, and so what other types of elements are going to be considered 'words'?


```r
crying_by_words <- 
  crying %>%
  tidytext::unnest_tokens(word, review_body, token = "words")

head(crying_by_words)
#> # A tibble: 6 × 3
#>   stars five_stars word 
#>   <int>      <dbl> <chr>
#> 1     5          1 now  
#> 2     5          1 i    
#> 3     5          1 can  
#> 4     5          1 cry  
#> 5     5          1 all  
#> 6     5          1 i
```

We now want to count the number of times each word is used by each of the star classifications.


```r
crying_by_words <- 
  crying_by_words %>% 
  count(stars, word, sort = TRUE)

head(crying_by_words)
#> # A tibble: 6 × 3
#>   stars word      n
#>   <int> <chr> <int>
#> 1     5 i       348
#> 2     5 and     249
#> 3     5 the     239
#> 4     5 it      211
#> 5     5 a       193
#> 6     5 this    178

crying_by_words %>% 
  filter(stars == 1) %>% 
  head()
#> # A tibble: 6 × 3
#>   stars word      n
#>   <int> <chr> <int>
#> 1     1 the      39
#> 2     1 i        24
#> 3     1 and      21
#> 4     1 it       21
#> 5     1 to       19
#> 6     1 my       16
```

So you can see that the most popular word for five-star reviews is 'i', and that the most popular word for one star reviews is 'the'.

At this point, we can use the data to do a whole bunch of different things, but one nice measure to look at is term frequency e.g. in this case how many times is a word used in reviews with a particular star rating. The issue is that there are a lot of words that are commonly used regardless of context. As such, we may also like to look at the inverse document frequency in which we 'penalise' words that occur in many particular star ratings. For instance, 'the' probably occurs in both one star and five star reviews and so its idf is lower than 'hate' which probably only occurs in one star reviews. The term frequency–inverse document frequency (tf-idf) is then the product of these.

We can create this value using the `bind_tf_idf()` function from the `tidytext` package, and this will create a bunch of new columns, one for each word and star combination. 


```r
# This code, and the one in the next block, is from Julia Silge: https://juliasilge.com/blog/sherlock-holmes-stm/
crying_by_words_tf_idf <- 
  crying_by_words %>%
  bind_tf_idf(word, stars, n) %>%
  arrange(-tf_idf)

head(crying_by_words_tf_idf)
#> # A tibble: 6 × 6
#>   stars word              n      tf   idf tf_idf
#>   <int> <chr>         <int>   <dbl> <dbl>  <dbl>
#> 1     2 below             1 0.00826  1.61 0.0133
#> 2     2 boy               1 0.00826  1.61 0.0133
#> 3     2 choice            1 0.00826  1.61 0.0133
#> 4     2 contrary          1 0.00826  1.61 0.0133
#> 5     2 exceptionally     1 0.00826  1.61 0.0133
#> 6     2 migrates          1 0.00826  1.61 0.0133
```



```r
crying_by_words_tf_idf %>% 
  group_by(stars) %>%
  top_n(10) %>%
  ungroup %>% 
  mutate(word = reorder_within(word, tf_idf, stars)) %>%
  mutate(stars = as_factor(stars)) %>%
  filter(stars %in% c(1, 5)) %>% 
  ggplot(aes(word, tf_idf, fill = stars)) +
    geom_col(show.legend = FALSE) +
    facet_wrap(vars(stars), scales = "free") +
    scale_x_reordered() +
    coord_flip() +
    labs(x = "Word", 
         y = "tf-idf") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1")
```

<img src="20-gather_files/figure-html/unnamed-chunk-71-1.png" width="672" />




## Exercises and tutorial



### Exercises

1. In your own words, what is an API (write a paragraph or two)?
2. Find two APIs and discuss how you could use them to tell interesting stories (write a paragraph or two for each). 
3. Find two APIs that have an R packages written around them. How could you use these to tell interesting stories? (Write a paragraph or two for each.)
4. What is the main argument to `httr::GET()` (pick one)?
    a. 'url'
    b. 'website'
    c. 'domain'
    d. 'location'
5. Name three reasons why we should be respectful when getting scraping data from websites (write a paragraph or two).
6. What features of a website do we typically take advantage of when we parse the code (select all)?
    a. HTML/CSS mark-up.
    b. Cookies.
    c. Facebook beacons.
    d. Code comments.
7. What are three advantages and three disadvantages of scraping compared with using an API (write a paragraph or two)?
8. What are three delimiters that could be useful when trying to bring order to the PDF that you read in as a character vector (write a paragraph or two)?
9. What do I need to put inside "SOMETHING_HERE" if I want to match regular expressions for a full stop i.e. "." (hint: see the 'strings' cheat sheet) (pick one)? 
    a. `.`
    b. `\.`
    c. `\\.`
    d. `\\\.`
10. Name three reasons for sketching out what you want before starting to try to extract data from a PDF (write a paragraph or two for each).
11. If you are interested in demographic data then what are three checks that you might like to do? What are three if you are interested in economic data such as GDP, interest rates, and exchange rates?  (Write an explanation for each.)
12. What does the `purrr` package do (select all)?
    a. Enhances R's functional programming toolkit.
    b. Makes loops easier to code and read.
    c. Checks the consistency of datasets.
    d. Identifies issues in data structures and proposes replacements.
13. Which of these are functions from the `purrr` package (select all)?
    a. `map()`
    b. `walk()`
    c. `run()`
    d. `safely()`
14. Why should we use `safely()` when scraping data (pick one)?
    a. To protect us from hackers.
    b. To avoid side effects of pages with issues.
    c. To slow down our scraping to an appropriate speed.
15. What are some principles to follow when scraping (select all)?
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
18. If I have the following text data 'rohan_alexander' in a column called ‘names’ and want to split it into first name and surname based on the underbar what function should I use (pick one)?
    a. `separate()`
    b. `slice()`
    c. `spacing()`
    d. `text_to_columns()`


### Tutorial

Gather some data yourself using a method that is introduced here - APIs directly or via a wrapper package, web scraping, PDF parsing, OCR, or text. Write a few paragraphs about the data source, what you gathered, and how you went about it. What took longer than you expected? When did it become fun? What would you do differently next time you do this? Please include a link to your GitHub repo so I can see the code, but it won't be strictly marked - this is more about encouraging you to have a go. (Start with something tiny and very specific, get that working, and then increase the scope - almost everything will be more difficult and time-consuming than you think - and don't forget to plan it out before you start.)

