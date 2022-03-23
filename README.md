# versionsort

<!-- badges: start -->

[![CRAN status](https://www.r-pkg.org/badges/version/versionsort)](https://CRAN.R-project.org/package=versionsort) [![R-CMD-check](https://github.com/ErdaradunGaztea/versionsort/workflows/R-CMD-check/badge.svg)](https://github.com/ErdaradunGaztea/versionsort/actions) [![Codecov test coverage](https://codecov.io/gh/ErdaradunGaztea/versionsort/branch/master/graph/badge.svg)](https://app.codecov.io/gh/ErdaradunGaztea/versionsort?branch=master)

<!-- badges: end -->

`versionsort` is a lightweight, dependency-free package for sorting version codes. Version codes are considered to be strings of alphanumeric characters split into components by special characters acting as separators; most commonly a dot `.` or a dash `-`, but others are allowed as well.

## Why use versionsort?

*Can't I use base sort function?*

Base `sort()` is not suited to the task of sorting version codes. It sorts strings alphabetically, placing `1.0.10` between `1.0.1` and `1.0.2`, for example. `ver_sort()` places it behind `1.0.9` instead.

*What about less known base functions that handle version codes?*

There are functions like `numeric_version()` and `compareVersion()`. They are, however, much more limited in that they accept only numerical components in version codes. `versionsort` can handle letters, even if concatenated with numbers, allowing the user to work with version codes like `1.8b0a` and `0.3-10vcd1-devel`. It correctly detects `8` and `10` in these examples, placing these versions behind codes like `1.8.5` and `0.3-10` respectively.

*And what about other R packages?*

I'm not aware of any R package providing this functionality. Even if there is any, `versionsort` is designed to have simple, intuitive API with all functions having the same naming scheme of `ver_xxx()`, reducing the risk of name clash. Moreover, package developers should appreciate the strict "no dependencies" policy, so that importing `versionsort` inside their packages won't create indirect dependencies on another five or ten libraries.

## Installation

``` r
# Install from CRAN: 
install.packages("versionsort")

# Install the development version from GitHub:
# install.packages("devtools")
devtools::install_github("ErdaradunGaztea/versionsort")
```

## How to use versionsort?

`versionsort` has two main functions, mimicking base R division: `vec_order()` and `vec_sort()`.

``` r
library(versionsort)

version_codes <- c("1.5-0", "1.4-1", "0.0.0.9000", "1.4-0a", "1.4-0")
ver_order(version_codes)
# The two lines below are equivalent (but use the latter for code readability, whenever possible)
version_codes[ver_order(version_codes)]
ver_sort(version_codes)
```

There are also two functions dedicated to finding the code of the latest/oldest version, aptly named `vec_latest()` and `vec_oldest()`.

``` r
# We can reuse already defined vector of version codes
version_codes <- c("1.5-0", "1.4-1", "0.0.0.9000", "1.4-0a", "1.4-0")
ver_latest(version_codes)
vec_oldest(version_codes)
```

## End notes

I believe in equal rights and treatment for everybody, regardless of their sexuality, gender identity, skin tone, nationality, and other features beyond human control. Thus, I do not allow `versionsort` to be used in any project that promotes hate based on the aforementioned factors.
