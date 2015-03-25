flux <- function(var, data = chemostat){
    res <- list()
    n <- max(reactorId(data$ID))
    for(R in 1:n){
        chem <- data[ reactorId(data$ID)==R,]
        S <- chem[typeId(chem$ID)=="s", ]
        A <- chem[typeId(chem$ID)=="a", ]
        A1 <- A[1,]
        A1[2:ncol(A1)] <- 0
        A <- rbind(A1, A)
        S$WR__kg <- A$WR__kg
        S$WR__kg [1] <- S$W__kg[1]
        S$W__kg[1] <- 0 
        C1 <- S[[var]]* S$WR__kg
        C2 <- S[[var]]* (S$WR__kg+S$W__kg) - A[[var]]* A$W__kg
        res[[paste("R",R,sep="")]] <- C2[-1] - C1[-length(C1)]
        
    }
    res 
}

###Example
#load("~/Desktop/JT09/chemostat_JT09.Rdata)
#chemostat <- chemostat_JT09
# flux("PO4__ui")
