\name{unitTests.ENtest}
\alias{unitTests.ENtest}

\title{ Unit tests for the package ENtest }
\description{
  Performs unit tests defined in this package by running
  \code{example(unitTests.ENtest)}. Tests are in \code{runit*.R} files located
  in the '/unitTests' subdirectory or one of its subdirectories ('/inst/unitTests'
  and subdirectories in package sources).
}

\author{Philippe Grosjean (\email{phgrosjean@sciviews.org})}

\examples{
if (require(ENtest)) {
    clearLog()
    runTest(svSuite("package:ENtest"), "ENtest")
 
  \dontshow{
    ## Put here test units you want to run during R CMD check but
	## don't want to show or run with example(unitTests.ENtest)
  }
    ## Check errors at the end (needed to interrupt R CMD check)
    errorLog()
}
}

\keyword{utilities}
