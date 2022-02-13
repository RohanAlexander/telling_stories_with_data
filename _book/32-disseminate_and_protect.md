
# Disseminating and protecting data

**Required material**

- Read 'Ten simple rules for responsible big data research', [@zook2017ten].
- Read 'How Data Can Be Used Against People: A Classification of Personal Data Misuses', [@kroger2021data].

**Key concepts and skills**

- Understanding what is personally identifying information, and how this depends on context.
- Implementing data simulation to share data.
- Know what differential privacy is and some of its likely effect on data science

**Key libraries**

- `openssl` [@openssl]

**Key functions**

- `openssl::md5()`
- `openssl::sha512()`


## Introduction

One reason for the rise of data science is that humans are at the heart of it. And often the data that we are interested in directly concern humans. This means there is a tension between sharing the data to facilitate reproducibility, and maintaining privacy. Medicine has developed approaches to this over a long time. And out of that we have seen Health Insurance Portability and Accountability Act (HIPAA) in the US, and the related General Data Protection Regulation (GDPR) in Europe. Our concerns in data science tend to be about personally identifying information (PII). We have a variety of ways to protect especially private information in our datasets, such as emails, including hashing. And sometimes we simulate data and distribute that instead of sharing the actual dataset. More recently, differential privacy is being implemented. But this is usually an inappropriate choice, for anything other than the most massive of datasets and ensures a level of privacy, only at the expense of population minorities.

## Personally identifying information

Personally identifying information (PII) is that which enables us to link a row in our dataset with an actual person. For instance, email addresses are often PII, as are names and addresses. Interestingly, sometimes the combination of several variables, none of which are PII in and of themselves, can be PII. For instance, age is unlikely PII by itself, but age combined with city, education, and a few other variables could be. One concern is that this re-identification can occur across datasets. Another interesting aspect is that again while some variable may not be PII for almost everyone in the dataset, it can become PII in the extreme. For instance, if we have age, then there are many people of most ages, but there are fewer people in ages over 100 and it likely becomes PII. The same scenario happens with both income and wealth. One response to this is for data to be censored. For instance, we may record age between 0 and 100, and then group everyone over that into '101+'.

@zook2017ten recommend considering whether data even need to be gathered in the first place. For instance, if a phone number is not absolutely required then it might be better to not gather it in the first place, rather than need to worry about protecting it before data dissemination.

## Hashing and salting

A hash is a one-way transformation of data, such that the same input always provides the same output, but given the output, it is not reasonably possible to obtain the input. For instance, a function that doubled its input always gives the same output, for the same input, but is also easy to reverse. 

@knuth [p. 514] relates an interesting etymology for 'hash' by first defining 'to hash' as relating to chop up or make a mess, and then explaining that hashing relates to scrambling the input and using this partial information to define the output. A collision is when different inputs map to the same output, and one feature of a good hashing algorithm is that collisions are reduced. One simple approach is to rely on the modulo operator. For instance if we were interested in 10 different groupings for the integers 1 through to 10. A better approach would be for the number of groupings to be a prime number, such as 11 or 853.


```r
library(tidyverse)

hashing <- 
  tibble(ppi_data = c(1:10),
         modulo_ten = ppi_data %% 10,
         modulo_eleven = ppi_data %% 11,
         modulo_eightfivethree = ppi_data %% 853)

hashing
#> # A tibble: 10 × 4
#>    ppi_data modulo_ten modulo_eleven modulo_eightfivethree
#>       <int>      <dbl>         <dbl>                 <dbl>
#>  1        1          1             1                     1
#>  2        2          2             2                     2
#>  3        3          3             3                     3
#>  4        4          4             4                     4
#>  5        5          5             5                     5
#>  6        6          6             6                     6
#>  7        7          7             7                     7
#>  8        8          8             8                     8
#>  9        9          9             9                     9
#> 10       10          0            10                    10
```

Rather than worry about things ourselves, we can use various hash functions from `openssl` [@openssl] including `sha512()` and `md5()`.


```r
library(openssl)

openssl_hashing <- 
  tibble(names =
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
            )) %>% 
  mutate(sha512 = sha512(names),
         md5 = md5(names)
  )

openssl_hashing
#> # A tibble: 10 × 3
#>    names    sha512                                     md5  
#>    <chr>    <hash>                                     <has>
#>  1 Edward   5759ada975e7cb87c28fe1b6ea5f6a1d51dbcf120… 243f…
#>  2 Helen    6ee4156ca7e8e9a5acc42704363f35e278eda738e… 29e0…
#>  3 Hugo     b1e441a54866906727d842e6a064ba8fb9bf1a0cb… 1b38…
#>  4 Ian      d3cf9cdaea6ffdfd8b8d143fe609bc35b937ef139… 245a…
#>  5 Monica   84250b971b87728aa4ab24cec405864ed9dee1343… 0908…
#>  6 Myles    4eae7c19d5c5d4ffffd8c2f97ed7df69f792c74d7… fafd…
#>  7 Patricia e511593a2db805e51ed0bb74c96d0db6521e2a907… 54a7…
#>  8 Roger    f63ab236a5b0135f71c32ee39517001b21ddaa81a… efc5…
#>  9 Rohan    5111e18391d41fbabd9005b85dc2413f2af60c61c… 02df…
#> 10 Ruth     d7e7d23b69e37208002cdfa7dc7a0fa6f6a928539… 8e06…
```

We could share either of these and be comfortable that, in general, it would be difficult for someone to use only that information to recover the names of our respondents. That is not to say that it is impossible. If we made a mistake, such as accidentally committing the original dataset to GitHub then they could be recovered. And of course it is likely that various governments have the ability to reverse the cryptographic hashes used here.

One issue that remains is that anyone can take advantage of the key feature of hashing being that the same input always gets the same output, to test various options for inputs. For instance they could, themselves try to has 'Rohan', and then noticing that the hash is the same as the one that we published in our dataset, know that data relates to that particular individual. We could try to keep our hashing approach secret, but that is difficult as there are only a few that was widely used. One approach is to add a salt that we keep secret. This slightly changes the input. For instance, we could add the salt '_is_a_person' to all our names and then hash that, although a large random number might be a better option. Provided the salt is not shared, then it would be difficult for most folks to reverse our approach in that way.


```r
openssl_hashing_with_salt <- 
  tibble(names =
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
            )
         ) %>% 
  mutate(names = paste0(names, "_is_a_person")) %>% 
  mutate(sha512 = sha512(names),
         md5 = md5(names)
         )

openssl_hashing_with_salt
#> # A tibble: 10 × 3
#>    names                sha512                         md5  
#>    <chr>                <hash>                         <has>
#>  1 Edward_is_a_person   e8ce00d98d5d2f22f7c2bf63a63c6… 9845…
#>  2 Helen_is_a_person    b066b72ebafcb77c765de724f5cae… 7e4a…
#>  3 Hugo_is_a_person     07c18ebb565cc86b84a523e823318… b9b8…
#>  4 Ian_is_a_person      eb9928f62e7004aa0a6ef7e17af6f… 9b1a…
#>  5 Monica_is_a_person   ef429119529d22b72aedbd28d06a5… 50bb…
#>  6 Myles_is_a_person    795dce5816cf5a070ac87cc6021f0… 3635…
#>  7 Patricia_is_a_person 1b44649bc13fa3c505a29c68dff69… 4e4a…
#>  8 Roger_is_a_person    2f753bc3f871d60889c6d51471623… ea1d…
#>  9 Rohan_is_a_person    cc9c7c3d9da05da52f394e2782f9d… 3ab0…
#> 10 Ruth_is_a_person     6d329fde75a259b7de137e70b8615… 8b83…
```



## GDPR and HIPAA

GDPR and HIPAA are two legal structures that govern data in Europe and the US, respectively. Due to the influence of these regions, they have a significant effect outside those regions also. GDPR concerns data generally, while HIPAA is focused on healthcare. GDPR applies to all personal data, which is defined as:

> 'personal data' means any information relating to an identified or identifiable natural person ('data subject'); an identifiable natural person is one who can be identified, directly or indirectly, in particular by reference to an identifier such as a name, an identification number, location data, an online identifier or to one or more factors specific to the physical, physiological, genetic, mental, economic, cultural or social identity of that natural person;
>
> @gdpr, Article 4, 'Definitions'

HIPAA refers to the privacy of medical records in the US and codify the idea that the patient should have access to their medical records, and that only the patient should be able to authorize access to their medical records [@annas2003hipaa]. While it only applies to covered entities, it sets a standard that informs practice, yet is piecemeal given the variety of applications. For instance, a person's social media posts about their health is generally not subject to it, nor is knowledge about a person's location and how active they are, even though based on that information we may be able to get some idea of their health [@Cohen2018]. Such data are hugely valuable [@ibmdataset].


## Data simulation

One common approach to deal with the issue of being unable to share the actual data that underpins an analysis, is to use data simulation. We have used data simulation throughout this book toward the start of the workflow to help us to think more deeply about our dataset before we turn to it. We can use data simulation again at the end, to ensure that others cannot think about our actual dataset. The workflow advocated in this book makes this relatively straight-forward.

The approach is to understand the critical features of the dataset and the appropriate distribution. For instance, if our data were the ages of some population, then we may want to use the Poisson distribution and experiment with different parameters for lambda. Having simulated a dataset, we conduct our analysis using this simulated dataset and ensure that the results are broadly similar to when we use the real data. We can then release the simulated dataset along with our code.

For more nuanced situations, @koenecke2020synthetic recommend using the synthetic data vault [@patki2016synthetic] and then the use of Generative Adversarial Networks, such as implemented by @athey2021using.



## Differential privacy

Differential privacy implements a mathematical definition of privacy, that means that even if datasets are combined, a certain level of privacy will be maintained. A dataset is differentially private to different levels, based on how much it changes when one person's results are removed.

A variant of differential privacy has recently been implemented by the US census. This has been shown to not universally protect respondent privacy, and yet it is expected to have a significant effect on redistricting [@kenny2021impact]. @Suriyakumar2021 found that such model will be disproportionately affected by large demographic groups. The implementation of differential privacy is expected to result in publicly available data that are unusable in the social sciences [@ruggles2019differential].



## Exercises and tutorial



### Exercises



### Tutorial


### Paper

At about this point, Paper Four (Appendix \@ref(paper-four)) would be appropriate.

