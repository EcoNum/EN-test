## This code is used to run svUnit test from R Studio's Build -> Test Package
## Note that it only uses main tests, not those in subsdirs!
pkg <- .packageName
library(svUnit)
clearLog()
res <- capture.output(tests <- runTest(svSuite(paste0("package:", pkg)), pkg))
## This occurs when run from R Studio's Build -> Test Package
if (!length(tests)) {
  ## Try from devtools dirs
  tests <- paste0("dir:", system.file(package = pkg, "unitTests"))
  res <- capture.output(runTest(svSuite(tests), pkg))
}
## Note that the message in case of error is not explicit enough
print(errorLog())
 