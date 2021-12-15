
# versionsort

<!-- badges: start -->
[![R-CMD-check](https://github.com/ErdaradunGaztea/versionsort/workflows/R-CMD-check/badge.svg)](https://github.com/ErdaradunGaztea/versionsort/actions)
[![Codecov test coverage](https://codecov.io/gh/ErdaradunGaztea/versionsort/branch/master/graph/badge.svg)](https://app.codecov.io/gh/ErdaradunGaztea/versionsort?branch=master)
<!-- badges: end -->

`versionsort` is a lightweight, dependency-free package for sorting version codes. Version codes are considered to be strings of alphanumeric characters split into components by the following separators: a quotation mark `"`, a dash `-`, and a space ` `.

## Installation

``` r
# Install the development version from GitHub:
# install.packages("devtools")
devtools::install_github("ErdaradunGaztea/versionsort")
```

## Why use versionsort?

`versionsort` sorts version codes better than base sort function. Most importantly, it'll place `1.0.10` behind `1.0.9` instead of between `1.0.1` and `1.0.2`. It can handle letters too, even concatenated with numbers. For example, `versionsort` will correctly detect `8` and `10` in `1.8b0a` and `0.3-10vcd1-devel`. It won't drop the rest of the code, though, correctly placing these after `1.8` and `0.3-10` versions.

Basically, `versionsort` has two functions, mimicking base R division: `vec_order()` and `vec_sort()`.

``` r
library(versionsort)

version_codes <- c("1.5-0", "1.4-1", "0.0.0.9000", "1.4-0a", "1.4-0")
ver_order(version_codes)
# The two lines below are equivalent (but use the latter for code readability, whenever possible)
version_codes[ver_order(version_codes)]
ver_sort(version_codes)
```
