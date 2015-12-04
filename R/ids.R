## Functions to extract information for chemostat Ids
## Old convention:
## Reactor or set = [R|A-C], reactor # = [1-4] bottle series # = [I|II|III],
## addition or sampling = [a|s], cycle = [0-9]+
## Ex.: R1Is0, A3IIa6, C4IIIs8
##
## New convention:
## Reactor # [A-Z], reactor or set [0-9], bottle series # = [a-z],
## cycle [0-9][0-9], addition or sampling [a|s]

#' Conversion from old to new chemostat Ids, and check these Ids
#'
#' @param Ids The old Ids
#' @export
#'
#' @examples
#' oldIds <- c("R1Is0", "R4Is0", "A1Ia1", "A2IIa4", "B3IIIs5",
#'             "C4IVs2", "B1Va2", "C4VIs6")
#' checkId(oldIds)
#' newIds <- c("A0a00s", "D0a00s", "A1a01a", "B1b04a", "C2c05s",
#'             "D3d02s", "A2e02a", "D3f06s")
#' checkId(newIds)
checkId <- function(Ids) {
  if (!is.character(Ids) && !is.factor(Ids))
    stop("'Ids' must be a character string")
  Ids <- as.character(Ids)
  ## Do we have an old format?
  oldForm <- grepl("^[A-Z][0-9]II?I?[as][0-9]+$", Ids[1])
  if (oldForm) {
    ## R, or A, B, C, ... becomes 0 or 1, 2, 3, ...
    reactSet <- c(R = 0, A = 1, B = 2, C = 3, D = 4, E = 5)[
      substring(Ids, 1, 1)]
    ## Reactor 1, 2, 3, ... becomes A, B, C, ...
    reactor <- LETTERS[as.integer(substring(Ids, 2, 2))]
    ## Bottle series I, II, III, IV, V, VI becomes a, b, c, d, e, f
    botSer <- c(I = "a", II = "b", III = "c", IV = "d", V = "e", VI = "f")[
      substring(Ids, 3, nchar(Ids) - 2)]
    ## Add or sample and cycle from two last chars
    Ids2 <- substring(Ids, nchar(Ids) - 1)
    addOrSamp <- substring(Ids2, 1, 1)
    ## Cycle is formatted on two digits, e.g., "01"
    cycle <- formatC(as.integer(substring(Ids2, 2, 2)), width = 2, flag = "0")

    ## Calculated converted strings
    res <- paste0(reactor, reactSet, botSer, cycle, addOrSamp)
  } else res <- Ids # No conversion needed

  ## Check that result is correct
  if (!all(grepl("^[A-Z][0-9][a-z][0-9][0-9][as]$", res))) {
    print(res)
    stop("Error in one or more ids")
  }
  res
}

#' @describeIn checkId Get Id of the reactor
#' @export
reactorId <- function(Ids)
    substring(checkId(Ids), 1, 1)

#' @describeIn checkId Get the item number form its Id
#' @export
itemNbr <- function(Ids)
    as.integer(substring(checkId(Ids), 2, 2))

#' @describeIn checkId Get the bottle set Id
#' @export
bottleId <- function(Ids)
    substring(checkId(Ids), 3, 3)

#' @describeIn checkId Get the cycle number
#' @export
cycleNbr <- function(Ids)
    as.integer(substring(checkId(Ids), 4, 5))

#' @describeIn checkId Get the type (addition or sampling)
#' @export
typeId <- function(Ids)
    substring(checkId(Ids), 6, 6)
