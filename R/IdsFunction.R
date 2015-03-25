
#####sélection des noms des bouteilles sans la référence du type ni du cycle
bottleId <- function(x) sub("^([ABCR][1-4]I{1,3}).*$" ,"\\1",x)

#bottleId(chemostat$Id)

#####sélection du cycle

#cycleId <- function(x) as.numeric(sub("^[^I]+ I{1,3}[a-s]","",x))
cycleId <- function(x) as.numeric(sub("[^I]+I{1,3}[a-s]","",x))

####sélection des additions ou des échantillons
typeId <- function(x) factor(sub("^[^as]+([as]).*$","\\1",x),levels=c("a","s"))

#reactorId <- function (x) as.numeric(sub("^[R](1-4).*$","\\1",x))
reactorData <- function (x) factor(sub("^([R]).*$","\\1",x),levels=c("R"))
reactorId <- function(x) as.numeric (substr(x, 2,2))

#####tare

#Tare
#TareVect <- Tare$tare
#names(TareVect)<- Tare$ID #####mettre Id

#chemostat$Tare__g <- TareVect[bottleId(chemostat$Id)]


