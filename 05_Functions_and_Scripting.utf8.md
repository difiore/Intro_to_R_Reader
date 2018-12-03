# Functions and Scripting

## Notes
### Writing Functions
By now, we've started understanding how to use the prebuilt functions available for us within R. However, those functions don't cover everything that we might need to do - and so sometimes, we need to build them for ourselves.

At first, it might not make sense to spend your time writing functions, when you could just copy and paste the same code snippets to multiple places. But - in addition to this failing our rule that, if you have to repeat something more than twice, there's a better way - copying and pasting increases the chance of typos, makes the important parts of your code harder to understand, and makes your script or notebook unnecessarily long. Additionally, if the needs of your project change - or you catch a mistake in your code - functions only need to be changed in one place. Plus, once we move into working with others and sharing your code, functions make cleaning data and standardizing analyses between partners much easier.

#### Our First Function
Some functions might seem impossibly complex - coding something like ggplot's geoms, for instance, is probably a bit beyond us right now. But others really aren't that hard - for instance, if we wanted to code another function to calculate the mean, our code would look like this:


```r
mean2 <- function(x){
  MEAN <- sum(x)/length(x)
  return(MEAN)
}
```

Note if we want to run an entire chunk of code while using curly braces (```{}```), we have to run our code from the very first line - trying to run the code from the middle will only evaluate the section inside of those particular braces.

As you can see, there are three steps to this process:

* We defined the object ```mean2()``` as a function (using ```function()```), which takes the argument ```x```
* Inside the curly braces ```{}```, we coded what the function should do - define ```MEAN``` as the sum of ```x``` divided by the number of elements in ```x```
* We told R what our function should ```return()``` as an output - in this case, ```MEAN```

This is how most functions work! While the internal code can be a lot more complicated than this, at their essence, functions are just objects that manipulate their inputs before returning an output.

We can compare the results of our function against base R's ```mean()```, to make sure we did alright:

```r
mean(iris$Sepal.Length)
```

```
## [1] 5.843333
```

```r
mean2(iris$Sepal.Length)
```

```
## [1] 5.843333
```

Not bad!

#### Returns
As a quick sidenote, not all the code you'll see in the wild will be quite as explicit about what it ```return()```s. For instance, the same code will run exactly like ```mean2()``` did, and is a bit shorter:


```r
mean3 <- function(x){
  sum(x)/length(x)
}
```

In general, functions will return the last thing they evaluate. ```return()``` is typically used to stop a function early - if it fails a conditional (as we'll discuss below) or other similar cases. I personally like being explicit about what a function returns, but most developers will let their function return values implicitly instead.

#### More Complicated Functions
Where other functions get more complicated is in the number of arguments they take. In ```mean2()```, we defined ```x``` as our only argument. This is the _data_ argument - it tells us what dataset we should use in our function. However, plenty of functions have _detail_ arguments as well - for instance, the ```na.rm``` argument in ```mean()```, or the ```method``` argument in ```cor.test()```. These allow us to specify exactly how our function is implemented. For instance, if we wanted to code a new function, ```multistat()```, which let us run any function on a dataset ```x```: 


```r
multistat <- function(x, func = mean){
  func(x)
}
```

We could now use that function to calculate standard deviation, for instance:

```r
multistat(iris$Sepal.Length, sd)
```

```
## [1] 0.8280661
```

But if we left the ```func``` argument blank, it would default to what it was defined as - in this case, ```mean```:

```r
multistat(iris$Sepal.Length)
```

```
## [1] 5.843333
```

This is a pretty stupid reason to make a function - it doesn't do anything that the base functions don't, and makes your code harder to understand - but it's good for demonstration purposes.

You don't have to give your detail arguments a default value - and it's often helpful if you don't, as it makes you be explicit about what you want as an output. However, if you're expecting that you - or anyone else using your function - will usually want a particular output, you can specify the default using ```=``` like we did above.

#### About Names...
You might remember our discussion in unit 1 about why R occasionally requires quotes around things, while othertimes it doesn't. This is what our explanation was then:

> Note the quotes around "tidyverse" when you go to install it, but **not** when it's inside of ```library()```. The reason for this is a little complicated - basically, you don't use quotes for things that are inside of R's memory, like data, functions, and packages. You use quotes for everything else.

This is still true inside of functions, but with a twist - objects that are defined inside of functions are only defined inside of that function. For instance, even though our ```mean``` functions have assigned ```Sepal.Length``` to ```x```, we can't then call ```mean(x)```. As such, there's not as much worry about creatively naming objects created inside of functions - while your names should still be short and descriptive, they don't need to be distinct from names that exist outside of the function. 


### Conditional Statements
Let's go back to our ```mean()``` copycat functions. Now, to be fully honest, the code for ```mean()``` is a little more complicated - the function checks to make sure your vector isn't a character vector, removes NA values if specified, trims your data, and then calculates the mean. But we've come close with our basic functions!

In order to come a bit closer, we'd have to make use of something known as a _conditional statement_. In their simplest form, these statements evaluate whether or not something is true, then return the appropriate output. 

The most basic version of a conditional is the ```if()``` statement. ```if()``` evaluates the statement inside of its parentheses, and then returns the result of whatever code is in the ```{}``` below it:


```r
if(TRUE == 1){
  "Yes"
}
```

```
## [1] "Yes"
```

Typically, you'll see ```if()``` statements paired with ```else``` statements, which will run the code below them if the conditional statement is false. ```else``` statements should be surrounded by ```{}``` brackets for clarity. For instance:


```r
if(TRUE == 0){
  "Yes"
} else {
  "No"
}
```

```
## [1] "No"
```

You can even combine the two:


```r
if(TRUE == 0){
  "Yes"
} else if(FALSE == 1){
  "Maybe"
} else {
  "No"
}
```

```
## [1] "No"
```

A shorter version of this format is the ```ifelse()``` statement, which works much like if statements in Excel - it evaluates the conditional statement, then returns the first value if the statement is true, or the second if it's false:


```r
ifelse(TRUE == 1, 4, 0)
```

```
## [1] 4
```

If we wanted to get closer to the ```mean()``` function, then, we could do something like this:


```r
mean4 <- function(x){
  if(!is.numeric(x)) {
    return("That's not a number!")
  } else{
    MEAN <- sum(x)/length(x)
    return(MEAN) 
  }
}
```

This function does exactly as well handling numeric values as our other functions:


```r
mean4(iris$Sepal.Length)
```

```
## [1] 5.843333
```

But makes a bit more sense when handed other types of values:


```r
mean2("h")
```

```
## Error in sum(x) : invalid 'type' (character) of argument
```


```r
mean4("h")
```

```
## [1] "That's not a number!"
```

### Stops
The proper way to handle that sort of error-catching is to use ```stop()``` statements. While our ```mean4()``` function will ID when it's given a non-numeric dataset, it will still return a value - in this case, the string "That's not a number!" The problem with this is that it won't make it obvious that something's gone wrong - it lets the mess-up be implicit, instead of explicit.

We can fix that by giving the error message to ```stop()``` instead of ```return```:

```r
mean5 <- function(x){
  if(!is.numeric(x)) {
    stop("That's not a number!")
  } else{
    MEAN <- sum(x)/length(x)
    return(MEAN) 
  }
}
```


```r
mean5("h")
```

```
## Error in mean5("h") : That's not a number!
```

If we think that this sort of error is worth alerting the user about, but not stopping the entire function, we can use ```warning()``` to generate warning messages:


```r
mean6 <- function(x){
  if(!is.numeric(x)) {
    warning("That's not a number! Returning NA.")
    return(NA_real_)
  } else{
    MEAN <- sum(x)/length(x)
    return(MEAN) 
  }
}
mean6("h")
```

```
## Warning in mean6("h"): That's not a number! Returning NA.
```

```
## [1] NA
```

You might have noticed, by the way, that I haven't been using descriptive object names for our ```mean()``` functions. That's because it's hard to come up with short, descriptive names for such similar objects - this is the problem that we solve with ```%>%``` for our datasets! But still, I tripped up once or twice while writing this chapter, and accidentally called the wrong function - you should make sure you're naming your functions much more descriptively than I am!

#### Function Dependencies
As you've seen, we can include functions inside of our functions - and, in fact, most of the most useful functions do exactly this. In that last example, we used ```mean()``` and ```sd()``` inside of our ```multistat()``` function - both of which are included in base R. However, we can even use functions from other libraries if we want. For instance, we can use the ```describe()``` function from psych below - but note that we're preceeding it with ```psych::```, so that it'll run even if the user doesn't have the psych library loaded:


```r
summary_describe <- function(x){
  return(list(Summary = summary(x), Describe = psych::describe(x)))
}
summary_describe(iris$Sepal.Length)
```

```
## $Summary
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   4.300   5.100   5.800   5.843   6.400   7.900 
## 
## $Describe
##    vars   n mean   sd median trimmed  mad min max range skew kurtosis   se
## X1    1 150 5.84 0.83    5.8    5.81 1.04 4.3 7.9   3.6 0.31    -0.61 0.07
```

The problem with doing this is that if your end user doesn't have the package installed, your function will fail out. If you want to force your users to download that package, we'd code something like this:


```r
summary_describe <- function(x){
  if(!require(psych)){
    install.packages("psych")
    return(list(Summary = summary(x), Describe = psych::describe(x)))
  } else{ 
  return(list(Summary = summary(x), Describe = psych::describe(x)))
  }
}  
summary_describe(iris$Sepal.Length)
```

```
## Loading required package: psych
```

```
## $Summary
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   4.300   5.100   5.800   5.843   6.400   7.900 
## 
## $Describe
##    vars   n mean   sd median trimmed  mad min max range skew kurtosis   se
## X1    1 150 5.84 0.83    5.8    5.81 1.04 4.3 7.9   3.6 0.31    -0.61 0.07
```

(We use ```require()``` in the place of ```library()``` here as it will generate a warning message - letting our function proceed - rather than an error. More info [here](https://www.r-bloggers.com/difference-between-library-and-require-in-r/).)

We can also require that packages be loaded in an R session, using code like this:


```r
summary_describe <- function(x){
  if(!require(psych)){
    install.packages("psych")
    library(psych)
    return(list(Summary = summary(x), Describe = describe(x)))
  } else{ 
  return(list(Summary = summary(x), Describe = describe(x)))
  }
}  
summary_describe(iris$Sepal.Length)
```

```
## $Summary
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   4.300   5.100   5.800   5.843   6.400   7.900 
## 
## $Describe
##    vars   n mean   sd median trimmed  mad min max range skew kurtosis   se
## X1    1 150 5.84 0.83    5.8    5.81 1.04 4.3 7.9   3.6 0.31    -0.61 0.07
```

This isn't a great practice, though - you should only load a library inside a function if you use that library often enough that using ```::``` becomes impractical. Otherwise, your code becomes hard for outsiders to understand - you might understand where ```describe()``` comes from, but if you have a ton of packages loaded for a function, other users will have to go digging.

Also, make sure to be careful with how many other packages your functions depend upon - the more packages, the more chances something breaks when one of them updates! 

##### Sidenote:
Note that I had to use "list" in ```summary_describe()``` above to return more than one object - and that both objects are written with a $ in front of their name. One cool side effect of this is that I can ask R to return only one of the outputs:


```r
summary_describe(iris$Sepal.Length)$Describe
```

```
##    vars   n mean   sd median trimmed  mad min max range skew kurtosis   se
## X1    1 150 5.84 0.83    5.8    5.81 1.04 4.3 7.9   3.6 0.31    -0.61 0.07
```

This has some actual applications when using tidyverse functions - for instance, ```summarise()``` can only use single-output functions. We can get around this by doing the following:


```r
library(tidyverse)
```

```
## ── Attaching packages ────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
```

```
## ✔ ggplot2 3.1.0     ✔ purrr   0.2.5
## ✔ tibble  1.4.2     ✔ dplyr   0.7.8
## ✔ tidyr   0.8.2     ✔ stringr 1.3.1
## ✔ readr   1.1.1     ✔ forcats 0.3.0
```

```
## ── Conflicts ───────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ ggplot2::%+%()   masks psych::%+%()
## ✖ ggplot2::alpha() masks psych::alpha()
## ✖ dplyr::filter()  masks stats::filter()
## ✖ dplyr::lag()     masks stats::lag()
```

```r
iris %>%
  group_by(Species) %>%
  summarise(Estimate = cor.test(Sepal.Length, Sepal.Width)$estimate, 
            pValue = cor.test(Sepal.Length, Sepal.Width)$p.value)
```

```
## # A tibble: 3 x 3
##   Species    Estimate   pValue
##   <fct>         <dbl>    <dbl>
## 1 setosa        0.743 6.71e-10
## 2 versicolor    0.526 8.77e- 5
## 3 virginica     0.457 8.43e- 4
```

This is another workaround to the map functions we described in unit 4. Map functions have a lot of advantages to this approach - for instance, they don't require repeating yourself as much, and they run faster - but there's nothing _wrong_ with doing it this way. However, not all functions return lists, so you may have some challenges if you only rely on this approach.


### Saving and Loading Functions
If you want to use a function in multiple scripts or notebooks, you have to save it in its own ```.r``` file - that is, its own R script file. After doing so, you'll be able to load the function in other scripts and notebooks using the ```source()``` command, with the filename (in quotes, with the extension, case sensitive) as the only argument. Once you do that, you'll be able to use the function as normal.

Saving and loading functions in this way has a lot of the same benefits as writing functions in the first place - it cuts down on repetition, makes editing and debugging easier, and makes your code easier for other people to understand.


## Loops
You may have noticed a theme throughout this reader - repetition is bad. Repeating your code makes it easy to make mistakes, and makes it harder to edit things as needed. As such, there's a concept in R - and most other programming languages - called looping, designed to cut down on repetitions.

For instance, say we had a tibble:

```r
df1 <- tibble(a = c(1,1,1,1),
              b = c(2,2,2,2))
```

If we wanted to multiply each column by 2, we could do the following:

```r
df1$a <- df1$a * 2
df1$b <- df1$b * 2
df1
```

```
## # A tibble: 4 x 2
##       a     b
##   <dbl> <dbl>
## 1     2     4
## 2     2     4
## 3     2     4
## 4     2     4
```

But as usual, we want to find a way to reduce that repetition. The best tool in R for this sort of thing is what's known as a _for loop_, which will repeat an action a specified number of times. To complete this task, we'd write a for loop that looked something like this:


```r
df1 <- data.frame(a = c(1,1,1,1),
              b = c(2,2,2,2))

for (i in seq_along(df1)){
  df1[[i]] <- df1[[i]] * 2
}

df1
```

```
##   a b
## 1 2 4
## 2 2 4
## 3 2 4
## 4 2 4
```

Alright, so let's break that down.

The ```for()``` statement initializes the loop, telling R that we're going to want to do something repeatedly. Inside the parentheses, the ```i in seq_along(df1)``` defines how many times we want to loop the code. This will make a little more sense if we see what we get from running ```seq_along(df1)``` by itself:


```r
seq_along(df1)
```

```
## [1] 1 2
```

```seq_along()``` returns the position of each column of a dataframe or each element in a vector - so for a dataframe with _n_ columns, we'll get the output "1, 2, ..., n". While this isn't particularly useful by itself, it becomes powerful when used to make loops. 

The code ```i in seq_along(df1)``` then tells our code to repeat itself as many times as there are positions. It does this by incrementing ```i``` by 1 each time the code is run, with the first iteration having a value of 1. I should note that it doesn't matter what you use to represent ```i``` - while ```i``` is extremely common, you could use almost any object name.

We then are able to act on each column of our dataframe by selecting it using ```[[i]]```. Since ```i``` increases by 1 each time the code is looped, we keep selecting the next column in order, until we're completely done with our loop.

If we want to make a new dataframe with our output, we have to be careful to initalize it with the proper number of columns before we start our loop - if we don't, our code will slow down significantly. 

Say we wanted our function to return the median of each column. Doing this the right way looks something like this:


```r
df1 <- data.frame(a = c(1,1,1,1),
              b = c(2,2,2,2))

out <- vector("numeric", length(df1))
out[1] <- df1[1]
for (i in seq_along(df1)){
  out[[i]] <- median(df1[[i]])
}

out
```

```
## [[1]]
## [1] 1
## 
## [[2]]
## [1] 2
```

By the way - you may have heard or read that for loops are extremely slow in R. That's not true, anymore. While they're slower than Python's loops by a good margin, that's because _everything_ is slower than Python by a good margin - but R is pretty middle-of-the-road when it comes to loop speed.

That being said, most programmers in R avoid using for loops when possible. That's both because loops _were_ significantly slower in R than other languages not that long ago, but also because the nature of R makes using functions more popular and efficient than loops. But there are certain times loops are unavoidable - and we'll be using them in the next unit!

For more on for loops, look at [Hadley Wickham's coverage of the subject](https://r4ds.had.co.nz/iteration.html#for-loops-vs.functionals). For our purposes, we don't have to go much further than we already have on the subject.

## Mapping Functions
One way to avoid the use of loops is to replace them with map functions from ```purrr```, as we did in the past unit. While the lists returned by ```map()``` last unit worked fine for our purposes, there are actually map functions for each type of output you might want:

* ```map()``` for lists
* ```map_lgl()``` for logicals (true/false values)
* ```map_int()``` for integers (whole-number numerics)
* ```map_dbl()``` for doubles (numerics with decimal places)
* ```map_chr()``` for character strings

For instance, we could replace our last for loop with the following:

```r
map_dbl(df1, median)
```

```
## a b 
## 1 2
```

Which, with the pipe, looks like this:

```r
df1 %>%
  map_dbl(median)
```

```
## a b 
## 1 2
```

Which is a lot cleaner to read, and easier to write!


### More Information 
There's a world of depth to constructing functions, with mountains of methods to make your functions work cleaner and more efficiently. The majority of R users don't think of themselves as software developers, who need to be concerned with speed and efficiency - instead, they want things to work, preferably with as little time spent coding as possible. However, if you ever want to write functions for other people to use - or use R for more complex tasks in your own work - it's worth understanding how to code efficiently in R. [Here's a good primer on that subject](https://bookdown.org/csgillespie/efficientR/).


## Exercises
1. Remember in unit 3 that there's no standard error function in base R. Write one, naming it ```std.err```.
2. Write a function that will say "Hi!" if given the input "hi", "Bye!" if it gets the input "bye", and "How rude!" if the input isn't either of those.
3. Use a loop to find the mean and median of each column of this dataframe:

```r
df <- data.frame(x = c(57, 24, 245, 3526),
                 y = c(67, 234, 574, 57))
```
4. Replace that loop with map functions.
