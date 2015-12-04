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
    msg = "A single pHDrift calculation")

  # Test checkId
  oldIds <- c("R1Is0", "R4Is0", "A1Ia1", "A2IIa4", "B3IIIs5",
    "C4IVs2", "B1Va2", "C4VIs6")
  newIds <- c("A0a00s", "D0a00s", "A1a01a", "B1b04a", "C2c05s",
    "D3d02s", "A2e02a", "D3f06s")

  checkIdentical(newIds, checkId(newIds),
    msg = "checkId() returns new format unmodified")
  checkIdentical(newIds, checkId(oldIds),
    msg = "checkId() conversion from old to new format")
  checkException(checkId(1),
    msg = "checkId() does not accept non-character argument")
  checkException(checkId("Wrong Id"),
    msg = "checkId() stops on wrong Id")

  # Test other Id functions
  rea <- c("A", "D", "A", "B", "C", "D", "A", "D")
  checkIdentical(rea, reactorId(newIds),
    msg = "reactorId() extracts reactor Id")

  itm <- c(0, 0, 1, 1, 2, 3, 2, 3)
  checkIdentical(itm, itemNbr(newIds),
    msg = "itemNbr() extracts item number")

  bot <- c("a", "a", "a", "b", "c", "d", "e", "f")
  checkIdentical(bot, bottleId(newIds),
    msg = "bottleId() extracts bottle Id")

  cyc <- c(0, 0, 1, 4, 5, 2, 2, 6)
  checkIdentical(cyc, cycleNbr(newIds),
    msg = "cycleNbr() extracts cycle number")

  typ <- c("s", "s", "a", "a", "s", "s", "a", "s")
  checkIdentical(typ, typeId(newIds),
    msg = "typeId() extracts type Id")
}
