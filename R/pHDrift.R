#pHDrift : a function to compute the pH of addtions after partial equilibration with air

pHDrift <- function (pHini, Alk, TimeElapsed__min,CO2ref=400,tau=560.2) {
    
    #function of water/gas exchange
    mod <- function(x,delta0, tau) delta0 * exp(-(x/tau)) 
    #x = time
    #delta0 =  delta pCO2 between water and ai
    # tau = cinetic value, estimated 560.2 min at 25C

    library(seacarb)
    #Convert initial pH and Alk into pCO2
    #TO DO: memoise here
    pCO2ini <- carb(8,pHini,Alk)$pCO2
    
    #Compute initial delta CO2
    dpCO2ini <- pCO2ini - CO2ref
    
    #Compute the delta pCO2 after waiting x minutes
    dpCO2<- model(TimeElapsed__min,dpCO2ini,tau)
    
    #Compute the resulting pCO2 inside the water
    pCO2f <- CO2ref+dpCO2
    
    #return the resulting pH
    return(carb(24,pCO2f,Alk)$pH)
}

#For one sample:
#pHDrift(pHini=c(7.5),Alk=c(0.00230),TimeElapsed=c(60))

#For three samples:
#pHDrift(pHini=c(7,8,7),Alk=c(0.00230,0.00230,0.00230),TimeElapsed=c(60,12000,60))

#Also work on one sample and a time course:
#plot(1:500,pHdrift(pHini=c(7),Alk=c(0.00230),TimeElapsed=c(1:500)))

