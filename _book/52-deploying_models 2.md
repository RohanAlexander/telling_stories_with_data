---
date: April 6, 2021
bibliography: bibliography.bib
output:
  pdf_document:
    citation_package: natbib
  bookdown::pdf_book:
    citation_package: biblatex
---


# Deploying models

*Last updated: 6 April 2021.*

**Required reading**

- Chip Huyen, 2020, 'Machine learning is going real-time', 27 December, https://huyenchip.com/2020/12/27/real-time-machine-learning.html.

**Required viewing**

- Blair, James, 2019, 'Democratizing R with Plumber APIs', RStudio Conference, 24 January, https://www.rstudio.com/resources/rstudioconf-2019/democratizing-r-with-plumber-apis/.
- Nolis, Heather, and Jacqueline Nolis, 'We're hitting R a million times a day so we made a talk about it', RStudio Conference, 30 January, https://www.rstudio.com/resources/rstudioconf-2020/we-re-hitting-r-a-million-times-a-day-so-we-made-a-talk-about-it/.


**Recommended reading**

- 

**Key concepts/skills/etc**

- Putting models into production requires a different set of skills to building a model. We need a familiarity with some cloud provider, APIs, and of course modelling. But the biggest difficulty, for me, is getting things set-up.


**Key libraries**

- `plumber`
- `shiny`


**Key functions**

- 


**Quiz**

1. 





## Introduction

A key troupe against R is that it's not for production. I'm not here to convince you one way or another, however in this section we will go through a bunch of different tools that would allow you to do a lot in R if you wanted. The topics that we cover are:

- SQL databases.
- Docker.
- Plumber and APIs for models.
- Shiny
- Packages

The general idea here is that you need to know the whole workflow. To this point, you've been able to scrape some data from a website, bring some order to that chaos, make some charts, appropriately model it, and write this all up. In most academic settings that is more than enough. But in many industry settings we're going to want to use the model to do something. For instance, set-up a website that allows your model to be used to generate an insurance quote given several inputs.

One way to deploy your model is to use Shiny, and we have seen examples of this earlier in the notes. That enables an individual to use your model. But it doesn't really scale very well. For instance, if we wanted to sell our model forecasts to other businesses, then they might have their own way in which they would like users to interact with the results. The general problem is that we want our model results available to other machines and for that we will want to make an APIs.




## Packages

To this point we've largely been using R Packages to do things for us. However, another way is to have them loaded

DoSS Toolkit

## Shiny



## Plumber and model APIs

### Hello Toronto

The general idea behind the `plumber` package [@citeplumber] is that we can train a model and make it available via an API that we can call when we want a forecast. It's pretty great.

Just to get something working, let's make a function that returns 'Hello Toronto' regardless of the output. Open a new R file, add the following, and then save it as 'plumber.R' (you may need to install the `plumber` package if you've not done that yet).


```r
library(plumber)

#* @get /print_toronto
print_toronto <- function() {
  result <- "Hello Toronto"
  return(result)
}
```

After that is saved, in the top right of the editor you should get a button to 'Run API'. Click that, and your API should load. It'll be a 'Swagger' application, which provides a GUI around our API. Expand the GET method, and then clik 'Try it out' and 'Execute'. In the response body, you should get 'Toronto'. 

To more closely reflect the fact that this is an API designed for computers, you can copy/paste the 'request HTML' into a browser and it should return 'Hello Toronto'.


### Local model

Now, we're going to update the API so that it serves a model output, given some input. We're going to follow @buhrplumber fairly closely.

At this point, I'd recommend starting a new R Project. To get started, let's simulate some data and then train a model on it. In this case we're interested in forecasting how long a baby may sleep overnight, given we know how long they slept during their afternoon nap.


```r
library(tidyverse)
set.seed(853)

number_of_observations <- 1000

baby_sleep <- 
  tibble(afternoon_nap_length = rnorm(number_of_observations, 120, 5) %>% abs(),
         noise = rnorm(number_of_observations, 0, 120),
         night_sleep_length = afternoon_nap_length * 4 + noise,
         )

baby_sleep %>% 
  ggplot(aes(x = afternoon_nap_length, y = night_sleep_length)) +
  geom_point(alpha = 0.5) +
  labs(x = "Baby's afternoon nap length (minutes)",
       y = "Baby's overnight sleep length (minutes)") +
  theme_classic()
```

Let's now use `tidymodels` to quickly make a dodgy model.


```r
set.seed(853)
library(tidymodels)

baby_sleep_split <- rsample::initial_split(baby_sleep, prop = 0.80)
baby_sleep_train <- rsample::training(baby_sleep_split)
baby_sleep_test <- rsample::testing(baby_sleep_split)

model <- 
  parsnip::linear_reg() %>%
  parsnip::set_engine(engine = "lm") %>% 
  parsnip::fit(night_sleep_length ~ afternoon_nap_length, 
               data = baby_sleep_train
               )

write_rds(x = model, file = "baby_sleep.rds")
```

At this point, we have a model. One difference from what you might be used to is that we've saved the model as an '.rds' file. We are going to read that in.

Now that we have our model we want to put that into a file that we will use the API to access, again called 'plumber.R'. And we also want a file that sets up the API, called 'server.R'. So make an R script called 'server.R' and add the following content:


```r
library(plumber)

serve_model <- plumb("plumber.R")
serve_model$run(port = 8000)
```

Then in 'plumber.R' add the following content:


```r
library(plumber)
library(tidyverse)

model <- readRDS("baby_sleep.rds")

version_number <- "0.0.1"

variables <- 
  list(
    afternoon_nap_length = "A value in minutes, likely between 0 and 240.",
    night_sleep_length = "A forecast, in minutes, likely between 0 and 1000."
  )

#* @param afternoon_nap_length
#* @get /survival
predict_sleep <- function(afternoon_nap_length=0) {
  afternoon_nap_length = as.integer(afternoon_nap_length)
  
  payload <- data.frame(afternoon_nap_length=afternoon_nap_length)
  
  prediction <- predict(model, payload)

  result <- list(
    input = list(payload),
    response = list("estimated_night_sleep" = prediction),
    status = 200,
    model_version = version_number)

  return(result)
}
```

Again, after you save the 'plumber.R' file you should have an option to 'Run API'. Click that and you can try out the API locally in the same way as before.


### Cloud model

To this point, we've got an API working on our own machine, but what we really want to do is to get it working on a computer such that the API can be accessed by anyone. To do this we are going to use DigitalOcean - https://www.digitalocean.com. It is a charged service, but when you create an account, it will come with $100 in credit, which will be enough to get started.

This set-up process will be a pain and take some time, but you only need to do it once. Install two additional packages that will assist here:

- `plumberDeploy` [@citeplumberdeploy].
- `analogsea` [@citeanalogsea].


```r
install.packages("plumberDeploy")
remotes::install_github("sckott/analogsea")
```

Now we need to connect your local computer with your DigitalOcean account. Get started with:


```r
analogsea::account()
```

Now you need to authenticate the connection and this is done using a SSH public key. You can do this using:


```r
analogsea::key_create()
```

But if this is your first time doing this then it may be more useful to have a visual process, in which case follow the instructions here: https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/to-account/. What you want is to have a '.pub' file on your computer. Then copy the public key aspect in that file, and add it to the SSH keys section in the account security settings. When you have the key on your local computer then you can check this using:


```r
ssh::ssh_key_info()
```

Again, this will all take a while to validate. DigitalOcean calls every computer that you start a 'droplet'. So if you start three computers, then you'll have started three droplets. You can check the droplets that you have running using:
 

```r
analogsea::droplets()
```

If everything is set-up properly, then this will print the information about all droplets that you have associated with your account (which at this point, is probably none).

To create a droplet, you run:


```r
id <- plumberDeploy::do_provision(example = FALSE)
```

Then you'll get asked for your SSH passphrase and then it'll just set-up a bunch of things. After this we're going to need to install a whole bunch of things onto our droplet:


```r
analogsea::install_r_package(droplet = id, c("plumber", 
                                             "remotes", 
                                             "here"))
analogsea::debian_apt_get_install(id, "libssl-dev", 
                                  "libsodium-dev", 
                                  "libcurl4-openssl-dev")
analogsea::debian_apt_get_install(id, 
                                  "libxml2-dev")

analogsea::install_r_package(id, c("config",
                                   "httr",
                                   "urltools",
                                   "plumber"))

analogsea::install_r_package(id, c("xml2"))
analogsea::install_r_package(id, c("tidyverse"))

analogsea::install_r_package(id, c("tidymodels"))

```

And then when that is finally set-up (it'll seriously take 30 min or so) we can deploy our API!


```r
plumberDeploy::do_deploy_api(droplet = id, 
                             path = "example", 
                             localPath = getwd(), 
                             port = 8000, 
                             docs = TRUE, 
                             overwrite=TRUE)
```





## Exercises and tutorial

### Exercises



### Tutorial



