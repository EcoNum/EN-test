## runitsENtest.R test suite
## by Ph. Grosjean <phgrosjean@sciviews.org>
## Run it simply by example(unitTests.ENtest)

## Create a few objects we need for our tests
# ...

## Create a very simple 'svTest' object
test_R <- svTest(function() {
	checkTrue(1 < 2)
})

## The test cases
.setUp <- function() {
	## Executed before each test function
	library(ENtest)
  # ...

	## Create a function (just an example, replace with real code here)
	foo <- function(x) return(x)
}

.tearDown <- function() {
	## Executed after each test function
	## Restore previous exclusion list
	# ...
	## Remove our object with tests in .GlobalEnv
	rm(foo, test_R, envir = .GlobalEnv)
}

test_EN <- function() {
  # Test a single pHDrift() calculation
  checkEqualsNumeric(7.532,
    round(pHDrift(pHini = 7.5, Alk = 0.00230, TimeElapsed__min = 60), 3),
    msg = "A single pHDrift( calculation")
}
