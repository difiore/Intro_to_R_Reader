# More Complicated Analyses
## Work in Progress
## Other Datasets
### Importing Your Own Data
So far in this course, we've been working exclusively with the data pre-available in R and a few of the packages we've taken advantage of. While this is a good way to learn R, it's not particularly helpful in letting you complete your own analyses.

Luckily, R has a number of functions used to import data from external files. To demonstrate these, I'll be using datasets located at [https://github.com/mikemahoney218/Unit5Data](https://github.com/mikemahoney218/Unit5Data), in the "Datasets" folder. You don't necessarily need to download these files - but we'll be using these for demonstration throughout this unit.

We're going to be assuming that your data are located in the same folder as your script - this is usually the easiest way to manage datasets. Otherwise, you'll have to wrestle a little with using relative pathways and directory names - Hadley Wickham explains these in more detail here.

In order to do this, we'll be using the ```readr``` package, which is included in the base tidyverse:


```r
library(tidyverse)
```

```
## -- Attaching packages ------------------------------------------------------------------------ tidyverse 1.2.1 --
```

```
## v ggplot2 3.0.0     v purrr   0.2.4
## v tibble  1.4.2     v dplyr   0.7.4
## v tidyr   0.8.0     v stringr 1.3.0
## v readr   1.1.1     v forcats 0.3.0
```

```
## -- Conflicts --------------------------------------------------------------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

All the datasets included in our example use different _delimiters_ - the character that tells R (or Excel, or whatever program you're using) where one column stops and the next one begins. No matter what your delimiter is, we can parse the file using ```read_delim()``` - the first argument is the filename to read, while the second is the delimiter used. For instance, our text file is tab delimited - and since tabs are represented in R as ```\t```, we'll tell ```read_delim()``` to use that as a delimiter:


```r
SiteData <- read_delim("SiteData.txt", "\t")
```

```
## Parsed with column specification:
## cols(
##   Site = col_character(),
##   LakeRiver = col_character(),
##   Elevation = col_integer(),
##   Lat = col_double(),
##   Long = col_double()
## )
```

```r
SiteData
```

```
## # A tibble: 19 x 5
##    Site            LakeRiver Elevation   Lat  Long
##    <chr>           <chr>         <int> <dbl> <dbl>
##  1 Alder Pond      Lake            327  43.9 -73.7
##  2 Bear Creek      River           477  43.6 -75.1
##  3 Cedar Creek     River           470  43.8 -74.3
##  4 Dog Pond        Lake            583  44.1 -74.7
##  5 Duane Stream    River           395  44.7 -74.2
##  6 Fish Creek      River           468  44.3 -74.2
##  7 Gull Pond       Lake            350  43.8 -73.7
##  8 Indian River    River           660  43.5 -74.6
##  9 Twin Lake       Lake            592  43.5 -74.9
## 10 Lyon's Brook    River           474  44.4 -74.1
## 11 Masawepie Creek River           490  44.0 -75.1
## 12 Mill Creek      River           520  43.4 -74.9
## 13 Pond Two        Lake            664  44.2 -74.7
## 14 Moose Creek     River           695  44.2 -74.1
## 15 Death Brook     River           611  43.8 -74.7
## 16 Rock Pond       Lake            485  44.2 -74.3
## 17 Copperas Pond   Lake            538  44.3 -73.9
## 18 Whitney Creek   River           729  43.6 -74.6
## 19 Towers Brook    River           971  43.5 -74.2
```

We can do the same thing with documents that have comma separated values (known as CSVs):


```r
CoverData <- read_delim("CoverData.csv", ",")
```

```
## Parsed with column specification:
## cols(
##   Site = col_character(),
##   Transect = col_integer(),
##   Plot = col_character(),
##   Quadrant = col_integer(),
##   CoverType = col_character()
## )
```

```r
CoverData
```

```
## # A tibble: 756 x 5
##    Site       Transect Plot  Quadrant CoverType
##    <chr>         <int> <chr>    <int> <chr>    
##  1 Bear Creek        1 A            1 Litter   
##  2 Bear Creek        1 A            2 Grass    
##  3 Bear Creek        1 A            3 Litter   
##  4 Bear Creek        1 A            4 Litter   
##  5 Bear Creek        1 B            1 Litter   
##  6 Bear Creek        1 B            2 Grass    
##  7 Bear Creek        1 B            3 Grass    
##  8 Bear Creek        1 B            4 Regen    
##  9 Bear Creek        1 C            1 Regen    
## 10 Bear Creek        1 C            2 Moss     
## # ... with 746 more rows
```

However, ```readr``` also includes a pretty good tool specifically for CSV files:


```r
CoverData <- read_csv("CoverData.csv")
```

```
## Parsed with column specification:
## cols(
##   Site = col_character(),
##   Transect = col_integer(),
##   Plot = col_character(),
##   Quadrant = col_integer(),
##   CoverType = col_character()
## )
```

```r
CoverData
```

```
## # A tibble: 756 x 5
##    Site       Transect Plot  Quadrant CoverType
##    <chr>         <int> <chr>    <int> <chr>    
##  1 Bear Creek        1 A            1 Litter   
##  2 Bear Creek        1 A            2 Grass    
##  3 Bear Creek        1 A            3 Litter   
##  4 Bear Creek        1 A            4 Litter   
##  5 Bear Creek        1 B            1 Litter   
##  6 Bear Creek        1 B            2 Grass    
##  7 Bear Creek        1 B            3 Grass    
##  8 Bear Creek        1 B            4 Regen    
##  9 Bear Creek        1 C            1 Regen    
## 10 Bear Creek        1 C            2 Moss     
## # ... with 746 more rows
```

Now, ```readr``` doesn't have native support for more complicated files, like Excel files. Philosphically, you shouldn't store data in Excel format for long periods of time - we have no idea how long Microsoft will be around for, and the encoding used by Excel may someday disappear and take your data with it. CSVs are generally preferred for long-term data storage, as they're easy to understand visually and are easily parsed by computers.

However, data entry is much easier in Excel, and plenty of data professionals still use the format. Luckily, there's a package - ```readxl``` - designed to parse these types of files:
```
install.packages("readxl")
```


```r
library(readxl)
```


```r
PlotData <- read_excel("PlotData.xlsx")
PlotData
```

```
## # A tibble: 189 x 5
##    Site       Transect Plot  Slope LightDots
##    <chr>         <dbl> <chr> <chr> <chr>    
##  1 Bear Creek       1. A     2     96       
##  2 Bear Creek       1. B     3     96       
##  3 Bear Creek       1. C     4     8        
##  4 Bear Creek       2. A     2     96       
##  5 Bear Creek       2. B     2     96       
##  6 Bear Creek       2. C     15    9        
##  7 Bear Creek       3. A     2     96       
##  8 Bear Creek       3. B     2     96       
##  9 Bear Creek       4. A     2     96       
## 10 Bear Creek       4. B     2     96       
## # ... with 179 more rows
```

You'll also notice that RStudio has an "import dataset" button in the top right corner, which makes use of both the ```readr``` and ```readxl``` packages. This button lets you point and click your way through data import, and then copy the code into your script. It's a great resource for beginners!

### Exporting Data
Writing data to a file is also pretty painless using ```readr```. There are as many options for delimiters as before - you can use ```write_delim()``` to specify which you want to use with your data - but more commonly data is imported and exported as CSV files using ```write_csv()```


```r
write_csv(CoverData, "CoverData.csv")
```

Note that, like all other ```tidyverse``` functions, the dataset is the first thing you specify.


INCLUDE JOINS
AND AIC




