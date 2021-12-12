#' This will output all individuals that are missing variables of interest
#'
#' @param data dataset of interest
#' @param colno columns of interest c(i,j,...)
#'
#' @return list of all individuals missing data in specified columns
#' @export
#'
#' @examples
#' missvar(iris, c(2,4))
missvar <- function(data, colno=c(2,3)){
  #this fixes if a string is entered as an option
  col <- seq(1:ncol(data))
  names(col) <- colnames(data)
  col <- col[colno]

  #I had to do cases since rowSums() needs at least 2 rows
  if (length(col)>1){
    allgone <- is.na(data[,col])
    s <- rowSums(allgone)
    pr <- ifelse(s==length(col), TRUE, FALSE)
    df <- data[pr,c(1,col)]
    return(df)
  }
  else{
    allgone <- is.na(data[,col])
    pr <- ifelse(allgone == length(col), TRUE, FALSE)
    df <- data[pr,c(1,col)]
    return(df)
  }
}
