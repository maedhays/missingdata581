#' We can see all observations who are missing at least k variables
#'
#'
#' @param .data name of dataset
#' @param k number of missing values
#'
#' @return individuals who are missing at least k values
#' @export
#'
#' @examples
missing_al_k <- function(.data, k=0){
  nmissing <- rep(0, nrow(.data))
  for (i in 1:nrow(.data)){
    #keep track of number of missing values for each row
    nmissing[i] <- sum(is.na(.data[i,]))
  }
  #add this vector to the original dataset
  missing <- data.frame(nmissing, .data)
  #subset and keep only those missing at least k
  missingk <- missing[nmissing >= k,]
  output <- list(missingk$individual, missingk$nmissing)
  names(output)<-c("individual", "num_missing")
  return(output)
}
