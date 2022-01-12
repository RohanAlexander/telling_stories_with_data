


# (PART) Communication {-}

**STATUS: Under construction.**

# On writing




**Required reading**

- 

Random stuff: 

- https://psyarxiv.com/n32qw/
- https://en.wikipedia.org/wiki/Einstein–Szilárd_letter#/media/File:Einstein-Roosevelt-letter.png
- https://www.w3.org/History/1989/proposal.html

**Required viewing**

- 

**Recommended reading**

- 



**Examples of well-written papers**

- 


**Key concepts/skills/etc**

- 

**Key libraries**

- 

**Key functions/etc**

- 



**Quiz**




## Introduction




## Writing

> I had not indeed published anything before I commenced "The Professor", but in many a crude effort, destroyed almost as soon as composed, I had got over any such taste as I might once have had for ornamented and redundant composition, and come to prefer what was plain and homely.
>
> Currer Bell (aka Charlotte Brontë), *The Professor*.

> It's not what you say, it's what they hear.
>
> Frank Luntz




## Developing research questions

Both qualitative and quantitative approaches have their place, but here we focus on quantitative approaches. Qualitative research is important as well, and often the most interesting work has a little of both---'mixed methods'. This means that we are subject to issues surrounding data quality, scales, measures, sources, etc. We are especially interested in trying to tease out causality.

Broadly there are two ways to go about research: 

1) data-first, 
2) question-first. 

If you get a job somewhere typically you will initially be data-first. This means that you will need to work out the questions that you can reasonably answer with the data available to you. After you show some promise, you may be given the latitude to explore specific questions, possibly even gathering data specifically for that purpose. Contrast this with the example of the Behavioural Insights Team, [@gertler2016impact, p. 23] who got to design and then carry out experiments given the remit of the entire British government (as they were spun out of the prime minister's office).

When deciding the questions that you can reasonably answer with the data that are available, you need to think about: 

1) Theory: Do you have a reasonable expectation that there is something causal that could be determined? Charting the stock market - maybe, but might be better with haruspex because at least that way you have something you could eat. You need a reasonable theory of how $x$ may be affecting $y$.
2) Importance: There are plenty of trivial questions that you could ask, but it's important to not waste your time. The importance of a question also helps with motivation when you are on your fourth straight week of cleaning data and de-bugging your code. It also (and this becomes important) makes it easier to get talented people to work with you, or similarly to convince people to fund you or allow you to work on this project.
3) Availability: Can you reasonably expect get more data about this research question in the future or is this the extent of the data that could be gathered?
4) Iteration: Is this something that you can come back to and run often or is this a once-off analysis?

The 'FINER framework' as a mnemonic device used in medicine. This framework reminds us to ask questions that are [@hulley2007designing]:

> - Feasible: Adequate number of subjects; adequate technical expertise; affordable in time and money; manageable in scope.
> - Interesting: Getting the answer intrigues investigator, peers and community.
> - Novel: Confirms, refutes or extends previous findings
> - Ethical: Amenable to a study that institutional review board will approve.
> - Relevant: To scientific knowledge; to clinical and health policy; to future research.

@farrugia2010research build on this in terms of developing research questions and recommend 'PICOT':

> - Population: What specific population are you interested in?
> - Intervention: What is your investigational intervention?
> - Comparison group: What is the main alternative to compare with the intervention?
> - Outcome of interest: What do you intend to accomplish, measure, improve or affect?
> - Time: What is the appropriate follow-up time to assess outcome

Often time will be constrained, possibly in interesting ways and these can guide your research. If we are interested in the effect of Trump's tweets on the stock market, then that can be done just by looking at the minutes (milliseconds?) after he tweets. But what if we are interested in the effect of a cancer drug on long term outcomes? If the effect takes 20 years, then we either have to wait a while, or we need to look at people who were treated in 2000, but then we have selection effects and different circumstances to if we give the drug today. Often the only reasonable thing to do is to build a statistical model, but then we need adequate sample sizes, etc.

Usually, the creation of a counterfactual is crucial. We'll discuss counterfactuals a lot more later, but briefly, a counterfactual is an if-then statement in which the 'if' is false. Consider the example of Humpty Dumpty from Lewis Carroll's Through the Looking-Glass:

<div class="figure" style="text-align: center">
<img src="figures/humpty.png" alt="Humpty Dumpty example" width="95%" />
<p class="caption">(\#fig:humpty)Humpty Dumpty example</p>
</div>

Humpty is satisfied with what would happen if he were to fall off, even though he is similarly satisfied that this would never happen. (I won't ruin the story for you.) The comparison group often determines your results e.g. the relationship between VO2 and athletic outcomes, compared with elite athletic outcomes.

Finally, we can often dodge ethics boards in data science, especially once you leave university. Typically, ethics guides from medicine and other fields are focused on ethics boards. But we often do not have those in data science applications. Even if your intentions are unimpeachable, I want to suggest one additional aspect to think about, and that is Bayes theorem: 
$$P(A|B) = \frac{P(B|A)\times P(A)}{P(B)}$$
(The probability of A given B depends on the probability of B given A, the probability of A, and the probability of B.)

To see why this may be relevant, let's go to the canonical Bayes example: There is some test for a disease that is 99 per cent accurate both ways (that is, if a person actually has the disease there is a 99 per cent chance the test says positive, and is a person does not have the disease then there is a 99 per cent chance the test says negative). Let's just say that only 0.005 of the population has the disease. Then if we randomly pick someone from the general population then the chance that they have the disease is outstandingly low. This is even if they test positive:
$$\frac{0.99\times0.005}{0.99\times0.005 + 0.01\times0.995} \approx 33.2$$

To see why this may be relevant, consider the example of Google's AI cancer testing [@citeGoogleAIbreastcancer]. Basically, what they have done is to train a model that can identify breast cancer. They claim 'greater accuracy, fewer false positives, and fewer false negatives than experts'. 

I, and many others [@citeWiredonGoogle], would argue this is probably not where we would want these resources directed at this point. Even when perfectly healthy people go and get screened, they tend to find various things that are 'wrong' with them. The issue is that they're perfectly healthy and that we've rarely got a good idea as to whether that aspect that was flagged by the test is a big deal or not. 

Given low prevalence in the community, we probably do not want wide-spread use of a particular testing regime that only looks at one aspect (i.e. the mammogram in this case). Bayes rule guides us that the danger caused by the unnecessary 'treatment' would probably outweigh the benefits. The authors of that Google blog post likely have unimpeachable ethics, but they may not understand Bayes rule.



### Title, abstract, and introduction

A title is the first opportunity that you have to tell the reader your story. Ideally you will tell the reader exactly what you found. An effective title is critical in order to get your work read when there are other competing priorities. A title doesn't have to be 'cute' to be great.

- Good: 'On the 2019 Canadian Federal Election'. (At least the reader knows what the paper is about.)
- Better: 'The Liberal Party performance in the 2019 Canadian Federal Election'. (At least the reader knows what the paper is about more specifically.)
- Even better: 'The Liberal Party did poorly in rural areas in the 2019 Canadian Federal Election'.  (The reader knows what the paper is about.)

You should put your name and the date on the paper because this provides an important context to the paper.

For a six-page paper, a good abstract is a three to five sentence paragraph. For a longer paper your abstract can be slightly longer. The abstract should say: What you did, what you found, and why the reader should care. Each of these should just be a sentence or two, so keep it very high level.

You should then have an introduction that tells the reader everything they need to know. You are not writing a mystery story - tell the reader the most important points in the introduction. For a six-page paper, your introduction may be two or three paragraphs. Four would likely be too much, but it depends on the context. 

Your introduction should set the scene and give the reader some background. For instance, you may like to start of a little broader, to provide some context to your paper. You should then describe how your paper fits into that context. Then give some high-level results - provide more detail than you provided in the abstract, but don't get into the weeds - and finally broadly discuss next steps or glaring weaknesses. With regard to that high-level result: you need to pick one. If you have a bunch of interesting findings, then good for you, but pick one and write your introduction around that. If it's compelling enough then the reader will end up reading all your other interesting findings in the discussion/results sections. Finally, you should highlight the remainder of the paper.

As an example:

> The Canadian Liberal Party has always struggled in rural ridings. In the past 100 years they have never won more than 25 per cent of them. But even by those standards the 2019 Federal Election was a disappointment with the Liberal Party winning only 2 of the 40 rural ridings. 
>
> In this paper we look at why the performance of the Liberal Party in this most recent election was so poor. We construct a model in which whether the Liberal Party won the riding is explained by the number of farms in the riding, the average internet connectivity, and the median age. We find that as the median age of a riding increases, the likelihood that a riding was won by the Liberal Party decreases by 14 percentage points. Future work could expand the time horizon that is considered which would allow a more nuanced understanding of these effects.
> 
> The remainder of this paper is structured as follows: Section 2 discusses the data, Section 3 discusses the model, Section 4 presents the results, and finally Section 5 discusses our findings and some weaknesses.

The recommended readings provide some lovely examples of titles, abstracts, and introductions. Please take the time to briefly read these papers.


### Figures, tables, equations, and technical terms

Figure and tables are a critical aspect of convincing people of your story. In a graph you can show your data and then let people decide for themselves. And in a table, you can more easily summarise your data.

Figures, tables, equations, etc, should be numbered and then referenced in the text e.g. "Figure 1 shows..." and then have Figure 1.

You should make sure that all aspects of your graph are legible. Always label all of the axes. Your graphs should have titles, and the point that you want to communicate should be clear.

If you use a technical term, then it should be briefly explained in plain language for readers who might not be familiar with it. A great example of this is [this post](https://www.monicaalexander.com/posts/2019-20-01-babynames/) by Monica Alexander where she explains the Gini coefficient:

> To look at the concentration of baby names, let's calculate the Gini coefficient for each country, sex and year. The Gini coefficient measures dispersion or inequality among values of a frequency distribution. It can take any value between 0 and 1. In the case of income distributions, a Gini coefficient of 1 would mean one person has all the income. In this case, a Gini coefficient of 1 would mean that all babies have the same name. In contrast, a Gini coefficient of 0 would mean names are evenly distributed across all babies.


### On brevity


<div class="figure">
<img src="figures/johnson.png" alt="'No more than four pages, or he's never going to read it. Two pages is preferable.'" width="90%" />
<p class="caption">(\#fig:unnamed-chunk-2)'No more than four pages, or he's never going to read it. Two pages is preferable.'</p>
</div>
Source: Shipman, Tim, 2020, "The prime minister's vanishing briefs', The Sunday Times, 23 February, available at: https://www.thetimes.co.uk/article/the-prime-ministers-vanishing-briefs-67mt0bg95 via [Sarah Nickson](https://twitter.com/sarahjnickson).


> Insisting on two page briefs is sensible - not 'government by ADHD'. PM has to be across lots of issues - cannot and should not be across (most of) them in the same depth as secretaries of state. Danger lies in PM trying to take on too much and getting bogged down in detail.
> 
> This might irk officials who lack a sense of where their issue sits within the PM's list of priorities - or the writing skills to draft a succinct brief. But there'd be very few occasions when a brief to the PM warrants more than two pages.
> 
> This is not something peculiar to the current PM - other ministers have raised the same in interviews with \@instituteforgov Oliver Letwin complained of 'huge amount of terrible guff, at huge, colossal, humungous length coming from some departments'
> https://www.instituteforgovernment.org.uk/ministers-reflect/person/oliver-letwin/
> 
> Letwin sent briefs back and asked they be re-drafted to one quarter of the length. 'Somewhere along the line the Civil Service had got used to splurge of the meaningless kind' Similarly, Theresa Villiers talked about the civil service's 'frustrating tendency to produce six pages of obscure and rather impenetrable text' and wishes she'd be firmer in sending documents back for re-drafting:
> https://www.instituteforgovernment.org.uk/ministers-reflect/person/theresa-villiers/
> 
> Sarah Nickson, [23 Feb 2020](https://twitter.com/sarahjnickson/status/1231518746398908421).

Brevity is important. Partly this because you are writing for the reader, not yourself, and your reader has other priorities. But it is also because as the writer it focuses you to consider what your most important points are, how you can best support them, and where your arguments are weakest. 

If you don't think that examples from government are persuasive, then please consider [Amazon's 2017 Letter to Shareholders](https://www.sec.gov/Archives/edgar/data/1018724/000119312518121161/d456916dex991.htm), or other statements about Bezos and memo writing, for instance:

> Well structured, narrative text is what we're after rather than just text... The reason writing a 4 page memo is harder than "writing" a 20 page powerpoint is because the narrative structure of a good memo forces better thought and better understanding of what's more important than what, and how things are related.
>
> Jeff Bezos,  9 June 2004.








### Other

Typos and other grammatical mistakes affect the credibility of your claims. If the reader can't trust you to use a spell-checker, then why should they trust you to use logistic regression? Microsoft Word has a fantastic spell-checker that is much better than what is available for R Markdown: copy/paste your work into there, look for the red lines and fix them in your R Markdown. Then look for the green lines and think about if you need to fix them in your R Markdown. If you don't have Word, then Google Docs is pretty good and so is Apple's Pages.

A few other general tips that I have stolen from various people including the Reserve Bank of Australia's style guide:

- Think about what you are writing. Aim to write everything as though it were on the front page of the newspaper, because one day it could be.
- Be concise. Remove as many words as possible.
- Be direct. Think about the structure of your story and identify the key pieces of information and arrange them so that your paper flows logically from one to the next. You should use sub-headings if you need.
- Be precise. For instance, the stock-market didn't improve or worsen, it rose or fell. Distinguish levels from rates of change.
- Be clear.
- Write simply.
- Use short sentence where possible.
- Avoid jargon.

You should break these rules when you need to. But the only way to know whether you need to break a rule is to know the rules in the first instance.







## Exercises and tutorial


### Exercises

1. Which of the following is the best title (pick one)?
    a. "Problem Set 1"
    b. "Unemployment"
    c. "Examining Canada's Unemployment (2010-2020)"
    d. "Canada's Unemployment Increased between 2010 and 2020"
2. Which word/s can be removed in this sentence without affecting its meaning 'ADD SENTENCE' (pick all that apply)?
    a. a
    b. word
    c. another
    d. word
1. What are three features of a good research question (write a paragraph or two)?
2. What is a counterfactual (pick one)?
    a. If-then statements in which the if didn't happen.
    b. If-then statements in which the if happen.
    c. Statements that are either true or false.
    c. Statements that are neither true or false.




### Tutorial








