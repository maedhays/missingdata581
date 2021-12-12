#' This puts together individual, # missing, and list of missing variables
#'
#' @param df data frame of interest--should be individualized
#' @param n number of missing values of interest
#'
#' @return individual, number of missing values, variables missing
#' @export
#'
#' @examples
#' air <- ind(airquality)
#' missoutput(air, n=1)
missoutput <- function (df, n=1){
  #n is the number of missing values
  falta <- missing_al_k(df, n)
  #this shows all rows with at least one missing value
  lacking <- df[!complete.cases(df),]

  missingq <- matrix(nrow=nrow(lacking), ncol=ncol(lacking))
  #it can only miss as many columns as are in the subsetted group
  nmiss <- seq(1:nrow(lacking))
  #transfer the column names
  colnames(missingq) <- colnames(lacking)

  report <- seq(1:nrow(lacking))
  for (i in 1:nrow(lacking)){
    for (j in 1:ncol(lacking)){
      #this will make the cell equal the column name if it was originally NA
      missingq[i,j] <-ifelse(is.na(lacking[i,j]),colnames(lacking)[j],NA)
    }
    nmiss[i] <- sum(!is.na(missingq[i,]))
  }

  #this collapses each row to only include NA values
  reportlists <- split(missingq, seq(nrow(missingq)))
  report <- lapply(reportlists, na.omit)
  combined <- cbind(nmiss,lapply(report, paste, collapse=", "))

  subset <- combined[nmiss >= n,2]

  descr <- summary(falta$num_missing)

  output2 <-cbind (falta$individual, falta$num_missing, subset)

  colnames(output2) <-c("individual","number_missing", "missing_columns")

  print(descr)
  return(output2)

}
