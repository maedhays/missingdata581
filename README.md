
<!-- README.md is generated from README.Rmd. Please edit that file -->

# missingdata581

<!-- badges: start -->
<!-- badges: end -->

The goal of missingdata581 is to let you subset missing values by person
and by variable. There is a Shiny application that lets you interact in
real-time with missing data.

The purpose of my project is to address missing data. I work as a data
manager, and one of the most prevalent issues in any study, especially
clinical studies, is handling missing data. A lot of analysis depends on
having all covariates known, but in practice, this almost never happens,
especially as the sample size increases.

If a study has relatively few subjects, it is not too cumbersome to
manually look for missing values. However, as the size of the study
increases, manually checking for missing values gets much more
difficult.

R has several functions that help address missing data, like is.na(),
complete.cases(), and na.omit(). However, these have to be manipulated
to get useful information, like the total number of missing values a
person has.

Something that I have found particularly useful through my work is
knowing the number of missing values per person and a list of all
missing variables. With the package I have made, this can be found very
easily; with the Shiny application, the number of missing values,
variables, and individuals can be updated in real-time.

## Installation

You can install the released version of missingdata581 from GitHub
<https://github.com/maedhays/missingdata581> with:

``` r
xfun:: install_github("maedhays/missingdata581")
```
