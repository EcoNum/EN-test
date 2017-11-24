## This code is used to run svUnit test from R Studio's Build -> Test Package
## Note that it only uses main tests, not those in subsdirs
## You don't need to import/depend/suggest testthat package for it to work!
pkg <- .packageName
library(svUnit)
clearLog()
tests <- paste0("dir:", system.file(package = pkg, "unitTests"))
res <- capture.output(runTest(svSuite(tests), pkg))
## Note that the message in case of error is not explicit enough
print(errorLog())
