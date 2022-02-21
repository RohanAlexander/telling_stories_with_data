
# (PART) Enrichment {-}

# Deploying models

**STATUS: Under construction.**

**Required reading**

- Read *Machine learning is going real-time*, [@chiphuyenone]
- Read *Real-time machine learning: challenges and solutions*, [@chiphuyentwo]




<!-- **Required viewing** -->

<!-- - Blair, James, 2019, 'Democratizing R with Plumber APIs', RStudio Conference, 24 January, https://www.rstudio.com/resources/rstudioconf-2019/democratizing-r-with-plumber-apis/. -->
<!-- - Nolis, Heather, and Jacqueline Nolis, 'We're hitting R a million times a day so we made a talk about it', RStudio Conference, 30 January, https://www.rstudio.com/resources/rstudioconf-2020/we-re-hitting-r-a-million-times-a-day-so-we-made-a-talk-about-it/. -->


<!-- **Recommended reading** -->

<!-- - Edmondson, Mark, 2020, 'googleComputeEngineR documentation', version 0.3.0.9000, freely available at: https://cloudyr.github.io/googleComputeEngineR/. -->
<!-- - McDermott, Grant R., 2020, 'Cloud computing with Google Compute Engine', *Data Science for Economists*, freely available at: https://raw.githack.com/uo-ec607/lectures/master/14-gce/14-gce.html. -->
<!-- - Morris, Mitzi, 2020, 'Stan Notebooks in the Cloud', freely available at: https://mc-stan.org/users/documentation/case-studies/jupyter_colab_notebooks_2020.html. -->

**Key concepts/skills/etc**

- Benefits/costs of cloud.
- Getting started in the cloud.
- Starting virtual machines with R Studio.
- Stopping virtual machines.
- Putting models into production requires a different set of skills to building a model. We need a familiarity with some cloud provider, APIs, and of course modelling. But the biggest difficulty, for me, is getting things set-up.


**Key libraries**

- `plumber` [@plumber]
- `shiny`




## Introduction

A key troupe against R is that it's not for production. I'm not here to convince you one way or another, however in this section we will go through a bunch of different tools that would allow you to do a lot in R if you wanted. The topics that we cover are:

- SQL databases.
- Docker.
- Plumber and APIs for models.
- Shiny
- Packages

The general idea here is that you need to know the whole workflow. To this point, you've been able to scrape some data from a website, bring some order to that chaos, make some charts, appropriately model it, and write this all up. In most academic settings that is more than enough. But in many industry settings we're going to want to use the model to do something. For instance, set-up a website that allows your model to be used to generate an insurance quote given several inputs.

One way to deploy your model is to use Shiny, and we have seen examples of this earlier in the notes. That enables an individual to use your model. But it doesn't really scale very well. For instance, if we wanted to sell our model forecasts to other businesses, then they might have their own way in which they would like users to interact with the results. The general problem is that we want our model results available to other machines and for that we will want to make an APIs.


Cloud benefits:
- Costs can be reduced, or more easily amortized.
- Can scale as you need.
- Many platforms are already sorted out e.g. R Studio just works.


I stole this from someone and I can't remember who, but the cloud is another name for 'someone else's computer'. That's it. Nonetheless, learning to use someone else's computer can be great for a number of reasons including:

1) Scalability: It can be quite expensive to buy a new computer, especially if you only need it to run something every now and then, but by using someone else's computer, you can just rent for a few hours or days. 
2) Portability: If you can shift your analysis workflow from your laptop to the cloud, then that suggests that you are likely doing good things in terms of reproducibility and portability. At the very least, your code is capable of running on your laptop and the cloud.
3) Set-and-forget: If you are doing something that will take a while, then it can be great to not have to worry about your laptop's fan running overnight, or your partner/baby/pet/housemate/etc accidently closing your computer, or not being able to watch Netflix on that same computer. 

When you use the cloud you are running your code on a 'virtual machine'. This is a part of a larger bunch of computers that has been designed to act like a computer with specific features. For instance you may specify that your virtual machine has 8 GB RAM, 128 storage, and 4 CPUs. Your VM would then act like a computer with those specifications. The cost to use cloud options increases based on the specifications of the virtual machine that you choose.

There are a few downsides:

- Cost: While most cloud options are cheap, they are rarely free. (While there are free options, they tend to not be very powerful, and so you end up having to pay to get a computer that is better than your laptop.) To give you an idea of cost, when I use AWS, I typically end up spending five to ten dollars for a couple of days. So it's fairly cheap, but it's not nothing. It's also pretty easy to accidently forget about something and run up an unexpected bill, especially initially. 
- Public: It is pretty easy to make mistakes and accidently make everything public.
- Time: It takes time to get set-up and comfortable on the cloud.

In these notes we are going to introduce the cloud starting with some options that pretty much anyone can (and should) take advantage of: Google Colab; and then moving to more general cloud options including Google Compute Engine, AWS, and Azure, which may be useful to some of you in some cases. If you want to get a job in industry, then the advice of pretty much every speaker from industry at the Toronto Data Workshop is that you learn at least one of those cloud options. For instance, Munich Re is an Azure shop, Receptiviti uses AWS, etc.



## Using the cloud

### Google Colab

Google Colab is similar to R Studio Cloud, in that it is set-up to allow you to just log in and get started. In this case, you need a Google account. It's better than R Studio because they have more resources to put into its development and you can use GPUs, but but on the other hand it is designed for Python, and while we can use it for R, it's not really focused on that.

To get started you need to tell Google Colab that you want to use R. You can do this by using this: https://colab.research.google.com/notebook#create=true&language=r.

At this point you have a Jupyter notebook open that will run R. (But it is not a R Markdown document.) You can install packages as normal, e.g. `install.packages("tidyverse")`, and then call the package e.g. `library(tidyverse)`.

Google Colab is a good option if you have a good reason for using the broader capabilities that it has. If you want to go deeper into that then the Morris reading has a bunch of options that you can explore, but as Morris puts it 'Colab is a gateway drug - for large-scale processing pipelines you'll need to move up to Google Cloud Platform or one of its competitors AWS, Azure, etc.' and that is what we will do now.



### AWS

Amazon Web Services is a cloud service from Amazon. To get started you need an AWS Developer account which you can create here: https://aws.amazon.com/developer/.

After you have created an account, you need to select a region where the computer that you will access is located. After this, you will want to "Launch a virtual machine" (with EC2). 

The first step is to choose an Amazon Machine Image (AMI). This provides the details of the computer that you will be using. For instance, your local computer may be a MacBook running Catalina. Helpfully, Louis Aslett provides a bunch of these already set up - http://www.louisaslett.com/RStudio_AMI/. You can either select the code for the region that you registered for, or you can click on the link. The benefit of this AMI is that they are set-up specifically for R Studio, however the trade-off is that they are a little out-dated, as they were compiled in May 2019.

In the next step you can choose how powerful the computer will be. The free tier has a fairly basic computer, but you can choose better ones when you need them. At this point you can pretty much just launch the instance. If you start using AWS more seriously then you should look into different security settings.

Your instance is now running. You can go to it by pasting the 'public DNS' into a browser. The username is 'rstudio' and the password is your instance ID.

You should have R Studio running, which is exciting. The first thing to do is probably to change the default password using the instructions in the instance.

You don't need to install, say, the tidyverse, instead you can just call the library and keep going. You can see the list of packages that are installed with `installed.packages()`. For instance, `rstan` is already installed. And you can use GPUs if you want.

Perhaps as important as being able to start an AWS instance is being able to stop it (so that you don't get billed). The free tier is pretty great, but you do need to turn it off. To stop an instance, in the AWS instances page, select it, then 'Actions -> Instance State -> Terminate'.




### Google Compute Engine

The main R package related to Google Compute Engine seems to be: `googleComputeEngineR`.

The reading from Grant McDermott is a pretty good walk-through. 



## R packages

To this point we've largely been using R Packages to do things for us. However, another way is to have them loaded

DoSS Toolkit


## Shiny



## Plumber and model APIs

### Hello Toronto

The general idea behind the `plumber` package [@plumber] is that we can train a model and make it available via an API that we can call when we want a forecast. It's pretty great.

Just to get something working, let's make a function that returns 'Hello Toronto' regardless of the output. Open a new R file, add the following, and then save it as 'plumber.R' (you may need to install the `plumber` package if you've not done that yet).


```r
library(plumber)

#* @get /print_toronto
print_toronto <- function() {
  result <- "Hello Toronto"
  return(result)
}
```

After that is saved, in the top right of the editor you should get a button to 'Run API'. Click that, and your API should load. It'll be a 'Swagger' application, which provides a GUI around our API. Expand the GET method, and then click 'Try it out' and 'Execute'. In the response body, you should get 'Toronto'. 

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

- `plumberDeploy` [@plumberdeploy].
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



