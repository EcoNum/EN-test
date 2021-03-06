% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/ENtest.R
\docType{package}
\name{ENtest}
\alias{ENtest}
\alias{ENtest-package}
\title{ENtest: Test Code for EcoNum.}
\description{
Test R code for EcoNum analyses, in particular, the carbochemostat.
}
\details{
\tabular{ll}{
   Package: \tab ENtest\cr
   Type: \tab Package\cr
   Version: \tab 1.0-1\cr
   Date: \tab 2015-11-04\cr
   License: \tab MIT (see LICENSE file)\cr
   LazyLoad: \tab yes\cr
 }
}
\section{ENtest functions}{

flux() and conc() to calculate fluxes of chemical in the carbochemostat.
pHDrift() to calculate pH according to a drif due to equilibration with air.
checkId() and cie for calculations on samples Ids.
}
\examples{
# To run the tests:
if (require(svUnit)) {
  #clearLog()

  \dontrun{
    ## This test is now moved to the tests directory
    #runTest(svSuite("package:ENtest"), "ENtest")

  }
  \dontshow{
    ## Put here test units you want to run during R CMD check but
    ## don't want to show or run with example(unitTests.ENtest)
  }
  ## Check errors at the end (needed to interrupt R CMD check)
  #errorLog()
}
}
\author{
Philippe Grosjean \email{phgrosjean@sciviews.org}
}
\references{
\url{http://econum.umons.ac.be/}
}
\keyword{package}

