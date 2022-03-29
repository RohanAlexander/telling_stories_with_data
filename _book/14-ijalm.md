
# It's Just A Linear Model {#ijalm}

**Required material**

- Read *An Introduction to Statistical Learning with Applications in R*, Chapters 3 'Linear Regression', and 4 'Classification', [@islr]
- Read *Data Analysis Using Regression and Multilevel/Hierarchical Models*, Chapters 3 'Linear regression: the basics', 4 'Linear regression: before and after fitting the model', 5 'Logistic regression', and 6 'Generalized linear models', [@gelmanandhill]
- Read *Why most published research findings are false*, [@ioannidis2005most]

<!-- - Pavlik, Kaylin, 2018, 'Exploring the Relationship Between Dog Names and Breeds', https://www.kaylinpavlik.com/dog-names-tfidf/. -->
<!-- - Pavlik, Kaylin, 2019, 'Understanding + classifying genres using Spotify audio features', https://www.kaylinpavlik.com/classifying-songs-genres/. -->
<!-- - Silge, Julia, 2019, 'Modeling salary and gender in the tech industry', https://juliasilge.com/blog/salary-gender/. -->
<!-- - Silge, Julia, 2019, 'Opioid prescribing habits in Texas', https://juliasilge.com/blog/texas-opioids/. -->
<!-- - Silge, Julia, 2019, 'Tidymodels', https://juliasilge.com/blog/intro-tidymodels/. -->
<!-- - Silge, Julia, 2020, '#TidyTuesday hotel bookings and recipes', https://juliasilge.com/blog/hotels-recipes/. -->
<!-- - Silge, Julia, 2020, 'Hyperparameter tuning and #TidyTuesday food consumption', https://juliasilge.com/blog/food-hyperparameter-tune/. -->
<!-- - Taddy, Matt, 2019, *Business Data Science*, Chapters 2 and 4. -->
<!-- - Wasserstein, Ronald L. and Nicole A. Lazar, 2016, 'The ASA Statement on p-Values: Context, Process, and Purpose', *The American Statistician*, 70:2, 129-133, DOI: 10.1080/00031305.2016.1154108. -->
<!-- https://rviews.rstudio.com/2020/03/10/comparing-machine-learning-algorithms-for-predicting-clothing-classes-part-3/ -->
<!-- https://juliasilge.com/blog/tuition-resampling/ -->


**Key concepts and skills**

- Simple and multiple linear regression.
- Logistic and Poisson regression.
- The key role of uncertainty.
- Threats to validity of inference.
- Overfitting.

**Key libraries**

- `broom` [@broom]
- `modelsummary` [@citemodelsummary]
- `rstanarm` [@citerstanarm]
- `tidymodels` [@citeTidymodels]
- `tidyverse` [@citetidyverse]

**Key functions**

- `broom::augment()`
- `broom::glance()`
- `broom::tidy()`
- `glm()`
- `lm()`
- `modelsummary::modelsummary()`
- `parsnip::fit()`
- `parsnip::linear_reg()`
- `parsnip::logistic_reg()`
- `parsnip::set_engine()`
- `poissonreg::poisson_reg()`
- `rnorm()`
- `rpois()`
- `rsample::initial_split()`
- `rsample::testing()`
- `rsample::training()`
- `sample()`
- `set.seed()`
- `summary()`







## Introduction

Linear models have been around for a long time. For instance, speaking about the development of least squares, which is one way to fit linear models, in the 1700s, @stigler [p.16] describes how it was associated with foundational problems in astronomy, such as determining the motion of the moon and reconciling the non-periodic motion of Jupiter and Saturn. The fundamental issue at the time with least squares was that of hesitancy to combine different observations. Astronomers were early to develop a comfort with doing this because they had typically gathered their observations themselves and knew that the conditions of the data gathering were similar, even though the value of the observation was different. It took longer for social scientists to become comfortable with linear models, possibly because they were hesitant to group together data they worried was not alike. In this sense, astronomers had an advantage because they could compare their predictions with what actually happened whereas this was more difficult for social scientists [@stigler, p. 163]. 

Galton and others of his generation, some of whom were eugenicists, used linear regression in earnest in the late 1800s and early 1900s. Binary outcomes quickly became of interest and needed special treatment, leading to the development and wide adaption of logistic regression and similar methods in the mid-1900s [@cramer2002origins]. The generalized linear model framework came into being, in a formal sense, in the 1970s with @nelder1972generalized who brought this all together. Generalized linear models (GLM) broaden the types of outcomes that are allowed. We still model outcomes as a linear function, but we are not constrained to an outcome that is normally distributed. The outcome can be anything in the exponential family, and popular choices include the logistic distribution, and the Poisson distribution. A further generalization of GLMs is generalized additive models where we broaden the structure of the explanatory side. We still explain the dependent variable as an additive function of various bits and pieces, but those bits and pieces can be functions. This framework, in this way, came about in the 1990s, with @hastie1990generalized.

It is important to recognize that when we build models, we are not discovering 'the truth'. We are using the model to help us explore and understand the data that we have. There is no one best model, there are just useful models that help us learn something about the data that we have and hence, hopefully, something about the world from which the data were generated. When we use models, we are trying to understand the world, but there are enormous constraints on the perspective we bring to this. It is silly to expect one model to be universal. Further, we should not just blindly throw data into a regression model and hope that it will sort it out. 'Regression will not sort it out. Regression is indeed an oracle, but a cruel one. It speaks in riddles and delights in punishing us for asking bad questions' [@citemcelreath, p. 162].

We use models to understand the world. We poke, push, and test them. We build them and rejoice in their beauty, and then seek to understand their limits and ultimately destroy them. It is this process that is important, it is this process that allows us to better understand the world; not the outcome. When we build models, we need to keep in mind both the world of the model and the broader world that we want to be able to speak about. To what extent does a model trained on the experiences of straight, cis, men, speak to the world as it is? It is not worthless, but it is also not unimpeachable. To what extent does the model teach us about the data that we have? To what extent do the data that we have reflect the world about which we would like to draw conclusions? We need to keep such questions front of mind.

Much of statistics was developed without concern for broader implications. And that was reasonable because it was developed for situations such as astronomy and agriculture. Folks were literally able to randomize the order of fields and planting because they literally worked at agricultural stations. But many of the subsequent applications in the twentieth and twenty-first centuries, do not have those properties. Statistical science is often taught as though it proceeds through some idealized process where a hypothesis appears, is tested, and is either confirmed or not. But that is not what happens. We react to incentives. We dabble, guess, and test, and then follow our intuition, backfilling as we need. All of this is fine. But it is not a world in which a traditional null hypothesis holds completely, which means concepts such as p-values and power lose some of their meaning. While we need to understand the 'old world', we also need to be sophisticated enough to know when we need to move away from it. We can appreciate the beauty and ingenuity of a Ford Model T, at the same time recognizing we could not use it to win Le Mans.

In this chapter we begin with simple linear regression, and then move to multiple linear regression, the difference being the number of explanatory variables that we allow. We then consider logistic and Poisson regression. We consider three approaches for each of these: base R, which is useful when we want to quickly use the models in EDA; `tidymodels` [@citeTidymodels] which is useful when we are interested in forecasting; and `rstanarm` [@citerstanarm] when we are interested in understanding. Regardless of the approach we use, the important thing to remember is that modelling in this way is just fancy averaging. The chapter is named for a quote by Daniela Witten, Professor, University of Washington, who identifies how far we can get with linear models and the huge extent to which they underpin statistics. 





## Simple linear regression

When we are interested in the relationship between two continuous variables, say $y$ and $x$, we can use simple linear regression. This is based on the Normal, also 'Gaussian', distribution. The shape of the Normal distribution is determined by two parameters, the mean $\mu$ and the standard deviation, $\sigma$: 

$$y = \frac{1}{\sqrt{2\pi\sigma}}e^{-\frac{1}{2}z^2},$$
where $z = (x - \mu)/\sigma$ is the difference between the mean, $\mu$, and $x$ in terms of the standard deviation [@pitman, p. 94].

As discussed in Chapter \@ref(r-essentials), we use `rnorm()` to simulate data from the Normal distribution. 


```r
library(tidyverse)

set.seed(853)

twenty_draws_from_normal_distribution <- 
  tibble(draws = rnorm(n = 20, mean = 0, sd = 1))
  
twenty_draws_from_normal_distribution
#> # A tibble: 20 x 1
#>      draws
#>      <dbl>
#>  1 -0.360 
#>  2 -0.0406
#>  3 -1.78  
#>  4 -1.12  
#>  5 -1.00  
#>  6  1.78  
#>  7 -1.39  
#>  8 -0.497 
#>  9 -0.558 
#> 10 -0.824 
#> 11  1.67  
#> 12 -0.682 
#> 13  0.0652
#> 14 -0.260 
#> 15  0.329 
#> 16 -0.437 
#> 17 -0.323 
#> 18  0.115 
#> 19  0.842 
#> 20  0.342
```

Here we specified $n=20$ draws from a Normal distribution with mean of 0 and standard deviation of 1. When we deal with real data, we will not know these parameters and we want to use our data to estimate them. We can estimate the mean, $\bar{x}$, and standard deviation, $\hat{\sigma}_x$, with the following estimators:

$$
\begin{aligned}
 \bar{x} &= \frac{1}{n} \times \sum_{i = 1}^{n}x_i\\
 \hat{\sigma}_{x} &= \sqrt{\frac{1}{n} \times \sum_{i = 1}^{n}\left(x_i - \bar{x}\right)^2}
\end{aligned}
$$

If $\hat{\sigma}_x$ is the standard deviation, then a standard error of an estimate, say, $\bar{x}$ is:
$$\mbox{SE}(\bar{x})^2 = \frac{\sigma^2}{n}$$


```r
estimated_mean <-
  sum(twenty_draws_from_normal_distribution$draws) / nrow(twenty_draws_from_normal_distribution)

estimated_mean
#> [1] -0.2069253

estimated_mean <-
  twenty_draws_from_normal_distribution |> 
  mutate(draws_diff_square = (draws - estimated_mean)^2)

estimated_standard_deviation <- 
  sqrt(
    sum(estimated_mean$draws_diff_square) / nrow(twenty_draws_from_normal_distribution)
  )

estimated_standard_deviation
#> [1] 0.8832841
```

We should not be worried that our estimates are slightly off. It will typically take a larger number of draws before we get the expected shape, and our estimated parameters get close to the actual parameters, but it will happen (Figure \@ref(fig:normaldistributiontakingshape)). @wasserman [p. 76] describes our certainty of this, which is due to the Law of Large Numbers, as 'a crowning achievement in probability'.


```r
library(tidyverse)

set.seed(853)

tibble(
  number_of_draws = c(
    rep.int(x = "2 draws", times = 2),
    rep.int(x = "5 draws", times = 5),
    rep.int(x = "10 draws", times = 10),
    rep.int(x = "50 draws", times = 50),
    rep.int(x = "100 draws", times = 100),
    rep.int(x = "500 draws", times = 500),
    rep.int(x = "1,000 draws", times = 1000),
    rep.int(x = "10,000 draws", times = 10000),
    rep.int(x = "100,000 draws", times = 100000)
  ),
  draws = c(
    rnorm(n = 2, mean = 0, sd = 1),
    rnorm(n = 5, mean = 0, sd = 1),
    rnorm(n = 10, mean = 0, sd = 1),
    rnorm(n = 50, mean = 0, sd = 1),
    rnorm(n = 100, mean = 0, sd = 1),
    rnorm(n = 500, mean = 0, sd = 1),
    rnorm(n = 1000, mean = 0, sd = 1),
    rnorm(n = 10000, mean = 0, sd = 1),
    rnorm(n = 100000, mean = 0, sd = 1)
  )
) |>
  mutate(number_of_draws = as_factor(number_of_draws)) |>
  ggplot(aes(x = draws)) +
  geom_density() +
  theme_minimal() +
  facet_wrap(vars(number_of_draws),
             scales = "free_y") +
  labs(x = 'Draw',
       y = 'Density')
```

![(\#fig:normaldistributiontakingshape)The Normal distribution takes its familiar shape as the number of draws increases](14-ijalm_files/figure-latex/normaldistributiontakingshape-1.pdf) 

When we use simple linear regression, we assume that our relationship is characterized by the variables and the parameters. If we have two variables, $Y$ and $X$, then we could characterize a linear relationship between these as:
$$Y \approx \beta_0 + \beta_1 X.$$

There are two coefficients, also 'parameters': the 'intercept', $\beta_0$, and the 'slope', $\beta_1$. We are saying that $Y$ will have some value, $\beta_0$, even when $X$ is 0, and that $Y$ will change by $\beta_1$ units for every one unit change in $X$. The language that we use is that 'X is being regressed on Y'. We may then take this relationship to the data that we have, in order to estimate these coefficients, for the particular data that we have.

To make this example concrete, we will simulate some data and then discuss it in that context. For instance, we could consider the time it takes someone to run five kilometers, compared with the time it takes them to run a marathon (Figure \@ref(fig:fivekmvsmarathon)). We impute a relationship of 8.4, as that is roughly the ratio between the distance of a marathon and a five-kilometer race.


```r
set.seed(853)

number_of_observations <- 100
expected_relationship <- 8.4

simulated_running_data <- 
  tibble(five_km_time = 
           runif(n = number_of_observations, 
                 min = 15, 
                 max = 30),
         noise = rnorm(number_of_observations, 0, 20),
         marathon_time = five_km_time * expected_relationship + noise
         ) |>
  mutate(five_km_time = round(five_km_time, digits = 1),
         marathon_time = round(marathon_time, digits = 1)) |>
  select(-noise)

simulated_running_data
#> # A tibble: 100 x 2
#>    five_km_time marathon_time
#>           <dbl>         <dbl>
#>  1         20.4          152.
#>  2         16.8          134.
#>  3         22.3          198.
#>  4         19.7          166.
#>  5         15.6          163.
#>  6         21.1          168.
#>  7         17            131.
#>  8         18.6          150.
#>  9         17.4          158.
#> 10         17.8          147.
#> # ... with 90 more rows
```



```r
simulated_running_data |> 
  ggplot(aes(x = five_km_time, y = marathon_time)) +
  geom_point() +
  labs(x = "Five-kilometer time (minutes)",
       y = "Marathon time (minutes)") +
  theme_classic()
```

![(\#fig:fivekmvsmarathon)Simulated data of the relationship between the time to run five kilometers and a marathon](14-ijalm_files/figure-latex/fivekmvsmarathon-1.pdf) 

In this simulated example, we know what $\beta_0$ and $\beta_1$ are. But our challenge is to see if we can use only the data, and simple linear regression, to recover them. That is, can we use $x$, which is the five-kilometer time, to produce estimates of $y$, which is the marathon time, and which we will put a hat on to denote our estimate:

$$\hat{y} = \hat{\beta}_0 + \hat{\beta}_1 x.$$
The hats are used to indicate that these are estimated values.

This involves estimating values for $\beta_0$ and $\beta_1$, and again, our estimates will be denoted by a hat on them. But how should we estimate these coefficients? Even if we impose a linear relationship there are many options, because a large number of straight lines could be drawn. But some of those lines would fit the data better than others.

One way we may define a line as being 'better' than another, is if it is as close as possible to each of the $x$ and $y$ combinations that we know. There are a lot of candidates for how we define 'as close as possible', but one is to minimize the residual sum of squares. To do this we produce estimates for $\hat{y}$ based on some guesses of $\hat{\beta}_0$ and $\hat{\beta}_1$, given the $x$. We then work out how 'wrong', for every point $i$, we were:
$$e_i = y_i - \hat{y}_i.$$

To compute the residual sum of squares (RSS), we sum across all the points, taking the square to account for negative differences:
$$\mbox{RSS} = e^2_1+ e^2_2 +\dots + e^2_n.$$
This results in one 'linear best-fit' line (Figure \@ref(fig:fivekmvsmarathonwithbestfit)), but it is worth thinking about all the assumptions and decisions that it took to get us to this point.


```r
simulated_running_data |> 
  ggplot(aes(x = five_km_time, y = marathon_time)) +
  geom_point() + 
  geom_smooth(method = "lm", 
              se = FALSE, 
              color = "black", 
              linetype = "dashed",
              formula = 'y ~ x') +
  labs(x = "Five-kilometer time (minutes)",
       y = "Marathon time (minutes)") +
  theme_classic()
```

![(\#fig:fivekmvsmarathonwithbestfit)Simulated data of the relationship between the time to run five kilometers and a marathon](14-ijalm_files/figure-latex/fivekmvsmarathonwithbestfit-1.pdf) 

Underpinning our use of simple linear regression is a belief that there is some 'true' relationship between $X$ and $Y$, that is: 

$$Y = f(X) + \epsilon.$$

We are going to say that function, $f()$, is linear, and so for simple linear regression:

$$\hat{Y} = \beta_0 + \beta_1 X + \epsilon.$$

There is some 'true' relationship between $X$ and $Y$, but we do not know what it is. All we can do is use our sample of data to estimate it. But because our understanding depends on that sample, for every possible sample, we would get a slightly different relationship, as measured by the coefficients. 

That $\epsilon$ is a measure of our error---what does the model not know? There is going to be plenty that the model does not know, but we hope the error does not depend on $X$, and that the error is normally distributed.

We can conduct simple linear regression with `lm()` from base R. We specify the dependent variable first, then `~`, followed by the independent variables. Finally, we specify the dataset. 


```r
simulated_running_data_first_model <- 
  lm(marathon_time ~ five_km_time, 
     data = simulated_running_data)
```

To see the result of the regression, we can use `summary()` from base R.


```r
summary(simulated_running_data_first_model)
#> 
#> Call:
#> lm(formula = marathon_time ~ five_km_time, data = simulated_running_data)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -49.654  -9.278   0.781  12.606  56.898 
#> 
#> Coefficients:
#>              Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)    8.2393     8.9550    0.92     0.36    
#> five_km_time   7.9407     0.4072   19.50   <2e-16 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 16.96 on 98 degrees of freedom
#> Multiple R-squared:  0.7951,	Adjusted R-squared:  0.793 
#> F-statistic: 380.3 on 1 and 98 DF,  p-value: < 2.2e-16
```

The first part of the result tells us the regression that we specified, then information about the residuals, and our estimated coefficients. And then finally some useful diagnostics. 

The intercept is the marathon time that we would expect with a five-kilometer time of 0 minutes. Hopefully this example illustrates the need to carefully interpret the intercept coefficient! The coefficient on five-kilometer run time shows how we expect the marathon time to change if the five-kilometer run time changed by one unit. In this case it is about 8.4, which makes sense seeing as a marathon is roughly that many times longer than a five-kilometer run.

We use `augment()` from `broom` [@broom] to add the fitted values and residuals to our original dataset. This allows us to plot the residuals (Figure \@ref(fig:fivekmvsmarathonresids)).


```r
library(broom)

simulated_running_data <- 
  augment(simulated_running_data_first_model,
          data = simulated_running_data)

simulated_running_data
#> # A tibble: 100 x 8
#>    five_km_time marathon_time .fitted .resid   .hat .sigma
#>           <dbl>         <dbl>   <dbl>  <dbl>  <dbl>  <dbl>
#>  1         20.4          152.    170. -17.8  0.0108   17.0
#>  2         16.8          134.    142.  -7.84 0.0232   17.0
#>  3         22.3          198.    185.  13.1  0.0103   17.0
#>  4         19.7          166.    165.   1.83 0.0121   17.1
#>  5         15.6          163.    132.  31.3  0.0307   16.7
#>  6         21.1          168.    176.  -8.09 0.0101   17.0
#>  7         17            131.    143. -11.8  0.0222   17.0
#>  8         18.6          150.    156.  -6.04 0.0152   17.0
#>  9         17.4          158.    146.  11.1  0.0201   17.0
#> 10         17.8          147.    150.  -2.68 0.0183   17.0
#> # ... with 90 more rows, and 2 more variables:
#> #   .cooksd <dbl>, .std.resid <dbl>
```


```r
ggplot(simulated_running_data, 
       aes(x = .resid)) + 
  geom_histogram(binwidth = 1) +
  theme_classic() +
  labs(y = "Number of occurrences",
       x = "Residuals")

ggplot(simulated_running_data, 
       aes(x = five_km_time, y = .resid)) + 
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dotted", color = "grey") +
  theme_classic() +
  labs(y = "Residuals",
       x = "Five-kilometer time (minutes)")

ggplot(simulated_running_data, 
       aes(x = marathon_time, .fitted)) + 
  geom_point() +
  theme_classic() +
  labs(y = "Estimated marathon time",
       x = "Actual marathon time")
```

\begin{figure}
\includegraphics[width=0.49\linewidth]{14-ijalm_files/figure-latex/fivekmvsmarathonresids-1} \includegraphics[width=0.49\linewidth]{14-ijalm_files/figure-latex/fivekmvsmarathonresids-2} \includegraphics[width=0.49\linewidth]{14-ijalm_files/figure-latex/fivekmvsmarathonresids-3} \caption{Residuals from the simple linear regression with simulated data on the time someone takes to run five kilometers and a marathon}(\#fig:fivekmvsmarathonresids)
\end{figure}

We want our estimate to be unbiased. When we say our estimate is unbiased, we are trying to say that even though with some sample our estimate might be too high, and with another sample our estimate might be too low, eventually if we have a lot of data then our estimate would be the same as the population. An estimator is unbiased if it does not systematically over- or under-estimate [@islr, p. 65].

But we want to try to speak to the 'true' relationship, so we need to try to capture how much we think our understanding depends on the particular sample that we have to analyze. And this is where standard error comes in. It tells us how off our estimate is compared with the actual (Figure \@ref(fig:fivekmvsmarathonses)).


```r
simulated_running_data |> 
  ggplot(aes(x = five_km_time, y = marathon_time)) +
  geom_point() + 
  geom_smooth(method = "lm", 
              se = TRUE, 
              color = "black", 
              linetype = "dashed",
              formula = 'y ~ x') +
  labs(x = "Five-kilometer time (minutes)",
       y = "Marathon time (minutes)") +
  theme_classic()
```

![(\#fig:fivekmvsmarathonses)Simple linear regression with simulated data on the time someone takes to run five kilometers and a marathon, along with standard errors](14-ijalm_files/figure-latex/fivekmvsmarathonses-1.pdf) 

From standard errors, we can compute a confidence interval. A 95 per cent confidence interval is a range, such that there is roughly a 0.95 probability that the interval happens to contain the population parameter, which is typically unknown. The lower end of this range is: $\hat{\beta_1} - 2 \times \mbox{SE}\left(\hat{\beta_1}\right)$ and the upper end of this range is: $\hat{\beta_1} + 2 \times \mbox{SE}\left(\hat{\beta_1}\right)$.

Now that we have a range, for which we can say there is a roughly 95 per cent probability that range contains the true population parameter, we could test claims. For instance, we could claim that there is no relationship between $X$ and $Y$, i.e. $\beta_1 = 0$, as an alternative to a claim that there is some relationship between $X$ and $Y$, i.e. $\beta_1 \neq 0$.

In the same way that in Chapter \@ref(hunt-data) we needed to decide how much evidence it would take to convince us that our tea taster could distinguish whether milk or tea had been added first, we need to decide whether our estimate of $\beta_1$, which is $\hat{\beta}_1$, is 'far enough' away from zero for us to be comfortable claiming that $\beta_1 \neq 0$. How far is 'far enough'? If we were very confident in our estimate of $\beta_1$ then it would not have to be far, but if we were not then it would have to be substantial. The standard error of $\hat{\beta}_1$ does an awful lot of work here in accounting for a variety of factors, only some of which it can actually account for. 

We compare this standard error with $\hat{\beta}_1$ to get the t-statistic:
$$t = \frac{\hat{\beta}_1 - 0}{\mbox{SE}(\hat{\beta}_1)}.$$ 
And we then compare our t-statistic to the t-distribution to compute the probability of getting this absolute t-statistic or a larger one, if it was actually the case that $\beta_1 = 0$. This probability is the p-value. A smaller p-value means it is less likely that we would observe our data due to chance if there was not a relationship.

> Words! Mere words! How terrible they were! How clear, and vivid, and cruel! One could not escape from them. And yet what a subtle magic there was in them! They seemed to be able to give a plastic form to formless things, and to have a music of their own as sweet as that of viol or of lute. Mere words! Was there anything so real as words?
>
> *The Picture of Dorian Gray* [@wilde].

We will not make much use of p-values in this book because they are a specific and subtle concept. They are difficult to understand and easy to abuse. The main issue is that they embody, and assume correct, every assumption of the model, including everything that went into gathering and cleaning the data. While smaller p-values do imply the data are more unusual if all the assumptions were correct; when we consider the full data science workflow there are usually an awful lot of assumptions. And we do not get guidance from p-values about the reasonableness of specific assumptions [@greenland2016statistical p. 339]. A p-value may reject a null hypothesis because the null hypothesis is actually false, but it may also be that some data were incorrectly gathered or prepared. We can only be sure that the p-value speaks to the hypothesis we are interested in testing, if all the other assumptions are correct. There is nothing inherently wrong about using p-values, but it is important to use them in sophisticated and thoughtful ways. @coxtalks provides a lovely discussion of what this requires.

One application where it is easy to see abuse of p-values is in power analysis. Power, in a statistical sense, refers to probability of rejecting a null hypothesis that is actually false. As power relates to hypothesis testing, it also related to sample size. There is often a worry that a study is 'under-powered', meaning there was not a large enough sample, but rarely a worry that, say, the data were inappropriately cleaned, even though we cannot distinguish between these based only on a p-value.

## Multiple linear regression

To this point we have just considered one explanatory variable. But we will usually have more than one. One approach would be to run separate regressions for each explanatory variable. But compared with separate linear regressions for each, adding more explanatory variables allows us to have a better understanding of the intercept and accounts for interaction. Often the results will be quite different.

We may also like to consider explanatory variables that do not have an inherent ordering. For instance: pregnant or not; day or night. When there are only two options then we can use a binary variable, which is considered either 0 or 1. If we have a column of character values that only has two values, such as: `c("Myles", "Ruth", "Ruth", "Myles", "Myles", "Ruth")`, then using this as an explanatory variable in the usual regression set up, would mean that it is treated as a binary variable. If there are more than two levels then we can use a combination of binary variables, where the 'missing' outcome (baseline) gets pushed into the intercept. 


```r
simulated_running_data <-
  simulated_running_data |>
  mutate(was_raining = sample(
    c("Yes", "No"),
    size = number_of_observations,
    replace = TRUE,
    prob = c(0.2, 0.8)
  )) |> 
  select(five_km_time, marathon_time, was_raining)

simulated_running_data
#> # A tibble: 100 x 3
#>    five_km_time marathon_time was_raining
#>           <dbl>         <dbl> <chr>      
#>  1         20.4          152. No         
#>  2         16.8          134. No         
#>  3         22.3          198. No         
#>  4         19.7          166. No         
#>  5         15.6          163. No         
#>  6         21.1          168. No         
#>  7         17            131. No         
#>  8         18.6          150. No         
#>  9         17.4          158. No         
#> 10         17.8          147. No         
#> # ... with 90 more rows
```

We can add additional explanatory variables to `lm()` with `+`.


```r
simulated_running_data_rain_model <-
  lm(marathon_time ~ five_km_time + was_raining,
     data = simulated_running_data)

summary(simulated_running_data_rain_model)
#> 
#> Call:
#> lm(formula = marathon_time ~ five_km_time + was_raining, data = simulated_running_data)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -49.150  -8.828   0.968  10.522  58.224 
#> 
#> Coefficients:
#>                Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)      9.1030     9.0101   1.010    0.315    
#> five_km_time     7.8660     0.4154  18.934   <2e-16 ***
#> was_rainingYes   4.1673     4.5048   0.925    0.357    
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 16.98 on 97 degrees of freedom
#> Multiple R-squared:  0.7969,	Adjusted R-squared:  0.7927 
#> F-statistic: 190.3 on 2 and 97 DF,  p-value: < 2.2e-16
```

The result probably is not too surprising if we look at a plot of the data (Figure \@ref(fig:fivekmvsmarathonbinary)).


```r
simulated_running_data |>
  ggplot(aes(x = five_km_time, y = marathon_time, color = was_raining)) +
  geom_point() +
  geom_smooth(method = "lm",
              color = "black", 
              linetype = "dashed",
              formula = 'y ~ x') +
  labs(x = "Five-kilometer time (minutes)",
       y = "Marathon time (minutes)",
       color = "Was raining") +
  theme_classic() +
  scale_color_brewer(palette = "Set1")
```

![(\#fig:fivekmvsmarathonbinary)Simple linear regression with simulated data on the time someone takes to run five kilometers and a marathon, with a binary variable for whether it was raining](14-ijalm_files/figure-latex/fivekmvsmarathonbinary-1.pdf) 

In addition to wanting to include additional explanatory variables, we may think that they are related with each another. For instance, if we were wanting to explain the amount of snowfall, then we may be interested in the humidity and the temperature, but those two variables may also interact. We can do this by using `*` instead of `+` when we specify the model. When we interact variables in this way, then we almost always need to include the individual variables as well and `lm()` will do this by default.


```r
simulated_running_data <-
  simulated_running_data |>
  mutate(humidity = sample(
    c("High", "Low"),
    size = number_of_observations,
    replace = TRUE,
    prob = c(0.2, 0.8)
  ))

simulated_running_data
#> # A tibble: 100 x 4
#>    five_km_time marathon_time was_raining humidity
#>           <dbl>         <dbl> <chr>       <chr>   
#>  1         20.4          152. No          Low     
#>  2         16.8          134. No          Low     
#>  3         22.3          198. No          Low     
#>  4         19.7          166. No          Low     
#>  5         15.6          163. No          Low     
#>  6         21.1          168. No          Low     
#>  7         17            131. No          Low     
#>  8         18.6          150. No          Low     
#>  9         17.4          158. No          High    
#> 10         17.8          147. No          Low     
#> # ... with 90 more rows
```


```r
simulated_running_data_rain_and_humidity_model <-
  lm(marathon_time ~ five_km_time + was_raining*humidity,
     data = simulated_running_data)

summary(simulated_running_data_rain_and_humidity_model)
#> 
#> Call:
#> lm(formula = marathon_time ~ five_km_time + was_raining * humidity, 
#>     data = simulated_running_data)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -48.904  -8.523   0.404  10.130  59.951 
#> 
#> Coefficients:
#>                            Estimate Std. Error t value
#> (Intercept)                 15.0595    10.3144   1.460
#> five_km_time                 7.7313     0.4167  18.552
#> was_rainingYes              15.6008     9.6199   1.622
#> humidityLow                 -3.7380     4.9569  -0.754
#> was_rainingYes:humidityLow -14.5825    10.7410  -1.358
#>                            Pr(>|t|)    
#> (Intercept)                   0.148    
#> five_km_time                 <2e-16 ***
#> was_rainingYes                0.108    
#> humidityLow                   0.453    
#> was_rainingYes:humidityLow    0.178    
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 16.79 on 95 degrees of freedom
#> Multiple R-squared:  0.8054,	Adjusted R-squared:  0.7972 
#> F-statistic: 98.31 on 4 and 95 DF,  p-value: < 2.2e-16
```

There are a variety of threats to the validity of linear regression estimates, and aspects to think about. We need to address these when we use it, and usually four graphs and associated text are sufficient to assuage most of these. Aspects of concern include:

1. Linearity of explanatory variables. We are concerned with whether the independent variables enter in a linear way. Sometimes if we are worried that there might be a multiplicative relationship between the explanatory variables, rather than an additive one, then we may consider a logarithmic transform. We can usually be convinced there is enough linearity in our explanatory variables for our purposes by using graphs of the variables.
2. Independence of errors. We are concerned that the errors are not correlated. For instance, if we are interested in weather-related measurement such as average daily temperature, then we may find a pattern because the temperature on one day is likely similar to the temperature on another. We can be convinced that we have satisfied this condition by making graphs of the errors, such as Figure \@ref(fig:fivekmvsmarathonresids).
3. Homoscedasticity of errors. We are concerned that the errors are not becoming systematically larger or smaller throughout the sample. If that is happening, then we term it heteroscedasticity. Again, graphs of errors, such as Figure \@ref(fig:fivekmvsmarathonresids) are used to convince us of this.
4. Normality of errors. We are concerned that our errors are normally distributed when we are interested in making individual-level predictions.
5. Outliers and other high-impact observations. Finally, we might be worried that our results are being driven by a handful of observations. For instance, thinking back to Chapter \@ref(static-communication) and Anscombe's Quartet, we notice that linear regression estimates would be heavily influenced by the inclusion of one or two particular points. We can become comfortable with this by considering our analysis on various sub-sets

Those aspects are statistical concerns and relate to whether the model is working. The most important threat to validity and hence the aspect that must be addressed at some length, is speaking to the fact that this model is appropriate to the circumstances and addresses the research question at hand.

To this point, we have just had a quick look at the regression results using `summary()`. A better approach is to use `modelsummary()` from `modelsummary` [@citemodelsummary] (Table \@ref(tab:modelsummaryruntimes)).


```r
library(modelsummary)

modelsummary(list(simulated_running_data_first_model,
                  simulated_running_data_rain_model, 
                  simulated_running_data_rain_and_humidity_model),
             fmt = 2,
             title = "Explaining marathon time based on five-kilometer run times and weather features")
```

\begin{table}

\caption{(\#tab:modelsummaryruntimes)Explaining marathon time based on five-kilometer run times and weather features}
\centering
\begin{tabular}[t]{lccc}
\toprule
  & Model 1 & Model 2 & Model 3\\
\midrule
(Intercept) & \num{8.24} & \num{9.10} & \num{15.06}\\
 & (\num{8.96}) & (\num{9.01}) & (\num{10.31})\\
five\_km\_time & \num{7.94} & \num{7.87} & \num{7.73}\\
 & (\num{0.41}) & (\num{0.42}) & (\num{0.42})\\
was\_rainingYes &  & \num{4.17} & \num{15.60}\\
 &  & (\num{4.50}) & (\num{9.62})\\
humidityLow &  &  & \num{-3.74}\\
 &  &  & (\num{4.96})\\
was\_rainingYes × humidityLow &  &  & \num{-14.58}\\
 &  &  & (\num{10.74})\\
\midrule
Num.Obs. & \num{100} & \num{100} & \num{100}\\
R2 & \num{0.795} & \num{0.797} & \num{0.805}\\
R2 Adj. & \num{0.793} & \num{0.793} & \num{0.797}\\
AIC & \num{854.0} & \num{855.1} & \num{854.8}\\
BIC & \num{861.8} & \num{865.5} & \num{870.4}\\
Log.Lik. & \num{-423.993} & \num{-423.554} & \num{-421.405}\\
F & \num{380.262} & \num{190.279} & \num{98.314}\\
\bottomrule
\end{tabular}
\end{table}

When we are focused on prediction, we will often want to fit many models. One way to do this is to copy and paste code many times. There is nothing wrong with that. And that is the way that most people get started. But we need an approach that: 

1) scales more easily; 
2) enables us to think carefully about over-fitting; and 
3) adds model evaluation.

The use of `tidymodels` [@citeTidymodels] satisfies these criteria by providing a coherent grammar that allows us to easily fit a variety of models. Like `tidyverse`, it is a package of packages.

As we are focused on prediction, we are worried about over-fitting our data, which would limit our ability to make claims about other datasets. One way to partially address this is to split our dataset into training and test datasets using `initial_split()`. 


```r
library(tidymodels)

set.seed(853)

simulated_running_data_split <- 
  initial_split(data = simulated_running_data, 
                prop = 0.80)

simulated_running_data_split
#> <Analysis/Assess/Total>
#> <80/20/100>
```

Having split the data, we then create the training and test datasets.


```r
simulated_running_data_train <- training(simulated_running_data_split)

simulated_running_data_train
#> # A tibble: 80 x 4
#>    five_km_time marathon_time was_raining humidity
#>           <dbl>         <dbl> <chr>       <chr>   
#>  1         17.4          158. No          High    
#>  2         23.8          205. No          High    
#>  3         23.4          198. Yes         Low     
#>  4         22.3          175  No          Low     
#>  5         19.3          158  No          Low     
#>  6         24.4          204. No          High    
#>  7         17            120  No          High    
#>  8         19.1          178. No          Low     
#>  9         22.3          198. No          Low     
#> 10         20.6          166. No          Low     
#> # ... with 70 more rows

simulated_running_data_test <- testing(simulated_running_data_split)

simulated_running_data_test
#> # A tibble: 20 x 4
#>    five_km_time marathon_time was_raining humidity
#>           <dbl>         <dbl> <chr>       <chr>   
#>  1         17            131. No          Low     
#>  2         16.6          118. No          Low     
#>  3         19.6          164. No          Low     
#>  4         21.1          164. Yes         Low     
#>  5         21            180. No          Low     
#>  6         27.9          246. No          Low     
#>  7         23.7          198. No          High    
#>  8         16            143  No          Low     
#>  9         24.9          202. No          Low     
#> 10         15.2          140. Yes         Low     
#> 11         28.9          238. No          Low     
#> 12         19.2          132  Yes         Low     
#> 13         22            200. No          Low     
#> 14         26.5          229  Yes         High    
#> 15         25.3          222  Yes         High    
#> 16         25.9          208. Yes         Low     
#> 17         15.5          120  No          Low     
#> 18         18            144. No          Low     
#> 19         27.2          227. No          High    
#> 20         20.8          201. No          Low
```

When we look at the training and test datasets, we can see that we have placed most of our dataset into the training dataset. We will use that to estimate the parameters of our model. We have kept a small amount of it back, and we will use that to evaluate our model.


```r
simulated_running_data_first_model_tidymodels <- 
  linear_reg() |>
  set_engine(engine = "lm") |> 
  fit(marathon_time ~ five_km_time + was_raining, 
      data = simulated_running_data_train
      )

simulated_running_data_first_model_tidymodels
#> parsnip model object
#> 
#> Fit time:  2ms 
#> 
#> Call:
#> stats::lm(formula = marathon_time ~ five_km_time + was_raining, 
#>     data = data)
#> 
#> Coefficients:
#>    (Intercept)    five_km_time  was_rainingYes  
#>         16.601           7.490           8.244
```

We will use `tidymodels` for forecasting. But when we are focused on inference, instead, we will use Bayesian approaches. To do this we use the probabilistic programming language 'Stan', and interface with it using `rstanarm` [@citerstanarm]. We keep these separate, rather than adapting Bayesian approaches within `tidymodels`, because to this point the ecosystems have developed separately, and so the best books to go onto next are also separate.

In order to use Bayesian approaches we will need to specify a starting point, or prior. This is another reason for the workflow advocated in this book; the simulate stage leads directly to priors. We will also more thoroughly specify the model that we are interested in:

$$
\begin{aligned}
y_i &\sim \mbox{Normal}(\mu_i, \sigma) \\
\mu_i &= \beta_0 +\beta_1x_i\\
\beta_0 &\sim \mbox{Normal}(0, 3) \\
\beta_1 &\sim \mbox{Normal}(0, 3) \\
\sigma &\sim \mbox{Normal}(0, 3) \\
\end{aligned}
$$

On a practical note, one aspect that different between Bayesian approaches and the way we have been doing modelling to this point, is that Bayesian models will usually take longer to run. Because of this, it can be useful to run the model, either within the R Markdown document or in a separate R script, and then save it with `saveRDS()`. With sensible R Markdown chunk options, the model can then be read into the R Markdown document with `readRDS()`. In this way, the model, and hence delay, is only imposed once for a given model. 


```r
library(rstanarm)

simulated_running_data_first_model_rstanarm <-
  stan_lm(
    marathon_time ~ five_km_time + was_raining, 
    data = simulated_running_data,
    prior = NULL,
    seed = 853
  )

# simulated_running_data_first_model_rstanarm <-
#   stan_lm(
#     formula = marathon_time ~ five_km_time,
#     data = simulated_running_data,
#     prior = normal(0, 3),
#     prior_intercept = normal(0, 3),
#     prior_aux = normal(0, 3),
#     seed = 853
#     )

saveRDS(simulated_running_data_first_model_rstanarm,
        file = "simulated_running_data_first_model_rstanarm.rds")
```






```r
simulated_running_data_first_model_rstanarm
#> stan_lm
#>  family:       gaussian [identity]
#>  formula:      marathon_time ~ five_km_time + was_raining
#>  observations: 100
#>  predictors:   3
#> ------
#>                Median MAD_SD
#> (Intercept)    9.2    8.7   
#> five_km_time   7.9    0.4   
#> was_rainingYes 4.6    4.5   
#> 
#> Auxiliary parameter(s):
#>               Median MAD_SD
#> R2             0.8    0.0  
#> log-fit_ratio  0.0    0.0  
#> sigma         17.1    1.3  
#> 
#> ------
#> * For help interpreting the printed output see ?print.stanreg
#> * For info on the priors used see ?prior_summary.stanreg
```




<!-- ## Tutorial -->

<!-- Let's do this in the context of the Paspaley dataset that we were introduced to in an earlier lecture. -->

<!-- Read in the data. -->

<!-- ```{r} -->
<!-- paspaley_data <- read_csv(here::here("notes/inputs/data/paspaley_cleaned_dataset.csv")) -->

<!-- head(paspaley_data) -->
<!-- ``` -->

<!-- Take a brief look: -->

<!-- ```{r} -->
<!-- skimr::skim(paspaley_data) -->



<!-- paspaley_data$keshi |> table() -->
<!-- paspaley_data$metal |> table() -->
<!-- paspaley_data$category |> table() -->
<!-- ``` -->

<!-- Clean up and remove some anonying other variables. -->

<!-- ```{r} -->
<!-- paspaley_data <-  -->
<!--   paspaley_data |>  -->
<!--   filter(metal != "Other") |>  -->
<!--   filter(category != "Other") -->
<!-- ``` -->

<!-- Run a ordinary linear regression. -->

<!-- ```{r} -->
<!-- model_1 <- lm(price ~ keshi, data = paspaley_data) -->
<!-- model_2 <- lm(price ~ metal, data = paspaley_data) -->
<!-- model_3 <- lm(price ~ category, data = paspaley_data) -->
<!-- model_4 <- lm(price ~ keshi + metal + category, data = paspaley_data) -->
<!-- ``` -->

<!-- `broom` is great to look at the models, in particular `glance` and `tidy`.  -->

<!-- ```{r} -->
<!-- summary(model_1) -->
<!-- broom::glance(model_1) -->
<!-- broom::tidy(model_1) -->
<!-- ``` -->


<!-- ```{r} -->
<!-- broom::glance(model_4) -->
<!-- broom::tidy(model_4) -->

<!-- paspaley_data |>  -->
<!--   ggplot(aes(x = price)) + -->
<!--   geom_histogram() + -->
<!--   facet_wrap(vars(metal), scales = "free_y") -->
<!-- ``` -->


<!-- You can add the fitted variables easily too. -->

<!-- ```{r} -->
<!-- paspaley_data_with_model_4 <- broom::augment(model_4) -->

<!-- head(model_4) -->
<!-- ``` -->











## Logistic regression

Linear regression is a nice way to come to understand better our data. But it assumes a continuous outcome variable which can take any number on the real line. We would like some way to use this same machinery when we cannot satisfy this condition. We turn to logistic and Poisson regression for binary and count outcome variables, respectively.

Logistic regression and its close variants are useful in a variety of settings, from elections [@wang2015forecasting] through to horse racing [@chellel2018gambler; @boltonruth]. We use logistic regression when the dependent variable is a binary outcome, such as 0 or 1. Although the presence of a binary outcome variable may sound limiting, there are a lot of circumstances in which the outcome either naturally falls into this situation, or can be adjusted into it.

The reason that we use logistic regression is that we will be modelling a probability and so it will be bounded between 0 and 1. Whereas with linear regression we may end up with values outside this. This all said, logistic regression, as Daniella Witten teaches us, is just a linear model. The foundation of logistic regression is the logit function:

$$
\mbox{logit}(x) = \log\left(\frac{x}{1-x}\right),
$$
which will transpose values between 0 and 1, onto the real line. For instance, `logit(0.1) = -2.2`, `logit(0.5) = 0`, and `logit(0.9) = 2.2`.

We will simulate data on whether it is day or night, based on the number of cars that we can see.


```r
library(tidyverse)

set.seed(853)

day_or_night <- 
  tibble(
    number_of_cars = runif(n = 1000, min = 0, 100),
    noise = rnorm(n = 1000, mean = 0, sd = 2),
    is_night = if_else(number_of_cars + noise > 50, 1, 0)
  ) |> 
  mutate(number_of_cars = round(number_of_cars)) |> 
  select(-noise)
  
day_or_night
#> # A tibble: 1,000 x 2
#>    number_of_cars is_night
#>             <dbl>    <dbl>
#>  1             36        0
#>  2             12        0
#>  3             48        0
#>  4             32        0
#>  5              4        0
#>  6             40        0
#>  7             13        0
#>  8             24        0
#>  9             16        0
#> 10             19        0
#> # ... with 990 more rows
```

As with linear regression, logistic regression with can use `glm()` from base to put together a quick model and `summary()` to look at it. In this case we will try to work out whether it is day or night, based on the number of cars we can see. We are interested in estimating Equation \@ref(eq:logisticexample):
$$
\mbox{Pr}(y_i=1) = \mbox{logit}^{-1}\left(\beta_0+\beta_1 x_i\right). (\#eq:logisticexample)
$$


```r
day_or_night_model <- 
  glm(is_night ~ number_of_cars,
      data = day_or_night,
      family = 'binomial')
#> Warning: glm.fit: fitted probabilities numerically 0 or 1
#> occurred

summary(day_or_night_model)
#> 
#> Call:
#> glm(formula = is_night ~ number_of_cars, family = "binomial", 
#>     data = day_or_night)
#> 
#> Deviance Residuals: 
#>      Min        1Q    Median        3Q       Max  
#> -2.39419  -0.00002   0.00000   0.00002   2.33776  
#> 
#> Coefficients:
#>                Estimate Std. Error z value Pr(>|z|)    
#> (Intercept)    -45.5353     7.3389  -6.205 5.48e-10 ***
#> number_of_cars   0.9121     0.1470   6.205 5.47e-10 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> (Dispersion parameter for binomial family taken to be 1)
#> 
#>     Null deviance: 1386.194  on 999  degrees of freedom
#> Residual deviance:   77.243  on 998  degrees of freedom
#> AIC: 81.243
#> 
#> Number of Fisher Scoring iterations: 11
```

One reason that logistic regression can be a bit tricky initially, is because the coefficients take a bit of work to interpret. In particular, our estimate on likelihood of it being night is 0.91 This is the odds. So, the odds that it is night, increase by 0.91 as the number of cars that we saw increases. We can translate the result into probabilities using `augment()` from `broom` [@broom] and this allows us to graph the results (Figure \@ref(fig:dayornightprobs)).


```r
library(broom)

day_or_night <-
  augment(day_or_night_model,
          data = day_or_night,
          type.predict = "response")

day_or_night
#> # A tibble: 1,000 x 8
#>    number_of_cars is_night  .fitted        .resid .std.resid
#>             <dbl>    <dbl>    <dbl>         <dbl>      <dbl>
#>  1             36        0 3.06e- 6 -0.00247        -2.47e-3
#>  2             12        0 2.22e-16 -0.0000000211   -2.11e-8
#>  3             48        0 1.48e- 1 -0.565          -5.71e-1
#>  4             32        0 7.95e- 8 -0.000399       -3.99e-4
#>  5              4        0 2.22e-16 -0.0000000211   -2.11e-8
#>  6             40        0 1.17e- 4 -0.0153         -1.53e-2
#>  7             13        0 2.22e-16 -0.0000000211   -2.11e-8
#>  8             24        0 5.39e-11 -0.0000104      -1.04e-5
#>  9             16        0 2.22e-16 -0.0000000211   -2.11e-8
#> 10             19        0 5.63e-13 -0.00000106     -1.06e-6
#> # ... with 990 more rows, and 3 more variables: .hat <dbl>,
#> #   .sigma <dbl>, .cooksd <dbl>
```


```r
day_or_night |>
  mutate(is_night = factor(is_night)) |>
  ggplot(aes(x = number_of_cars,
             y = .fitted,
             color = is_night)) +
  geom_jitter(width = 0.01, height = 0.01) +
  labs(x = "Number of cars that were seen",
       y = "Estimated probability it is night",
       color = "Was actually night") +
  theme_classic() +
  scale_color_brewer(palette = "Set1")
```

![(\#fig:dayornightprobs)Logistic regression probability results with simulated data of whether it is day or night based on the number of cars that are around](14-ijalm_files/figure-latex/dayornightprobs-1.pdf) 

We can use `tidymodels` to run this if we wanted. In order to do that, we first need to change the class of our dependent variable into a factor.


```r
set.seed(853)

day_or_night <-
  day_or_night |>
  mutate(is_night = as_factor(is_night))

day_or_night_split <- initial_split(day_or_night, prop = 0.80)
day_or_night_train <- training(day_or_night_split)
day_or_night_test <- testing(day_or_night_split)

day_or_night_tidymodels <-
  logistic_reg(mode = "classification") |>
  set_engine("glm") |>
  fit(is_night ~ number_of_cars,
      data = day_or_night_train)
#> Warning: glm.fit: fitted probabilities numerically 0 or 1
#> occurred

day_or_night_tidymodels
#> parsnip model object
#> 
#> Fit time:  4ms 
#> 
#> Call:  stats::glm(formula = is_night ~ number_of_cars, family = stats::binomial, 
#>     data = data)
#> 
#> Coefficients:
#>    (Intercept)  number_of_cars  
#>       -44.4817          0.8937  
#> 
#> Degrees of Freedom: 799 Total (i.e. Null);  798 Residual
#> Null Deviance:	    1109 
#> Residual Deviance: 62.5 	AIC: 66.5
```

As before, we can make a graph of the actual results compared with our estimates. But one nice aspect of this is that we could use our test dataset to more thoroughly  evaluate our model's forecasting ability, for instance through a confusion matrix. We find that the model does well on the held-out dataset.


```r
day_or_night_tidymodels |>
  predict(new_data = day_or_night_test) |>
  cbind(day_or_night_test) |>
  conf_mat(truth = is_night, estimate = .pred_class)
#>           Truth
#> Prediction   0   1
#>          0  95   0
#>          1   3 102
```

Finally, we might be interested in inference, and so want to build a Bayesian model using `rstanarm`. Again, we will more fully specify our model: 

Finally, we can build a Bayesian model and estimate it with `rstanarm`.

$$
\begin{aligned}
\mbox{Pr}(y_i=1) & = \mbox{logit}^{-1}\left(\beta_0+\beta_1 x_i\right)\\
\beta_0 & \sim \mbox{Normal}(0, 3)\\
\beta_1 & \sim \mbox{Normal}(0, 3)
\end{aligned}
$$


```r
day_or_night_rstanarm <-
  stan_glm(
    is_night ~ number_of_cars,
    data = day_or_night,
    family = binomial(link = "logit"),
    prior = normal(0, 3),
    prior_intercept = normal(0, 3),
    seed = 853
  )

saveRDS(day_or_night_rstanarm,
        file = "day_or_night_rstanarm.rds")
```






```r
day_or_night_rstanarm
#> stan_glm
#>  family:       binomial [logit]
#>  formula:      is_night ~ number_of_cars
#>  observations: 1000
#>  predictors:   2
#> ------
#>                Median MAD_SD
#> (Intercept)    -47.3    8.0 
#> number_of_cars   0.9    0.2 
#> 
#> ------
#> * For help interpreting the printed output see ?print.stanreg
#> * For info on the priors used see ?prior_summary.stanreg
```




## Poisson regression

When we have count data, we should initially think to use Poisson distribution. The Poisson distribution has the interesting feature that the mean is also the variance, and so as the mean increases, so does the variance. As such, the Poisson distribution is governed by the parameter, $\lambda$ and it distributes probabilities over the non-negative integers. The Poisson distribution is [@pitman, p. 121]: 

$$P_{\lambda}(k) = e^{-\lambda}\mu^k/k!\mbox{, for }k=0,1,2,...$$
We can simulate $n=20$ draws from the Poisson distribution with `rpois()`, where $\lambda$ is both the mean and the variance. The $\lambda$ parameter governs the shape of the distribution (Figure \@ref(fig:poissondistributiontakingshape)).


```r
rpois(n = 20, lambda = 3)
#>  [1] 1 5 5 4 5 2 1 4 5 4 6 2 3 4 4 6 5 1 3 5
```


```r
set.seed(853)

number_of_each <- 1000

tibble(
  lambda = c(
    rep(0, number_of_each),
    rep(1, number_of_each),
    rep(2, number_of_each),
    rep(4, number_of_each),
    rep(7, number_of_each),
    rep(10, number_of_each),
    rep(15, number_of_each),
    rep(50, number_of_each),
    rep(100, number_of_each)
  ),
  draw = c(
    rpois(n = number_of_each, lambda = 0),
    rpois(n = number_of_each, lambda = 1),
    rpois(n = number_of_each, lambda = 2),
    rpois(n = number_of_each, lambda = 4),
    rpois(n = number_of_each, lambda = 7),
    rpois(n = number_of_each, lambda = 10),
    rpois(n = number_of_each, lambda = 15),
    rpois(n = number_of_each, lambda = 50),
    rpois(n = number_of_each, lambda = 100)
  )
) |>
  ggplot(aes(x = draw)) +
  geom_density() +
  facet_wrap(vars(lambda),
             scales = "free_y") +
  theme_minimal() +
  labs(x = 'Integer',
       y = 'Density')
```

![(\#fig:poissondistributiontakingshape)The Poisson distribution is governed by the value of the mean, which is the same as its variance](14-ijalm_files/figure-latex/poissondistributiontakingshape-1.pdf) 

For instance, if we look at the number of A+ grades that are awarded in each university course in a given term then for each course we would have a count.


```r
set.seed(853)

count_of_A_plus <-
  tibble(
    # Thanks to Chris DuBois: https://stackoverflow.com/a/1439843
    department = c(rep.int("1", 26), rep.int("2", 26), rep.int("3", 26)),
    course = c(paste0("DEP_1_", letters), paste0("DEP_2_", letters), paste0("DEP_3_", letters)),
    number_of_A_plus = c(
      sample(c(1:10),
             size = 26,
             replace = TRUE),
      sample(c(1:50),
             size = 26,
             replace = TRUE),
      sample(c(1:25),
             size = 26,
             replace = TRUE)
    )
  )

count_of_A_plus
#> # A tibble: 78 x 3
#>    department course  number_of_A_plus
#>    <chr>      <chr>              <int>
#>  1 1          DEP_1_a                9
#>  2 1          DEP_1_b               10
#>  3 1          DEP_1_c                1
#>  4 1          DEP_1_d                5
#>  5 1          DEP_1_e                2
#>  6 1          DEP_1_f                4
#>  7 1          DEP_1_g                3
#>  8 1          DEP_1_h                3
#>  9 1          DEP_1_i                1
#> 10 1          DEP_1_j                3
#> # ... with 68 more rows
```
Our simulated dataset has the number of A+ grades awarded by courses, which are structured within departments. We can use `glm()` and `summary()` from base to quickly get a sense of the data.


```r
grades_model_base <- 
  glm(number_of_A_plus ~ department, 
    data = count_of_A_plus, 
    family = 'poisson')

summary(grades_model_base)
#> 
#> Call:
#> glm(formula = number_of_A_plus ~ department, family = "poisson", 
#>     data = count_of_A_plus)
#> 
#> Deviance Residuals: 
#>    Min      1Q  Median      3Q     Max  
#> -6.739  -1.210  -0.171   1.424   3.952  
#> 
#> Coefficients:
#>             Estimate Std. Error z value Pr(>|z|)    
#> (Intercept)  1.44238    0.09535  15.128   <2e-16 ***
#> department2  1.85345    0.10254  18.075   <2e-16 ***
#> department3  1.00663    0.11141   9.035   <2e-16 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> (Dispersion parameter for poisson family taken to be 1)
#> 
#>     Null deviance: 952.12  on 77  degrees of freedom
#> Residual deviance: 450.08  on 75  degrees of freedom
#> AIC: 768.21
#> 
#> Number of Fisher Scoring iterations: 5
```

The interpretation of the coefficient on 'department2' is that it is the log of the expected difference between departments. So we expect $\exp(1.85345) \approx 6.3$ and $\exp(1.00663) \approx 2.7$ additional A+ grades in departments 2 and 3, compared with department 1.

We can use `tidymodels` to estimate Poisson regression models with `poissonreg` [@poissonreg].


```r
library(poissonreg)

set.seed(853)

count_of_A_plus_split <-
  rsample::initial_split(count_of_A_plus, prop = 0.80)
count_of_A_plus_train <- rsample::training(count_of_A_plus_split)
count_of_A_plus_test <- rsample::testing(count_of_A_plus_split)

a_plus_model_tidymodels <-
  poisson_reg(mode = "regression") |>
  set_engine("glm") |>
  fit(number_of_A_plus ~ department,
      data = count_of_A_plus_train)

a_plus_model_tidymodels
#> parsnip model object
#> 
#> Fit time:  2ms 
#> 
#> Call:  stats::glm(formula = number_of_A_plus ~ department, family = stats::poisson, 
#>     data = data)
#> 
#> Coefficients:
#> (Intercept)  department2  department3  
#>       1.470        1.925        1.011  
#> 
#> Degrees of Freedom: 61 Total (i.e. Null);  59 Residual
#> Null Deviance:	    758 
#> Residual Deviance: 276.8 	AIC: 534.8
```

And finally, we can build a Bayesian model and estimate it with `rstanarm`. We put a tight prior on the coefficients because of the propensity for the Poisson distribution to expand them substantially.

$$
\begin{aligned}
y_i &\sim \mbox{Poisson}(\lambda_i)\\
\log(\lambda_i) & = \beta_0 + \beta_1 x_1 + \beta_2 x_2\\
\beta_0 & \sim \mbox{Normal}(0, 0.5)\\
\beta_1 & \sim \mbox{Normal}(0, 0.5)\\
\beta_2 & \sim \mbox{Normal}(0, 0.5)
\end{aligned}
$$


```r
count_of_A_plus_rstanarm <-
  stan_glm(
    number_of_A_plus ~ department,
    data = count_of_A_plus,
    family = poisson(link = "log"),
    prior = normal(0, 0.5),
    prior_intercept = normal(0, 0.5),
    seed = 853
  )

saveRDS(count_of_A_plus_rstanarm,
        file = "count_of_A_plus_rstanarm.rds")
```






```r
count_of_A_plus_rstanarm
#> stan_glm
#>  family:       poisson [log]
#>  formula:      number_of_A_plus ~ department
#>  observations: 78
#>  predictors:   3
#> ------
#>             Median MAD_SD
#> (Intercept) 1.5    0.1   
#> department2 1.8    0.1   
#> department3 0.9    0.1   
#> 
#> ------
#> * For help interpreting the printed output see ?print.stanreg
#> * For info on the priors used see ?prior_summary.stanreg
```

<!-- ## Proportional hazards -->

<!-- Could do like how long someone has to wait for something? -->



## Exercises and tutorial


### Exercises

1. Please write a linear relationship between some response variable, Y, and some predictor, X. What is the intercept term? What is the slope term? What would adding a hat to these indicate?
2. What is the least squares criterion? Similarly, what is RSS and what are we trying to do when we run least squares regression?
3. What is statistical bias?
4. If there were three variables: Snow, Temperature, and Wind, please write R code that would fit a simple linear regression to explain Snow as a function of Temperature and Wind. What do you think about another explanatory variable - daily stock market returns - to your model?
5. According to @greenland2016statistical, p-values test (pick one)?
    a. All the assumptions about how the data were generated (the entire model), not just the targeted hypothesis it is supposed to test (such as a null hypothesis).
    b. Whether the hypothesis targeted for testing is true or not.
    c. A dichotomy whereby results can be declared 'statistically significant'.
6. According to @greenland2016statistical, a p-value may be small because (select all)?
    a. The targeted hypothesis is false.
    b. The study protocols were violated.
    c. It was selected for presentation based on its small size. 
7. According to @obermeyer2019dissecting, why does racial bias occur in an algorithm used to guide health decisions in the US (pick one)?
    a. The algorithm uses health costs as a proxy for health needs.
    b. The algorithm was trained on Reddit data.
8. When should we use logistic regression (pick one)?
    a. Continuous dependent variable.
    b. Binary dependent variable.
    c. Count dependent variable.
9. We are interested in studying how voting intentions in the recent US presidential election vary by an individual's income. We set up a logistic regression model to study this relationship. In this study, one possible dependent variable would be (pick one)?
    a. Whether the respondent is a US citizen (yes/no)
    b. The respondent's personal income (high/low)
    c. Whether the respondent is going to vote for Trump (yes/no)
    d. Who the respondent voted for in 2016 (Trump/Clinton)
10. We are interested in studying how voting intentions in the recent US presidential election vary by an individual's income. We set up a logistic regression model to study this relationship. In this study, one possible dependent variable would be (pick one)?
    a. The race of the respondent (white/not white)
    b. The respondent's marital status (married/not)
    c. Whether the respondent is registered to vote (yes/no)
    d. Whether the respondent is going to vote for Biden (yes/no)
11. Please explain what a p-value is, using only the term itself (i.e. 'p-value') and words that are amongst the 1,000 most common in the English language according to the XKCD Simple Writer - https://xkcd.com/simplewriter/. (Please write one or two paragraphs.)
12. The mean of a Poisson distribution is equal to its?
    a. Median.
    b. Standard deviation.
    c. Variance.
13. What is power (in a statistical context)?
14. According to @citemcelreath [p. 162] 'Regression will not sort it out. Regression is indeed an oracle, but a cruel one. It speaks in riddles and delights in punishing us for...' (please select one answer)? 
    a. overcomplicating models.
    b.  asking bad questions.
    c. using bad data.
15. Is a model that fits the small or large world more important to you, and why?



### Tutorial

Simulate some data that are similar to those discussed by @gould2013median. Then build a regression model. Discuss your results



<!-- ### Paper -->

<!-- At about this point, Paper Four (Appendix \@ref(paper-four)) would be appropriate. -->

