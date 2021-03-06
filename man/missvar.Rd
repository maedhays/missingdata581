% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/missvar.R
\name{missvar}
\alias{missvar}
\title{This will output all individuals that are missing variables of interest}
\usage{
missvar(data, colno = c(2, 3))
}
\arguments{
\item{data}{dataset of interest}

\item{colno}{columns of interest c(i,j,...)}
}
\value{
list of all individuals missing data in specified columns
}
\description{
This will output all individuals that are missing variables of interest
}
\examples{
missvar(iris, c(2,4))
}
