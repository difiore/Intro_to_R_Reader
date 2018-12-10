# Working with Text
## Work in Progress
So far, all of our work has dealt with numeric data. We've even gone so far as to convert categorical data (such as the type of medal won in the Olympics) into numeric formats when we want to include it in our analyses.

There's a few reasons for this. First off, the majority of data used in business and scientific applications can be treated as numeric in nature, meaning it makes the most sense for the front of this book to focus on that more common application. But mostly we started off with numeric data due to how much _harder_ text can be to work with - it doesn't lend itself to nice rectangular dataframes as easily as numeric data does, and tends to be much messier to wrangle than easy numeric formats.

However, much data originates in text format, whether or not it will be used that way, and as such data scientists have to understand how to interpret and process it as easily as numeric data. As such, this chapter will teach you how to wrangle and manipulate text data into more usable formats for your analyses. This is, I believe, one of the hardest topics in this book, but a good understanding of how to use these tools will allow you to handle a much wider variety of datasets than numerical methods alone.

Before we begin, I want to highlight that the title of this chapter is _Working with Text_, as opposed to _Text-Based Analyses_. While text-based analyses are commonly used in some spheres - for instance, sentiment analysis is popular in both the digital humanities and political science - we're more focused on the tools used to work with text than the following analyses. For good resources on those topics, check out the [Text Mining with R](https://www.tidytextmining.com/index.html) book.

## Working with Strings

> Some people, when confronted with a problem, think "I know, I'll use regular expressions." Now they have two problems.
> <div align = "right"> --- Jamie Zawinski</div>

Let's say we have some text in a vector - known as a _string_:


```r
string <- c("lzGDHgldkh3orange25ght")
```

(I never said it would be a pretty string.)

We're going to be working with this data using the `stringr` package, conveniently located in the `tidyverse` suite. As such, let's load the tidyverse now:


```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.2.1 ──
```

```
## ✔ ggplot2 3.1.0     ✔ purrr   0.2.5
## ✔ tibble  1.4.2     ✔ dplyr   0.7.8
## ✔ tidyr   0.8.2     ✔ stringr 1.3.1
## ✔ readr   1.1.1     ✔ forcats 0.3.0
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

`stringr` contains a bunch of useful tools for analyzing and working with strings via the use of _patterns_ - that is, the things you want to detect in the string itself. For instance, you may have noticed that there's the word "orange" hidden in our string of text. If we just wanted to know if that word was there, we could do the following:


```r
str_detect(string, "orange")
```

```
## [1] TRUE
```

(By the way, all these functions that start with `str_` are provided by the `stringr` package. While we'll use a few functions from base R, `stringr` simplifies a lot of the hassle of working with strings, and so we'll primarily be using those.)

If we wanted to know where in the string it was, we could try this instead:


```r
str_locate(string, "orange")
```

```
##      start end
## [1,]    12  17
```

We can use this information to extract the word from our string using `str_sub()`:


```r
str_sub(string, 12, 17)
```

```
## [1] "orange"
```

Or even use the `str_extract()` function to do so:


```r
str_extract(string, "orange")
```

```
## [1] "orange"
```

We can also replace the fruit, if we so desire:


```r
str_replace(string, "orange", "apple")
```

```
## [1] "lzGDHgldkh3apple25ght"
```

(Note that if we wanted to update our `string` object, we'd have to assign the new value using `string <- str_replace()`.)

This is all pretty useful, but what happens if we didn't know exactly 


```r
str_extract(string, "o.*e")
```

```
## [1] "orange"
```


```r
string <- c("lzGDHodegldopenkh3orange25ght")
```

WORKING WITH STRING MATRICES
