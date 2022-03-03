
# Causality from observational data {#causality}

**Required material**

- Read *BNT162b2 mRNA Covid-19 Vaccine in a Nationwide Mass Vaccination Setting*, [@dagan2021bnt162b2]
- Read *The Effect: An Introduction to Research Design and Causality*, Chapters 18 'Difference-in-Differences', 19 'Instrumental Variables', and 20 'Regression Discontinuity', [@theeffect]
- Read *Understanding regression discontinuity designs as observational studies*, [@sekhon2017understanding]

**Key concepts and skills**

- Being able to put together DAGs.
- Essential matching methods and the weaknesses of matching.
- Implementing difference in differences.
- Identifying opportunities for instrumental variables and implementing it.
- Challenges to the validity of instrumental variables.
- Reading in foreign data.
- Understanding regression discontinuity and implementing it both manually and using packages.
- Appreciating the threats to the validity of regression discontinuity.

**Key libraries**

- `broom` [@broom]
- `DiagrammeR` [@citeDiagrammeR]
- `estimatr` [estimatr]
- `haven` [citehaven]
- `MatchIt` [@MatchIt]
- `modelsummary` [@citemodelsummary]
- `rdrobust` [@rdrobust]
- `scales` [@scales]
- `tidyverse` [@Wickham2017]

**Key functions**

- `DiagrammeR::grViz()`
- `estimatr::iv_robust()`
- `haven::read_dta()`
- `MatchIt::matchit()`
- `modelsummary::datasummary_skim()`
- `modelsummary::modelsummary()`
- `poly()`
- `rdrobust::rdrobust()`
- `scales::dollar_format()`


<!-- https://declaredesign.org/blog/2019-02-05-instrumental-variables.html -->

<!-- https://raw.githack.com/edrubin/EC421W19/master/LectureNotes/11InstrumentalVariables/11_instrumental_variables.html#41 -->

<!-- https://www.cambridge.org/core/journals/political-science-research-and-methods/article/estimating-slimmajority-effects-in-us-state-legislatures-with-a-regression-discontinuity-design-under-local-randomization-assumptions/33581FB74160166FF29E49DE64497F3C#fndtn-information -->


<!-- **Required reading** -->

<!-- - Better Evaluation, 'Regression Discontinuity', https://www.betterevaluation.org/en/evaluation-options/regressiondiscontinuity -->
<!-- - Eggers, Andrew C., Anthony Fowler, Jens Hainmueller, Andrew B. Hall, and James M. Snyder Jr, 2015, ‘On the validity of the regression discontinuity design for estimating electoral effects: New evidence from over 40,000 close races’, American Journal of Political Science, 59 (1), pp. 259-274 -->
<!-- - Gelman, Andrew, 2019, 'Another Regression Discontinuity Disaster and what can we learn from it', 25 June, https://statmodeling.stat.columbia.edu/2019/06/25/another-regression-discontinuity-disaster-and-what-can-we-learn-from-it/.  -->
<!-- - Gelman, Andrew, Jennifer Hill and Aki Vehtari, 2020, Regression and Other Stories, Cambridge University Press, Chs 18 - 21. -->
<!-- - Gertler, Paul, Sebastian Martinez, Patrick Premand, Laura Rawlings, and Christel Vermeersch, 'Impact Evaluation in Practice', Chapter 5 - 8. -->
<!-- - McElreath, Richard, 2020, Statistical Rethinking, 2nd Edition, CRC Press, Ch 14. -->
<!-- - Meng, Xiao-Li, 2021, 'What Are the Values of Data, Data Science, or Data Scientists?', *Harvard Data Science Review*, https://doi.org/10.1162/99608f92.ee717cf7, https://hdsr.mitpress.mit.edu/pub/bj2dfcwg/release/2. -->
<!-- - Riederer, Emily, 2021, 'Causal design patterns for data analysts', 30 January, https://emilyriederer.netlify.app/post/causal-design-patterns/ -->
<!-- - Wong, Jeffrey, and Colin McFarland, 2020, ‘Computational Causal Inference at Netflix’, Netflix Technology Blog, 11 Aug, https://netflixtechblog.com/computational-causal-inference-at-netflix-293591691c62. -->


<!-- **Required viewing** -->

<!-- - Gelman, Andrew, 2020 '100 Stories of Causal Inference', 4 August, https://www.youtube.com/watch?v=jnI5KI843Lk. -->
<!-- - King, Gary, 2020, ‘Research Designs’, Lectures on Quantitative Social Science Methods 1, https://youtu.be/SBwPLwVOb7s.  -->
<!-- - Kuriwaki, Shiro, 2020, 'Difference-in-Differences Estimation in R (parts 1 and 2)', 18 April, https://vimeo.com/409267138 and https://vimeo.com/409267190. -->
<!-- - Kuriwaki, Shiro, 2020, 'Instrumental variables in R', 11 April, https://vimeo.com/406629459. -->
<!-- - Kuriwaki, Shiro, 2020, 'Regression Discontinuity in R (parts 1 and 2)', 25 March, https://vimeo.com/400826628 and https://vimeo.com/400826660. -->
<!-- - Oostrom, Tamar, 2021, 'Funding of Clinical Trials and Reported Drug Efficacy', 2 March, https://youtu.be/DdnpWS9Km5U. -->
<!-- - Riederer, Emily, 2021, 'Observational Causal Inference', Toronto Data Workshop, 15 February, https://youtu.be/VP3BBZ7poc0. -->


<!-- **Recommended reading** -->

<!-- - Alexander, Monica, Polimis, Kivan, and Zagheni, Emilio, 2019,' The impact of Hurricane Maria on out-migration from Puerto Rico: Evidence from Facebook data', *Population and Development Review*. (Example of using diff-in-diff to measure the effect of Hurricane Maria.) -->
<!-- - Alexander, Rohan, and Zachary Ward, 2018, 'Age at arrival and assimilation during the age of mass migration', *The Journal of Economic History*, 78, no. 3, 904-937. (Example where I used differences between brothers to estimate the effect of education.) -->
<!-- - Angrist, Joshua D., and Jörn-Steffen Pischke, 2008, *Mostly harmless econometrics: An empiricist's companion*, Princeton University Press, Chapter 4.  -->
<!-- - Angrist, Joshua D., and Jörn-Steffen Pischke, 2008, *Mostly harmless econometrics: An empiricist's companion*, Princeton University Press, Chapter 6. -->
<!-- - Angrist, Joshua D., and Jörn-Steffen Pischke, 2008, *Mostly harmless econometrics: An empiricist's companion*, Princeton University Press, Chapters 3.3.2 and 5. -->
<!-- - Austin, Peter C., 2011, 'An Introduction to Propensity Score Methods for Reducing the Effects of Confounding in Observational Studies', *Multivariate Behavioral Research*, vol. 46, no. 3, pp.399-424. (Broad overview of propensity score matching, with a nice discussion of the comparison to randomized controlled trials.) -->
<!-- - Baker, Andrew, 2019, 'Difference-in-Differences Methodology', 25 September, https://andrewcbaker.netlify.app/2019/09/25/difference-in-differences-methodology/.  -->
<!-- - Coppock, Alenxader, and Donald P. Green, 2016, 'Is Voting Habit Forming? New Evidence from Experiments and Regression Discontinuities', *American Journal of Political Science*, Volume 60, Issue 4, pp. 1044-1062, available at: https://onlinelibrary.wiley.com/doi/abs/10.1111/ajps.12210. (Has code and data.) -->
<!-- - Cunningham, Scott, 'Causal Inference: The Mixtape', Chapter 'Instrumental variables', http://www.scunning.com/causalinference_norap.pdf. -->
<!-- - Cunningham, Scott, 'Causal Inference: The Mixtape', chapter 'Regression discontinuity', http://www.scunning.com/causalinference_norap.pdf. -->
<!-- - Cunningham, Scott, *Causal Inference: The Mixtape*, chapters 'Matching and subclassifications' and 'Differences-in-differences', http://www.scunning.com/causalinference_norap.pdf. (Very well-written notes on diff-in-diff.) -->
<!-- - Dell, Melissa, Pablo Querubin, 2018, 'Nation Building Through Foreign Intervention: Evidence from Discontinuities in Military Strategies', *The Quarterly Journal of Economics*, Volume 133, Issue 2, pp. 701–764, https://doi.org/10.1093/qje/qjx037. -->
<!-- - Evans, David, 2013, 'Regression Discontinuity Porn', *World Bank Blogs*, 16 November, https://blogs.worldbank.org/impactevaluations/regression-discontinuity-porn. -->
<!-- - Gelman, Andrew, 2019, 'Another Regression Discontinuity Disaster and what can we learn from it', *Statistical Modeling, Causal Inference, and Social Science*, 25 June, https://statmodeling.stat.columbia.edu/2019/06/25/another-regression-discontinuity-disaster-and-what-can-we-learn-from-it/. -->
<!-- - Gelman, Andrew, and Guido Imbens, 2019, "Why high-order polynomials should not be used in regression discontinuity designs", *Journal of Business & Economic Statistics*, 37, pp. 447-456. -->
<!-- - Gelman, Andrew, and Jennifer Hill, 2007, *Data Analysis Using Regression and Muiltilevel/Hierarchical Models*, Chapter 10, pp. 207-215. -->
<!-- - Grogger, Jeffrey, Andreas Steinmayr, Joachim Winter, 2020, 'The Wage Penalty of Regional Accents', NBER Working Paper No. 26719. -->
<!-- - Harris, Rich, Mlacki Migliozzi and Niraj Chokshi, '13,000 Missing Flights: The Global Consequences of the Coronavirus', *New York Times*, 21 February 2020. freely available here (if you make an account): https://www.nytimes.com/interactive/2020/02/21/business/coronavirus-airline-travel.html. -->
<!-- - Imai, Kosuke, 2017, Quantitative Social Science: An Introduction, Princeton University Press, Ch 2.5. -->
<!-- - Imbens, Guido W., and Thomas Lemieux, 2008, 'Regression discontinuity designs: A guide to practice', *Journal of Econometrics*, vol. 142, no. 2, pp. 615-635. -->
<!-- - Myllyvirta, Lauri, 2020, 'Analysis: Coronavirus has temporarily reduced China's CO2 emissions by a quarter', *Carbon Brief*, 19 February, https://www.carbonbrief.org/analysis-coronavirus-has-temporarily-reduced-chinas-co2-emissions-by-a-quarter. -->
<!-- - Saeed, Sahar, Erica E. M. Moodie, Erin C. Strumpf, Marina B. Klein, 2019, 'Evaluating the impact of health policies: using a difference-in-differences approach', *International Journal of Public Health*, 64, pp. 637–642, https://doi.org/10.1007/s00038-018-1195-2. -->
<!-- - Taddy, Matt, 2019, *Business Data Science*, Chapter 5, pp. 146-162. -->
<!-- - Tang, John, 2015, 'Pollution havens and the trade in toxic chemicals: evidence from U.S. trade flows', *Ecological Economics*, vol. 112, pp. 150-160. (Example of using diff-in-diff to estimate pollution.) -->
<!-- - Travis, D.J., Carleton, A.M. and Lauritsen, R.G., 2004. 'Regional variations in US diurnal temperature range for the 11–14 September 2001 aircraft groundings: Evidence of jet contrail influence on climate', Journal of climate, 17(5), pp.1123-1134. -->
<!-- - Travis, David J., Andrew M. Carleton, and Ryan G. Lauritsen. "Contrails reduce daily temperature range." Nature, 418, no. 6898 (2002): 601-601. -->
<!-- - Valencia Caicedo, Felipe. 'The mission: Human capital transmission, economic persistence, and culture in South America.' The Quarterly Journal of Economics 134.1 (2019): 507-556. (Data available at: Valencia Caicedo, Felipe, 2018, "Replication Data for: 'The Mission: Human Capital Transmission, Economic Persistence, and Culture in South America'", https://doi.org/10.7910/DVN/ML1155, Harvard Dataverse, V1.). -->
<!-- - Zinovyeva, Natalia and Maryna Tverdostup, 2019, 'Why are women who earn slightly more than their husbands hard to find?', 10 June, https://blogs.lse.ac.uk/businessreview/2019/06/10/why-are-women-who-earn-slightly-more-than-their-husbands-hard-to-find/. -->









## Introduction

Life is grand when we can conduct experiments to be able to speak to causality. But there are circumstances in which we cannot run an experiment, but nonetheless want to be able to make causal claims. And data from outside experiments have value that experiments do not have. In this chapter we discuss the circumstances and methods that allow us to speak to causality using observational data. We use relatively simple methods, in sophisticated ways, drawing from statistics, but also a variety of social sciences, including economics, and political science, as well as epidemiology.

For instance, @dagan2021bnt162b2 use observational data to confirm the effectiveness of the Pfizer-BioNTech vaccine. They discuss how one concern with using observational data in this way is confounding, which is where we are concerned that there is some variable that affects both the explanatory and dependent variables and can lead to spurious relationships. @dagan2021bnt162b2 adjust for this by first making a list of potential confounders, such as age, sex, geographic location, healthcare usage and then adjusting for each of them, by matching, one-to-one between people that were vaccinated and those that were not. The experimental data guided the use of observational data, and the larger size of the later enabled a focus on specific age-groups and extent of disease.

Using observational data in sophisticated ways is what this chapter is about. How we can nonetheless be comfortable making causal statements, even when we cannot run A/B tests or RCTs. Indeed, in what circumstances may we prefer to not run those or to run observational-based approaches in addition to them. We cover three of the major methods: difference in differences; regression discontinuity; and instrumental variables.


## Directed acyclic graphs

When we are discussing causality, it can help to be very specific about what we mean. It is easy to get caught up in observational data and trick ourselves. It is important to think hard, and to use all the tools available to us. For instance, in that earlier example, @dagan2021bnt162b2 were able to use experimental data as a guide. Most of the time, we will not be so lucky as to have both experimental data and observational data available to us. But one framework that can help with thinking hard about our data is the use of directed acyclic graph (DAG). DAGs are a fancy name for a flow diagram and involves drawing arrows and lines between the variables to indicate the relationship between them. Following @citeerik we use `DiagrammeR` [@citeDiagrammeR] to build them here, because we can use the same skills outside of just DAGs and `DiagrammeR` provides quite a lot of control (Figure \@ref(fig:firstdag)). But `ggdag` is also useful [@citeggdag].


```r
library(DiagrammeR)

DiagrammeR::grViz("
digraph {
  graph [ranksep = 0.2]
  node [shape = plaintext, fontsize = 10, fontname = Helvetica]
    x
    y
  edge [minlen = 2, arrowhead = vee]
    x->y
  { rank = same; x; y }
}
", height = 200)
```

<div class="figure">

```{=html}
<div id="htmlwidget-72570b64d6c550f3e4ec" style="width:75%;height:200px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-72570b64d6c550f3e4ec">{"x":{"diagram":"\ndigraph {\n  graph [ranksep = 0.2]\n  node [shape = plaintext, fontsize = 10, fontname = Helvetica]\n    x\n    y\n  edge [minlen = 2, arrowhead = vee]\n    x->y\n  { rank = same; x; y }\n}\n","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:firstdag)Using a DAG to illustrate perceived relationships</p>
</div>

In Figure \@ref(fig:firstdag), we think that *x* causes *y*. We could build another DAG where the situation is less clear. To make the examples a little easier to follow, we will switch to fruits (Figure \@ref(fig:carrotasconfounder)).


```r
DiagrammeR::grViz("
digraph {
  graph [ranksep = 0.2]
  node [shape = plaintext, fontsize = 10, fontname = Helvetica]
    Apple
    Banana
    Carrot
  edge [minlen = 2, arrowhead = vee]
    Apple->Banana
    Carrot->Apple
    Carrot->Banana
  { rank = same; Apple; Banana }
}
", height = 300)
```

<div class="figure">

```{=html}
<div id="htmlwidget-6535b2435ca6a00c6236" style="width:75%;height:300px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-6535b2435ca6a00c6236">{"x":{"diagram":"\ndigraph {\n  graph [ranksep = 0.2]\n  node [shape = plaintext, fontsize = 10, fontname = Helvetica]\n    Apple\n    Banana\n    Carrot\n  edge [minlen = 2, arrowhead = vee]\n    Apple->Banana\n    Carrot->Apple\n    Carrot->Banana\n  { rank = same; Apple; Banana }\n}\n","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:carrotasconfounder)A DAG showing Carrot as a confounder</p>
</div>

In Figure \@ref(fig:carrotasconfounder), we think *Apple* causes *Banana*. But we also think that *Carrot* causes *Banana*, and that *Carrot* also causes *Apple*. That relationship is a 'backdoor path', and would create spurious correlation in our analysis. We may think that changes in *Apple* are causing changes in *Banana*, but it could be that *Carrot* is changing them both. That variable, in this case, *Carrot*, is called a 'confounder'.

@hernanrobins2020 [p. 83] discuss an interesting case where a researcher was interested in whether one person looking up at the sky makes others look up at the sky also. There was a clear relationship between the responses of both people. But it was also the case that there was noise in the sky. So, it was unclear whether the second person looked up because the first person looked up, or they both looked up because of the noise. When using experimental data, randomization allows us to avoid this concern, but with observational data we cannot rely on that. It is also not the case that bigger data necessarily get around this problem for us. Instead, it is important to think carefully about the situation. 

If there are confounders, but we are still interested in causal effects, then we need to adjust for them. One way is to include them in the regression. But the validity of this requires several assumptions. In particular, @gelmanandhill [p. 169] warn that our estimate will only correspond to the average causal effect in the sample if we include all of the confounders and have the right model. Putting the second requirement to one side, and focusing only on the first, if we do not think about and observe a confounder, then it can be difficult to adjust for it. And this is an area where both domain expertise and theory can bring a lot to an analysis. 

In Figure \@ref(fig:carrotasmediator) we have a similar situation where again, we may think that *Apple* causes *Banana*. But in Figure \@ref(fig:carrotasmediator) *Apple* also causes *Carrot*, which itself causes *Banana*.


```r
DiagrammeR::grViz("
digraph {
  graph [ranksep = 0.2]
  node [shape = plaintext, fontsize = 10, fontname = Helvetica]
    Apple
    Banana
    Carrot
  edge [minlen = 2, arrowhead = vee]
    Apple->Banana
    Apple->Carrot
    Carrot->Banana
  { rank = same; Apple; Banana }
}
", height = 300)
```

<div class="figure">

```{=html}
<div id="htmlwidget-cb47645586b40bc4c68c" style="width:75%;height:300px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-cb47645586b40bc4c68c">{"x":{"diagram":"\ndigraph {\n  graph [ranksep = 0.2]\n  node [shape = plaintext, fontsize = 10, fontname = Helvetica]\n    Apple\n    Banana\n    Carrot\n  edge [minlen = 2, arrowhead = vee]\n    Apple->Banana\n    Apple->Carrot\n    Carrot->Banana\n  { rank = same; Apple; Banana }\n}\n","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:carrotasmediator)A DAG showing Carrot as a mediator</p>
</div>

In Figure \@ref(fig:carrotasmediator), *Carrot* is called a 'mediator' and we would not adjust for it if we were interested in the effect of *Apple* on *Banana*. If we were to adjust for it, then some of what we are attributing to *Apple*, would be due to *Carrot*.

Finally, in Figure \@ref(fig:carrotascollider) we have yet another similar situation, where we again, think that *Apple* causes *Banana*. But this time both *Apple* and *Banana* also cause *Carrot*.


```r
DiagrammeR::grViz("
digraph {
  graph [ranksep = 0.2]
  node [shape = plaintext, fontsize = 10, fontname = Helvetica]
    Apple
    Banana
    Carrot
  edge [minlen = 2, arrowhead = vee]
    Apple->Banana
    Apple->Carrot
    Banana->Carrot
  { rank = same; Apple; Banana }
}
", height = 300)
```

<div class="figure">

```{=html}
<div id="htmlwidget-527fb5bc62f3bf1e67af" style="width:75%;height:300px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-527fb5bc62f3bf1e67af">{"x":{"diagram":"\ndigraph {\n  graph [ranksep = 0.2]\n  node [shape = plaintext, fontsize = 10, fontname = Helvetica]\n    Apple\n    Banana\n    Carrot\n  edge [minlen = 2, arrowhead = vee]\n    Apple->Banana\n    Apple->Carrot\n    Banana->Carrot\n  { rank = same; Apple; Banana }\n}\n","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:carrotascollider)A DAG showing Carrot as a collider</p>
</div>

In this case, *Carrot* is called a 'collider' and if we were to condition on it, then we would create a misleading relationship.

It is important to be clear about this: we must create the DAG ourselves, in the same way that we must put together the model ourselves. There is nothing that will create it for us. This means that we need to think carefully about the situation. Because it is one thing to see something in the DAG and then do something about it. But it is another to not even know that it is there. @citemcelreath [p. 180] describes these as haunted DAGs. DAGs are helpful, but they are just a tool to help us think deeply about our situation. 

There are two situations where data can trick us that are so common that we will explicitly go through them. These are: 1) Simpson's paradox, and 2) Berkson's paradox. It is important to keep these situations in mind, and the use of DAGs can help identify them. 

Simpson's paradox occurs when we estimate some relationship for subsets of our data, but a different relationship when we consider the entire dataset [@simpson1951interpretation]. For instance, it may be that there is a positive relationship between undergraduate grades and performance in graduate school in two departments when considering each department individually. But if undergraduate grades tended to be higher in one department than another while graduate school performance tended to be opposite, we may find a negative relationship between undergraduate grades and performance in graduate school. We can simulate some data to show this more clearly (Figure \@ref(fig:simpsonsparadox)).


```r
library(tidyverse)

set.seed(853)

number_in_each <- 1000

department_one <-
  tibble(
    undergrad = runif(n = number_in_each, min = 0.7, max = 0.9),
    noise = rnorm(n = number_in_each, 0, sd = 0.1),
    grad = undergrad + noise,
    type = "Department 1"
  )

department_two <-
  tibble(
    undergrad = runif(n = number_in_each, min = 0.6, max = 0.8),
    noise = rnorm(n = number_in_each, 0, sd = 0.1),
    grad = undergrad + noise + 0.3,
    type = "Department 2"
  )

both_departments <- rbind(department_one, department_two)

both_departments
#> # A tibble: 2,000 × 4
#>    undergrad   noise  grad type        
#>        <dbl>   <dbl> <dbl> <chr>       
#>  1     0.772 -0.0566 0.715 Department 1
#>  2     0.724 -0.0312 0.693 Department 1
#>  3     0.797  0.0770 0.874 Department 1
#>  4     0.763 -0.0664 0.697 Department 1
#>  5     0.707  0.0717 0.779 Department 1
#>  6     0.781 -0.0165 0.764 Department 1
#>  7     0.726 -0.104  0.623 Department 1
#>  8     0.749  0.0527 0.801 Department 1
#>  9     0.732 -0.0471 0.684 Department 1
#> 10     0.738  0.0552 0.793 Department 1
#> # … with 1,990 more rows
```


```r
both_departments |>
  ggplot(aes(x = undergrad, y = grad)) +
  geom_point(aes(color = type), alpha = 0.1) +
  geom_smooth(aes(color = type), method = 'lm', formula = 'y ~ x') +
  geom_smooth(method = 'lm',
              formula = 'y ~ x',
              color = 'black') +
  labs(x = "Undergraduate results",
       y = "Graduate results",
       color = "Department") +
  theme_minimal() +
  scale_color_brewer(palette = "Set1")
```

<div class="figure">
<img src="42-causality_from_obs_files/figure-html/simpsonsparadox-1.png" alt="Illustration of simulated data that shows Simpson's paradox" width="672" />
<p class="caption">(\#fig:simpsonsparadox)Illustration of simulated data that shows Simpson's paradox</p>
</div>

Berkson's paradox occurs when we estimate some relationship based on the dataset that we have. But because the dataset is so selected, the relationship is different in a more general dataset [@citeberkson]. For instance, if we have a dataset of professional cyclists then we might find there is no relationship between their VO2 max and their chance of winning a bike race. But if we had a dataset of the general population then we might find a relationship between these two variables. The professional dataset has just been so selected that the relationship disappears; one cannot become a professional cyclist unless one has a good-enough VO2 max. Again, we can simulate some data to show this more clearly (Figure \@ref(fig:berksonsparadox)).


```r
set.seed(853)

number_of_pros <- 100

number_of_public <- 1000

professionals <-
  tibble(
    VO2 = runif(n = number_of_pros, min = 0.7, max = 0.9),
    chance_of_winning = runif(n = number_of_pros, min = 0.7, max = 0.9),
    type = "Professionals"
  )

general_public <-
  tibble(
    VO2 = runif(n = number_of_public, min = 0.6, max = 0.8),
    noise = rnorm(n = number_of_public, 0, sd = 0.03),
    chance_of_winning = VO2 + noise + 0.1,
    type = "Public"
  ) |>
  select(-noise)

professionals_and_public = rbind(professionals, general_public)

professionals_and_public
#> # A tibble: 1,100 × 3
#>      VO2 chance_of_winning type         
#>    <dbl>             <dbl> <chr>        
#>  1 0.772             0.734 Professionals
#>  2 0.724             0.773 Professionals
#>  3 0.797             0.772 Professionals
#>  4 0.763             0.754 Professionals
#>  5 0.707             0.843 Professionals
#>  6 0.781             0.740 Professionals
#>  7 0.726             0.803 Professionals
#>  8 0.749             0.750 Professionals
#>  9 0.732             0.890 Professionals
#> 10 0.738             0.821 Professionals
#> # … with 1,090 more rows
```



```r
professionals_and_public |> 
  ggplot(aes(x = VO2, y = chance_of_winning)) +
  geom_point(aes(color = type), alpha = 0.1) +
  geom_smooth(aes(color = type), method = 'lm', formula = 'y ~ x') +
  geom_smooth(method = 'lm', formula = 'y ~ x', color = 'black') +
  labs(x = "VO2 max",
       y = "Chance of winning a bike race",
       color = "Type") +
  theme_minimal() +
  scale_color_brewer(palette = "Set1")
```

<div class="figure">
<img src="42-causality_from_obs_files/figure-html/berksonsparadox-1.png" alt="Illustration of simulated data that shows Berkson's paradox" width="672" />
<p class="caption">(\#fig:berksonsparadox)Illustration of simulated data that shows Berkson's paradox</p>
</div>



## Difference in differences

### Overview

The ideal situation of being able to conduct an experiment is rarely possible. Can we reasonably expect that Netflix would allow us to change prices? And even if they did once, would they let us do it again, and again, and again? Further, rarely can we explicitly create treatment and control groups. Finally, experiments can be expensive or unethical. Instead, we need to make do with what we have. Rather than our counterfactual coming to us through randomization, and hence us knowing that the two are the same but for the treatment, we try to identify groups that were similar but for the treatment, and hence any differences can be attributed to the treatment. 

With observational data, sometimes there are differences between our two groups before we treat. Provided those pre-treatment differences satisfy assumptions that essentially amount to the differences being both consistent, and that we expect that consistency to continue in the absence of the treatment---the 'parallel trends' assumption---then we can look to any difference in the differences as the effect of the treatment. One of the aspects of difference in differences analysis is that we can do it using relatively straight-forward methods. Linear regression with a binary variable is enough to get started and do a convincing job.

Consider wanting to know the effect of a new tennis racket on serve speed. One way to test this would be to measure the difference between, say, Roger Federer's serve speed without the tennis racket and the serve speed of an enthusiastic amateur, let us call them Ville, with the tennis racket. Yes, we would find a difference, but would we know how much to attribute to the tennis racket? Another way would be to consider the difference between Ville's serve speed without the new tennis racket and Ville's serve speed with the new tennis racket. But what if serves were just getting faster naturally over time? Instead, we combine the two approaches to look at the difference in the differences.

We begin by measuring Federer's serve speed and compare it to Ville's serve speed, both without the new racket. We then measure Federer's serve speed again, and measure Ville's serve speed with the new racket. That difference in the differences would then be the estimate of the effect of the new racket. There are a few key assumptions that we need to make for this analysis to be appropriate:

1) Is there something else that may have affected only Ville, and not Federer that could affect Ville's serve speed?
2) Is it likely that Federer and Ville have the same trajectory of serve speed improvement? This is the 'parallel trends' assumption, and it dominates many discussions of difference in differences analysis. 
3) Finally, is it likely that the variance of our serve speeds of Federer and Ville are the same?

Despite these requirements, difference in differences is a powerful approach because we do not need the treatment and control group to be the same before the treatment. We just need to have a good idea of how they differed.

### Simulated example

To be more specific about the situation, we simulate data. We will simulate a situation in which there is initially a difference of one between the serve speeds of the different people, and then after a new tennis racket, there is a difference of six. We can use a graph to illustrate the situation (Figure \@ref(fig:diffindifftennisracket)).


```r
library(tidyverse)

set.seed(853)

simulated_difference_in_differences <-
  tibble(
    person = rep(c(1:1000), times = 2),
    time = c(rep(0, times = 1000), rep(1, times = 1000)),
    treatment_group = rep(
      sample(
        x = 0:1,
        size  = 1000,
        replace = TRUE
        ), 
      times = 2)
    ) |>
  mutate(treatment_group = as.factor(treatment_group),
         time = as.factor(time)
  )


simulated_difference_in_differences <-
  simulated_difference_in_differences |>
  rowwise() |>
  mutate(
    serve_speed = case_when(
      time == 0 & treatment_group == 0 ~ rnorm(n = 1, mean = 5, sd = 1),
      time == 1 & treatment_group == 0 ~ rnorm(n = 1, mean = 6, sd = 1),
      time == 0 & treatment_group == 1 ~ rnorm(n = 1, mean = 8, sd = 1),
      time == 1 & treatment_group == 1 ~ rnorm(n = 1, mean = 14, sd = 1)
    )
  )

simulated_difference_in_differences
#> # A tibble: 2,000 × 4
#> # Rowwise: 
#>    person time  treatment_group serve_speed
#>     <int> <fct> <fct>                 <dbl>
#>  1      1 0     0                      4.43
#>  2      2 0     1                      6.96
#>  3      3 0     1                      7.77
#>  4      4 0     0                      5.31
#>  5      5 0     0                      4.09
#>  6      6 0     0                      4.85
#>  7      7 0     0                      6.43
#>  8      8 0     0                      5.77
#>  9      9 0     1                      6.13
#> 10     10 0     1                      7.32
#> # … with 1,990 more rows
```


```r
simulated_difference_in_differences |>
  ggplot(aes(x = time,
             y = serve_speed,
             color = treatment_group)) +
  geom_point(alpha = 0.2) +
  geom_line(aes(group = person), alpha = 0.1) +
  theme_minimal() +
  labs(x = "Time period",
       y = "Serve speed",
       color = "Person got a new racket") +
  scale_color_brewer(palette = "Set1")
```

<div class="figure">
<img src="42-causality_from_obs_files/figure-html/diffindifftennisracket-1.png" alt="Illustration of simulated data that shows a difference before and after getting a new tennis racket" width="672" />
<p class="caption">(\#fig:diffindifftennisracket)Illustration of simulated data that shows a difference before and after getting a new tennis racket</p>
</div>

As it is a straight-forward example, we can obtain our estimate manually, by looking at the average difference of the differences. When we do that, we find that we estimate the effect of the new tennis racket to be 5.06, which is similar to what we simulated.


```r
average_differences <-
  simulated_difference_in_differences |>
  pivot_wider(names_from = time,
              values_from = serve_speed,
              names_prefix = "time_") |>
  mutate(difference = time_1 - time_0) |>
  group_by(treatment_group) |>
  summarize(average_difference = mean(difference))

average_differences$average_difference[2] - average_differences$average_difference[1]
#> [1] 5.058414
```

And we can use linear regression to get the same result. The equation that we are interested in is:
$$Y_{i,t} = \beta_0 + \beta_1\mbox{Treatment binary}_i + \beta_2\mbox{Time binary}_t + \beta_3(\mbox{Treatment binary} \times\mbox{Time binary})_{i,t} + \epsilon_{i,t}$$

While we should include the separate aspects as well, it is the estimate of the interaction that we are interested in. In this case it is $\beta_3$. And we find that our estimated effect is 5.06.


```r
diff_in_diff_example_regression <- 
  lm(serve_speed ~ treatment_group*time, 
     data = simulated_difference_in_differences)

summary(diff_in_diff_example_regression)
#> 
#> Call:
#> lm(formula = serve_speed ~ treatment_group * time, data = simulated_difference_in_differences)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -4.1415 -0.6638 -0.0039  0.6708  3.2664 
#> 
#> Coefficients:
#>                        Estimate Std. Error t value Pr(>|t|)
#> (Intercept)             4.97131    0.04281  116.12   <2e-16
#> treatment_group1        3.03350    0.06225   48.73   <2e-16
#> time1                   1.00680    0.06055   16.63   <2e-16
#> treatment_group1:time1  5.05841    0.08803   57.46   <2e-16
#>                           
#> (Intercept)            ***
#> treatment_group1       ***
#> time1                  ***
#> treatment_group1:time1 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 0.9828 on 1996 degrees of freedom
#> Multiple R-squared:  0.9268,	Adjusted R-squared:  0.9266 
#> F-statistic:  8418 on 3 and 1996 DF,  p-value: < 2.2e-16
```


### Assumptions

If we want to use difference in differences, then we need to satisfy the assumptions. There were three that were touched on earlier, but here we will focus on one: the 'parallel trends' assumption. The parallel trends assumption haunts everything to do with difference in differences analysis because we can never prove it, we can just be convinced of it, and try to convince others.

To see why we can never prove it, consider an example in which we want to know the effect of a new stadium on a professional sports team's wins/loses. To do this we consider two teams: the Golden State Warriors and the Toronto Raptors. The Warriors changed stadiums at the start of the 2019-20 season, while the Raptors did not, so we will consider four time periods: the 2016-17 season, 2017-18 season, 2018-19 season, and finally we will compare the performance with the one after they moved, so the 2019-20 season. The Raptors here act as our counterfactual. This means that we assume the relationship between the Warriors and the Raptors, in the absence of a new stadium, would have continued to change in a consistent way. But the fundamental problem of causal inference means that we can never know that for certain. We must present sufficient evidence to assuage any concerns that a reader may have. 

There are four main threats to validity when we use difference in differences, and we need to address all of them [@Cunningham2021, p. 272--277]:

1. Non-parallel trends. The treatment and control groups may be based on differences. As such it can be difficult to convincingly argue for parallel trends. In this case, maybe try to find another factor to consider in your model that may adjust for some of that. This may require difference in difference in differences (in the earlier example, we could perhaps add the San Francisco 49ers as they are in the same broad geographic area as the Warriors). Or maybe re-think the analysis to see if we can make a different control group. Adding additional earlier time periods may help but may introduce more issues, which we touch on in the third point.
2. Compositional differences. This is a concern when working with repeated cross-sections. What if the composition of those cross-sections change? For instance, if we are working at an app that is rapidly growing, and we want to look at the effect of some change. In our initial cross-section, we may have mostly young people, but in a subsequent cross-section, we may have more older people as the demographics of the app usage change. Hence our results may just be an age-effect, not an effect of the change that we are interested in. 
3. Long-term effects compared with reliability. As we discussed in Chapter \@ref(hunt-data), there is a trade-off between the length of the analysis that we run. As we run the analysis for longer there is more opportunity for other factors to affect the results. There is also increased chance for someone who was not treated to be treated. But, on the other hand, it can be difficult to convincingly argue that short-term results will continue in the long-term. 
4. Functional form dependence. This is less of an issue when the outcomes are similar, but if they are different then functional form may be responsible for some aspects of the results.










### Case study: French newspaper prices between 1960 and 1974

In this case study we introduce @angelucci2019newspapers, and replicate its main findings. 

The business model of newspapers was challenged by the internet and many local newspapers have closed. And this issue is not new. When television was introduced, there were similar concerns. @angelucci2019newspapers use the introduction of television advertising in France, announced in 1967, to examine the effect of decreased advertising revenue on newspapers. They create a dataset of French newspapers from 1960 to 1974 and then use difference in differences to examine the effect of the reduction in advertising revenues on newspapers' content and prices. The change that they focus on is the introduction of television advertising, which they argue affected national newspapers more than local newspapers. They find that this change results in both less journalism-content in the newspapers and lower newspaper prices. Focusing on this change, and analyzing it using difference in differences, is important because it allows us to disentangle a few competing effects. For instance, did newspapers become redundant because they could no longer charge high prices for their advertisements, or because consumers preferred to get their news from the television?

We can get free access to the [data](https://www.openicpsr.org/openicpsr/project/116438/version/V1/view) that underpins @angelucci2019newspapers after registration. The dataset is in the Stata data format, 'dta', which we can read with `read_dta()` from `haven` [@citehaven]. The file that we are interested in is 'Angelucci_Cage_AEJMicro_dataset.dta', which is the 'dta' folder.


```r
library(haven)

newspapers <- read_dta("Angelucci_Cage_AEJMicro_dataset.dta")

newspapers
```



```
#> # A tibble: 1,196 × 52
#>     year id_news local national after_national   Had po_cst
#>    <dbl>   <dbl> <dbl>    <dbl>          <dbl> <dbl>  <dbl>
#>  1  1960       1     1        0              0     0   2.60
#>  2  1961       1     1        0              0     0   2.51
#>  3  1962       1     1        0              0     0   2.39
#>  4  1963       1     1        0              0     0   2.74
#>  5  1964       1     1        0              0     0   2.65
#>  6  1965       1     1        0              0     0   2.59
#>  7  1966       1     1        0              0     0   2.52
#>  8  1967       1     1        0              0     0   3.27
#>  9  1968       1     1        0              0     0   3.91
#> 10  1969       1     1        0              0     0   3.67
#> # … with 1,186 more rows, and 45 more variables:
#> #   ps_cst <dbl>, etotal_cst <dbl>, ra_cst <dbl>,
#> #   ra_s <dbl>, rs_cst <dbl>, rtotal_cst <dbl>,
#> #   profit_cst <dbl>, nb_journ <dbl>, qs_s <dbl>,
#> #   qtotal <dbl>, pages <dbl>, ads_q <dbl>, ads_s <dbl>,
#> #   news_hole <dbl>, share_Hard <dbl>, ads_p4_cst <dbl>,
#> #   R_sh_edu_primaire_ipo <dbl>, …
```

There are 1,196 observations in the dataset and 52 variables. @angelucci2019newspapers are interested in the 1960-1974 time-period which has around 100 newspapers. There are 14 national newspapers at the beginning of the period and 12 at the end. The key period is 1967, when the French government announced it would allow advertising on television. @angelucci2019newspapers argue that national newspapers were affected by this chance, but local newspapers were not. So, the national newspapers are the treatment group and the local newspapers are the control group.

We focus just on the headline difference in differences result and construct summary statistics (Table \@ref(tab:frenchnewspaperssummarystatistics)).



```r
newspapers <- 
  newspapers |> 
  select(year, id_news, after_national, local, national, # Diff in diff variables
         ra_cst, ads_p4_cst, ads_s, # Advertising side dependents
         ps_cst, po_cst, qtotal, qs_s, rs_cst) |> # Reader side dependents
  mutate(ra_cst_div_qtotal = ra_cst / qtotal) |> # An advertising side dependent needs to be built
  mutate(across(c(id_news, after_national, local, national), as.factor)) |> 
  mutate(year = as.integer(year))

newspapers
#> # A tibble: 1,196 × 14
#>     year id_news after_national local national    ra_cst
#>    <int> <fct>   <fct>          <fct> <fct>        <dbl>
#>  1  1960 1       0              1     0         52890272
#>  2  1961 1       0              1     0         56601060
#>  3  1962 1       0              1     0         64840752
#>  4  1963 1       0              1     0         70582944
#>  5  1964 1       0              1     0         74977888
#>  6  1965 1       0              1     0         74438248
#>  7  1966 1       0              1     0         81383000
#>  8  1967 1       0              1     0         80263152
#>  9  1968 1       0              1     0         87165704
#> 10  1969 1       0              1     0        102596384
#> # … with 1,186 more rows, and 8 more variables:
#> #   ads_p4_cst <dbl>, ads_s <dbl>, ps_cst <dbl>,
#> #   po_cst <dbl>, qtotal <dbl>, qs_s <dbl>, rs_cst <dbl>,
#> #   ra_cst_div_qtotal <dbl>
```



```r
library(modelsummary)

datasummary_skim(newspapers,
                 title = "Summary statistics for French newspapers dataset (1960-1974)")
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:frenchnewspaperssummarystatistics)Summary statistics for French newspapers dataset (1960-1974)</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Unique (#) </th>
   <th style="text-align:right;"> Missing (%) </th>
   <th style="text-align:right;"> Mean </th>
   <th style="text-align:right;"> SD </th>
   <th style="text-align:right;"> Min </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> Max </th>
   <th style="text-align:right;">    </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> year </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1967.0 </td>
   <td style="text-align:right;"> 4.3 </td>
   <td style="text-align:right;"> 1960.0 </td>
   <td style="text-align:right;"> 1967.0 </td>
   <td style="text-align:right;"> 1974.0 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="1.78" y="3.22" width="3.17" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="4.95" y="7.44" width="3.17" height="4.22" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="8.13" y="7.44" width="3.17" height="4.22" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="11.30" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="14.48" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="17.65" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="20.83" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="24.00" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="27.17" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="30.35" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="33.52" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="36.70" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="39.87" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="43.05" y="7.39" width="3.17" height="4.28" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> ra_cst </td>
   <td style="text-align:right;"> 1053 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 91531796.9 </td>
   <td style="text-align:right;"> 137207312.4 </td>
   <td style="text-align:right;"> 549717.2 </td>
   <td style="text-align:right;"> 35994710.0 </td>
   <td style="text-align:right;"> 864369088.0 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="1.75" y="3.22" width="5.15" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="6.89" y="9.89" width="5.15" height="1.77" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="12.04" y="10.76" width="5.15" height="0.91" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="17.18" y="11.38" width="5.15" height="0.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="22.33" y="11.61" width="5.15" height="0.056" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="27.48" y="11.61" width="5.15" height="0.056" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="32.62" y="11.58" width="5.15" height="0.078" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="37.77" y="11.57" width="5.15" height="0.090" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="42.91" y="11.56" width="5.15" height="0.10" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> ads_p4_cst </td>
   <td style="text-align:right;"> 558 </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 86.4 </td>
   <td style="text-align:right;"> 75.3 </td>
   <td style="text-align:right;"> 3.8 </td>
   <td style="text-align:right;"> 69.0 </td>
   <td style="text-align:right;"> 327.2 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="1.26" y="3.22" width="6.87" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="8.13" y="7.36" width="6.87" height="4.31" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="15.00" y="8.67" width="6.87" height="2.99" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="21.87" y="10.16" width="6.87" height="1.51" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="28.74" y="10.59" width="6.87" height="1.08" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="35.61" y="10.94" width="6.87" height="0.72" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="42.48" y="11.35" width="6.87" height="0.31" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> ads_s </td>
   <td style="text-align:right;"> 988 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 18.7 </td>
   <td style="text-align:right;"> 9.7 </td>
   <td style="text-align:right;"> 1.6 </td>
   <td style="text-align:right;"> 16.9 </td>
   <td style="text-align:right;"> 59.6 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="0.53" y="10.81" width="3.84" height="0.85" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="4.37" y="6.85" width="3.84" height="4.81" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="8.20" y="3.22" width="3.84" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="12.04" y="4.33" width="3.84" height="7.33" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="15.88" y="5.08" width="3.84" height="6.58" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="19.71" y="9.44" width="3.84" height="2.23" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="23.55" y="9.89" width="3.84" height="1.77" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="27.38" y="11.04" width="3.84" height="0.62" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="31.22" y="11.14" width="3.84" height="0.52" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="35.06" y="10.97" width="3.84" height="0.69" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="38.89" y="11.37" width="3.84" height="0.29" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="42.73" y="11.56" width="3.84" height="0.098" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> ps_cst </td>
   <td style="text-align:right;"> 665 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 2.8 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 2.8 </td>
   <td style="text-align:right;"> 5.6 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="0.15" y="11.36" width="4.49" height="0.30" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="4.64" y="11.10" width="4.49" height="0.57" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="9.13" y="10.94" width="4.49" height="0.72" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="13.62" y="3.22" width="4.49" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="18.11" y="7.85" width="4.49" height="3.81" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="22.60" y="6.44" width="4.49" height="5.22" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="27.09" y="8.90" width="4.49" height="2.76" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="31.58" y="11.01" width="4.49" height="0.65" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="36.07" y="11.55" width="4.49" height="0.11" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="40.56" y="11.55" width="4.49" height="0.11" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="45.05" y="11.64" width="4.49" height="0.022" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> po_cst </td>
   <td style="text-align:right;"> 146 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 3.2 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 0.8 </td>
   <td style="text-align:right;"> 3.3 </td>
   <td style="text-align:right;"> 9.3 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="-2.49" y="11.55" width="5.21" height="0.11" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="2.73" y="11.14" width="5.21" height="0.52" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="7.94" y="3.22" width="5.21" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="13.15" y="3.91" width="5.21" height="7.76" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="18.36" y="9.08" width="5.21" height="2.59" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="23.58" y="11.46" width="5.21" height="0.20" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="28.79" y="11.61" width="5.21" height="0.056" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="34.00" y="11.63" width="5.21" height="0.037" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="39.21" y="11.64" width="5.21" height="0.019" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="44.42" y="11.63" width="5.21" height="0.037" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> qtotal </td>
   <td style="text-align:right;"> 1052 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 130817.5 </td>
   <td style="text-align:right;"> 172954.3 </td>
   <td style="text-align:right;"> 1480.0 </td>
   <td style="text-align:right;"> 56775.2 </td>
   <td style="text-align:right;"> 1143676.0 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="1.72" y="3.22" width="3.89" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="5.61" y="9.63" width="3.89" height="2.03" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="9.50" y="10.53" width="3.89" height="1.13" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="13.39" y="10.82" width="3.89" height="0.84" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="17.28" y="11.40" width="3.89" height="0.26" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="21.18" y="11.60" width="3.89" height="0.062" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="25.07" y="11.54" width="3.89" height="0.12" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="28.96" y="11.43" width="3.89" height="0.24" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="32.85" y="11.63" width="3.89" height="0.037" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="36.74" y="11.65" width="3.89" height="0.012" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="40.63" y="11.59" width="3.89" height="0.074" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="44.52" y="11.65" width="3.89" height="0.012" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> qs_s </td>
   <td style="text-align:right;"> 914 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 27.2 </td>
   <td style="text-align:right;"> 22.7 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 22.5 </td>
   <td style="text-align:right;"> 100.1 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="1.47" y="3.22" width="4.47" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="5.94" y="6.42" width="4.47" height="5.24" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="10.41" y="5.36" width="4.47" height="6.30" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="14.88" y="8.20" width="4.47" height="3.46" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="19.35" y="9.11" width="4.47" height="2.55" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="23.82" y="9.46" width="4.47" height="2.20" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="28.29" y="11.20" width="4.47" height="0.46" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="32.76" y="11.29" width="4.47" height="0.37" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="37.23" y="10.60" width="4.47" height="1.06" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="41.70" y="11.12" width="4.47" height="0.54" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="46.17" y="11.60" width="4.47" height="0.057" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> rs_cst </td>
   <td style="text-align:right;"> 1047 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 97666503.6 </td>
   <td style="text-align:right;"> 125257120.3 </td>
   <td style="text-align:right;"> 255760.1 </td>
   <td style="text-align:right;"> 40736368.0 </td>
   <td style="text-align:right;"> 750715008.0 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="1.76" y="3.22" width="2.96" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="4.72" y="9.75" width="2.96" height="1.92" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="7.68" y="10.29" width="2.96" height="1.38" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="10.65" y="10.49" width="2.96" height="1.17" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="13.61" y="10.83" width="2.96" height="0.83" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="16.57" y="11.27" width="2.96" height="0.40" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="19.53" y="11.30" width="2.96" height="0.37" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="22.49" y="11.38" width="2.96" height="0.28" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="25.45" y="11.56" width="2.96" height="0.10" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="28.41" y="11.65" width="2.96" height="0.015" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="31.37" y="11.60" width="2.96" height="0.059" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="34.34" y="11.47" width="2.96" height="0.19" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="37.30" y="11.56" width="2.96" height="0.10" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="40.26" y="11.62" width="2.96" height="0.044" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="43.22" y="11.66" width="2.96" height="0.00" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="46.18" y="11.65" width="2.96" height="0.015" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
  <tr>
   <td style="text-align:left;"> ra_cst_div_qtotal </td>
   <td style="text-align:right;"> 1049 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 661.2 </td>
   <td style="text-align:right;"> 352.7 </td>
   <td style="text-align:right;"> 61.3 </td>
   <td style="text-align:right;"> 596.6 </td>
   <td style="text-align:right;"> 3048.4 </td>
   <td style="text-align:right;">  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="svglite" width="48.00pt" height="12.00pt" viewBox="0 0 48.00 12.00"><defs><style type="text/css">
    .svglite line, .svglite polyline, .svglite polygon, .svglite path, .svglite rect, .svglite circle {
      fill: none;
      stroke: #000000;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-miterlimit: 10.00;
    }
  </style></defs><rect width="100%" height="100%" style="stroke: none; fill: none;"></rect><defs><clipPath id="cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw"><rect x="0.00" y="0.00" width="48.00" height="12.00"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwwLjAwfDEyLjAw)">
</g><defs><clipPath id="cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw"><rect x="0.00" y="2.88" width="48.00" height="9.12"></rect></clipPath></defs><g clip-path="url(#cpMC4wMHw0OC4wMHwyLjg4fDEyLjAw)"><rect x="0.87" y="10.99" width="2.98" height="0.67" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="3.84" y="8.03" width="2.98" height="3.63" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="6.82" y="3.22" width="2.98" height="8.44" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="9.79" y="4.83" width="2.98" height="6.83" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="12.77" y="8.63" width="2.98" height="3.03" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="15.74" y="10.44" width="2.98" height="1.23" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="18.72" y="11.35" width="2.98" height="0.31" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="21.70" y="11.42" width="2.98" height="0.24" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="24.67" y="11.54" width="2.98" height="0.12" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="27.65" y="11.30" width="2.98" height="0.36" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="30.62" y="11.45" width="2.98" height="0.22" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="33.60" y="11.61" width="2.98" height="0.048" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="36.57" y="11.64" width="2.98" height="0.024" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="39.55" y="11.66" width="2.98" height="0.00" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="42.53" y="11.64" width="2.98" height="0.024" style="stroke-width: 0.38; fill: #000000;"></rect><rect x="45.50" y="11.64" width="2.98" height="0.024" style="stroke-width: 0.38; fill: #000000;"></rect></g></svg>
</td>
  </tr>
</tbody>
</table>


We are interested in what happened from 1967 onward, especially in terms of advertising revenue, and whether that was different for national, compared with local newspapers (Figure \@ref(fig:frenchnewspapersrevenue)). We use `scales` to adjust the y axis [@scales].


```r
library(scales)
newspapers |> 
  mutate(type = if_else(local == 1, "Local", "National")) |> 
  ggplot(aes(x = year, y = ra_cst)) +
  geom_point(alpha = 0.5) +
  scale_y_continuous(labels = dollar_format(prefix="$", suffix = "M", scale = 0.000001)) +
  labs(x = "Year",
       y = "Advertising revenue") +
  facet_wrap(vars(type),
               nrow = 2) +
  theme_minimal() +
  geom_vline(xintercept = 1966.5, linetype = "dashed")
```

<div class="figure">
<img src="42-causality_from_obs_files/figure-html/frenchnewspapersrevenue-1.png" alt="Revenue of French newspapers (1960-1974), by whether they were local or national" width="672" />
<p class="caption">(\#fig:frenchnewspapersrevenue)Revenue of French newspapers (1960-1974), by whether they were local or national</p>
</div>






The model that we are interested in estimating is:
$$\mbox{ln}(y_{n,t}) = \beta_0 + \beta_1(\mbox{National binary}\times\mbox{1967 onward binary}) + \lambda_n + \gamma_y + \epsilon.$$
It is the $\beta_1$ coefficient that we are especially interested in. We use $\lambda_n$ as fixed effect for each newspaper, and the $\gamma_y$ as a fixed effect for each year. We estimate the models using `lm()`.


```r
# Advertising side
ad_revenue <-
  lm(log(ra_cst) ~ after_national + id_news + year, data = newspapers)
ad_revenue_div_circulation <-
  lm(log(ra_cst_div_qtotal) ~ after_national + id_news + year, data = newspapers)
ad_price <-
  lm(log(ads_p4_cst) ~ after_national + id_news + year, data = newspapers)
ad_space <-
  lm(log(ads_s) ~ after_national + id_news + year, data = newspapers)

# Consumer side
subscription_price <-
  lm(log(ps_cst) ~ after_national + id_news + year, data = newspapers)
unit_price <-
  lm(log(po_cst) ~ after_national + id_news + year, data = newspapers)
circulation <-
  lm(log(qtotal) ~ after_national + id_news + year, data = newspapers)
share_of_sub <-
  lm(log(qs_s) ~ after_national + id_news + year, data = newspapers)
revenue_from_sales <-
  lm(log(rs_cst) ~ after_national + id_news + year, data = newspapers)
```


Looking at the advertising-side variables (Table \@ref(tab:frenchnewspapersadvertising)) we find consistently negative coefficients for everything apart from advertising space.


```r
selected_variables <- 
  c("year" = "Year",
  "after_national1" = "Is after advertising change")

advertising_models <- list(
  "Ad revenue" = ad_revenue,
  "Ad revenue over circulation" = ad_revenue_div_circulation,
  "Ad prices" = ad_price,
  "Ad space" = ad_space
)

modelsummary(
  advertising_models,
  fmt = 2,
  coef_map = selected_variables,
  title = "Effect of changed television advertising laws on revenue of French newspapers (1960-1974)"
)
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:frenchnewspapersadvertising)Effect of changed television advertising laws on revenue of French newspapers (1960-1974)</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Ad revenue </th>
   <th style="text-align:center;"> Ad revenue over circulation </th>
   <th style="text-align:center;"> Ad prices </th>
   <th style="text-align:center;"> Ad space </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Year </td>
   <td style="text-align:center;"> 0.05 </td>
   <td style="text-align:center;"> 0.04 </td>
   <td style="text-align:center;"> 0.04 </td>
   <td style="text-align:center;"> 0.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (0.00) </td>
   <td style="text-align:center;"> (0.00) </td>
   <td style="text-align:center;"> (0.00) </td>
   <td style="text-align:center;"> (0.00) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Is after advertising change </td>
   <td style="text-align:center;"> −0.23 </td>
   <td style="text-align:center;"> −0.15 </td>
   <td style="text-align:center;"> −0.31 </td>
   <td style="text-align:center;"> 0.01 </td>
  </tr>
  <tr>
   <td style="text-align:left;box-shadow: 0px 1px">  </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.03) </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.03) </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.07) </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.05) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Num.Obs. </td>
   <td style="text-align:center;"> 1052 </td>
   <td style="text-align:center;"> 1048 </td>
   <td style="text-align:center;"> 809 </td>
   <td style="text-align:center;"> 1046 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 </td>
   <td style="text-align:center;"> 0.985 </td>
   <td style="text-align:center;"> 0.903 </td>
   <td style="text-align:center;"> 0.892 </td>
   <td style="text-align:center;"> 0.720 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 Adj. </td>
   <td style="text-align:center;"> 0.984 </td>
   <td style="text-align:center;"> 0.895 </td>
   <td style="text-align:center;"> 0.882 </td>
   <td style="text-align:center;"> 0.699 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AIC </td>
   <td style="text-align:center;"> −526.7 </td>
   <td style="text-align:center;"> −735.0 </td>
   <td style="text-align:center;"> 705.4 </td>
   <td style="text-align:center;"> 478.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BIC </td>
   <td style="text-align:center;"> −120.1 </td>
   <td style="text-align:center;"> −328.8 </td>
   <td style="text-align:center;"> 1057.6 </td>
   <td style="text-align:center;"> 849.5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Log.Lik. </td>
   <td style="text-align:center;"> 345.341 </td>
   <td style="text-align:center;"> 449.524 </td>
   <td style="text-align:center;"> −277.714 </td>
   <td style="text-align:center;"> −164.012 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F </td>
   <td style="text-align:center;"> 814.664 </td>
   <td style="text-align:center;"> 112.259 </td>
   <td style="text-align:center;"> 83.464 </td>
   <td style="text-align:center;"> 34.285 </td>
  </tr>
</tbody>
</table>



And looking at the advertising-side variables (Table \@ref(tab:frenchnewspapersconsumers)) we again, find consistently negative coefficients for everything apart from the share of subscriptions and unit price.


```r
consumer_models <- list(
  "Subscription price" = subscription_price,
  "Circulation" = circulation,
  "Share of subscriptions" = share_of_sub,
  "Revenue from sales" = revenue_from_sales,
  "Unit price" = unit_price
)

modelsummary(
  consumer_models,
  fmt = 2,
  coef_map = selected_variables,
  title = "Effect of changed television advertising laws on consumers of French newspapers (1960-1974)"
)
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:frenchnewspapersconsumers)Effect of changed television advertising laws on consumers of French newspapers (1960-1974)</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Subscription price </th>
   <th style="text-align:center;"> Circulation </th>
   <th style="text-align:center;"> Share of subscriptions </th>
   <th style="text-align:center;"> Revenue from sales </th>
   <th style="text-align:center;"> Unit price </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Year </td>
   <td style="text-align:center;"> 0.05 </td>
   <td style="text-align:center;"> 0.01 </td>
   <td style="text-align:center;"> −0.01 </td>
   <td style="text-align:center;"> 0.05 </td>
   <td style="text-align:center;"> 0.05 </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> (0.00) </td>
   <td style="text-align:center;"> (0.00) </td>
   <td style="text-align:center;"> (0.00) </td>
   <td style="text-align:center;"> (0.00) </td>
   <td style="text-align:center;"> (0.00) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Is after advertising change </td>
   <td style="text-align:center;"> −0.04 </td>
   <td style="text-align:center;"> −0.06 </td>
   <td style="text-align:center;"> 0.19 </td>
   <td style="text-align:center;"> −0.06 </td>
   <td style="text-align:center;"> 0.06 </td>
  </tr>
  <tr>
   <td style="text-align:left;box-shadow: 0px 1px">  </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.02) </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.02) </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.03) </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.03) </td>
   <td style="text-align:center;box-shadow: 0px 1px"> (0.02) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Num.Obs. </td>
   <td style="text-align:center;"> 1044 </td>
   <td style="text-align:center;"> 1070 </td>
   <td style="text-align:center;"> 1072 </td>
   <td style="text-align:center;"> 1046 </td>
   <td style="text-align:center;"> 1063 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 </td>
   <td style="text-align:center;"> 0.876 </td>
   <td style="text-align:center;"> 0.991 </td>
   <td style="text-align:center;"> 0.972 </td>
   <td style="text-align:center;"> 0.988 </td>
   <td style="text-align:center;"> 0.867 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R2 Adj. </td>
   <td style="text-align:center;"> 0.865 </td>
   <td style="text-align:center;"> 0.990 </td>
   <td style="text-align:center;"> 0.970 </td>
   <td style="text-align:center;"> 0.987 </td>
   <td style="text-align:center;"> 0.856 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AIC </td>
   <td style="text-align:center;"> −1600.3 </td>
   <td style="text-align:center;"> −1355.1 </td>
   <td style="text-align:center;"> −477.8 </td>
   <td style="text-align:center;"> −738.2 </td>
   <td style="text-align:center;"> −1650.6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BIC </td>
   <td style="text-align:center;"> −1194.3 </td>
   <td style="text-align:center;"> −947.2 </td>
   <td style="text-align:center;"> −64.7 </td>
   <td style="text-align:center;"> −332.1 </td>
   <td style="text-align:center;"> −1243.1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Log.Lik. </td>
   <td style="text-align:center;"> 882.140 </td>
   <td style="text-align:center;"> 759.573 </td>
   <td style="text-align:center;"> 321.907 </td>
   <td style="text-align:center;"> 451.112 </td>
   <td style="text-align:center;"> 907.285 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F </td>
   <td style="text-align:center;"> 84.659 </td>
   <td style="text-align:center;"> 1392.863 </td>
   <td style="text-align:center;"> 421.297 </td>
   <td style="text-align:center;"> 1030.303 </td>
   <td style="text-align:center;"> 79.888 </td>
  </tr>
</tbody>
</table>

In general, we are able to replicate the main results of @angelucci2019newspapers and find that in many cases there appears to be a difference from 1967 onward. Our results are similar to @angelucci2019newspapers.

<!-- - Parallel trends: Notice the wonderful way in which they test the 'parallel trends' assumption on pp. 350-351. -->
<!-- - Discussion: Look at their wonderful discussion (pp. 353-358) of interpretation, external validity, and robustness. -->








<!-- ## Case study - Lalonde -->

<!-- <!-- Need to add the student who identified this. -->

<!-- http://sekhon.berkeley.edu/matching/lalonde.html -->


<!-- ## Case study: Funding of Clinical Trials and Reported Drug Efficacy -->

<!-- @oostrom2021 looks at clinical trials of drugs. These days, of course, we all know a lot more than we may have ever wished to, about clinical trials. But the one thing that we (think) we know is that they are, well, clinical. By that I mean, that it doesn't matter who does the actual trial, the outcome would be the same. @oostrom2021 says this isn't true. -->

<!-- By way of background, clinical trials are needed before a drug can be approved. @oostrom2021 finds that when pharmaceutical firms sponsor a clinical trial, 'a drug appears 0.15 standard deviations more effective when the trial is sponsored by that drug's manufacturer, compared with the same drug in the same trial without the drug manufacturer's involvement.' She does this by exploiting the fact that often 'the exact same sets of drugs are often compared in different randomized control trials conducted by parties with different financial interests.'. -->

<!-- The main finding is [@oostrom2021, p. 2]:  -->

<!-- > Utilizing dozens of drug combinations across hundreds of clinical trials, I estimate that a drug appears 36 percent more effective (0.15 standard deviations off of a base of 0.42) when the trial is sponsored by that drug's manufacturing or marketing firm, compared with the same drug, evaluated against the same comparators, but without the drug manufacturer's involvement. As in the medical literature, I measure efficacy, in the case of antidepressants, as the share of patients that respond to medication or, in the case of schizophrenia, as the average decline in symptoms. -->

<!-- Why might this happen? @oostrom2021 looks at a variety of different options, grouped into those that happen before the trial and those that happen after the trial 'publication bias'. She finds that 'publication bias can explain as much as half of  this sponsorship effect. Incorporating data on unpublished clinical trials, I find sponsored trials are less likely to publish non-positive results for their drugs.' -->

<!-- @oostrom2021 focuses on antidepressant and antipsychotic drugs and this allows her to obtain a dataset of trials. An 'arm' of a trial refers to 'the unit at which randomization occurs. Arms are often unique drugs but occasionally refer to unique drug and dosage combinations.' [@oostrom2021 p. 9]. -->

<!-- Summary statistics are provided in a summary table (Figure \@ref(fig:oostromsummary)) (this approach is common in economics, but not a great idea because it hides the distribution of the data - better to plot the raw data.) -->


<!-- ```{r oostromsummary, echo=FALSE, fig.cap="Summary statistics from Ooostrom", out.width = '100%'} -->
<!-- knitr::include_graphics(here::here("figures/oostrom_1.png")) -->
<!-- ``` -->

<!-- The model is: -->

<!-- $$y_{ij} = \alpha + \beta \mbox{ Sponsor}_{ij} + X_{ij}\gamma + G_{d(i),s(j)} +\epsilon_{ij}$$ -->

<!-- where $y_{ij}$ is the efficacy for arm $i$ in trial $j$. The main coefficient of interest is $\beta$ which is based on whether $\mbox{Sponsor}_{ij}$. The outcome is relative to the placebo arm in that trial, or the least effective arm. -->

<!-- 'Table 3.3' from the paper is actually the reason that I included this as a case student. If this sounds odd to you then you've not had to read millions of papers that are unclear about their results. 'Table 3.3' (republished here as Figure \@ref(fig:oostromtable)) is beautiful and I'll allow it to speak for itself. -->

<!-- ```{r oostromtable, echo=FALSE, fig.cap="Results", out.width = '100%'} -->
<!-- knitr::include_graphics(here::here("figures/oostrom_2.png")) -->
<!-- ``` -->


<!-- The paper is available here: https://www.tamaroostrom.com/research and I'd recommend a brief read. -->



## Propensity score matching

Difference in differences is a powerful analysis framework. But it can be tough to identify appropriate treatment and control groups. @alexander2018age compare migrant brothers, where one brother had most of their education in a different country, and the other brother had most of their education in the US. Given the data that are available, this match provides a reasonable treatment and control group. But other matches could have given different results, for instance friends or cousins.

We can match based on observable variables. For instance, age-group or education. At two different times we compare smoking rates in 18-year-olds in one city with smoking rates in 18-year-olds in another city. This would be a coarse match because we know that there are many differences between 18-year-olds, even in terms of the variables that we commonly observe, say gender and education. One way to deal with this would be to create sub-groups: 18-year-old males with a high school education, etc. But then the sample sizes quickly become small. We also have the issue of how to deal with continuous variables. And, are an 18-year-old and a 19-year-old really so different? Why not also compare with them?

One way to proceed is to consider a nearest neighbor approach. But there can be limited concern for uncertainty with this approach. There can also be an issue with having many variables because we end up with a high-dimension graph. This leads to propensity score matching. Here we will explain the process of propensity score matching, but it is not something that should be widely used [@king2019propensity], and we will then go through why that is the case.

Propensity score matching involves assigning some probability to each observation. We construct that probability based on the observation's values for the independent variables, at their values before the treatment. That probability is our best guess at the probability of the observation being treated, regardless of whether it was treated or not. For instance, if 18-year-old males were treated but 19-year-old males were not, then as there is not much difference between 18-year-old males and 19-year-old males our assigned probability would be similar. We can then compare the outcomes of observations with similar propensity scores.

One advantage of propensity score matching is that is allows us to easily consider many independent variables at once, and it can be constructed using logistic regression.

To be more specific we can simulate some data. We will pretend that we work for a large online retailer. We are going to treat some individuals with free shipping to see what happens to their average purchase.


```r
set.seed(853)

sample_size <- 10000

purchase_data <-
  tibble(
    unique_person_id = c(1:sample_size),
    age = runif(n = sample_size,
                min = 18,
                max = 100),
    city = sample(
      x = c("Toronto", "Montreal", "Calgary"),
      size = sample_size,
      replace = TRUE
    ),
    gender = sample(
      x = c("Female", "Male", "Other/decline"),
      size = sample_size,
      replace = TRUE,
      prob = c(0.49, 0.47, 0.02)
    ),
    income = rlnorm(n = sample_size,
                    meanlog = 0.5,
                    sdlog = 1)
  )
```

Then we need to add some probability of being treated with free shipping. We will say that it depends on our variables and that younger, higher-income, male and Toronto-based individuals make this treatment slightly more likely.


```r
purchase_data <-
  purchase_data |>
  mutate(
    age_num = case_when(age < 30 ~ 3,
                        age < 50 ~ 2,
                        age < 70 ~ 1,
                        TRUE ~ 0),
    city_num = case_when(
      city == "Toronto" ~ 3,
      city == "Montreal" ~ 2,
      city == "Calgary" ~ 1,
      TRUE ~ 0
    ),
    gender_num = case_when(
      gender == "Male" ~ 3,
      gender == "Female" ~ 2,
      gender == "Other/decline" ~ 1,
      TRUE ~ 0
    ),
    income_num = case_when(income > 3 ~ 3,
                           income > 2 ~ 2,
                           income > 1 ~ 1,
                           TRUE ~ 0)
  ) |>
  rowwise() |>
  mutate(
    sum_num = sum(age_num, city_num, gender_num, income_num),
    softmax_prob = exp(sum_num) / exp(12),
    free_shipping = sample(
      x = c(0:1),
      size = 1,
      replace = TRUE,
      prob = c(1 - softmax_prob, softmax_prob)
    )
  ) |>
  ungroup()

purchase_data <-
  purchase_data |>
  select(-age_num,-city_num,-gender_num,-income_num,-sum_num,-softmax_prob)
```

Finally, we need to have some measure of a person's average spend. We want those with free shipping to be slightly higher than those without.


```r
purchase_data <-
  purchase_data |>
  mutate(mean_spend = if_else(free_shipping == 1, 60, 50)) |>
  rowwise() |>
  mutate(average_spend = rnorm(1, mean_spend, sd = 5)) |>
  ungroup() |>
  select(-mean_spend) |>
  mutate(across(c(city, gender, free_shipping), as.factor))

purchase_data
#> # A tibble: 10,000 × 7
#>    unique_person_id   age city   gender income free_shipping
#>               <int> <dbl> <fct>  <fct>   <dbl> <fct>        
#>  1                1  47.5 Calga… Female  1.72  0            
#>  2                2  27.8 Montr… Male    1.54  0            
#>  3                3  57.7 Toron… Female  3.16  0            
#>  4                4  43.9 Toron… Male    0.636 0            
#>  5                5  21.1 Toron… Female  1.43  0            
#>  6                6  51.1 Calga… Male    1.18  0            
#>  7                7  28.7 Toron… Female  1.49  0            
#>  8                8  37.9 Toron… Female  0.414 0            
#>  9                9  31.0 Calga… Male    0.384 0            
#> 10               10  33.5 Montr… Female  1.11  0            
#> # … with 9,990 more rows, and 1 more variable:
#> #   average_spend <dbl>
```

We use `matchit()` from `MatchIt` [@MatchIt] to implement logistic regression and create matched groups. We then use `match.data()` to get the data of matches containing both all 371 people who were actually treated with free shipping and the untreated person who is considered as similar to them, based on propensity score, as possible. The result is a dataset of 742 observations.


```r
library(MatchIt)

matched_groups <- matchit(free_shipping ~ age + city + gender + income, 
                  data = purchase_data,
                  method = "nearest", distance = "glm")

matched_groups
#> A matchit object
#>  - method: 1:1 nearest neighbor matching without replacement
#>  - distance: Propensity score
#>              - estimated with logistic regression
#>  - number of obs.: 10000 (original), 742 (matched)
#>  - target estimand: ATT
#>  - covariates: age, city, gender, income

matched_dataset <- match.data(matched_groups)

matched_dataset
#> # A tibble: 742 × 10
#>    unique_person_id   age city   gender income free_shipping
#>               <int> <dbl> <fct>  <fct>   <dbl> <fct>        
#>  1                5  21.1 Toron… Female  1.43  0            
#>  2               20  30.0 Montr… Male    8.65  0            
#>  3               22  22.8 Toron… Male    0.898 0            
#>  4               38  41.3 Toron… Female  6.01  1            
#>  5               43  24.7 Toron… Male    1.59  1            
#>  6               76  56.4 Toron… Male   15.0   0            
#>  7              102  48.1 Toron… Male    3.48  1            
#>  8              105  76.7 Toron… Male    2.84  0            
#>  9              118  26.7 Toron… Female  0.315 0            
#> 10              143  36.3 Toron… Male   10.6   0            
#> # … with 732 more rows, and 4 more variables:
#> #   average_spend <dbl>, distance <dbl>, weights <dbl>,
#> #   subclass <fct>
```

Finally, we can estimate the effect of being treated on average spend using linear regression. We are particularly interested in the coefficient associated with the treatment variable, in this case free shipping.


```r
propensity_score_regression <- lm(average_spend ~ age + city + gender + income + free_shipping, 
                                  data = matched_dataset)

propensity_score_regression
#> 
#> Call:
#> lm(formula = average_spend ~ age + city + gender + income + free_shipping, 
#>     data = matched_dataset)
#> 
#> Coefficients:
#>         (Intercept)                  age  
#>            49.56747              0.00735  
#>        cityMontreal          cityToronto  
#>             0.12787              0.58628  
#>          genderMale  genderOther/decline  
#>            -1.09978             -1.99861  
#>              income       free_shipping1  
#>             0.01903             10.60550
```

We cover propensity score matching because it is widely used. But there are many issues with propensity score matching that mean that propensity scores should not be used for matching [@king2019propensity]. These include:

1. Matching. Propensity score matching cannot match on unobserved variables. This may be fine in a classroom setting, but in more realistic settings it will likely cause issues. 
2. Modelling. The results tend to be specific to the model that is used.
3. Statistically. We are using the data twice. 




## Regression discontinuity design

### Overview

Regression discontinuity design (RDD) was established by @thistlethwaite1960regression and is a popular way to get causality when there is a continuous variable with cut-offs that determine treatment. Is there a difference between a student who gets 79 per cent and a student who gets 80 per cent? Probably not much, but one may get an A-, while the other may get a B+, and seeing that on a transcript could affect who gets a job which could affect income. In this case the percentage is a 'forcing variable' and the cut-off for an A- is a 'threshold'. As the treatment is determined by the forcing variable we need to control for that variable. And, these seemingly arbitrary cut-offs can be seen all the time. Hence, there has been a great deal of work using RDD.

There is sometimes slightly different terminology used when it comes to RDD. For instance, @Cunningham2021 refers to the forcing function as a running variable. The exact terminology that is used does not matter provided we use it consistently.  




### Simulated example

To be more specific about the situation, we simulate data. We will consider the relationship between income and grades, and simulate there to be a change if a student gets at least 80 (Figure \@ref(fig:rddmarks)).


```r
library(tidyverse)

set.seed(853)

number_of_observation <- 1000

rdd_example_data <- tibble(
  person = c(1:number_of_observation),
  mark = runif(number_of_observation, min = 78, max = 82),
  income = rnorm(number_of_observation, 10, 1)
)

## Make income more likely to be higher if they have a mark at least 80
rdd_example_data <-
  rdd_example_data |>
  mutate(
    noise = rnorm(n = number_of_observation, mean = 2, sd = 1),
    income = if_else(mark >= 80, income + noise, income)
  )

rdd_example_data
#> # A tibble: 1,000 × 4
#>    person  mark income noise
#>     <int> <dbl>  <dbl> <dbl>
#>  1      1  79.4   9.43 1.87 
#>  2      2  78.5   9.69 2.26 
#>  3      3  79.9  10.8  1.14 
#>  4      4  79.3   9.34 2.50 
#>  5      5  78.1  10.7  2.21 
#>  6      6  79.6   9.83 2.47 
#>  7      7  78.5   8.96 4.22 
#>  8      8  79.0  10.5  3.11 
#>  9      9  78.6   9.53 0.671
#> 10     10  78.8  10.6  2.46 
#> # … with 990 more rows
```


```r
rdd_example_data |> 
  ggplot(aes(x = mark,
             y = income)) +
  geom_point(alpha = 0.2) +
  geom_smooth(data = rdd_example_data |> filter(mark < 80), 
              method='lm',
              color = "black",
              formula = 'y ~ x') +
  geom_smooth(data = rdd_example_data |> filter(mark >= 80), 
              method='lm',
              color = "black",
              formula = 'y ~ x') +
  theme_minimal() +
  labs(x = "Mark",
       y = "Income ($)")
```

<div class="figure">
<img src="42-causality_from_obs_files/figure-html/rddmarks-1.png" alt="Illustration of simulated data that shows an effect on income from getting a mark that is 80, compared with 79" width="672" />
<p class="caption">(\#fig:rddmarks)Illustration of simulated data that shows an effect on income from getting a mark that is 80, compared with 79</p>
</div>

We can use a binary variable with linear regression to estimate the effect. We expect the coefficient to be around two, which is what we simulated.


```r
rdd_example_data <- 
  rdd_example_data |> 
  mutate(mark_80_and_over = if_else(mark < 80, 0, 1)) 

lm(income ~ mark + mark_80_and_over, data = rdd_example_data) |> 
  summary()
#> 
#> Call:
#> lm(formula = income ~ mark + mark_80_and_over, data = rdd_example_data)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -4.3418 -0.8218 -0.0043  0.7740  6.1209 
#> 
#> Coefficients:
#>                  Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)       5.30130    5.16331   1.027    0.305    
#> mark              0.06025    0.06535   0.922    0.357    
#> mark_80_and_over  1.89221    0.14921  12.682   <2e-16 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 1.189 on 997 degrees of freedom
#> Multiple R-squared:  0.4178,	Adjusted R-squared:  0.4166 
#> F-statistic: 357.7 on 2 and 997 DF,  p-value: < 2.2e-16
```

There are various caveats to this estimate that we will discuss, but the essentials of RDD are here. Given an appropriate set-up, and model, an RDD can compare favorably to randomized trials [@bloombellreiman2020].

We could also implement RDD using `rdrobust` [@rdrobust]. The advantage of this approach is that many extensions are easily available. 


```r
library(rdrobust)
rdrobust(y = rdd_example_data$income, 
         x = rdd_example_data$mark, 
         c = 80, h = 2, all = TRUE) |> 
  summary()
#> Call: rdrobust
#> 
#> Number of Obs.                 1000
#> BW type                      Manual
#> Kernel                   Triangular
#> VCE method                       NN
#> 
#> Number of Obs.                  497          503
#> Eff. Number of Obs.             497          503
#> Order est. (p)                    1            1
#> Order bias  (q)                   2            2
#> BW est. (h)                   2.000        2.000
#> BW bias (b)                   2.000        2.000
#> rho (h/b)                     1.000        1.000
#> Unique Obs.                     497          503
#> 
#> =============================================================================
#>         Method     Coef. Std. Err.         z     P>|z|      [ 95% C.I. ]       
#> =============================================================================
#>   Conventional     1.913     0.161    11.876     0.000     [1.597 , 2.229]     
#> Bias-Corrected     1.966     0.161    12.207     0.000     [1.650 , 2.282]     
#>         Robust     1.966     0.232     8.461     0.000     [1.511 , 2.422]     
#> =============================================================================
```


### Assumptions

The key assumptions of RDD are [@Cunningham2021, p. 163]:

1. The cut-off is specific, fixed, and known to all.
2. The forcing function is continuous.

The first assumption is largely about being unable to manipulate the cut-off, and ensures that the cut-off has meaning. The second assumption enables us to be confident that folks on either side of the threshold are similar, apart from just happening to just fall on either side of the threshold.

When we discussed randomized control trials and A/B testing in Chapter \@ref(hunt-data) the randomized assignment of the treatment meant that the control and treatment groups were the same, but for the treatment. Then we moved to difference in differences, and we assumed that there was a common trend between the treated and control groups. We allowed that the groups could be different, but that we could 'difference out' their differences. Finally, we considered matching, and we said that even if we the control and treatment groups seemed quite different, we were able to match, to some extent, those who were treated with a group that were similar to them in all ways, apart from the fact that they were not treated.

In regression discontinuity we consider a slightly different setting. The two groups are completely different in terms of the forcing variable. They are on either side of the threshold. So there is no overlap at all. But we know the threshold and believe that those on either side are essentially matched. Let us consider the 2019 NBA Eastern Conference Semifinals - Toronto and the Philadelphia. Game 1: Raptors win 108-95; Game 2: 76ers win 94-89; Game 3: 76ers win 116-95; Game 4: Raptors win 101-96; Game 5: Raptors win 125-89; Game 6: 76ers win 112-101; and finally, Game 7: Raptors win 92-90, because of a ball that win in after bouncing on the rim four times. Was there really that much difference between the teams?

The continuity assumption is important, but we cannot test this as it is based on a counterfactual. Instead, we need to convince people of it. Ways to do this include: 

- Using a test/train set-up.
- Trying different specifications. We are especially concerned if results do not broadly persist with just linear or quadratic functions.
- Considering different subsets of the data.
- Considering different windows.
- Be clear about uncertainty intervals, especially in graphs.
- Discussing and assuage concerns about the possibility of omitted variables.

The threshold is also important. For instance, is there an actual shift or is there a non-linear relationship?

There are a variety of weaknesses of RDD including: 

- External validity may be difficult. For instance, when we think about the A-/B+ example, it is hard to see those generalizing to also B-/C+ students.
- The important responses are those that are close to the cut-off. This means that even if we have many A and B students, they do not help much. Hence, we need a lot of data or we may have concerns about our ability to support our claims [@green2009testing].
- As the researcher, we have a lot of freedom to implement different options. This means that it becomes important to  There is a lot of freedom for the researcher, so open science best practice becomes vital.

To this point we have considered 'sharp' RDD. That is, the threshold is strict. But, in reality, often the boundary is a little less strict. For instance, consider the drinking age. There is a legal drinking age, say 18. If we looked at the number of people who had drunk, then it is likely to increase in the few years leading up to that age. 

In a sharp RDD setting, if we know the value of the forcing function then we know the outcome. For instance, if a student gets a mark of 80 then we know that they got an A-, but if they got a mark of 79 then we know that they got a B+. But with fuzzy RDD it is only known with some probability. We can say that a Canadian 19-year-old is more likely to have drunk alcohol than a Canadian 18-year-old, but the number of Canadian 18-year-olds who have drunk alcohol is not zero.

It may be possible to deal with fuzzy RDD settings with appropriate choice of model or data. It may also be possible to deal with them using instrumental variables.


We want as 'sharp' an effect as possible, but if the thresholds are known, then they will be gamed. For instance, there is a lot of evidence that people run for certain marathon times, and we know that people aim for certain grades. Similarly, from the other side, it is a lot easier for an instructor to just give out As than it is to have to justify Bs. One way to look at this is to consider how 'balanced' the sample is on either side of the threshold. We can do this using histograms with appropriate bins. For instance, think of the age-heaping that we found in the cleaned Kenyan census data in Chapter \@ref(gather-data)

Another key factor for RDD is the possible effect of the decision around the choice of model. To see this, consider the difference between a linear and polynomial.


```r
some_data <- 
  tibble(outcome = rnorm(n = 100, mean = 1, sd = 1),
         running_variable = c(1:100),
         location = "before")

some_more_data <- 
  tibble(outcome = rnorm(n = 100, mean = 2, sd = 1),
         running_variable = c(101:200),
         location = "after")

both <- 
  rbind(some_data, some_more_data)

both |> 
  ggplot(aes(x = running_variable, y = outcome, color = location)) +
  geom_point(alpha = 0.5) + 
  geom_smooth(formula = y~x, method = 'lm')
```

<img src="42-causality_from_obs_files/figure-html/unnamed-chunk-18-1.png" width="672" />

```r
  
both |> 
  ggplot(aes(x = running_variable, y = outcome, color = location)) +
  geom_point(alpha = 0.5) + 
  geom_smooth(formula = y ~ poly(x, 3), method = 'lm')
```

<img src="42-causality_from_obs_files/figure-html/unnamed-chunk-18-2.png" width="672" />

The result is that our estimate is dependent on the choice of model. We see this issue occur often in RDD [@gelmanonrdd].


<!-- ### Case study: Voting in Ghent -->

<!-- As with difference in differences, after I learnt about it, I began to see opportunities to implement it everywhere. Frankly, I find it a lot easier to think of legitimate examples of using regression discontinuity than difference in differences. But, at the risk of mentioning yet another movie from the 1990s that none of you have seen, when I think of RDD, my first thought is often of Sliding Doors (Figure \@ref(fig:slidingdoors)). -->

<!-- ```{r slidingdoors, echo=FALSE, fig.cap="Nobody expects the Spanish Inquisition.", out.width = '90%'} -->
<!-- knitr::include_graphics(here::here("figures/sliding_doors.png")) -->
<!-- ``` -->
<!-- Source: Mlotek, Haley, 2018, 'The Almosts and What-ifs of 'Sliding Doors'', *The Ringer*, 24 April, freely available at: https://www.theringer.com/movies/2018/4/24/17261506/sliding-doors-20th-anniversary. -->

<!-- Not only did the movie have a great soundtrack and help propel Gwyneth Paltrow to super-stardom, but it features an iconic moment in which Paltrow's character, Helen, arrives at a tube station at which point the movie splits into two. In one version she just makes the train, and arrives home to find her boyfriend cheating on her; and in another she just misses the train and doesn't find out about the boyfriend.  -->

<!-- I'd say, spoiler alert, but the movie was released in 1998, so... Of course, that 'threshold' turns out to be important. In the world in which she gets the train she leaves the boyfriend, cuts her hair, and changes everything about her life. In the world in which she misses the train she doesn't. At least initially. But, and I cannot say this any better than Ashley Fetters: -->

<!-- > At the end of Sliding Doors, the "bad" version of Helen's life elides right into the "good" version; even in the "bad" version, the philandering !@#$%^& boyfriend eventually gets found out and dumped, the true love eventually gets met-cute, and the MVP friend comes through. According to the Sliding Doors philosophy, in other words, even when our lives take fluky, chaotic detours, ultimately good-hearted people find each other, and the bad boyfriends and home-wreckers of the world get their comeuppance. There's no freak turn of events that allows the cheating boyfriend to just keep cheating, or the well-meaning, morally upright soulmates to just keep floating around in the universe unacquainted. -->
<!-- > -->
<!-- > Fetters, Ashley, 2018, 'I Think About This a Lot: The Sliding Doors in Sliding Doors', *The Cut*, 9 April, freely available at: https://www.thecut.com/2018/04/i-think-about-this-a-lot-the-sliding-doors-in-sliding-doors.html. -->

<!-- I'm getting off-track here, but the point is, not only does it seem as though we have a 'threshold', but it seems as though there's continuity! -->



<!-- Paper: Stiers, D., Hooghe, M. and Dassonneville, R., 2020. Voting at 16: Does lowering the voting age lead to more political engagement? Evidence from a quasi-experiment in the city of Ghent (Belgium). Political Science Research and Methods, pp.1-8. Available at: https://www.cambridge.org/core/journals/political-science-research-and-methods/article/voting-at-16-does-lowering-the-voting-age-lead-to-more-political-engagement-evidence-from-a-quasiexperiment-in-the-city-of-ghent-belgium/172A2D9B75ECB66E98C9680787F302AD#fndtn-information -->

<!-- Data: https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/J1FQW9 -->




<!-- ### Case study: Caughey, and Sekhon., 2011 -->

<!-- Paper: Caughey, Devin, and Jasjeet S. Sekhon. "Elections and the regression discontinuity design: Lessons from close US house races, 1942–2008." Political Analysis 19.4 (2011): 385-408. Available at: https://www.cambridge.org/core/journals/political-analysis/article/elections-and-the-regression-discontinuity-design-lessons-from-close-us-house-races-19422008/E5A69927D29BE682E012CAE9BFD8AEB7 -->

<!-- Data: https://dataverse.harvard.edu/dataset.xhtml?persistentId=hdl:1902.1/16357&version=1.0 -->






<!-- Let us see some more legitimate implementations of regression discontinuity. (And thank you to [Ryan Edwards](http://www.ryanbedwards.com/) for pointing me to these.) -->


<!-- #### Elections -->

<!-- Elections are a common area of application for regression discontinuity because if the election is close then arguably there's not much difference between the candidates. There are plenty of examples of regression discontinuity in an elections setting, but one recent one is George, Siddharth Eapen, 2019, 'Like Father, Like Son? The Effect of Political Dynasties on Economic Development', freely available at: https://www.dropbox.com/s/orhvh3n03wd9ybl/sid_JMP_dynasties_latestdraft.pdf?dl=0. -->

<!-- In this paper George is interested in political dynasties. But is the child of a politician more likely to be elected because they are the child of a politician, or because they happen to also be similarly skilled at politics? Regression discontinuity can help because in a close election, we can look at differences between places where someone narrowly won with where a similar someone narrowly lost. -->

<!-- In the George, 2019, case he examines:  -->

<!-- > descendant effects using a close elections regression discontinuity (RD) design. We focus on close races between dynastic descendants (i.e. direct relatives of former officeholders) and non-dynasts, and we compare places where a descendant narrowly won to those where a descendant narrowly lost. In these elections, descendants and non-dynasts have similar demographic and political characteristics, and win in similar places and at similar rates. Nevertheless, we find negative economic effects when a descendant narrowly wins. Villages represented by a descendant have lower asset ownership and public good provision after an electoral term: households are less likely to live in a brick house and to own basic amenities like a refrigerator, mobile phone, or vehicle. Moreover, voters assess descendants to perform worse in office. An additional standard deviation of exposure to descendants lowers a village's wealth rank by 12pp. -->

<!-- The model that George, 2019, estimates is (p. 19: -->
<!-- $$y_i = \alpha_{\mbox{district}} + \beta \times \mbox{Years descendant rule}_i + f(\mbox{Descendant margin}) + \gamma X_i + \epsilon_{i,t}.$$ -->
<!-- In this model, $y_i$ is various development outcomes in village $i$; $\mbox{Years descendant rule}_i$ is the number of years a dynastic descendant has represented village $i$ in the national or state parliament; $\mbox{Descendant margin}$ is the vote share difference between the dynastic descendant and non-dynast; and $\gamma X_i$ is a vector of village-level adjustments. -->

<!-- George, 2019, then conducts a whole bunch of tests of the validity of the regression discontinuity design (p. 19). These are critical in order for the results to be believed. There are a lot of different results but one is shown in Figure \@ref(fig:descendantsinindia). -->

<!-- ```{r descendantsinindia, echo=FALSE, fig.cap = "George, 2019, descendant effects identified using close elections RD design (p. 41).", out.width = '90%'} -->
<!-- knitr::include_graphics(here::here("figures/descendantsinindia.png")) -->
<!-- ``` -->


<!-- #### Economic development -->

<!-- One of the issues with considering economic development is that a place typically is either subject to some treatment or not. However, sometimes regression discontinuity allows us to compare areas that were just barely treated with those that were just barely not.  -->

<!-- One recent paper that does this Esteban Mendez-Chacon and Diana Van Patten, 2020, 'Multinationals, monopsony and local development: Evidence from the United Fruit Company' available here: https://www.dianavanpatten.com/. They are interested in the effect of the United Fruit Company (UFCo), which was given land in Costa Rica between 1889 and 1984. They were given roughly 4 per cent of the national territory or around 4500 acres. They key is that this land assignment was redrawn in 1904 based on a river and hence the re-assignment was essentially random with regard to determinants of growth to that point. They compare areas that were assigned to UFCo with those that were not. They find: -->

<!-- > We find that the firm had a positive and persistent effect on living standards. Regions within the UFCo were 26 per cent less likely to be poor in 1973 than nearby counterfactual locations, with only 63 per cent of the gap closing over the following three decades. Company documents explain that a key concern at the time was to attract and maintain a sizable workforce, which induced the firm to invest heavily in local amenities that likely account for our result.  -->

<!-- The model is: -->
<!-- $$y_{i,g,t} = \gamma\mbox{UFCo}_g + f(\mbox{geographic location}_g) + X_{i,g,t}\beta + X_g\Gamma + \alpha_t + \epsilon_{i,g,t}.$$ -->
<!-- In this model, $y_{i,g,t}$ is the development outcome for a household $i$ in census-block $g$ and year $t$; $\gamma\mbox{UFCo}_g$ is an indicator variable as to whether the census-block was in a UFCo area or not; $f(\mbox{geographic location}_g)$ is a function of the latitude and longitude to adjust for geographic area; $X_{i,g,t}$ is covariates for household $i$; $X_g$ is geographic characteristics for that census-block; and $\alpha_t$ is a year fixed effect. -->

<!-- Again, there are a lot of different results but one is shown in Figure \@ref(fig:ufco). -->

<!-- ```{r ufco, echo=FALSE, fig.cap = "George, 2020, UFCo effect on the probability of being poor (p. 17).", out.width = '90%'} -->
<!-- knitr::include_graphics(here::here("figures/ufco.png")) -->
<!-- ``` -->























## Instrumental variables

### Overview

Instrumental variables (IV) is an approach that can be handy when we have some type of treatment and control going on, but we have a lot of correlation with other variables and we possibly do not have a variable that actually measures what we are interested in. So adjusting for observables will not be enough to create a good estimate. Instead we find some variable---the eponymous instrumental variable---that is:

1. correlated with the treatment variable, but
2. not correlated with the outcome.

This solves our problem because the only way the instrumental variable can have an effect is through the treatment variable, and so we can adjust our understanding of the effect of the treatment variable appropriately. The trade-off is that instrumental variables must satisfy a bunch of different assumptions, and that, frankly, they are difficult to identify *ex ante*. Nonetheless, when we are able to use them, they are a powerful tool for speaking about causality.

The canonical instrumental variables example is smoking. These days we know that smoking causes cancer. But because smoking is correlated with a lot of other variables, for instance, education, it could be that it was actually education that causes cancer. RCTs may be possible, but they are likely to be troublesome in terms of speed and ethics, and so instead we look for some other variable that is correlated with smoking, but not, in and of itself, with lung cancer. In this case, we look to tax rates, and other policy responses, on cigarettes. As the tax rates on cigarettes are correlated with the number of cigarettes that are smoked, but not correlated with lung cancer, other than through their impact on cigarette smoking, through them we can assess the effect of cigarettes smoked on lung cancer.

To implement instrumental variables we first regress tax rates on cigarette smoking to get some coefficient on the instrumental variable, and then (in a separate regression) regress tax rates on lung cancer to again, get some coefficient on the instrumental variable. Our estimate is then the ratio of these coefficients, which is described as a 'Wald estimate' [@gelmanandhill, p. 219].

Following the language of [@gelmanandhill, p. 216] when we use instrumental variables we make a variety of assumptions including:

- Ignorability of the instrument.
- Correlation between the instrumental variable and the treatment variable.
- Monotonicity.
- Exclusion restriction.

<!-- To summarize exactly what instrumental variables is about, I cannot do better than recommend the first few pages of the 'Instrumental Variables' chapter in @Cunningham2021, and this key paragraph in particular (by way of background, Cunningham has explained why it would have been impossible to randomly allocate 'clean' and 'dirty' water through a randomized controlled trial and then continues...): -->

<!-- > Snow would need a way to trick the data such that the allocation of clean and dirty water to people was not associated with the other determinants of cholera mortality, such as hygiene and poverty. He just would need for someone or something to be making this treatment assignment for him. -->
<!-- >  -->
<!-- > Fortunately for Snow, and the rest of London, that someone or something existed. In the London of the 1800s, there were many different water companies serving different areas of the city. Some were served by more than one company. Several took their water from the Thames, which was heavily polluted by sewage. The service areas of such companies had much higher rates of cholera. The Chelsea water company was an exception, but it had an exceptionally good filtration system. That’s when Snow had a major insight. In 1849, Lambeth water company moved the intake point upstream along the Thames, above the main sewage discharge point, giving its customers purer water. Southwark and Vauxhall water company, on the other hand, left their intake point downstream from where the sewage discharged. Insofar as the kinds of people that each company serviced were approximately the same, then comparing the cholera rates between the two houses could be the experiment that Snow so desperately needed to test his hypothesis. -->

The history of instrumental variables is intriguing, and @stock2003retrospectives provide a brief overview. The method was first published in @wright1928tariff. This is a book about the effect of tariffs on animal and vegetable oil. So why might instrumental variables be important in a book about tariffs on animal and vegetable oil? The fundamental problem is that the effect of tariffs depends on both supply and demand. But we only know prices and quantities, so we do not know what is driving the effect. We can use instrumental variables to pin down causality. The intriguing aspect is that the instrumental variables discussion is only in Appendix B. It would seem odd to relegate a major statistical break-through to an appendix. Further, Philip G. Wright, the book's author, had a son Sewall Wright, who had considerable expertise in statistics and the specific method used in Appendix B. Hence the mystery of Appendix B: did Philip or Sewall write it? Both @Cunningham2021 and @stock2003retrospectives go into more detail, but on balance feel that it is likely that Philip did actually author the work.


### Simulated example

Let us generate some data. We will explore a simulation related to the canonical example of health status, smoking, and tax rates. So we are looking to explain how healthy someone is based on the amount they smoke, via the tax rate on smoking. We are going to generate different tax rates by provinces. My understanding is that the tax rate on cigarettes is now pretty much the same in each of the provinces, but that this is fairly recent. So we will pretend that Alberta had a low tax, and Nova Scotia had a high tax.

<!-- We first want a count for the number of cigarettes that a person smokes. The Poisson distribution can provide a distribution over the integers, so we will sample from that.  -->

As a reminder, we are simulating data for illustrative purposes, so we need to impose the answer that we want. When you actually use instrumental variables you will be reversing the process.


```r
library(broom)
library(tidyverse)

set.seed(853)

number_of_observation <- 10000

iv_example_data <- tibble(person = c(1:number_of_observation),
                          smoker = sample(x = c(0:1),
                                          size = number_of_observation, 
                                          replace = TRUE)
                          )
```

Now we need to relate the number of cigarettes that someone smoked to their health. We will model health status as a draw from the normal distribution, with either a high or low mean depending on whether the person smokes.


```r
iv_example_data <- 
  iv_example_data |> 
  mutate(health = if_else(smoker == 0,
                          rnorm(n = n(), mean = 1, sd = 1),
                          rnorm(n = n(), mean = 0, sd = 1)
                          )
         )
## So health will be one standard deviation higher for people who do not or barely smoke.
```

Now we need a relationship between cigarettes and the province (because in this illustration, the provinces have different tax rates).


```r
iv_example_data <- 
  iv_example_data |> 
  rowwise() |> 
  mutate(province = 
           case_when(smoker == 0 ~ sample(x = c("Nova Scotia", "Alberta"),
                                          size = 1, 
                                          replace = FALSE, 
                                          prob = c(1/2, 1/2)),
                     smoker == 1 ~ sample(x = c("Nova Scotia", "Alberta"),
                                          size = 1, 
                                          replace = FALSE, 
                                          prob = c(1/4, 3/4)))) |> 
  ungroup()

iv_example_data <- 
  iv_example_data |> 
  mutate(tax = case_when(province == "Alberta" ~ 0.3,
                         province == "Nova Scotia" ~ 0.5,
                         TRUE ~ 9999999
  )
  )

iv_example_data$tax |> table()
#> 
#>  0.3  0.5 
#> 6206 3794

head(iv_example_data)
#> # A tibble: 6 × 5
#>   person smoker  health province      tax
#>    <int>  <int>   <dbl> <chr>       <dbl>
#> 1      1      0  1.11   Alberta       0.3
#> 2      2      1 -0.0831 Alberta       0.3
#> 3      3      1 -0.0363 Alberta       0.3
#> 4      4      0  2.48   Alberta       0.3
#> 5      5      0  0.617  Alberta       0.3
#> 6      6      0  0.748  Nova Scotia   0.5
```

Now we can look at our data. 


```r
iv_example_data |> 
  mutate(smoker = as_factor(smoker)) |> 
  ggplot(aes(x = health, fill = smoker)) +
  geom_histogram(position = "dodge", binwidth = 0.2) +
  theme_minimal() +
  labs(x = "Health rating",
       y = "Number of people",
       fill = "Smoker") +
  scale_fill_brewer(palette = "Set1") +
  facet_wrap(vars(province))
```

<img src="42-causality_from_obs_files/figure-html/unnamed-chunk-22-1.png" width="672" />

Finally, we can use the tax rate as an instrumental variable to estimate the effect of smoking on health.


```r
health_on_tax <- lm(health ~ tax, data = iv_example_data)
smoker_on_tax <- lm(smoker ~ tax, data = iv_example_data)

coef(health_on_tax)["tax"] / coef(smoker_on_tax)["tax"]
#>        tax 
#> -0.8554502
```

So we find, luckily, that if you smoke then your health is likely to be worse than if you do not smoke.

Equivalently, we can think of instrumental variables in a two-stage regression context. 


```r
first_stage <- lm(smoker ~ tax, data = iv_example_data)
health_hat <- first_stage$fitted.values
second_stage <- lm(health ~ health_hat, data = iv_example_data)

summary(second_stage)
#> 
#> Call:
#> lm(formula = health ~ health_hat, data = iv_example_data)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -3.9867 -0.7600  0.0068  0.7709  4.3293 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)  0.91632    0.04479   20.46   <2e-16 ***
#> health_hat  -0.85545    0.08911   -9.60   <2e-16 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 1.112 on 9998 degrees of freedom
#> Multiple R-squared:  0.009134,	Adjusted R-squared:  0.009034 
#> F-statistic: 92.16 on 1 and 9998 DF,  p-value: < 2.2e-16
```

We can use `iv_robust()` from `estimatr` [@estimatr] to estimate IV. One nice reason for doing this is that it can help to keep everything organised and adjust the standard errors.


```r
library(estimatr)
iv_robust(health ~ smoker | tax, data = iv_example_data) |> 
  summary()
#> 
#> Call:
#> iv_robust(formula = health ~ smoker | tax, data = iv_example_data)
#> 
#> Standard error type:  HC2 
#> 
#> Coefficients:
#>             Estimate Std. Error t value   Pr(>|t|) CI Lower
#> (Intercept)   0.9163    0.04057   22.59 3.163e-110   0.8368
#> smoker       -0.8555    0.08047  -10.63  2.981e-26  -1.0132
#>             CI Upper   DF
#> (Intercept)   0.9958 9998
#> smoker       -0.6977 9998
#> 
#> Multiple R-squared:  0.1971 ,	Adjusted R-squared:  0.197 
#> F-statistic:   113 on 1 and 9998 DF,  p-value: < 2.2e-16
```

### Assumptions

As discussed earlier, there are a variety of assumptions that are made when using instrumental variables. The two most important are:

1. Exclusion Restriction. This assumption is that the instrumental variable only affects the dependent variable through the independent variable of interest.
2. Relevance. There must actually be a relationship between the instrumental variable and the independent variable. 

There is typically a trade-off between these two. There are plenty of variables that satisfy one, precisely because they do not satisfy the other. @Cunningham2021 [p. 211] describes how one test of a good instrument is if people are initially confused before you explain it to them, only to think it obvious in hindsight.

Relevance can be tested using regression and other tests for correlation. The exclusion restriction cannot be tested. We need to present evidence and convincing arguments. The difficult aspect is that the instrument needs to seem irrelevant because that is the implication of the exclusion restriction [@Cunningham2021 p. 225].

Instrumental variables is a useful approach because one can obtain causal estimates even without explicit randomization. Finding instrumental variables used to be a bit of a white whale, especially in academia. But there has been increased use of IV approaches downstream of A/B tests [@taddy2019, p. 162].

<!-- ### Case study: Effect of Police on Crime -->

<!-- Here we will use an example of @levitt2002using that looks at the effect of police on crime. This is interesting because you might think, that more police is associated with lower crime. But, it could actually be the opposite, if more crime causes more police to be hired - how many police would a hypothetical country with no crime need? Hence there is a need to find some sort of instrumental variable that affects crime only through its relationship with the number of police (that is, not in and of itself, related to crime), and yet is also correlated with police numbers. @levitt2002using suggests the number of firefighters in a city. -->

<!-- @levitt2002using argues that firefighters are appropriate as an instrument, because '(f)actors such as the power of public sector unions, citizen tastes for government services, affirmative action initiatives, or a mayor's desire to provide spoils might all be expected to jointly influence the number of firefighters and police.'. @levitt2002using also argues that the relevance assumption is met by showing that 'changes in the number of police officers and firefighters within a city are highly correlated over time'. -->

<!-- In terms of satisfying the exclusion restriction, @levitt2002using argues that the number of firefighters should not have a 'direct impact on crime.' However, it may be that there are common factors, and so @levitt2002using adjusts for this in the regression. -->



<!-- The dataset is based on 122 US cities between 1975 and 1995. Summary statistics are provided in Figure \@ref(fig:levittcrime). -->

<!-- ```{r levittcrime, echo=FALSE, fig.cap="Summary statistics for Levitt 2002.", out.width = '90%'} -->
<!-- knitr::include_graphics(here::here("figures/levitt_summary_stats.png")) -->
<!-- ``` -->
<!-- Source: @levitt2002using p. 1,246. -->




<!-- In the first stage @levitt2002using looks at police as a function of firefighters, and a bunch of adjustment variables: -->
<!-- $$\ln(\mbox{Police}_{ct}) = \gamma \ln(\mbox{Fire}_{ct}) + X'_{ct}\Gamma + \lambda_t + \phi_c + \epsilon_{ct}.$$ -->
<!-- The important part of this is the police and firefighters numbers which are on a per capita basis. There are a bunch of adjustment variables in $X$ which includes things like state prisoners per capita, the unemployment rate, etc, as well as year binary variables and fixed-effects for each city. -->

<!-- Having established the relationship between police and firefights, @levitt2002using can then use the estimates of the number of police, based on the number of firefighters, to explain crime rates: -->
<!-- $$\Delta\ln(\mbox{Crime}_{ct}) = \beta_1 \ln(\mbox{Police}_{ct-1}) + X'_{ct}\Gamma + \Theta_c + \mu_{ct}.$$ -->

<!-- The typical way to present instrumental variable results is to show both stages. Figure \@ref(fig:levittcrimefirst) shows the relationship between police and firefighters. -->

<!-- ```{r levittcrimefirst, echo=FALSE, fig.cap="The relationship between firefighters, police and crime.", out.width = '90%'} -->
<!-- knitr::include_graphics(here::here("figures/levitt_first.png")) -->
<!-- ``` -->
<!-- Source: @levitt2002using p. 1,247. -->

<!-- And then Figure \@ref(fig:levittcrimesecond) shows the relationship between police and crime, where is it the IV results that are the ones of interest. -->

<!-- ```{r levittcrimesecond, echo=FALSE, fig.cap="The impact of police on crime.", out.width = '90%'} -->
<!-- knitr::include_graphics(here::here("figures/levitt_second.png")) -->
<!-- ``` -->
<!-- Source: @levitt2002using p. 1,248. -->



<!-- The key finding of @levitt2002using is that there is a negative effect of the number of police on the amount of crime. -->

<!-- There are a variety of points that I want to raise in regard to this paper. They will come across as a little negative, but this is mostly just because this a paper from 2002, that I am reading today, and so the standards have changed. -->

<!-- 1. It is fairly remarkable how reliant on various model specifications the results are. The results bounce around a fair bit and that's just the ones that are reported. Chances are there are a bunch of other results that were not reported, but it would be of interest to see their impact. -->
<!-- 2. On that note, there is fairly limited model validation. This is probably something that I am more aware of these days, but it seems likely that there is a fair degree of over-fitting here.  -->
<!-- 3. @levitt2002using is actually a response, after another researcher, @mccrary2002using, found some issues with the original paper: @levitt87using. While Levitt appears quite decent about it, it is jarring to see that Levitt was thanked by @mccrary2002using for providing 'both the data and computer code.' What if Levitt had not been decent about providing the data and code? Or what if the code was unintelligible? In some ways it is nice to see how far that we have come - the author of a similar paper these days would be forced to make their code and data available as part of the paper, we wouldn't have to ask them for it. But it reinforces the importance of open data and reproducible science. -->



## Exercises and tutorial


### Exercises


1. For three months Sharla Gelfand shared two functions each day: one that was new to them and another that they already knew and love. Please go the 'Two Functions Most Days' GitHub [repo](https://github.com/sharlagelfand/twofunctionsmostdays), and find a package that they mention that you have never used. Find the relevant website for the package, and then in a paragraph or two, describe what the package does and a context in which it could be useful to you.
2. Please again, go to Sharla's 'Two Functions Most Days' GitHub [repo](https://github.com/sharlagelfand/twofunctionsmostdays), and find a function that they mention that you have never used. Please look at the help file for that function, and then detail the arguments of the function, and a context in which it could be useful to you.
3. What is propensity score matching? If you were matching people, then what are some of the features that you would like to match on? What sort of ethical questions does collecting and storing such information raise for you?
4. Putting the ethical issues to one side, following @king2019propensity, in at least two paragraphs, please describe some of the statistical concerns with propensity score matching.
5. What is the key assumption when using difference in differences?
6. Please read the fascinating article in The Markup about car insurance algorithms: https://themarkup.org/allstates-algorithm/2020/02/25/car-insurance-suckers-list. Please read the article and tell me what you think. You may wish to focus on ethical, legal, social, statistical, or other, aspects.
7. Please go to the GitHub page related to the fascinating article in The Markup about car insurance algorithms: https://github.com/the-markup/investigation-allstates-algorithm. What is great about their work? What could be improved?
8. What are the fundamental features of regression discontinuity design?
9. What are the conditions that are needed in order for regression discontinuity design to be able to be used?
10. Can you think of a situation in your own life where regression discontinuity design may be useful?
11. What are some threats to the validity of regression discontinuity design estimates?
14. Please read and reproduce the main findings from Eggers, Fowler, Hainmueller, Hall, Snyder, 2015.
15. What is an instrumental variable?
16. What are some circumstances in which instrumental variables might be useful?
17. What conditions must instrumental variables satisfy?
18. Who were some of the early instrumental variable authors?
19. Can you please think of and explain an application of instrumental variables in your own life?
20. What is the key assumption in difference in differences
    a. Parallel trends.
    b. Heteroscedasticity.
21. If you are using regression discontinuity, whare are some aspects to be aware of and think hard about (select all that apply)?
    a. Is the cut-off free of manipulation?
    b. Is the forcing function continuous?
    c. To what extent is the functional form driving the estimate?
    d. Would different fitted lines affect the results?
22. What is the main reason that @oostrom2021 finds that the outcome of an RCT can depend on who is funding it (pick one)?
    a. Publication bias
    b. Explicit manipulation
    c. Specialisation
    d. Larger number of arms
23. What is the key coefficient of interest in Angelucci and Cagé, 2019 (pick one)?
    a. $\beta_0$
    b. $\beta_1$
    c. $\lambda$
    d. $\gamma$
24. The instrumental variable is (please pick all that apply):
    a. Correlated with the treatment variable.
    b. Not correlated with the outcome.
    c. Heteroskedastic.
25. Who are the two candidates to have invented instrumental variables?
    a. Sewall Wright
    b. Philip G. Wright
    c. Sewall Cunningham
    d. Philip G. Cunningham
26. What are the two main assumptions of instrumental variables?
    a. Exclusion Restriction.
    b. Relevance.
    c. Ignorability.
    d. Randomization.
27. According to @Meng2021What 'Data science can persuade via...' (pick all that apply):
    a. the careful establishment of evidence from fair-minded and high-quality data collection
    b. processing and analysis
    c. the honest interpretation and communication of findings
    d. large sample sizes
28. According to Reiderer, 2021, if I have 'disjoint treated and untreated groups partitioned by a sharp cut-off' then which method should I use to measure the local treatment effect at the juncture between groups (pick one)?
    a. regression discontinuity
    b. matching
    c. difference in differences
    d. event study methods
29. According to Reiderer, 2021, 'Causal inference requires investment in' (pick all that apply):
    a. data management
    b. domain knowledge
    c. probabilistic reasoning
    d. data science
30. I am an Australian 30-39 year old male living in Toronto with one child and a PhD. Which of the following do you think I would match most closely with and why (please explain in a paragraph or two)?
    a. An Australian 30-39 year old male living in Toronto with one child and a bachelors degree
    b. A Canadian 30-39 year old male living in Toronto with one child and a PhD
    c. An Australian 30-39 year old male living in Ottawa with one child and a PhD
    d. A Canadian 18-29 year old male living in Toronto with one child and a PhD
31. In your most disdainful tone (jokes, I love DAGs), what is a DAG (in your own words please)?
32. What is a confounder (please select one answer)?
    a. A variable, z, that causes both x and y, where x also causes y.
    b. A variable, z, that is caused by both x and y, where x also causes y.
    c. A variable, z, that causes y and is caused by x, where x also causes y.
33. What is a mediator (please select one answer)?
    a. A variable, z, that causes y and is caused by x, where x also causes y.
    b. A variable, z, that causes both x and y, where x also causes y.
    c. A variable, z, that is caused by both x and y, where x also causes y.
34. What is a collider (please select one answer)?
    a. A variable, z, that causes both x and y, where x also causes y.
    b. A variable, z, that causes y and is caused by x, where x also causes y.
    c. A variable, z, that is caused by both x and y, where x also causes y.
35. Please talk through a brief example of when you may want to be very careful about checking for Simpson's paradox.
36. Please talk through a brief example of when you may want to be very careful about checking for Berkson's paradox.
38. In @NoiseKahneman the authors, including the Nobel Prize winner Daniel Kahneman, say '... while correlation does not imply causation, causation does imply correlation. Where there is a causal link, we should find a correlation'. With reference to @Cunningham2021 [Chapter 1], are they right or wrong, and why?


### Tutorial



### Paper

At about this point, Paper Five (Appendix \@ref(paper-five)) would be appropriate.



