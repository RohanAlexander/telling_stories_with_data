

# Storing and retrieving data

**STATUS: Under construction.**

**Required reading**


**Recommended reading**



**Key concepts/skills/etc**

- 

**Key libraries**

- 

**Key functions/etc**

- 



<!-- Lee, Benjamin, 2018, 'Ten simple rules for documenting scientific software' -->


## Introduction

After you've put together a dataset, an important part of being responsible is storing it appropriately and enabling easy retrieval. While it is certainly possible to be especially concerned about this, and entire careers are based on the storage and retrieval of data, to a certain extent, the baseline here is not onerous. If you can get it off your own computer then you are half-way there! Confirming that someone else can retrieve it and use it, puts you much further than most.

That said, the FAIR principles are especially useful to be more formal about data management. These are [@wilkinson2016fair]:

1. Findable. This means that there is one, unchanging, identifier for the dataset and the dataset has high-quality descriptions and explanations.
2. Accessible.
3. Interoperable.
4. Reusable.

It's important to recognise that just because a dataset is FAIR, it is not necessarily an unbiased representation of the world. 

> **Oh, you think we have good data on that!** One representation of reality that is commonplace is in chess. A chess board (see Figure X - add photo of a chess board) is a 8 x 8 board of alternating black and white squares. The squares are denonated by a unique combination of a letter (A-G) and a number (1-8). And each piece has a unique abbreviation, for instance pawns are X, and knights are Y. A game is recorded by each player noting the move. In this way the entire game can be recreated. The 2021 World Championship was contested by Magnus Carlsen and Ian Nepomniachtchi. Figure X shows a score sheet from Game 6. There were a variety of reasons this game was particularly noteworthy, but one the uncharactertic mistakes that both Carlsen and Nepomniachtchi made. For instance, at Move 32 Carlsen did not exploit an opportunity; and Move 36 a different move would have provided Nepomniachtchi with a promising endgame (CITATION). One reason for this may have been that both players at that point in the game had very little time remaining---they had to decide on their moves very quickly. But there is no sense of that in the representation provided by the game sheet. It is a 'correct' representation of what happened in the game, but not necessarily why it happened.




## Plan

@michener2015ten

Information Science and libraries

@hart2016ten



## R Packages for data


## Documentation

Datasheets [@gebru2020datasheets] are an increasingly critical aspect of data science. Datasheets are basically nutrition labels for datasets. The process of creating them enables us to think more carefully about what we will feed our model. More importantly, they enable others to better understand what we fed our model. Recently researchers went back and wrote a datasheet for one of the most popular datasets in computer science, and they found that around 30 per cent of the data were duplicated [@bandy2021addressing].

Instead of telling you how unhealthy various foods are, a datasheet tells you things like:

- 'Who created the dataset and on behalf of which entity?'
- 'Who funded the creation of the dataset?'
- Does the dataset contain all possible instances or is it a sample (not necessarily random) of instances from a larger set?'
- 'Is any information missing from individual instances?'

If you have done a lot of work to create the dataset that you analyze, then it may make sense to try to publish and share it on its own. But typically a datasheet might live in an appendix to the main work.




## Exercises and tutorial


### Exercises

1. According to @gebru2020datasheets [p.2], a datasheet should document a dataset's (please select all that apply):
    a. composition.
    b. recommended uses.
    c. motivation.
    d. collection process.
2. Following @wilkinson2016fair, which of the following are FAIR principles (please select all that apply)?
    a. Findable.
    b. Approachable.
    c. Interoperable.
    d. Reusable.
    e. Integrated.
    f. Fungible.
    g. Reduced.
    h. Accessible.

### Tutorial

Look into how IQ tests are conducted and what goes into them. To what extent do you think they measure intelligence? Some aspects that you may like to think about in answering that question include: Who decides what is intelligence? How is this updated? What is missing from that definition? To what extent is this generalisable? You should write a page or two.


<!-- The purpose of this tutorial is to ensure that it is clear in your mind how thoroughly you should know your dataset. It builds on the 'memory palace' technique used by professional memorisers, as described by @moonwalkingwitheinstein. -->

<!-- Please think about your childhood home, or another building that you know intimately. Imagine yourself standing at the front of it. Describe what it looks like. Then 'walk' into the front and throughout the house, again describing each aspect in as much detail as you can imagine. What are each of the rooms used for and what are their distinguishing features? How does it smell? What does this all evoke in you? Please write a page or two.  -->

<!-- Now think about a dataset that you are interested in. Please do this same exercise, but for the dataset. -->


