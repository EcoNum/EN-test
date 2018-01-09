#' Example of a nutrient data from the carbochemostat
#'
#' A data frame with NH3, NO2, NO3 and PO4 measurements fro a carbochemostat.
#'
#' @name CC110315
#' @docType data
#' @keywords data
"CC110315"


#' Flux calculation for a variable from a chemdata object.
#'
#' With the carbochemostat, fluxes are calculated from the weight balance
#' from inputs and outputs, modulated by the concentration of the solute
#' (i.e., the variable).
#'
#' @details
#' TODO: put here the equations for the calculations of the flux...
#'
#' @seealso \code{\link{conc}}, \url{http://econum.umons.ac.be}
#' @family calculation functions
#' @concept mass-balance flux
#' @param var A character vector with the name of the variable(s) to use
#'   for the calculations.
#' @param data A \code{chemdata} object, which default to \code{chemostat}.
#' @return A \code{data.frame} with time and flux for the variable(s)
#' @export
#' @examples
#' \dontrun{
#' flux("NH3", data = chem01)
#' }
#'
#' #load("~/Desktop/JT09/chemostat_JT09.Rdata)
#' # flux("PO4__ui", chemostat_JT09)
flux <- function(var, data) {
  if (!is.character(var))
    stop("'var' must be a character vector")
  if (!inherits(data, "chemdata"))
    stop("'data' must be a 'chemdata' object")
  # Return a fake result for now
  NULL

## PhG: to be reworked according to new Ids!
#flux <- function(var, data = chemostat){
#  res <- list()
#  n <- max(reactorId(data$ID))
#  for (R in 1:n) {
#    chem <- data[ reactorId(data$ID)==R,]
#    S <- chem[typeId(chem$ID)=="s", ]
#    A <- chem[typeId(chem$ID)=="a", ]
#    A1 <- A[1,]
#    A1[2:ncol(A1)] <- 0
#    A <- rbind(A1, A)
#    S$WR__kg <- A$WR__kg
#    S$WR__kg [1] <- S$W__kg[1]
#    S$W__kg[1] <- 0
#    C1 <- S[[var]]* S$WR__kg
#    C2 <- S[[var]]* (S$WR__kg+S$W__kg) - A[[var]]* A$W__kg
#    res[[paste("R",R,sep="")]] <- C2[-1] - C1[-length(C1)]
#  }
#  res
#}

}


#' Concentration calculation for a variable from a chemdata object.
#'
#' Concentration of the solute (i.e., the variable) over time is extracted from
#' \code{data}.
#'
#' @details
#' TODO: put some more info here...
#'
#' @section warning:
#' Do provide duplicated measurements for the calculation of the error!
#'
#' @seealso \code{\link{flux}}
#' @family calculation functions
#' @concept concentration
#' @param var A character vector with the name of the variable(s) to use
#'   for the calculations.
#' @param data A \code{chemdata} object, which default to \code{chemostat}.
#' @return A \code{data.frame} with time and concentration for the variable(s)
#' @export
#' @examples
#' \dontrun{
#' conc("NH3", data = chem01)
#' }
conc <- function(var, data) {
  if (!is.character(var))
    stop("'var' must be a character vector")
  if (!inherits(data, "chemdata"))
    stop("'data' must be a 'chemdata' object")
  # Return a fake result for now
  NULL
}
