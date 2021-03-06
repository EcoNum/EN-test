
# Test code for EcoNum

[![Linux & OSX Build Status](https://travis-ci.com/EcoNum/EN-test.svg)](https://travis-ci.com/EcoNum/EN-test)
[![Win Build Status](https://ci.appveyor.com/api/projects/status/750dxtbp6ukrkluf?svg=true)](https://ci.appveyor.com/project/phgrosjean/en-test)
[![Coverage Status](https://img.shields.io/codecov/c/github/EcoNum/EN-test/master.svg)
](https://codecov.io/github/EcoNum/EN-test?branch=master)
[![CRAN Status](https://www.r-pkg.org/badges/version/ENtest)](https://cran.r-project.org/package=ENtest)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://www.gnu.org/licenses/MIT)


_**Warning:** This is a temporary repository for test code. Don't use this for production!_


## Installation

Make sure you have the **devtools** R package installed:

```r
install.packages("devtools")
```

Use `install_github()` to install the **ENtest** package:

```r
devtools::install_github("EcoNum/EN-test")
```
    
R should install all required dependencies automatically, and then it should compile and install **ENtest**.

Latest devel version also available in sources and Windows binaries at [appveyor](https://ci.appveyor.com/project/phgrosjean/en-test/build/artifacts) _(only available if passing last Windows build!)_.


## Usage

Make the **ENtest** package available in your R session:

```r
library("ENtest")
```
    
Get help about this package:

```r
library(help = "ENtest")
?ENtest
```
