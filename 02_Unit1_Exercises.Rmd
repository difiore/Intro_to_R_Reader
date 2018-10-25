# R Basics and Visualizations Exercises

## Calculate the following:
1. The product of 9 * 9
2. 9 squared
3. The remainder from dividing 27 by 2
4. The remainder of 27 divided by 2, divided by 2
5. FALSE divided by TRUE. Why did you get this answer?

## Graph the following:
1. A boxplot of the iris data, with species on the x axis and sepal length on the y
2. A scatterplot of the iris data, plotting sepal length against width, where the points get bigger as sepal width increases
3. Can you change the color of the boxes in the graph you made for problem 1? Can you change the color of the lines?

## Use a new dataset:
Also included in ggplot is the ```mpg``` dataset, containing fuel economy data for 38 different models of car.

1. Use ```head()``` to examine the data. You can also type ```?mpg``` to get documentation on what each variable represents.
2. Is engine displacement (```displ```) correlated with highway miles per gallon (```hwy```)? Make a scatterplot to find out.
3. What variables could we use to group the data? Does coloring points by any of these help explain the scatterplot from problem 2?
4. What does the scatterplot look like if you make a scatterplot for ```cty``` plotted against ```hwy```? Why? What geom could we use to better represent the data?

## Looking ahead:
1. What happens if you type in ```summary(mpg)```? What do you think this output represents?
2. What happens if you type in ```mpg[1]```? How does this compare to ```mpg[[1]]```?
