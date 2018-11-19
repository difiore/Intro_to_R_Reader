---
title: "Introduction to Data Exploration and Analysis with R"
author: "Michael Mahoney"
date: "2018-11-14"
site: bookdown::bookdown_site
bookdown::gitbook:
  config:
    toc:
      collapse: section
      scroll_highlight: yes
    toolbar:
      position: fixed
    edit : null
    download: null
    search: yes
    fontsettings:
      theme: white
      family: sans
      size: 2
toc_float: true
documentclass: book
github-repo: MikeMahoney218/Intro_to_R_Reader
description: "This is a course reader for a class that will never be taught. Hopefully it helps you nonetheless."
---

# Welcome to IDEAR {-}

>Figures often beguile me, particularly when I have the arranging of them myself; in which case the remark attributed to Disraeli would often apply with justice and force: 'There are three kinds of lies: lies, damned lies, and statistics.  
><div align = "right"> --- Mark Twain </div>

> There are only two kinds of programming languages: those people always bitch about and those nobody uses.  
><div align = "right"> --- Bjarne Stroustrup  </div>

> Computers are cheap, and thinking hurts.
><div align = "right">---Uwe Ligges</div>

This is a course reader for a hypothetical 3-credit undergraduate class, focusing on getting those with no prior exposure to R up to speed in coding and data analysis procedures.

This reader is currently being continuously deployed to  [bookdown.org](https://bookdown.org/connect/#/apps/2008/access) and [GitHub](https://github.com/mikemahoney218/Intro_to_R_Reader), particularly as new sections are completed or old ones restructured. This is so that I can get feedback from the small group of people who are using this book to learn R themselves, so I can adjust and adapt the text as needed. If you'd like to help with this process, I'd love to hear from you, at <mike.mahoney.218@gmail.com>, or see a pull request made on GitHub. More information about me can be found at [my website](https://www.mikemahoney218.com), which just so happens to have been built in R.

## Course Outline
This course serves as an introduction to R for scientific and research applications, focusing specifically on exploratory data analysis, hypothesis generation and confirmation, data visualization, and communication of results. It is not an introduction to statistics course, though it will teach some statistics. It isn't even an introduction to computer programming or computer science course, though it will teach some of each of those.

The front half of the course includes an introduction to coding with R, a review of statistics, and two walk-through tutorials of data analyses to give you templates to build your own analyses from. In order, the units are:

1. Introduction to R and Data Visualization
2. R Functions and Workflow
3. Basic Statistics with R
4. Introduction to Data Analysis
5. Functions and Scripting
6. More Complicated Analyses

The middle section of the course then focuses on communicating your results and methodologies, and introduces Git and Latex (as well as R Markdown) in order to improve your collaboration skills. The units comprising this section include:

7. Achieving Graphical Excellence
8. Playing Nicely with Others (Communicating With Code)

The end of the course then covers topics which I have found to be more specialized, and - while important - not as common in day-to-day data analyses. We also finish with a brief introduction to machine learning techniques, to give you the basic knowledge to be familiar with the future of statistical analyses. This section includes the units:

9. Working with Text
10. Specialized Applications
11. Dates and Times
12. Machine Learning

## Citing My Sources
Much of this reader draws from Hadley Wickham's 2012 [stat405](http://stat405.had.co.nz/) class, as well as his wonderful textbooks [R for Data Science](http://r4ds.had.co.nz/index.html) (with Garrett Grolemund) and [Advanced R](https://adv-r.hadley.nz/index.html). I've updated some elements, distilled others, and not kept much of the content, but the ideas and steering come very directly from those works.  
Many other resources can be found in Chapter 14, at the end of this book. 
