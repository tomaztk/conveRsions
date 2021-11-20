
# Author: Tomaz
# Converts different units between categories

.listOfMeasures = data.frame(category = character(0), unit = character(0), quotient = numeric(0))
.listOfMeasures = rbind(.listOfMeasures,
                        data.frame(category = 'time', unit = 'milsec', quotient = 1000),
                        data.frame(category = 'time', unit = 'sec', quotient = 1),
                        data.frame(category = 'time', unit = 'min', quotient = 1/60),
                        data.frame(category = 'time', unit = 'h', quotient = 1/3600),
                        data.frame(category = 'time', unit = 'day', quotient = 1/86400),
                        data.frame(category = 'time', unit = 'week', quotient = 1/604800),
                        data.frame(category = 'time', unit = 'mon', quotient = 1/(86400*365.25/12)),
                        data.frame(category = 'time', unit = 'year', quotient = 1/(86400*365.25))
)

#' Conversion between list of measures
#'
#' function converts from to to unit for a given categorz.
#' It takes integer and returns integer.
#'
#' @param infile An Integer for from argument
#' @return An integer for to argument
#' @export
#'

conveRsion = function(x, from, to){
  unit = quotient = NULL
  if(nrow(subset(.listOfMeasures,unit==from,category))==0) {
    stop('the \'from\' argument is false unit.')
  }
  if(nrow(subset(.listOfMeasures,unit==to,category))==0) {
    stop('the \'to\' argument is false unit.')
  }
  if(subset(.listOfMeasures,unit==from,category)!=subset(.listOfMeasures,unit==to,category)) {
    stop('these units are not in same category and cannot be converted.')
  }

  value = x / subset(.listOfMeasures, unit == from, quotient, drop = TRUE)
  #print(value)
  value2 = value * subset(.listOfMeasures, unit == to, quotient, drop = TRUE)
  return(value2)
}
