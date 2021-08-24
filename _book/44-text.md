
# Text as data

**STATUS: Under construction.**



**Required reading**

- Hvitfeldt, Emil, and Julia Silge, 2021, *Supervised Machine Learning for Text Analysis in R*, Chapters 2, 5, 6, 7, https://smltar.com.
- Silge, Julia, and David Robinson, 2017, *Text Mining with R*, https://www.tidytextmining.com.


**Required viewing**

- 

**Recommended reading**

- Amaka, Ofunne, and Amber Thomas, 2020, 'The Naked Truth: How the names of 6,816 complexion products can reveal bias in beauty', The Pudding, March, https://pudding.cool/2021/03/foundation-names/.


**Key concepts/skills/etc**

- 

**Key libraries**

- 

**Key functions/etc**

- 


**Quiz**

- 


## Introduction

Text can be thought of as an unwieldy, but in generally


## Lasso regression

**This subsection, and much of the code that is used, directly draws on Julia Silge's notes, in particular: https://juliasilge.com/blog/tidy-text-classification/ [@silge2018].**

One of the nice aspects of text is that we can adapt our existing methods to use it as an input. Here we are going to use a variation of logistics regression, along with text inputs, to forecast. If you want to learn more about Lasso regression, then you should consider taking Arik's course over the summer, where he will dive into machine learning using Python.

In this section we are going to have two different text inputs, train a model on a sample of text from each of them, and then try to use that model to forecast the text in a training set. Although this is a arbitrary example, you could imagine many real-world applications. For instance, if you work at Twitter then you may want to know if a tweet was likely written by a bot, or by a human. Or similarly, imagine that you work for a political party - you may like to know if an email was likely from an email campaign organised by a group, or from an individual.

First we need to get some data. Julia Silge's example, nicely, uses book text as input. Seeing as I am jointly appointed at a Faculty of Information, that seems especially nice. The wonderful thing about this is that there is an R package - `gutenbergr` - that makes it easy to get text from Project Gutenberg into R. The key function is `gutenberg_download()`, which needs a key for the book that you want. We'll consider Jane Eyre and Alice's Adventures in Wonderland, which have the keys of 1260 and 11, respectively.


```r
library(gutenbergr)
alice_and_jane <- gutenbergr::gutenberg_download(c(1260, 11), meta_fields = "title")

# Save the dataset so that we don't need to overwhelm the servers each time
write_csv(alice_and_jane, "inputs/books/alice_and_jane.csv")

head(alice_and_jane)
```


```r
library(gutenbergr)

alice_and_jane <- read_csv("inputs/books/alice_and_jane.csv")

head(alice_and_jane)
#> # A tibble: 6 × 3
#>   gutenberg_id text                               title                         
#>          <dbl> <chr>                              <chr>                         
#> 1           11 ALICE'S ADVENTURES IN WONDERLAND   Alice's Adventures in Wonderl…
#> 2           11 <NA>                               Alice's Adventures in Wonderl…
#> 3           11 Lewis Carroll                      Alice's Adventures in Wonderl…
#> 4           11 <NA>                               Alice's Adventures in Wonderl…
#> 5           11 THE MILLENNIUM FULCRUM EDITION 3.0 Alice's Adventures in Wonderl…
#> 6           11 <NA>                               Alice's Adventures in Wonderl…
```

One of the great things about this is that the dataset is a tibble. So we can just work with all our familiar skills. The package has a lot more functionality, so I'd encourage you to look at the package's website: https://github.com/ropensci/gutenbergr. Each line of the book is read in as a different row in the dataset. Notice that we have downloaded two books here at once, and so we added the title. The two books are one after each other. You can see that we have both by looking at some summary statistics.


```r
table(alice_and_jane$title)
#> 
#> Alice's Adventures in Wonderland      Jane Eyre: An Autobiography 
#>                             3339                            20659
```

So it looks like Jane Eyre is much longer than Alice in Wonderland, which isn't a surprise to those who have read them. I don't want to step into Digital Humanities too much, as I don't know anything about it, but looking at things like the broader context of when these books were written, or other books that were written at similar times, is likely a fascinating area.

We'll just get rid of blank lines


```r
library(janitor)
# TODO There's a way to do this within janitor, but I forget, need to look it up.
alice_and_jane <- 
  alice_and_jane %>% 
  mutate(blank_line = if_else(text == "", 1, 0)) %>% 
  filter(blank_line == 0) %>% 
  select(-blank_line)

table(alice_and_jane$title)
#> 
#> Alice's Adventures in Wonderland      Jane Eyre: An Autobiography 
#>                             2481                            16395
```

There's still an overwhelming amount of Jane Eyre in there. So we'll just sample from Jane Eyre to make it more equal.


```r
set.seed(853)

alice_and_jane$rows <- c(1:nrow(alice_and_jane))
sample_from_me <- alice_and_jane %>% filter(title == "Jane Eyre: An Autobiography")
keep_me <- sample(x = sample_from_me$rows, size = 2481, replace = FALSE)

alice_and_jane <- 
  alice_and_jane %>% 
  filter(title == "Alice's Adventures in Wonderland" | rows %in% keep_me) %>% 
  select(-rows)

table(alice_and_jane$title)
#> 
#> Alice's Adventures in Wonderland      Jane Eyre: An Autobiography 
#>                             2481                             2481
```

There's a bunch of issues here, for instance, we have the whole of Alice, but we only have random bits of Jane, but nonetheless let's continue and we'll try to do something about that in a moment.

Now we want to get a sample of text from each book. We will use the lines to distinguish these samples. So we use a counter that will add a line number.


```r
alice_and_jane <- 
  alice_and_jane %>% 
  group_by(title) %>% 
  mutate(line_number = paste(gutenberg_id, row_number(), sep = "_")) %>% 
  ungroup()
```


We now want to separate out the words. We'll just use tidytext, because the focus here is on modelling, but there are a bunch of alternatives and one especially good one is the `quanteda` package, specifically, the `tokens()` function.


```r
library(tidytext)
alice_and_jane_by_word <- 
  alice_and_jane %>% 
  unnest_tokens(word, text) %>%
  group_by(word) %>%
  filter(n() > 10) %>%
  ungroup()
```

Notice here that we removed any word that wasn't used more than 10 times. Nonetheless we still have a lot of unique words. (If we didn't require that the word be used by the author at least 10 times then we end up with more than 6,000 words.)


```r
alice_and_jane_by_word$word %>% unique() %>% length()
#> [1] 585
```

The reason this is relevant is because these are our independent variables. So where you may be used to having something less than 10 explanatory variables, in this case we are going to have 585 As such, we need a model that can handle this.

However, as mentioned before, we are going to have some rows that essentially just had one word. While we could allow that, it might also be nice to give the model at least a few words to work with.


```r
alice_and_jane_by_word <- 
  alice_and_jane_by_word %>% 
  group_by(title, line_number) %>% 
  mutate(number_of_words_in_line = n()) %>% 
  ungroup() %>% 
  filter(number_of_words_in_line > 2) %>% 
  select(-number_of_words_in_line)
```

We'll create a test/training split, and load in `tidymodels`.


```r
library(tidymodels)

set.seed(853)

alice_and_jane_by_word_split <- 
  alice_and_jane_by_word %>%
  select(title, line_number) %>% 
  distinct() %>% 
  initial_split(prop = 3/4, strata = title)

# alice_and_jane_by_word_train <- training(alice_and_jane_by_word_split) %>% select(line_number)
# alice_and_jane_by_word_test <- testing(alice_and_jane_by_word_split)
# 
# rm(alice_and_jane_by_word_split)
```

Now we need to create a document-term matrix. 


```r
alice_and_jane_dtm_training <- 
  alice_and_jane_by_word %>% 
  count(line_number, word) %>% 
  inner_join(training(alice_and_jane_by_word_split) %>% select(line_number)) %>% 
  cast_dtm(term = word, document = line_number, value = n)

dim(alice_and_jane_dtm_training)
#> [1] 3413  585
```

So we have our independent variables sorted, now we need our binary dependent variable, which is whether the book is Alice in Wonderland or Jane Eyre.


```r

response <- 
  data.frame(id = dimnames(alice_and_jane_dtm_training)[[1]]) %>% 
  separate(id, into = c("book", "line", sep = "_")) %>% 
  mutate(is_alice = if_else(book == 11, 1, 0)) 
  

predictor <- alice_and_jane_dtm_training[] %>% as.matrix()
```


Now we can run our model.


```r
library(glmnet)

model <- cv.glmnet(x = predictor,
                   y = response$is_alice,
                   family = "binomial",
                   keep = TRUE
                   )

save(model, file = "outputs/models/alice_vs_jane.rda")
```



```r
load("outputs/models/alice_vs_jane.rda")
library(glmnet)
library(broom)

coefs <- model$glmnet.fit %>%
  tidy() %>%
  filter(lambda == model$lambda.1se)

coefs %>% head()
#> # A tibble: 6 × 5
#>   term         step estimate  lambda dev.ratio
#>   <chr>       <dbl>    <dbl>   <dbl>     <dbl>
#> 1 (Intercept)    36 -0.335   0.00597     0.562
#> 2 in             36 -0.144   0.00597     0.562
#> 3 she            36  0.390   0.00597     0.562
#> 4 so             36  0.00249 0.00597     0.562
#> 5 a              36 -0.117   0.00597     0.562
#> 6 about          36  0.279   0.00597     0.562
```


```r
coefs %>%
  group_by(estimate > 0) %>%
  top_n(10, abs(estimate)) %>%
  ungroup() %>%
  ggplot(aes(fct_reorder(term, estimate), estimate, fill = estimate > 0)) +
  geom_col(alpha = 0.8, show.legend = FALSE) +
  coord_flip() +
  theme_minimal() +
  labs(x = "Coefficient",
       y = "Word") +
  scale_fill_brewer(palette = "Set1")
```

<img src="44-text_files/figure-html/unnamed-chunk-15-1.png" width="672" />

Perhaps unsurprisingly, if you mention Alice then it's likely to be a Alice in Wonderland and if you mention Jane then it's likely to be Jane Eyre.











## Topic models

**A version of these notes was previously circulated as part of @Alexander2020.**


### Overview

Sometimes we have a statement and we want to know what it is about. Sometimes this will be easy, but we don't always have titles for statements, and even when we do, sometimes we do not have titles that define topics in a well-defined and consistent way. One way to get consistent estimates of the topics of each statement is to use topic models. While there are many variants, one way is to use the latent Dirichlet allocation (LDA) method of @Blei2003latent, as implemented by the R package 'topicmodels' by @Grun2011. 

The key assumption behind the LDA method is that each statement, 'a document', is made by a person who decides the topics they would like to talk about in that document, and then chooses words, 'terms', that are appropriate to those topics. A topic could be thought of as a collection of terms, and a document as a collection of topics. The topics are not specified *ex ante*; they are an outcome of the method. Terms are not necessarily unique to a particular topic, and a document could be about more than one topic. This provides more flexibility than other approaches such as a strict word count method. The goal is to have the words found in documents group themselves to define topics.


### Document generation process

The LDA method considers each statement to be a result of a process where a person first chooses the topics they want to speak about. After choosing the topics, the person then chooses appropriate words to use for each of those topics. More generally, the LDA topic model works by considering each document as having been generated by some probability distribution over topics. For instance, if there were five topics and two documents, then the first document may be comprised mostly of the first few topics; the other document may be mostly about the final few topics (Figure \@ref(fig:topicsoverdocuments)).

<div class="figure">
<img src="44-text_files/figure-html/topicsoverdocuments-1.png" alt="Probability distributions over topics" width="672" /><img src="44-text_files/figure-html/topicsoverdocuments-2.png" alt="Probability distributions over topics" width="672" />
<p class="caption">(\#fig:topicsoverdocuments)Probability distributions over topics</p>
</div>

Similarly, each topic could be considered a probability distribution over terms. To choose the terms used in each document the speaker picks terms from each topic in the appropriate proportion. For instance, if there were ten terms, then one topic could be defined by giving more weight to terms related to immigration; and some other topic may give more weight to terms related to the economy (Figure \@ref(fig:topicsoverterms)).

<div class="figure">
<img src="44-text_files/figure-html/topicsoverterms-1.png" alt="Probability distributions over terms" width="672" /><img src="44-text_files/figure-html/topicsoverterms-2.png" alt="Probability distributions over terms" width="672" />
<p class="caption">(\#fig:topicsoverterms)Probability distributions over terms</p>
</div>

Following @BleiLafferty2009, @blei2012 and @GriffithsSteyvers2004, the process by which a document is generated is more formally considered to be:

1. There are $1, 2, \dots, k, \dots, K$ topics and the vocabulary consists of $1, 2, \dots, V$ terms. For each topic, decide the terms that the topic uses by randomly drawing distributions over the terms. The distribution over the terms for the $k$th topic is $\beta_k$. Typically a topic would be a small number of terms and so the Dirichlet distribution with hyperparameter $0<\eta<1$ is used: $\beta_k \sim \mbox{Dirichlet}(\eta)$.[^Dirichletfootnote] Strictly, $\eta$ is actually a vector of hyperparameters, one for each $K$, but in practice they all tend to be the same value.
2. Decide the topics that each document will cover by randomly drawing distributions over the $K$ topics for each of the $1, 2, \dots, d, \dots, D$ documents. The topic distributions for the $d$th document are $\theta_d$, and $\theta_{d,k}$ is the topic distribution for topic $k$ in document $d$. Again, the Dirichlet distribution with the hyperparameter $0<\alpha<1$ is used here because usually a document would only cover a handful of topics: $\theta_d \sim \mbox{Dirichlet}(\alpha)$. Again, strictly $\alpha$ is vector of length $K$ of hyperparameters, but in practice each is usually the same value.
3. If there are $1, 2, \dots, n, \dots, N$ terms in the $d$th document, then to choose the $n$th term, $w_{d, n}$:
    a. Randomly choose a topic for that term $n$, in that document $d$, $z_{d,n}$, from the multinomial distribution over topics in that document, $z_{d,n} \sim \mbox{Multinomial}(\theta_d)$. 
    b. Randomly choose a term from the relevant multinomial distribution over the terms for that topic, $w_{d,n} \sim \mbox{Multinomial}(\beta_{z_{d,n}})$.
    
[^Dirichletfootnote]: The Dirichlet distribution is a variation of the beta distribution that is commonly used as a prior for categorical and multinomial variables. If there are just two categories, then the Dirichlet and the beta distributions are the same. In the special case of a symmetric Dirichlet distribution, $\eta=1$, it is equivalent to a uniform distribution. If $\eta<1$, then the distribution is sparse and concentrated on a smaller number of the values, and this number decreases as $\eta$ decreases. A hyperparameter is a parameter of a prior distribution.

Given this set-up, the joint distribution for the variables is (@blei2012, p.6):
$$p(\beta_{1:K}, \theta_{1:D}, z_{1:D, 1:N}, w_{1:D, 1:N}) = \prod^{K}_{i=1}p(\beta_i) \prod^{D}_{d=1}p(\theta_d) \left(\prod^N_{n=1}p(z_{d,n}|\theta_d)p\left(w_{d,n}|\beta_{1:K},z_{d,n}\right) \right).$$

Based on this document generation process the analysis problem, discussed in the next section, is to compute a posterior over $\beta_{1:K}$ and $\theta_{1:D}$, given $w_{1:D, 1:N}$. This is intractable directly, but can be approximated (@GriffithsSteyvers2004 and @blei2012).


### Analysis process

After the documents are created, they are all that we have to analyse. The term usage in each document, $w_{1:D, 1:N}$, is observed, but the topics are hidden, or 'latent'. We do not know the topics of each document, nor how terms defined the topics. That is, we do not know the probability distributions of Figures \@ref(fig:topicsoverdocuments) or \@ref(fig:topicsoverterms). In a sense we are trying to reverse the document generation process -- we have the terms and we would like to discover the topics.

If the earlier process around how the documents were generated is assumed and we observe the terms in each document, then we can obtain estimates of the topics (@SteyversGriffiths2006). The outcomes of the LDA process are probability distributions and these define the topics. Each term will be given a probability of being a member of a particular topic, and each document will be given a probability of being about a particular topic. That is, we are trying to calculate the posterior distribution of the topics given the terms observed in each document (@blei2012, p.7): 
$$p(\beta_{1:K}, \theta_{1:D}, z_{1:D, 1:N} | w_{1:D, 1:N}) = \frac{p\left(\beta_{1:K}, \theta_{1:D}, z_{1:D, 1:N}, w_{1:D, 1:N}\right)}{p(w_{1:D, 1:N})}.$$

The initial practical step when implementing LDA given a corpus of documents is to remove 'stop words'. These are words that are common, but that don't typically help to define topics. There is a general list of stop words such as: "a"; "a's"; "able"; "about"; "above"... We also remove punctuation and capitalisation. The documents need to then be transformed into a document-term-matrix. This is essentially a table with a column of the number of times each term appears in each document.

After the dataset is ready, the R package 'topicmodels' by @Grun2011 can be used to implement LDA and approximate the posterior. It does this using Gibbs sampling or the variational expectation-maximization algorithm. Following @SteyversGriffiths2006 and @Darling2011, the Gibbs sampling process attempts to find a topic for a particular term in a particular document, given the topics of all other terms for all other documents. Broadly, it does this by first assigning every term in every document to a random topic, specified by Dirichlet priors with $\alpha = \frac{50}{K}$ and $\eta = 0.1$  (@SteyversGriffiths2006 recommends $\eta = 0.01$), where $\alpha$ refers to the distribution over topics and $\eta$ refers to the distribution over terms (@Grun2011, p.7). It then selects a particular term in a particular document and assigns it to a new topic based on the conditional distribution where the topics for all other terms in all documents are taken as given (@Grun2011, p.6):
$$p(z_{d, n}=k | w_{1:D, 1:N}, z'_{d, n}) \propto \frac{\lambda'_{n\rightarrow k}+\eta}{\lambda'_{.\rightarrow k}+V\eta} \frac{\lambda'^{(d)}_{n\rightarrow k}+\alpha}{\lambda'^{(d)}_{-i}+K\alpha} $$
where $z'_{d, n}$ refers to all other topic assignments; $\lambda'_{n\rightarrow k}$ is a count of how many other times that term has been assigned to topic $k$; $\lambda'_{.\rightarrow k}$ is a count of how many other times that any term has been assigned to topic $k$; $\lambda'^{(d)}_{n\rightarrow k}$ is a count of how many other times that term has been assigned to topic $k$ in that particular document; and $\lambda'^{(d)}_{-i}$ is a count of how many other times that term has been assigned in that document. Once $z_{d,n}$ has been estimated, then estimates for the distribution of words into topics and topics into documents can be backed out.

This conditional distribution assigns topics depending on how often a term has been assigned to that topic previously, and how common the topic is in that document (@SteyversGriffiths2006). The initial random allocation of topics means that the results of early passes through the corpus of document are poor, but given enough time the algorithm converges to an appropriate estimate. 


### Warnings and extensions

The choice of the number of topics, *k*, affects the results, and must be specified *a priori*. If there is a strong reason for a particular number, then this can be used. Otherwise, one way to choose an appropriate number is to use a test and training set process. Essentially, this means running the process on a variety of possible values for *k* and then picking an appropriate value that performs well.

One weakness of the LDA method is that it considers a 'bag of words' where the order of those words does not matter (@blei2012). It is possible to extend the model to reduce the impact of the bag-of-words assumption and add conditionality to word order. Additionally, alternatives to the Dirichlet distribution can be used to extend the model to allow for correlation. For instance, in Hansard topics related the army may be expected to be more commonly found with topics related to the navy, but less commonly with topics related to banking.







## Word embedding




<!-- ## Simulated example - categorising spending by merchant -->

<!-- *Thank you to Josh Harris for discussions that led to this example. The code draws on Alexander and Leslie, 2019.* -->

<!-- To begin with, let's pretend that we work for KOHO - a Toronto-based fintech. One important feature of the KOHO app is that it categorises your spending. For instance, buying a double-double from Tim Hortons could be categorised into "Eating out". This works because each merchant has a unique name, however that uniqueness means that the Tim Hortons at Sid Smith has a slightly different name to the Tim Hortons at Queen and John. Despite this slightly different name, we would like for them both to be classified as "Eating out".  -->

<!-- To get started, let's generate some data: -->

<!-- ```{r} -->
<!-- library(glmnet) -->
<!-- library(tidytext) -->
<!-- library(tidyverse) -->

<!-- size_of_labelled_data <- 1000 -->

<!-- # List of retailers in Toronto -->
<!-- list_of_retailers <- c("Tim Hortons", "Hudsons Bay", "Loblaws", "Shoppers Drug Mart", "Canadian Tire") -->

<!-- # List of roads in Toronto -->
<!-- # This is from https://en.wikipedia.org/wiki/List_of_north%E2%80%93south_roads_in_Toronto and https://en.wikipedia.org/wiki/List_of_east%E2%80%93west_roads_in_Toronto. -->
<!-- list_of_roads <- c("Adelaide St", "Allen Rd", "Annette St", "Ave Rd", "Bathurst St", "Bay St", "Bayview Ave", "Beare Rd", "Bellamy Rd", "Beverley St", "Birchmount Rd", "Black Creek Dr", "Bloor St", "Blythwood Rd", "Bond St", "Brimley Rd", "BRdview Ave", "Browns Line", "Burnhamthorpe Rd", "Caledonia Rd", "Carlingview Dr", "Carlton St", "Centennial Rd", "Christie St", "Church St", "College St", "Conlins Rd", "Coxwell Ave", "Cummer Ave", "Danforth Ave", "Davenport Rd", "Davisville Ave", "Dixon Rd", "Don Mills Rd", "Don Valley Parkway", "Donlands Ave", "Draper St", "Dufferin St", "Dundas St", "Dupont St", "East Ave", "Eastern Ave", "Eglinton Ave", "Ellesmere Rd", "Ellis Ave", "Finch Ave", "Front St", "Galloway Rd", "Gardiner Expressway", "Gerrard St", "Glencairn Ave", "Greenwood Ave", "Harbord St", "Highway 27", "Highway 401", "Highway 404", "Highway 427", "Islington Ave", "Jameson Ave", "Jane St", "Jarvis St", "John St", "Keele St", "Kennedy Rd", "King St", "Kipling Ave", "Laird Dr", "Lake Shore Boulevard", "Lansdowne Ave", "Lawrence Ave", "Leader Lane", "Leslie St", "Main St", "Manse Rd", "Markham Rd", "Marlee Ave", "Martin Grove Rd", "McCowan Rd", "Meadowvale Rd", "Middlefield Rd", "Midland Ave", "Mill St", "Millwood Rd", "Morningside Ave", "Morrish Rd", "Mount Pleasant Rd", "Neilson Rd", "Oakwood Ave", "OConnor Dr", "Ontario Highway 409", "Orfus Rd", "Orton Park Rd", "Ossington Ave", "Pape Ave", "Parkside Dr", "Parliament St", "Pharmacy Ave", "Port Union Rd", "Queen St", "Queens Park", "Queens Quay", "Rathburn Rd", "Rees St", "Reesor Rd", "Reggae Lane", "Renforth Dr", "Richmond St", "Rogers Rd", "Roncesvalles Ave", "Roselawn Ave", "Royal York Rd", "Runnymede Rd", "Scarborough Golf Club Rd", "Scarborough-Pickering Townline", "Scarlett Rd", "Sewells Rd", "Sheppard Ave", "Sherbourne St", "Simcoe St", "Spadina Ave", "St Clair Ave", "St George St", "Steeles Ave", "The Queensway", "University Ave", "Victoria Park Ave", "Warden Ave", "Wellesley St", "Wellington St", "Weston Rd", "Willowdale Ave", "Wilson Ave", "Woodbine Ave", "Yonge St", "York Mills Rd", "York St") -->

<!-- example_spending_data <-  -->
<!--   tibble( -->
<!--     merchant_actual = sample(list_of_retailers,  -->
<!--                              size = size_of_labelled_data,  -->
<!--                              replace = TRUE), -->
<!--     merchant_unique_name_noise = sample(list_of_roads,  -->
<!--                                         size = size_of_labelled_data,  -->
<!--                                         replace = TRUE), -->
<!--     merchant_unique_name = paste(merchant_actual, merchant_unique_name_noise, sep = " ") -->
<!--     ) %>%  -->
<!--   select(-merchant_unique_name_noise) -->

<!-- head(example_spending_data) -->
<!-- ``` -->

<!-- We could pretend that we have these 1,000 data points of the unique names and that we labelled the actual merchant by hand so that we are sure. Let's use this dataset to train a model. We'll then use that trained model on a new dataset. -->

<!-- First make a separate line for every word.  -->

<!-- ```{r} -->
<!-- all_words <-  -->
<!--   example_spending_data %>% -->
<!--   unnest_tokens(word, merchant_unique_name)  -->

<!-- head(all_words) -->
<!-- ``` -->

<!-- Now create a document-term matrix. -->

<!-- ```{r} -->
<!-- example_dtm <-  -->
<!--   all_words %>% -->
<!--   count(merchant_actual, word, sort = TRUE) %>%  -->
<!--   cast_dtm(merchant_actual, word, n) -->
<!-- ``` -->



<!-- ```{r} -->
<!-- predictor <- example_dtm %>% as.matrix()  -->
<!-- response <- dimnames(example_dtm)[[1]] -->
<!-- ``` -->

<!-- Now we can model it. -->

<!-- ```{r} -->
<!-- # names_model <- cv.glmnet(predictor, -->
<!-- #                          response, -->
<!-- #                          family = "multinomial", -->
<!-- #                          alpha = 0.9) -->
<!-- ``` -->






## Conclusion

Using text as data is exciting because of the quantity and variety of text that is available to us. In general, dealing with text datasets is messy. There is a lot of cleaning and preparation that is typically required. Often text datasets are large. As such, having a workflow in place, in which you work in a reproducible way, simulating data first, and then clearly communicating your findings becomes critical, if only to keep everything organised in your own mind. Nonetheless, it is an exciting area, and I encourage you to regularly use text analysis where possible.

In terms of next steps there are two, related, concerns: data and analysis. 

In terms of data there are many places to get large amounts of text data relatively easily, including:

- The r package `rtweets` makes it easy to get Twitter data (although typically this is going to be looking forward from when you start using it, rather than being able to look back). Plenty of people at U of T work with Twitter data including Jia Xue in the iSchool, and Ludovic Rheault in political science. 
- The inside Airbnb dataset that we used earlier provides text from reviews. 
- We've seen the `gutenbergr` package already in these notes, which provides easy access to text from Project Gutenberg.
- We've seen scraping of Wikipedia, but if you are going to do a bit of this then you may find it better to use a package, for instance `WikipediR`.

In terms of analysis: 

- Start by going through the tidytext book, `tidytext`, as it has a lot of nice explanations, code, and examples.
- It would then be worthwhile working through the Quanteda package `quanteda` tutorials.
- Finally, consider packages such as `text2vec`, and `spacyr`.





## Exercises and tutorial

### Exercises

### Tutorial


