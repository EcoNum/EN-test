## Note that the message in case of error is not explicit enough
pkg <- "ENtest"
library(svUnit)
clearLog()
runTest(svSuite(paste0("package:", pkg)), pkg)
print(errorLog())
