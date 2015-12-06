#' Compute the pH drift in seawater after partial equilibration with air
#'
#' Calculate the final pH of seawater after a given time considering
#' equilibration with a mixed gas phase considered as infinitely large
#' (constant pCO2air).
#'
#' @param pHini The initial pH in the seawater.
#' @param alk The initial alkalinity in mmol/kg.
#' @param elapsed Time elapsed waiting for equilibration in min.
#' @param pCO2air CO2 partial pressure of the gas phase in microatm
#' @param tau Cinetic constant for gas-liquid exchange of CO2 in the system.
#'
#' @return the final pH
#' @export
#' @importFrom seacarb carb
#'
#' @examples
#' pHDrift(pHini = 7.5, alk = 0.00230, elapsed = 60)
#' pHDrift(pHini = c(7, 8), alk = 0.00230, elapsed = c(60, 12000))
#' plot(1:500, pHDrift(pHini = 7, alk = 0.00230, elapsed = 1:500))
pHDrift <- function(pHini, alk, elapsed, pCO2air = 400, tau = 560) {
  # Water/gas exchange of the gas with time
  # t = time
  # delta0 =  delta pGas between water and air
  # tau = cinetic constant
  waterGasFlux <- function(t, delta0, tau)
    delta0 * exp(-(t / tau))

  # Convert initial pH and alk into fCO2 (fugacity in microatm)
  fCO2ini <- seacarb::carb(8, pHini, alk)$fCO2

  # Compute initial delta CO2
  dfCO2ini <- fCO2ini - pCO2air

  # Compute the delta pCO2 after TimeElapsed__min
  dfCO2final <- waterGasFlux(elapsed, delta0 = dfCO2ini, tau = tau)

  # Compute the resulting fCO2 in the water
  fCO2final <- pCO2air + dfCO2final

  # Return the resulting pH
  seacarb::carb(24, fCO2final, alk)$pH
}
