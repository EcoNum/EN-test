## Carbochemostat calculation functions

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
#' @examples
#' flux("")
#'
#' donrun{
#' flux("NH3", data = chem01)   
#' }
flux <- function (var, data = chemostat)
{
    if (!is.character(var))
        stop("'var' must be a character vector")
    if (!inherits(data, "chemdata"))
        stop("'data' must be a 'chemdata' object")
    ## Return a fake result for now
    NULL
}

#' Concentration calculation for a variable from a chemdata object.
#'
#' Concentration of the solute (i.e., the variable) over time is extracted from
#' \code{data}
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
#' @examples
#' conc("")
#'
#' donrun{
#' conc("NH3", data = chem01)   
#' }
conc <- function (var, data = chemostat)
{
    if (!is.character(var))
        stop("'var' must be a character vector")
    if (!inherits(data, "chemdata"))
        stop("'data' must be a 'chemdata' object")
    ## Return a fake result for now
    NULL
}
