
# Text as data

**Required material**

- Read *The Naked Truth: How the names of 6,816 complexion products can reveal bias in beauty*, [@thenakedtruth].
- Read *Supervised Machine Learning for Text Analysis in R*, Chapters 2 'Tokenization', 3 'Stop words', 6 'Regression', and 7 'Classification', [@hvitfeldt2021supervised].

**Key concepts and skills**

- Understanding text as a dataset that we can use.

**Key libraries**

- `gutenbergr` [@gutenbergr]
- `janitor` [@janitor].
- `tidytext` [@SilgeRobinson2016].

**Key functions**

- `glmnet::glmnet()`
- `gutenbergr::gutenberg_download()`
- `tidytext::bind_tf_idf()`
- `tidytext::cast_dtm()`

## Introduction

Text can be considered an unwieldy, but in general similar, version of the datasets that we have used throughout this book. The main difference is that we will typically begin with very wide data, insofar as often each column is a word, or token more generally. Each entry is then often a count. We would then typically transform this into rather long data, with a column of the word and another column of the count.

The larger size of text datasets means that it is especially important to simulate, and start small, when it comes to their analysis. Using text as data is exciting because of the quantity and variety of text that is available to us. In general, dealing with text datasets is messy. There is a lot of cleaning and preparation that is typically required. Often text datasets are large. As such, having a workflow in place, in which you work in a reproducible way, simulating data first, and then clearly communicating your findings becomes critical, if only to keep everything organized in your own mind. Nonetheless, it is an exciting area.

In terms of next steps there are two, related, concerns: data and analysis. 

In terms of data there are many places to get large amounts of text data relatively easily, from sources that we have already used, including:

- Accessing the Twitter API using `rtweet` [@rtweet].
- Using the Inside Airbnb, which provides text from reviews. 
- Getting the text of out-of-copyright books using `gutenbergr` [@gutenbergr].
- And finally, scraping Wikipedia.

In this chapter we first consider preparing text datasets. We then consider logistic and lasso regression. We finally consider topic models. 

## TF-IDF

Inspired by @sharlasephora and following @thenakedtruth, we will draw on the dataset they put together of makeup names and descriptions from Sephora and Ulta. We are interested in the counts of each word. We can read in the data using `read_csv()`.


```r
library(tidyverse)

makeup <-
  read_csv(file = 
             "https://raw.githubusercontent.com/the-pudding/data/master/foundation-names/allNumbers.csv")

makeup
#> # A tibble: 3,117 × 9
#>    brand  product name  specific lightness hex   lightToDark
#>    <chr>  <chr>   <chr> <chr>        <dbl> <chr> <lgl>      
#>  1 Makeu… Concea… <NA>  F0           0.949 #F2F… TRUE       
#>  2 HOURG… Veil F… Porc… No. 0        0.818 #F6D… TRUE       
#>  3 TOM F… Tracel… Pearl 0.0          0.851 #F0D… TRUE       
#>  4 Arman… Neo Nu… <NA>  0            0.912 #F0E… TRUE       
#>  5 TOM F… Tracel… Pearl 0.0          0.912 #FDE… TRUE       
#>  6 Charl… Magic … <NA>  0            0.731 #D9A… TRUE       
#>  7 Bobbi… Skin W… Porc… 0            0.822 #F3C… TRUE       
#>  8 Given… Matiss… <NA>  N00          0.831 #F5D… TRUE       
#>  9 Smash… Studio… <NA>  0.1          0.814 #F8C… TRUE       
#> 10 Smash… Studio… <NA>  0.1          0.910 #F9E… TRUE       
#> # … with 3,107 more rows, and 2 more variables:
#> #   numbers <dbl>, id <dbl>
```

We will focus on 'product', which provides the name of the item, and 'lightness' which is a value between 0 and 1. We are interested in whether products with lightness values that are less than 0.5, typically use different words to those with lightness values that are at least 0.5.




```r
makeup <-
  makeup |>
  select(product, lightness) |>
  mutate(lightness_above_half = if_else(lightness >= 0.5, "Yes", "No")
         )

table(makeup$lightness_above_half)
#> 
#>   No  Yes 
#>  702 2415
```

In this example we are going to split everything into separate words. When we do this, it is just searching for a space. And so, it will be the case that more than just words will be considered 'words', for instance, numbers. We use `unnest_tokens()` from `tidytext` [@SilgeRobinson2016] to do this.


```r
library(tidytext)

makeup_by_words <-
  makeup |>
  unnest_tokens(output = word, 
                input = product, 
                token = "words")

head(makeup_by_words)
#> # A tibble: 6 × 3
#>   lightness lightness_above_half word      
#>       <dbl> <chr>                <chr>     
#> 1     0.949 Yes                  conceal   
#> 2     0.949 Yes                  define    
#> 3     0.949 Yes                  full      
#> 4     0.949 Yes                  coverage  
#> 5     0.949 Yes                  foundation
#> 6     0.818 Yes                  veil
```

We now want to count the number of times each word is used by each of the lightness classifications.


```r
makeup_by_words <-
  makeup_by_words |>
  count(lightness_above_half, word, sort = TRUE)

makeup_by_words |>
  filter(lightness_above_half == "Yes") |>
  slice(1:5)
#> # A tibble: 5 × 3
#>   lightness_above_half word           n
#>   <chr>                <chr>      <int>
#> 1 Yes                  foundation  2214
#> 2 Yes                  skin         452
#> 3 Yes                  spf          443
#> 4 Yes                  matte        422
#> 5 Yes                  powder       327

makeup_by_words |>
  filter(lightness_above_half == "No") |>
  slice(1:5)
#> # A tibble: 5 × 3
#>   lightness_above_half word           n
#>   <chr>                <chr>      <int>
#> 1 No                   foundation   674
#> 2 No                   matte        106
#> 3 No                   spf          103
#> 4 No                   skin          98
#> 5 No                   liquid        89
```

We can see that the most popular words appear to be similar between the two categories. At this point, we could use the data in a variety of ways. We might be interested to know which words characterize each group---that is to say, which words are commonly used only in each group. We can do that by first looking at a word's term frequency (tf), which is how many times a word is used in the product name. The issue is that there are a lot of words that are commonly used regardless of context. As such, we may also like to look at the inverse document frequency (idf) in which we 'penalize' words that occur in both groups. For instance, we have seen that 'foundation' occurs in both products with high and low lightness values. And so, its idf would be lower than another word which only occurred in products that did not have a lightness value above half. The term frequency–inverse document frequency (tf-idf) is then the product of these.

We can create this value using `bind_tf_idf()` from `tidytext`. It will create a bunch of new columns, one for each word and star combination.


```r
makeup_by_words_tf_idf <-
  makeup_by_words |>
  bind_tf_idf(term = word, 
              document = lightness_above_half, 
              n = n) |>
  arrange(-tf_idf)

makeup_by_words_tf_idf
#> # A tibble: 505 × 6
#>    lightness_above_half word        n       tf   idf  tf_idf
#>    <chr>                <chr>   <int>    <dbl> <dbl>   <dbl>
#>  1 Yes                  cushion    25 0.00187  0.693 1.30e-3
#>  2 Yes                  combo      16 0.00120  0.693 8.31e-4
#>  3 Yes                  custom     16 0.00120  0.693 8.31e-4
#>  4 Yes                  oily       16 0.00120  0.693 8.31e-4
#>  5 Yes                  perfect    16 0.00120  0.693 8.31e-4
#>  6 Yes                  refill     16 0.00120  0.693 8.31e-4
#>  7 Yes                  50         14 0.00105  0.693 7.27e-4
#>  8 Yes                  compact    13 0.000974 0.693 6.75e-4
#>  9 Yes                  lifting    12 0.000899 0.693 6.23e-4
#> 10 Yes                  satte      12 0.000899 0.693 6.23e-4
#> # … with 495 more rows
```



```r
makeup_by_words_tf_idf |>
  group_by(lightness_above_half) |>
  slice(1:5)
#> # A tibble: 10 × 6
#> # Groups:   lightness_above_half [2]
#>    lightness_above_half word         n      tf   idf  tf_idf
#>    <chr>                <chr>    <int>   <dbl> <dbl>   <dbl>
#>  1 No                   able         2 5.25e-4 0.693 3.64e-4
#>  2 No                   concent…     2 5.25e-4 0.693 3.64e-4
#>  3 No                   marc         2 5.25e-4 0.693 3.64e-4
#>  4 No                   re           2 5.25e-4 0.693 3.64e-4
#>  5 No                   look         1 2.63e-4 0.693 1.82e-4
#>  6 Yes                  cushion     25 1.87e-3 0.693 1.30e-3
#>  7 Yes                  combo       16 1.20e-3 0.693 8.31e-4
#>  8 Yes                  custom      16 1.20e-3 0.693 8.31e-4
#>  9 Yes                  oily        16 1.20e-3 0.693 8.31e-4
#> 10 Yes                  perfect     16 1.20e-3 0.693 8.31e-4
```



## Lasso regression

One of the nice aspects of text is that we can adapt our existing methods to use it as an input. Here we are going to use logistic regression, along with text inputs, to forecast. Inspired by @silge2018 we are going to have two different text inputs, train a model on a sample of text from each of them, and then try to use that model to forecast the text in a training set. Although this is a arbitrary example, we could imagine many real-world applications. For instance, we may be interested in whether some text was likely written by a bot or a human

First we need to get some data. We use books from Project Gutenberg using `gutenberg_download()` from `gutenbergr` [@gutenbergr]. We will consider *Jane Eyre* [@janeeyre] and *Alice's Adventures in Wonderland* [@citealice].


```r
library(gutenbergr)
library(tidyverse)

# The books that we are interested in have the keys of 1260 and 11, respectively.
alice_and_jane <- 
  gutenberg_download(
    gutenberg_id = c(1260, 11), 
    meta_fields = "title")

write_csv(alice_and_jane, "alice_and_jane.csv")

head(alice_and_jane)
```



One of the great things about this is that the dataset is a tibble. So we can work with all our familiar skills. Each line of the book is read in as a different row in the dataset. Notice that we have downloaded two books here at once, and so we added the title. The two books are one after each other. 

By looking at the number of lines in each, it looks like *Jane Eyre* is much longer than *Alice in Wonderland*. We will start by getting rid of blank lines using `remove_empty()` from `janitor` [@janitor].


```r
library(janitor)
#> 
#> Attaching package: 'janitor'
#> The following objects are masked from 'package:stats':
#> 
#>     chisq.test, fisher.test

alice_and_jane <- 
  alice_and_jane %>% 
  mutate(blank_line = if_else(text == "", 1, 0)) %>% 
  filter(blank_line == 0) %>% 
  select(-blank_line)

table(alice_and_jane$title)
#> 
#> Alice's Adventures in Wonderland 
#>                             2481 
#>      Jane Eyre: An Autobiography 
#>                            16395
```

There is still an overwhelming amount of *Jane Eyre*, compared with *Alice in Wonderland*, so we will sample from *Jane Eyre* to make it more equal.


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
#> Alice's Adventures in Wonderland 
#>                             2481 
#>      Jane Eyre: An Autobiography 
#>                             2481
```

There are a variety of issues here, for instance, we have the whole of Alice, but we only have random bits of Jane, but nonetheless we will continue and add a counter with the line number for each book.


```r
alice_and_jane <- 
  alice_and_jane %>% 
  group_by(title) %>% 
  mutate(line_number = paste(gutenberg_id, row_number(), sep = "_")) %>% 
  ungroup()
```

We now want to unnest the tokes. We will use `unnest_tokens()` from `tidytext` [@SilgeRobinson2016].


```r
library(tidytext)

alice_and_jane_by_word <- 
  alice_and_jane %>% 
  unnest_tokens(word, text) %>%
  group_by(word) %>%
  filter(n() > 10) %>%
  ungroup()
```

We remove any word that was not used more than 10 times. Nonetheless we still have more than 500 unique words. (If we did not require that the word be used by the author at least 10 times then we end up with more than 6,000 words.)

The reason this is relevant is because these are our independent variables. So where we may be used to having something less than 10 explanatory variables, in this case we are going to have 585 As such, we need a model that can handle this.

However, as mentioned before, we are going to have some rows that essentially just had one word. And so we filter for that also, which ensures that the model will have at least some words to work with.


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
```

Then we can use `cast_dtm()` to create a document-term matrix. This provides a count of how many times each word is used.


```r
alice_and_jane_dtm_training <- 
  alice_and_jane_by_word %>% 
  count(line_number, word) %>% 
  inner_join(training(alice_and_jane_by_word_split) %>% select(line_number)) %>% 
  cast_dtm(term = word, document = line_number, value = n)
#> Joining, by = "line_number"

dim(alice_and_jane_dtm_training)
#> [1] 3413  585
```

So we have our independent variables sorted, now we need our binary dependent variable, which is whether the book is Alice in Wonderland or Jane Eyre.


```r
response <- 
  data.frame(id = dimnames(alice_and_jane_dtm_training)[[1]]) %>% 
  separate(id, into = c("book", "line", sep = "_")) %>% 
  mutate(is_alice = if_else(book == 11, 1, 0)) 
#> Warning: Expected 3 pieces. Missing pieces filled with `NA`
#> in 3413 rows [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
#> 15, 16, 17, 18, 19, 20, ...].
  
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

save(model, file = "alice_vs_jane.rda")
```





```r
library(glmnet)
#> Loading required package: Matrix
#> 
#> Attaching package: 'Matrix'
#> The following objects are masked from 'package:tidyr':
#> 
#>     expand, pack, unpack
#> Loaded glmnet 4.1-3
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

<img src="44-text_files/figure-html/unnamed-chunk-20-1.png" width="672" />

Perhaps unsurprisingly, if a line mentions Alice then it is likely to be a Alice in Wonderland and if it mention Jane then it is likely to be Jane Eyre.











## Topic models

Sometimes we have a statement and we want to know what it is about. Sometimes this will be easy, but we do not always have titles for statements, and even when we do, sometimes we do not have titles that define topics in a well-defined and consistent way. One way to get consistent estimates of the topics of each statement is to use topic models. While there are many variants, one way is to use the latent Dirichlet allocation (LDA) method of @Blei2003latent, as implemented by the R package 'topicmodels' by @Grun2011. 

The key assumption behind the LDA method is that each statement, 'a document', is made by a person who decides the topics they would like to talk about in that document, and then chooses words, 'terms', that are appropriate to those topics. A topic could be thought of as a collection of terms, and a document as a collection of topics. The topics are not specified *ex ante*; they are an outcome of the method. Terms are not necessarily unique to a particular topic, and a document could be about more than one topic. This provides more flexibility than other approaches such as a strict word count method. The goal is to have the words found in documents group themselves to define topics.

LDA considers each statement to be a result of a process where a person first chooses the topics they want to speak about. After choosing the topics, the person then chooses appropriate words to use for each of those topics. More generally, the LDA topic model works by considering each document as having been generated by some probability distribution over topics. For instance, if there were five topics and two documents, then the first document may be comprised mostly of the first few topics; the other document may be mostly about the final few topics (Figure \@ref(fig:topicsoverdocuments)).

<div class="figure">
<img src="44-text_files/figure-html/topicsoverdocuments-1.png" alt="Probability distributions over topics" width="50%" /><img src="44-text_files/figure-html/topicsoverdocuments-2.png" alt="Probability distributions over topics" width="50%" />
<p class="caption">(\#fig:topicsoverdocuments)Probability distributions over topics</p>
</div>

Similarly, each topic could be considered a probability distribution over terms. To choose the terms used in each document the speaker picks terms from each topic in the appropriate proportion. For instance, if there were ten terms, then one topic could be defined by giving more weight to terms related to immigration; and some other topic may give more weight to terms related to the economy (Figure \@ref(fig:topicsoverterms)).

<div class="figure">
<img src="44-text_files/figure-html/topicsoverterms-1.png" alt="Probability distributions over terms" width="50%" /><img src="44-text_files/figure-html/topicsoverterms-2.png" alt="Probability distributions over terms" width="50%" />
<p class="caption">(\#fig:topicsoverterms)Probability distributions over terms</p>
</div>

Following @BleiLafferty2009, @blei2012 and @GriffithsSteyvers2004, the process by which a document is generated is more formally considered to be:

1. There are $1, 2, \dots, k, \dots, K$ topics and the vocabulary consists of $1, 2, \dots, V$ terms. For each topic, decide the terms that the topic uses by randomly drawing distributions over the terms. The distribution over the terms for the $k$th topic is $\beta_k$. Typically a topic would be a small number of terms and so the Dirichlet distribution with hyperparameter $0<\eta<1$ is used: $\beta_k \sim \mbox{Dirichlet}(\eta)$.[^Dirichletfootnote] Strictly, $\eta$ is actually a vector of hyperparameters, one for each $K$, but in practice they all tend to be the same value.
2. Decide the topics that each document will cover by randomly drawing distributions over the $K$ topics for each of the $1, 2, \dots, d, \dots, D$ documents. The topic distributions for the $d$th document are $\theta_d$, and $\theta_{d,k}$ is the topic distribution for topic $k$ in document $d$. Again, the Dirichlet distribution with the hyperparameter $0<\alpha<1$ is used here because usually a document would only cover a handful of topics: $\theta_d \sim \mbox{Dirichlet}(\alpha)$. Again, strictly $\alpha$ is vector of length $K$ of hyperparameters, but in practice each is usually the same value.
3. If there are $1, 2, \dots, n, \dots, N$ terms in the $d$th document, then to choose the $n$th term, $w_{d, n}$:
    a. Randomly choose a topic for that term $n$, in that document $d$, $z_{d,n}$, from the multinomial distribution over topics in that document, $z_{d,n} \sim \mbox{Multinomial}(\theta_d)$. 
    b. Randomly choose a term from the relevant multinomial distribution over the terms for that topic, $w_{d,n} \sim \mbox{Multinomial}(\beta_{z_{d,n}})$.
    
The Dirichlet distribution is a variation of the beta distribution that is commonly used as a prior for categorical and multinomial variables. If there are just two categories, then the Dirichlet and the beta distributions are the same. In the special case of a symmetric Dirichlet distribution, $\eta=1$, it is equivalent to a uniform distribution. If $\eta<1$, then the distribution is sparse and concentrated on a smaller number of the values, and this number decreases as $\eta$ decreases. A hyperparameter is a parameter of a prior distribution.

Given this set-up, the joint distribution for the variables is (@blei2012, p.6):
$$p(\beta_{1:K}, \theta_{1:D}, z_{1:D, 1:N}, w_{1:D, 1:N}) = \prod^{K}_{i=1}p(\beta_i) \prod^{D}_{d=1}p(\theta_d) \left(\prod^N_{n=1}p(z_{d,n}|\theta_d)p\left(w_{d,n}|\beta_{1:K},z_{d,n}\right) \right).$$

Based on this document generation process the analysis problem, discussed in the next section, is to compute a posterior over $\beta_{1:K}$ and $\theta_{1:D}$, given $w_{1:D, 1:N}$. This is intractable directly, but can be approximated (@GriffithsSteyvers2004 and @blei2012).

After the documents are created, they are all that we have to analyze. The term usage in each document, $w_{1:D, 1:N}$, is observed, but the topics are hidden, or 'latent'. We do not know the topics of each document, nor how terms defined the topics. That is, we do not know the probability distributions of Figures \@ref(fig:topicsoverdocuments) or \@ref(fig:topicsoverterms). In a sense we are trying to reverse the document generation process -- we have the terms and we would like to discover the topics.

If the earlier process around how the documents were generated is assumed and we observe the terms in each document, then we can obtain estimates of the topics (@SteyversGriffiths2006). The outcomes of the LDA process are probability distributions and these define the topics. Each term will be given a probability of being a member of a particular topic, and each document will be given a probability of being about a particular topic. That is, we are trying to calculate the posterior distribution of the topics given the terms observed in each document (@blei2012, p.7): 
$$p(\beta_{1:K}, \theta_{1:D}, z_{1:D, 1:N} | w_{1:D, 1:N}) = \frac{p\left(\beta_{1:K}, \theta_{1:D}, z_{1:D, 1:N}, w_{1:D, 1:N}\right)}{p(w_{1:D, 1:N})}.$$

The initial practical step when implementing LDA given a corpus of documents is to remove 'stop words'. These are words that are common, but that do not typically help to define topics. There is a general list of stop words such as: "a"; "a's"; "able"; "about"; "above"... We also remove punctuation and capitalization. The documents need to then be transformed into a document-term-matrix. This is essentially a table with a column of the number of times each term appears in each document.

After the dataset is ready, the R package 'topicmodels' by @Grun2011 can be used to implement LDA and approximate the posterior. It does this using Gibbs sampling or the variational expectation-maximization algorithm. Following @SteyversGriffiths2006 and @Darling2011, the Gibbs sampling process attempts to find a topic for a particular term in a particular document, given the topics of all other terms for all other documents. Broadly, it does this by first assigning every term in every document to a random topic, specified by Dirichlet priors with $\alpha = \frac{50}{K}$ and $\eta = 0.1$  (@SteyversGriffiths2006 recommends $\eta = 0.01$), where $\alpha$ refers to the distribution over topics and $\eta$ refers to the distribution over terms (@Grun2011, p.7). It then selects a particular term in a particular document and assigns it to a new topic based on the conditional distribution where the topics for all other terms in all documents are taken as given (@Grun2011, p.6):
$$p(z_{d, n}=k | w_{1:D, 1:N}, z'_{d, n}) \propto \frac{\lambda'_{n\rightarrow k}+\eta}{\lambda'_{.\rightarrow k}+V\eta} \frac{\lambda'^{(d)}_{n\rightarrow k}+\alpha}{\lambda'^{(d)}_{-i}+K\alpha} $$
where $z'_{d, n}$ refers to all other topic assignments; $\lambda'_{n\rightarrow k}$ is a count of how many other times that term has been assigned to topic $k$; $\lambda'_{.\rightarrow k}$ is a count of how many other times that any term has been assigned to topic $k$; $\lambda'^{(d)}_{n\rightarrow k}$ is a count of how many other times that term has been assigned to topic $k$ in that particular document; and $\lambda'^{(d)}_{-i}$ is a count of how many other times that term has been assigned in that document. Once $z_{d,n}$ has been estimated, then estimates for the distribution of words into topics and topics into documents can be backed out.

This conditional distribution assigns topics depending on how often a term has been assigned to that topic previously, and how common the topic is in that document (@SteyversGriffiths2006). The initial random allocation of topics means that the results of early passes through the corpus of document are poor, but given enough time the algorithm converges to an appropriate estimate. 


The choice of the number of topics, *k*, affects the results, and must be specified *a priori*. If there is a strong reason for a particular number, then this can be used. Otherwise, one way to choose an appropriate number is to use a test and training set process. Essentially, this means running the process on a variety of possible values for *k* and then picking an appropriate value that performs well.

One weakness of the LDA method is that it considers a 'bag of words' where the order of those words does not matter (@blei2012). It is possible to extend the model to reduce the impact of the bag-of-words assumption and add conditionality to word order. Additionally, alternatives to the Dirichlet distribution can be used to extend the model to allow for correlation. For instance, in Hansard topics related the army may be expected to be more commonly found with topics related to the navy, but less commonly with topics related to banking.







<!-- ## Word embedding -->




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






## Exercises and tutorial

### Exercises

### Tutorial



