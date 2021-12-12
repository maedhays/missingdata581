#' We can see all observations who are missing exactly k variables
#'
#' @param .data dataset of interest
#' @param k number of missing values
#'
#' @return individuals who are missing k values
#' @export
#'
#' @examples
missing_k <- function(.data, k=0){
  nmissing <- rep(0, nrow(.data))
  for (i in 1:nrow(.data)){
    #this shows the number of missing for each row
    nmissing[i] <- sum(is.na(.data[i,]))
  }

  #we are adding this number of missing values to our original data
  missing <- data.frame(nmissing, .data)
  #we will subset and only keep those missing exactly k
  missingk <- missing[nmissing == k,]
  output <- list(missingk$individual, missingk$nmissing)
  names(output)<-c("individual", "num_missing")
  return(output)
}
