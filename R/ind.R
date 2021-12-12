#' Individualize function
#'
#' @param data dataset you want to add "individual" column to
#'
#' @return The original output plus a row number variable
#' @export
#'
#' @examples
ind <- function(data){
  data$individual <- seq(1:nrow(data))
  #I chose the name individual because it is long and rarely used
  nombre <- data[,c(length(data),seq(1:(length(data)-1)))]
  return(nombre)
}
