

# Efficiency

**STATUS: Under construction.**

**Required reading**

- 

**Required viewing**

- 


**Recommended reading**

- 

**Key concepts/skills/etc**

- 

**Key libraries**

- 

**Key functions**

- 




## Introduction




## Data efficiency

### SQL



### Feather





## Code efficiency

By and large, worrying about performance is a waste of time. For the most part you are far better off, just pushing things into the cloud, letting them run for a reasonable time, and using that time to worry about other aspects of your pipeline. However, eventually this becomes unfeasible. For me, this is when something takes more than a day to run because it just becomes a pain. There is rarely a most common area for obvious performance gains. Instead you need to learn to measure and then cut.

Being fast is valuable but it's mostly about you being able to iterate fast not your code running fast. If you find that the speed at which your code completes is a bottle neck then shard. Then throw more machines at it. Then shard again. Then throw more machines at it.


## Code refactoring

Some baby examples, focused on data science, along the lines of this: https://indrajeetpatil.github.io/Refactoring-ggstatsplot/refactoring-ggstatsplot#1

Start with an example of bad code, and then how it gets fixed.



### Measure

Using `tic()` and `tic()`.

Measuring


## Experimental efficiency

Multi-armed bandit

## Other languages

### Python

### Julia



## Exercises and tutorial

### Exercises


### Tutorial



