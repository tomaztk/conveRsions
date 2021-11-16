#' Convert Fahrenheit to Kelvin
#'
#' function converts Fahrenheit temperature to Kelvin temperature.
#' It takes integer and returns integer.
#'
#' @param infile An Integer for Fahrenheit
#' @return An integer for Kelvin
#' @export

fahrenheit_to_kelvin <- function(fahr) {
  kelvin <- ((fahr - 32) * (5 / 9)) + 273.15
  return(kelvin)
}
