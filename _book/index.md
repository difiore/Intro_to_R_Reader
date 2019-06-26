---
title: "Introduction to Data Exploration and Analysis with R"
author: "Michael Mahoney"
date: "2019-06-19"
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
description: "A detailed introduction to coding in R and the process of data analytics. Version 1.0.0"
---

# Welcome to IDEAR {-}

> There are only two kinds of programming languages: those people always bitch about and those nobody uses.  
><div align = "right"> --- Bjarne Stroustrup  </div>

Welcome to Introduction to Data Exploration and Analysis in R (IDEAr)! This book is designed as a crash course in coding with R and data analysis, built for people trying to teach themselves the techniques needed for most analyst jobs today. The book assumes no prior experience with R or data analysis, and aims to be equally applicable to industry and scientific purposes.

This reader is currently being continuously deployed to  [bookdown.org](https://bookdown.org/connect/#/apps/2008/access) and [GitHub](https://github.com/mikemahoney218/Intro_to_R_Reader), particularly as new sections are completed or old ones restructured. This is so that I can get feedback from the small group of people who are using this book to learn R themselves, so I can adjust and adapt the text as needed. If you'd like to help with this process, I'd love to hear from you, at <mike.mahoney.218@gmail.com>, or see a pull request made on GitHub. More information about me can be found at [my website](https://www.mikemahoney218.com), which just so happens to have been built in R.

## The State of the Book

When I began writing this book, I was designing it as course notes - a reader, of sorts - for an undergraduate course, which would be supported with lectures, homeworks, and other supporting materials. I was distributing it mostly to friends, who would text me directly with questions, and so was willing to let things be a little confusing or a little out of order. 

What I've found is that the book is useful mostly for people self-studying to learn data analytics and R, even though that isn't what it was designed for. Meanwhile, it doesn't seem like I'll be teaching the theoretical course any time soon - so it would make sense that, if I'm going to leave this book up, it ought to be built for what people are actually using it for. The form should follow the function, I suppose.

And so that's what I'm doing now - redesigning this book in order to make it more useful to people self-studying, teaching themselves R via the examples and exercises contained in here. That means a lot of things are going to get shifted and edited - particularly towards the end of the book, where certain topics (the now-excised unit on machine learning, for instance) which were originally written with the intent of instructor support could be sacrificed, in order to give a more cohesive learning experience. That means that the book is about to shift a lot, which might be a pain for anyone currently using it - which I am sorry about! If you want, I can send anyone HTML or PDF files of old versions of the chapters, if that would be helpful. Just contact me via any method above. 

I've included a changelog at the end of the book, to detail exactly what's being changed. Each chapter below is labeled "stable", if I believe it will not change significantly moving forward, or "unstable", if I see dramatic changes coming.

## Book Outline
This book serves as an introduction to R for scientific and business applications, focusing specifically on exploratory data analysis, hypothesis generation and confirmation, data visualization, and communication of results. It requires no prior knowledge of computer programming, computer science, or statistics, though a solid base in any of those fields will likely make your learning process faster.

The goal is to leave you with the basic essentials of working in R, as well as a strong foundation in thinking like a data analyst that will help you understand how to tackle more complicated problems. You won't be an R maestro, and you won't have developed domain-specific knowledge - but you'll have developed knowledge that will allow you to learn those from other resources. To that end, we'll focus primarily on the basic language skills required to implement those more complicated methods, and will skip over things such as natural language processing and machine learning.

To begin, we'll introduce you to programming and the quirks of R, and how you can use those skills to make data visualizations. These chapters include:

1. Introduction to R - Stable
2. Data Visualization - Stable
3. R Basics and Workflow - Stable (for now)

We'll then get into the data analysis workflow, stepping through each component of this process in turn. These chapters are:

4. Data Wrangling - Stable
5. Exploratory Data Analysis - Stable
6. Modeling - Unstable
7. Achieving Graphical Excellence - Stable

Towards the end of the course, we'll shift our focus to skills which will let you work in professional settings and larger groups, using your skills more efficiently and communicating better via code. These chapters include:

8. Functions and Scripting - Stable
9. More Complicated Analyses - Unstable
10. Markdown and Clear Code - Unstable 

The end of the course then covers topics which I have found to be more specialized, and - while important - not as universally applicable to every project. This section includes the units:

11. Working with Text - Stable
12. Dates and Times - Stable
13. Other Uses (What Next?) - Stable

The backmatter of the reader then concerns how to get help outside of this book, containing both links to useful resources and some frequently asked questions. The two units in this section are:

14. Basic Statistics - Stable
15. Other Resources - Stable
16. FAQ - Unstable

## Other Sources
If this introduction isn't quite your style, I'd highly recommend Garrett Grolemund and Hadley Wickham's [R for Data Science](http://r4ds.had.co.nz/index.html), as well as Wickham's [Advanced R](https://adv-r.hadley.nz/index.html). Many other useful resources can be found in Chapter 12, at the end of this book. 
