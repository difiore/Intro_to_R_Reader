# Working with Text

> "If it is not written down, it does not exist." 
> <div align = "right"> --- Philippe Kruchten</div>

So far, all of our work has dealt with numeric data. We've even gone so far as to convert categorical data (such as the type of medal won in the Olympics) into numeric formats when we want to include it in our analyses.

There's a few reasons for this. First off, the majority of data used in business and scientific applications can be treated as numeric in nature, meaning it makes the most sense for the front of this book to focus on that more common application. But mostly we started off with numeric data due to how much _harder_ text can be to work with - it doesn't lend itself to nice rectangular dataframes as easily as numeric data does, and tends to be much messier to wrangle than easy numeric formats.

However, much data originates in text format, whether or not it will be used that way, and as such data scientists have to understand how to interpret and process it as easily as numeric data. As such, this chapter will teach you how to wrangle and manipulate text data into more usable formats for your analyses. This is, I believe, one of the hardest topics in this book, but a good understanding of how to use these tools will allow you to handle a much wider variety of datasets than numerical methods alone.

Before we begin, I want to highlight that the title of this chapter is _Working with Text_, as opposed to _Text-Based Analyses_. While text-based analyses are commonly used in some spheres - for instance, sentiment analysis is popular in both the digital humanities and political science, and is gaining acceptance as a [business tool](https://www.northeastern.edu/levelblog/2018/08/02/companies-use-sentiment-analysis/) - we're more focused on the tools used to work with text than the following analyses. For good resources on those topics, check out the [Text Mining with R](https://www.tidytextmining.com/index.html) book.

## Working with Stringr

Let's say we have some text in a vector - known as a _string_:


```r
string <- c("lzGDHgldkh3orange2o5ghte")
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
## ✔ ggplot2 3.1.0     ✔ purrr   0.3.0
## ✔ tibble  2.1.1     ✔ dplyr   0.7.8
## ✔ tidyr   0.8.2     ✔ stringr 1.4.0
## ✔ readr   1.3.1     ✔ forcats 0.3.0
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
## [1] "lzGDHgldkh3apple2o5ghte"
```

(Note that if we wanted to update our `string` object, we'd have to assign the new value using `string <- str_replace()`.)

You can find a listing of all the other useful `stringr` functions on the [package cheatsheet](http://edrub.in/CheatSheets/cheatSheetStringr.pdf) or the accompanying [vignette](https://cran.r-project.org/web/packages/stringr/vignettes/stringr.html).

## Regular Expressions

> Some people, when confronted with a problem, think "I know, I'll use regular expressions." Now they have two problems.
> <div align = "right"> --- Jamie Zawinski</div>

This is all pretty neat, but what happens if we didn't know exactly what we're looking for - just specific parts of the string that we want? For instance, GPS data is often stored in a messy text file, where the latitude and longitude - that is, the data we care about - are specifically marked with start and end brackets or similar markings. In those cases, we can't type out each datapoint that we want - by introducing human errors and taking a long time to complete, that would seem to defeat the entire purpose of coding in the first place!

In this case, we'd have to begin wading into the world of `regular expressions`, also known as `regex` or `regexp`. These are concise statements that let us find specific chunks of strings that we're interested in by generalizing our problems slightly. For instance, the `.` operator in regex lets us select any character:


```r
str_extract_all(string, "o....e")
```

```
## [[1]]
## [1] "orange" "o5ghte"
```

Note that we're using `str_extract_all()` here, so that our regex doesn't just pick up the first match and terminate. While that would actually help in this situation - what's that ugly thing doing in our output? - there's better ways to only get what we're interested in. For instance, the `\\D` operator will select any character that _isn't_ a number - so switching it out for `.` should do the trick:


```r
str_extract_all(string, "o\\D\\D\\D\\De")
```

```
## [[1]]
## [1] "orange"
```

If we wanted to select the ugly thing instead (for instance, to correct it to whatever it should be), we can use the `\\d` operator, which will select any numeric digit. 


```r
str_extract_all(string, "o\\d\\D\\D\\De")
```

```
## [[1]]
## [1] "o5ghte"
```

You'll notice this pattern throughout regex expressions, by the way - a lowercase letter will select any of the things it stands for (so `\\d` selects any digit, while `\\s` will select any blank space) while an uppercase letter will select everything BUT that thing (so `\\D` doesn't select digits, `\\S` will erase blank spaces, and so on).

Another commonly used operator is the `*` function, which means "as many times as it shows up". For instance, say we had a string that looked like this:


```r
string2 <- "aeeeeeeeeeeeaeee"
```

If we wanted to select everything from the first a to the second, we _could_ type out all the e's. But rather than trying to make sure we typed the right number, it's a lot easier for us to do something like this:


```r
str_extract(string2, "ae*a")
```

```
## [1] "aeeeeeeeeeeea"
```

This function also works with other operators - for instance, you can type `.*` to select all the characters within your other specifications:


```r
str_extract_all(string, "o.*e")
```

```
## [[1]]
## [1] "orange2o5ghte"
```

Note, though, that `*` always looks for the longest string it can find. To make it select the shortest string instead, add `?` after the `*`:


```r
str_extract_all(string, "o.*?e")
```

```
## [[1]]
## [1] "orange" "o5ghte"
```

So now `*` splits the strings at each e, rather than continuing on to the last e in the string.

This becomes helpful if you're trying to extract multiple strings with the same pattern - for instance, let's say we had a string with multiple o_e words in it, like this:


```r
string3 <- c("lzGDHodegldopenkh3orange2o5ghte")
```

We can get each of our words out by combining the operators we've discussed above:


```r
str_extract_all(string3, "o\\D*?e")
```

```
## [[1]]
## [1] "ode"    "ope"    "orange"
```

And if we want to incorporate those words into a dataframe, it's as easy as `unlist()`ing them:


```r
tibble(x = 1:3,
       y = unlist(str_extract_all(string3, "o\\D*?e")))
```

```
## # A tibble: 3 x 2
##       x y     
##   <int> <chr> 
## 1     1 ode   
## 2     2 ope   
## 3     3 orange
```

Hopefully you can start to see how these techniques can be useful - we can start turning chunks of text into usable dataframes! We've only covered the basics of regular expressions here - there are _plenty_ of further specifications you can use, to make your code ever more efficient. A good reference moving forward is the [regex cheatsheet](https://www.rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf), which contains an at-a-glance overview of the operators available for your use.

## Case Study
For this example, we're going to be using data located in the [GitHub data repository](https://github.com/mikemahoney218/IntroToRData) for this book, in the "Unit 9 Data" folder. This file - named `LatLongFile.txt` contains a good number of GPS data points, and runs approximately 1154 lines, with 190 individual datapoints. Looking at the file (in a text editor) shows me that each datapoint is stored as follows:

<div align = "center"> `wpt lat="43.485087" lon="-74.949118"` </div>


Since these are consistently labeled, I can extract them from the text file using my sick new regex skills. First, I'll load the file into R:


```r
LatLong <- read_file("LatLongFile.txt")
```

I'm now going to work on the regex expressions, starting with the one for latitude. Since our latitude is always signified by `lat = "`, that's how I'll start my expression. However, remember that R will assume the `"` means you've finished entering your pattern, and will throw an error about anything following the quote mark. As such, we'll have to _escape_ that character using `\` - writing `\"` in the place of `"` will tell R to interpret the quote as part of the string, rather than as the end of the pattern.

After the quote comes a whole bunch of data - the digits of our latitude - and then the string ends with another quote mark. As such, we can represent all the data inside the quotes using `.*?` - we can't just use `\\d*?`, since we need to extract a period as well, and we need `*?` instead of `*` alone, in order to not just select the majority of the document text.

We now have a regex that looks something like `lat=\".*?`, which is very close to being finished. The last thing we're going to do is tell R what the last character in the string is - another quotation mark. As such, we add `\"` to the end of our regex, for a final product of `lat=\".*?\"`. Even though it looks like something a comic book character might swear at someone, that little expression is powerful enough to extract every single latitude in our file.

We can actually use the exact same formula to get our longitudes - we just have to swap "lon" for "lat" in the expression. In practice, this looks something like:

```r
lat <- str_extract_all(LatLong, "lat=\".*?\"")
lon <- str_extract_all(LatLong, "lon=\".*?\"")
```

If we want to then convert those objects into vectors, we can use `unlist`:

```r
lat <- unlist(lat)
lon <- unlist(lon)
```

And then we can look at our results by making a tibble:

```r
head(tibble(lon = lon, lat = lat))
```

```
## # A tibble: 6 x 2
##   lon                  lat                
##   <chr>                <chr>              
## 1 "lon=\"-74.949134\"" "lat=\"43.485033\""
## 2 "lon=\"-74.949118\"" "lat=\"43.485087\""
## 3 "lon=\"-74.948893\"" "lat=\"43.485093\""
## 4 "lon=\"-74.948766\"" "lat=\"43.485156\""
## 5 "lon=\"-74.948748\"" "lat=\"43.485245\""
## 6 "lon=\"-74.948725\"" "lat=\"43.485268\""
```

It looks like we have a little work left for us! If we want to use the latitude and longitude for anything, we're going to need to extract those numbers out from the text they're in. 

For latitude, we want our expression to start at the first digit and select everything it can until the last digit in the cell. For longitude, we want our expression to start at the negative sign (since all our longitudes are negative - I recorded this data in the Western Hemisphere) and select everything it can until the last digit in the cell. As such, both of our patterns will make use of `.*\\d` - that is, "select everything until the last digit". The only difference is that latitude will start with `\\d`, while longitude will start with `-`. 

```r
lat2 <- unlist(str_extract_all(lat, "\\d.*\\d"))
lon2 <- unlist(str_extract_all(lon, "-.*\\d"))
```

Let's see what that looks like:

```r
LatLonTib <- tibble(lon = lon2, lat = lat2)
head(LatLonTib)
```

```
## # A tibble: 6 x 2
##   lon        lat      
##   <chr>      <chr>    
## 1 -74.949134 43.485033
## 2 -74.949118 43.485087
## 3 -74.948893 43.485093
## 4 -74.948766 43.485156
## 5 -74.948748 43.485245
## 6 -74.948725 43.485268
```

While we could have done this all in one step, I was feeling like those regex were getting complicated enough as they were - I decided splitting things up might make it easier to learn.

Either way, our output is a much neater table than we started out with! You might notice that our columns are still character vectors, though. That's an easy enough fix, using `mutate_all` from `dplyr`:

```r
LatLonTib <- LatLonTib %>%
  mutate_all(as.numeric)
head(LatLonTib)
```

```
## # A tibble: 6 x 2
##     lon   lat
##   <dbl> <dbl>
## 1 -74.9  43.5
## 2 -74.9  43.5
## 3 -74.9  43.5
## 4 -74.9  43.5
## 5 -74.9  43.5
## 6 -74.9  43.5
```

## Further Reading
As I mentioned earlier in this chapter, I view text-based analyses as beyond the scope of this book, and am only covering ways of wranging text data into tidy formats. 

For more information on text mining and text-based analyses in R, check out the [tm package vignette](https://cran.r-project.org/web/packages/tm/vignettes/tm.pdf), as well as the prior-linked [Text Mining with R](https://www.tidytextmining.com/index.html) book.

## Exercises
1. Each datapoint in the LatLonFile also has an elevation and a name associated with it - try extracting those as well, and making a dataframe with columns for all four variables. Note that you won't be able to use `mutate_all()` once the name column is added - either add it (with `cbind()`) after converting the columns to numeric, or use `mutate_at(-name, as.numeric)` to select all the other columns.
2. What's the longest regex you can come up with to extract the times for each point? What's the shortest?
