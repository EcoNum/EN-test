## pH calculation functions

#' Compute the pH of additions after partial equilibration with air
#'
#' Adding a sample of seawater into another one, and calculate the final pH,
#' also considering equilibration with the gas phase during equilibration.
#'
#' @param pHini The initial pH.
#' @param Alk The initial alkalinity in mmol/kg-sw.
#' @param TimeElapsed__min Time elapsed waiting for equilibration
#' @param CO2ref CO2 partial pressure of the reference gas phase
#' @param tau Cinetic constant for gas-liquid exchange of CO2 in the systme
#'
#' @return the final pH
#' @export
#' @import seacarb
#'
#' @examples
#' pHDrift(pHini = 7.5, Alk = 0.00230, TimeElapsed = 60)
#' pHDrift(pHini = c(7, 8), Alk = 0.00230, TimeElapsed = c(60, 12000))
#' plot(1:500, pHDrift(pHini = 7, Alk = 0.00230, TimeElapsed = 1:500))
pHDrift <- function(pHini, Alk, TimeElapsed__min, CO2ref = 400, tau = 560.2) {
  # Water/gas exchange
  # x = time
  # delta0 =  delta pCO2 between water and air
  # tau = cinetic constant, estimated 560.2 min at 25C
  waterGasFlux <- function(x, delta0, tau) delta0 * exp(-(x / tau))

  #library(seacarb)
  # Convert initial pH and Alk into pCO2
  # TO DO: memoise here
  pCO2ini <- carb(8, pHini, Alk)$pCO2

  #Compute initial delta CO2
  dpCO2ini <- pCO2ini - CO2ref

  # Compute the delta pCO2 after waiting x minutes
  dpCO2 <- waterGasFlux(TimeElapsed__min, dpCO2ini, tau)

  #Compute the resulting pCO2 in the water
  pCO2f <- CO2ref + dpCO2

  # Return the resulting pH
  carb(24, pCO2f, Alk)$pH
}
