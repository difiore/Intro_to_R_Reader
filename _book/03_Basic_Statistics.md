# Basic Statistics (Using R)

## Purpose of the Unit {-}
This isn't a statistics course. However, R is a statistical computing language, and many of the functions built into R are designed for statistical purposes. As such, we're going to very quickly go over some statistical terms and a few of the statistical functions built into R. That way, you'll have a better understanding of what exactly it is that we're doing later in the course. 

There aren't any exercises with this unit, since we haven't worked through using these functions with examples yet. However, we'll be using most of these functions - in combination with those from Unit 2 - for the rest of this course.

## Definitions
### Data Concepts
We've already discussed some data concepts in this course, such as the ideas of rectangular and tidy data. However, those discussions are buried in the text of the last unit, so are hard to refer to - and I want to make sure these concepts are discussed explicitly, so I can refer to them in the future without explaining them.

Vector
: * Sequence of data elements of the same type
: * Each element of the vector are also called components, members, or values
: * Created in R using ```c()```


Dataframe
: * A list of vectors of identical lengths
: * Example: ```iris```


Variable
: * A trait or condition that can exist in different quantities or types
: * We measure the impacts of _independent_ predictor variables on _dependent_ response variables


Continuous Data
: * Numeric data which is not restricted to certain values - there are an infinite number of possible values


Discrete Data
: * Numeric data which is restricted to certain values - for example, number of kids (or trees, or animals)


Categorical Data
: * Data which can only exist as one of a specific set of values - for example, house color or zip code
: * Binned numeric data (e.g. "between 1 and 2 inches") is typically categorical


Binary Data
: * Categorical data where the only values are 0 and 1
: * Often used in situations where a "hit" - an animal getting trapped, a tree falling down, etc - is a 1, and no hit is a 0


Ordinal Data
: * A type of categorical data where each value is assigned a level or rank
: * Useful with binned data, but also in graphing to rearrange the order categories are drawn
: * Referred to in R as "factors"


Data Distribution
: * How often every possible value occurs in a dataset
: * Usually shown as a curved line on a graph, or a histogram
  
  
Normal Distribution
: * Data where mean = median, 2/3 of the data are within one standard deviation of the mean, 95% of the data are within two SD and 97% are within 3.
: * Many statistical analyses assume your data are normally distributed
: * Many datasets - especially in nature - aren't


Skewed Distribution
: * Data where the median does not equal the mean
: * A left-skewed distribution has a long tail on the left side of the graph, while a right-skewed distribution has a long tail to the right
: * Named after the tail and not the peak of the graph, as values in that tail occur more often than would be expected with a normal distribution


### Statistical Terms

Estimate
: * A statistic calculated from your data
: * Called an estimate as we are approximating population-level values from sample data
: * Synonynm: metric


Hypothesis Testing
: * Comparing the null hypothesis (typically, that two quantities are equivalent) to an alternative hypothesis  
: * The alternative hypothesis in a two-tailed test is that the quantities are different, while the alternative hypothesis in a one-tailed test is that one quantity is larger or smaller than the other


p Value:
: * The probability of seeing an effect of the same size as our results given a random model
: * High p values often mean your independent variables are irrelevant, but low p values don't mean they're important - that judgement requires scientific justification, and examining the effect size and importance. Otherwise you're just equating correlation and causation.
: * The 0.05 thing is from a single sentence, taken out of context, from a book published in 1925. There's no reason to set a line in the sand for "significance" - 0.05 means that there's a 1 in 20 prpbability your result could be random chance, and 0.056 means it's 1 in 18. Those are identical odds.
: * Some journals have banned their use altogether, but others still will only accept "significant" results
: * Statement from the American Statistical Association:

> A p value, or statistical significance, does not measure the size of an effect or the importance of a result. By itself, a p value does not provide a good measure of evidence about a model or a hypothesis.  


"Robust"
: * A term meaning an estimate is less susceptible to outliers
: * Means are not robust, while medians are, for instance.


Regression
: * A method to analyze the impacts of independent variables on a dependent variable
: * ANOVA and models are both types of regression analyses


General Linear Model
: * Formulas representing the expected value of a response variable for given values of one or more predictors
: * Sometimes abbreviated GLM


Generalized Linear Model
: * Depending who you ask, these may or may not be linear models
: * In this course, we'll only be using logistic models
: * Sometimes abbreviated GLM


#### Estimates and Statistics

n
: * The number of observations of a dataset or level of a categorical.
: * In R, run ```nrow(dataframe)``` or ```length(Vector)``` to calculate.
: * To calculate by group, run ```count(Data, GroupingVariable)```
: * Examples: ```nrow(iris)```, ```length(iris$Sepal.Length)```, ```count(iris, Species)```


Mean
: * The average of a dataset, defined as the sum of all observations divided by the number of observations. 
: * In R, run ```mean(Vector)``` to calculate.
: * Example: ```mean(iris$Sepal.Length)```


Trimmed Mean
: * The mean of a dataset with a certain proportion of data not included
: * The highest and lowest values are trimmed - for instance, the 10% trimmed mean will use the middle 80% of your data
: * ```mean(Vector, trim = 0.##)```
: * ```mean(iris$Sepal.Length, trim = 0.10)```


Variance
: * A measure of the spread of your data.
: * ```var(Vector)```
: * ```var(iris$Sepal.Length)```


Standard Deviation
: * The amount any observation can be expected to differ from the mean.
: * ```sd(Vector)```
: * ```sd(iris$Sepal.Length)```
  
  
Standard Error
: * The error associated with a point estimate (e.g. the mean) of the sample.
: * If you're reporting the mean of a sample variable, use the SD. If you're putting error bars around means on a graph, use the SE.
: * No native function in R - run ```sd(Vector)/sqrt(length(Vector))``` to calculate.
: * ```sd(iris$Sepal.Length)/sqrt(length(iris$Sepal.Length))```
  
  
Median Absolute Deviation from the Median
: * Average distance between each datapoint and - in R - the median
: * A measure of spread in your data
: * Note that MAD often means mean absolute deviation from the mean, mean absolute deviation from the median, and a few other less common things - check your acronyms before using!
: * ```mad(Vector)```
: * ```mad(iris$Sepal.Length)```
  
  
Median
: * A robust estimate of the center of the data.
: * ```median(Vector)```
: * ```median(iris$Sepal.Length)```
  
  
Minimum  
: * The smallest value.
: * ```min(Vector)```
: * ```min(iris$Sepal.Length)```
  
  
Maximum 
: * The largest value.
: * ```max(Vector)```
: * ```max(iris$Sepal.Length)```
  
  
Range
: * The maximum minus the minimum.
: * ```max(Vector) - min(Vector)```
: * ```max(iris$Sepal.Length) - min(iris$Sepal.Length)```

Quantile
: * The _n_ quantile is the value at which, for a given vector, _n_ percent of the data is below that value.
: * Ranges from 0-1. Quantile * 100 = percentile.
: * Quartiles are the 0.25, 0.5, and 0.75 quantiles
: * ```quantile(Vector, c(quantiles that you want))```
: * ```quantile(iris$Sepal.Length, c(0.25, 0.5, 0.75))```


Interquartile Range
: * The middle 50% of the data, contained between the 0.25 and 0.75 quantiles
: * ```IQR(Vector)```
: * ```IQR(iris$Sepal.Length)```


Skew
: * The relative position of the mean and median. At 0, mean = median, and the data is normally distributed.
: * Not included in base R.
  
  
Kurtosis
: * The size of the tails in a distribution. In R, values much different from 0 are non-normally distributed.
: * Not included in base R.


### Models and Tests
Note that most tests discussed here default to a 95% confidence level and a two-tailed test. If you want to learn how to change those for any function, type ```?FunctionName()```. Functions not applicable to the ```iris()``` dataset do not currently have examples underneath them.

Correlation
: * How closely related two variables are
: * Pearson's test assumes your data is normally distributed and measures linear correlation
: * Spearman's test does not assume normality and measures non-linear correlation
: * Kendall's test also does not assume normality and measures non-linear correlation, and is a more robust test - but it is harder to compute by hand, and as such is less commonly seen
: * You cannot compare results from one type of test to another - Kendall's results are always 20-40% lower than Spearman's, for instance
: * ```cor(Vector1, Vector2)``` provides correlation coefficients, while ```cor.test(Vector1, Vector2)``` performs the statistical test, giving test statistics, p values, and other outputs. Both perform the Pearson test by default, but can be changed by providing the argument ```method = "spearman"``` or ```method = "kendall"``` 
: * ```cor(iris$Sepal.Length, iris$Sepal.Width, method = "pearson")```
: * ```cor.test(iris$Sepal.Length, iris$Sepal.Width, method = "pearson")```


t Test
: * A method of comparing the means of two groups
: * If your group variable has more than two levels, don't use a t test - use an ANOVA instead
: * ```t.test(Vector1, Vector2)```


Chi-squared Test
: * A test to see if two categorical variables are related
: * The null hypothesis is that both variables are independent from one another
: * For more information - particularly on what form your data should be in - please see [this site.](http://www.r-tutor.com/elementary-statistics/goodness-fit/chi-squared-test-independence)
: * ```chisq.test(Vector1, Vector2)```


Linear Models
: * A type of regression which predicts the value of a response variable at given values of independent predictor variables
: * If you need help understanding linear models, [here's a lecture from Penn State](https://onlinecourses.science.psu.edu/stat501/node/250/).
: * The most important thing for our purposes is understanding that models are made up of _terms_, which are the predictor variables you give it, and _coefficients_, which are multiplied by those terms to calculate the value of our response. 
: * Larger coefficients _generally_ mean that variable is more important than others in the model, but only if the variables share units - one (much argued-over) way to compare coefficients between variables with different units is discussed [here](http://www.demog.berkeley.edu/~andrew/teaching/standard_coeff.pdf_)
: * Linear models also include an intercept term, which isn't multiplied with any variable. This term being "significant" at p = whatever means _literally nothing_, and if it's your only significant term, your model is useless.
: * You can add multiple predictor vectors using ```+```, and include interaction terms using ```+ Vector1:Vector2```. 
: * ```lm(ResponseVector ~ PredictorVectors, data)```
: * ```lm(Sepal.Length ~ Species, data = iris)```


Logistic Models
: * A form of generalized linear model where the predictor variable is a binary vector
: * Extremely common in science and business to predict events - if a tree or animal will die, if a sale will be made, etc
: * ```glm(ResponseVector ~ PredictorVectors, data, family = "binomial")```


ANOVA
: * A test to identify the impacts of one or more categorical variables on one or more numeric response variables
: * An altered form of the linear model
: * [This blog post](https://dynamicecology.wordpress.com/2014/10/02/interpreting-anova-interactions-and-model-selection/) does an interesting treatment on how to interpret ANOVA results with significant interactions
: * ```anova(lm(ResponseVector ~ PredictorVectors, data))```
: * Normally, you'll save your model to an object using ```<-```, then run ```anova()``` on that object - the way I wrote it above is just demonstrative
: * ```model <- lm(Sepal.Length ~ Species, data = iris)```, then ```anova(model)```


### How We'll Compare Models
There are plenty of different ways to compare models, each with their own proponents and detractors. Rather than wade into those arguments, we're going to use three of the most common metrics. Other metrics (RMSE, PRESS, BIC, etc) can also be generated from R's modeling functions, but we won't go into depth on those.


R^2^
: * The percentage of variance in your data explained by your regression
: * The more independent predictor variables in a model, the higher the R^2^, all else being equal
: * The adjusted R^2^ is a better estimate of regression goodness-of-fit, as it adjusts for the number of variables in a model
: * ```summary(lm(ResponseVector ~ PredictorVector, data))```
: * ```model <- lm(Sepal.Length ~ Species, iris)``` then ```summary(model)```


RMSE
: * Root-mean square error
: * Standard deviation of the residuals - so tells you how accurate your model is
: * Lower == better


Receiver Operating Characteristic Curve
: * R^2^ isn't applicable to logistic models
: * Instead, we calculate the area under the ROC curve, with the area under the curve being abbreviated AUC
: * AUC represents the accuracy of your model, with random guessing having an AUC of 0.5 and a perfect model having an AUC of 1
: * AUC is sometimes referred to as the c-statistic


AIC:
: * Akaike Information Criterion
: * For a single dataset, the model with the smallest AIC is your best model
: * But models with a $\Delta$AIC (the difference between their two AICs) of < 2 (or 4, depending who you ask) are statistically identical
: * If your model has a $\Delta$AIC of < 2 with the null model, it's useless
: * Null model: ```lm(ResponseVariable ~ 1)```

## Examples
All examples here use the ```Orange``` dataset, which is automatically included in R. Note that the O is capitalized!

1. Look at ```Orange``` using either head or ```as.tibble()``` (you'll have to run ```library(tidyverse)``` for that second option). What type of data are each of the columns?
2. Find the mean, standard deviation, and standard error of tree circumference. 
3. Make a linear model which describes circumference (the response) as a function of age (the predictor). Save it as an object with ```<-```, then print the object out by typing its name. What do those coefficients mean?
4. Make another linear model describing age as a function of circumference. Save this as a different object.
5. Call ```summary()``` on both of your model objects. What do you notice? 
6. Does this mean that trees growing makes them get older? Does a tree getting older make it grow larger? Or are these just correlations? 
7. Does the significant p value prove that trees growing makes them get older? Why not?
