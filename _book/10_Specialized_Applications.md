# Special Applications
## Work in Progress
Study design  
Random grouping  
Sampling  
Predictive models, heatmaps  
Bootstrapping, confirmatory analysis  

## Even More Special Applications
The R community has built an incredible number of tools for all sorts of purposes, such as interactive apps, books, and full websites. R often isn't the best - or, at least, the most straightforward - tool to use to build these, but it does have a few advanges over traditional methods:

* The packages used in making these products usually have shortcuts built in to handle the most common use cases.
* Building these things with R allows you to embed R code in your app/book/website, letting your graphs and other outputs adapt to different web browsers/viewers better than an image file would - and letting you build interactive visualizations.
* You already know R, and while these may require some HTML code to become fully polished, you can do the majority of the work in a language you already speak.

This section will focus on brief overviews of each application, with links to where you can learn more. The point is not to turn you into an expert on web development or HTML applets, but rather to give a sense of the possibility space your R skills have opened up for you.

### Leaflet Maps

### FlexDashboard

### Bookdown

### Blogdown


### Shiny
People really, really like interactive graphics. Being able to click their way through a series of visualizations - or maybe just alter the aesthetic choices of a final output - satisfies a lot of non-data-professionals in a big way. I think interactive graphics are usually a waste of resources - while they're cool, they take away your ability to narrate a story and effectively demonstrate your arguments, which are the main purposes of communicative graphics. While interactive graphics are more useful for data exploration, the amount of time they take to generate and polish makes them cost-prohibitive for this type of use. Plus, this book isn't _Introduction to R for Web Design_ - there are better tools for making these sorts of interactives, and they aren't particularly useful in the printable types of documents most readers of this book will find themselves making.

With that screed out of the way, R's `shiny` package does a pretty good job of letting people make interactive charts and HTML widgets with minimal pain - and some jobs do view proficency with Shiny a plus. You can find a list of resources for learning Shiny at the [official website](https://shiny.rstudio.com/), including written tutorials and a free DataCamp course.
