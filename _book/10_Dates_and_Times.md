# Working with Dates and Times
## Work in Progress
Before we get started, let's load the `lubridate` package. While part of the tidyverse (so you've already got it installed), we have to load it separately, since it's not as commonly used as the other ones:

```r
library(tidyverse)
```

```
## ── Attaching packages ───────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
```

```
## ✔ ggplot2 3.1.0     ✔ purrr   0.2.5
## ✔ tibble  1.4.2     ✔ dplyr   0.7.8
## ✔ tidyr   0.8.2     ✔ stringr 1.3.1
## ✔ readr   1.1.1     ✔ forcats 0.3.0
```

```
## ── Conflicts ──────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```r
library(lubridate)
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following object is masked from 'package:base':
## 
##     date
```

Time series data is essential to a huge number of analysis tasks, now that data readers can collect information every hour - or every second. Knowing how a process changes over time - whether it's how warm soil is, how many animals a camera has seen, or how often people have clicked on your link - allows insight into a large variety of questions.

However, dates and times can be surprisingly hard to deal with. For instance, the date the last time I compiled this book was 2018-12-18 - that's YYYY-MM-DD format, which we'll talk about in a minute. At first, this format makes a lot of sense - every 24 hours, we add a 1 to the day; after a certain number of days, we add a 1 to the month; and after 12 months (or 365 days), we add a 1 to the year. It's just a slightly different form of numerical data.

But there's a lot of messiness under those easy rules. For instance, not every year has 365 days, and not every day has 24 hours - thanks to the leap year's lesser-known cousin, the leap-second, but also due to daylight savings time, where we sometimes have 23 or 25 hours in a day. There's really no standardization of how many days a month has. Things are complicated.

Plus, unlike other numerical data, there's no good concept of what 0 means for dates. There's no month 0, there's no day 0, and - confusingly enough - there's no year 0, with year 1 separating the BC and CE eras. And all that confusion comes before the fact that we use [two different calendar systems to refer to years pre- and post-1582](https://en.wikipedia.org/wiki/Gregorian_calendar#Proleptic_Gregorian_calendar).

Luckily enough, you usually won't have a ton of data from before 1582. But it's still worth realizing that dates are just numbers on a kinda weird numberline - or, a perfectly normal numberline, where our labels are a little bit weird.

Due to how tricky numbers can be, this chapter is going to focus entirely on manipulating and wrangling date and time data, without any attempt at analyses. Statistical analyses of time-series data can be extremely complex, and as such are outside the scope of this book; a useful resource on implementing time-series analyses in R may be found [here](https://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html).

## Dates in R

R is capable of understanding pure numbers as dates. For instance, if we use the `as_date()` function from `lubridate`, we can convert numbers to dates as such:

```r
as_date(9910)
```

```
## [1] "1997-02-18"
```

To help understand this conversion, it might make sense to call `as_date(0)`:

```r
as_date(0)
```

```
## [1] "1970-01-01"
```

So here we can see what R uses as the 0 for its numberline - instead of being January 1, 1 CE, it chooses January 1, 1970, for... [reasons](https://en.wikipedia.org/wiki/Unix_time). R then adds or subtracts the number of days inside the parentheses to that "0" in order to give us an output date:


```r
as_date(-678)
```

```
## [1] "1968-02-23"
```

Importantly, `as_date()` is doing the fundamentally same thing that `as_character()` or any of the similar functions do - it's converting a numeric object into a date object. We can demonstrate this for ourselves by calling `class()` on an object created by `as_date()`:

```r
DateData <- as_date(9910)
class(9910)
## [1] "numeric"
class(DateData)
## [1] "Date"
```

You can do math with date objects the same way you can with numeric ones - the only difference being that these objects will use the weird timeline we use for dates, incorporating leap years and so on. 

We can also work with date-times, objects which include (you guessed it) both a date and a time. Unlike dates, where adding 1 increments the value by a _day_, adding 1 to a date-time increments by a _second_.

```r
as_datetime(1)
## [1] "1970-01-01 00:00:01 UTC"
as_datetime(9910)
## [1] "1970-01-01 02:45:10 UTC"
```

Date-times are _incredibly_ more complicated than dates, for reasons that we'll discuss later. Generally speaking, however, it's best to use the date format unless your data require times be used as well.

