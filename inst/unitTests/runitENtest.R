## runitsENtest.R test suite
## by Ph. Grosjean <phgrosjean@sciviews.org>

## Executed before each test function
.setUp <- function() {
  library(svUnit)
  library(ENtest)
  ## Create a function (just an example, replace with real code here)
  #foo <- function(x) return(x)
}

## Executed after each test function
.tearDown <- function() {
  ## Remove the objects we create for our tests in .GlobalEnv
  #rm(foo, envir = .GlobalEnv)
}

test_EN <- function() {
  # flux() and conc() are not implemented yet!

  # Test a single pHDrift() calculation
  checkEqualsNumeric(7.534,
    round(pHDrift(pHini = 7.5, alk = 0.00230, elapsed = 60), 3),
    msg = "A single pHDrift calculation")
}

test_checkId <- function() {
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
  checkEqualsNumeric(itm, itemNbr(newIds),
    msg = "itemNbr() extracts item number")

  bot <- c("a", "a", "a", "b", "c", "d", "e", "f")
  checkIdentical(bot, bottleId(newIds),
    msg = "bottleId() extracts bottle Id")

  cyc <- c(0, 0, 1, 4, 5, 2, 2, 6)
  checkEqualsNumeric(cyc, cycleNbr(newIds),
    msg = "cycleNbr() extracts cycle number")

  typ <- c("s", "s", "a", "a", "s", "s", "a", "s")
  checkIdentical(cyc, typeId(newIds),
    msg = "typeId() extracts type Id")
}
