#' here is a function that writes an R markdown for you
#' you will enter the parameters in the datasets.R file
#' it will write a report.txt file to your directory
#' the text can be copied into an RMD for an instant report
#'
#'
#' @param data dataset of interest--should be initialized
#' @param people vector of individual row numbers
#' @param variables vector of columns of interest in form c(1,2,...)
#'
#' @return dataset with specified people and columns, RMD template text file
#' @export
#'
#' @examples
#' prompt(iris, c(2,4,5,6,7,8), c(1,2,3))
prompt<- function(data, people="all", variables ="all"){
  if(people[1]=="all"){
    peoplelist<-'everyone'
    peop <- seq(1:nrow(data))
  }
  else{
    peoplelist<- paste(people, collapse= ', ')
    peop <- people
  }

  if(variables[1]=="all"){
    variableslist <- paste(colnames(data), collapse = ', ')
    variables <- seq(1:ncol(data))
  }
  else{
    variableslist <- paste(colnames(data[,variables]), collapse = ', ')
  }

  df <- data[peop, variables]

  fileConn<-file("report.txt")
  writeLines(paste(" ",
                   "We are checking the missing data for the following people: ",
                   peoplelist,
                   "and for the following variables: ",
                   variableslist, "The corresponding column numbers are: ",
                   paste(variables, collapse = ', '), " ",

                   " Here are the people with no missing values from the given variables.",
                   "```{r loading, include = FALSE}",
                   "library(missingdata581)",
                   "library(dplyr)",
                   "dframe <- ind(YOUR INDIVIDUALIZED DATASET HERE)",
                   "```",
                   " ",

                   "```{r nomissing, echo=FALSE}",


                   "peop = c(copy individual numbers here)",
                   "variables = c(copy column numbers here)",
                   "df <- prompt(dframe, peop, variables)",
                   "df[complete.cases(df),]",
                   "```",
                   " ", " ", " ",

                   "Here are the people missing some values from the given variables.",
                   "```{r missing, echo=FALSE}",
                   "df[!complete.cases(df),]",
                   "```",
                   " "," ",

                   sep="\n"),
             fileConn)

  close(fileConn)

  return(df)
}
