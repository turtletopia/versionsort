#' Order version codes
#'
#' @description `ver_order()` returns the permutation that rearranges a vector
#' of version codes alphanumerically.
#'
#' @param x [`character()`]\cr
#'  A vector of version codes that start with a number (as in "1.5.0"), i.e.
#'  without initial "v" (as in "v1.5.0").
#'
#' @return An integer vector (for details see \code{\link[base]{order}}).
#'
#' @examples
#' version_codes <- c("1.5-0", "1.4-1", "0.0.0.9000", "1.4-0a", "1.4-0")
#' ver_order(version_codes)
#' # The line below is the same as ver_sort(version_codes)
#' version_codes[ver_order(version_codes)]
#'
#' @seealso \code{\link{ver_sort}()}
#' @export
ver_order <- function(x) {
  version_components <- strsplit(x, "[^\\w]+", perl = TRUE)
  Reduce(
    function(list_order, position) {
      # Extract n-th components of version code
      # Empty components are extracted as NA (e.g. 4-th component of 1.5.0)
      nth_components <- vapply(
        version_components[list_order], `[`, FUN.VALUE = character(1), position
      )
      # Separate NA components
      empty_components_indices <- which(is.na(nth_components))
      other_components_indices <- which(!is.na(nth_components))
      nth_components <- nth_components[other_components_indices]
      # Split components into initial numeric value and additional code
      # e.g. "0b8a" => 0 + "b8a"
      initial_number_match <- regexpr("^\\d+", nth_components)
      initial_number <- as.numeric(
        substring(nth_components, 1, attr(
          initial_number_match, "match.length", exact = TRUE)
        )
      )
      additional_code <- substring(nth_components, 1 + attr(
        initial_number_match, "match.length", exact = TRUE)
      )
      # Order code alphabetically, then number numerically
      # Append empty components' indices at the beginning
      code_order <- order(additional_code, na.last = TRUE)
      list_order[
        c(empty_components_indices,
          other_components_indices[code_order][order(initial_number[code_order], na.last = TRUE)])
      ]
    },
    rev(seq_len(max(lengths(version_components)))),
    init = seq_along(version_components)
  )
}

#' Sort version numbers
#'
#' @description `ver_sort()` returns a sorted vector of version codes, where
#' sorting is done alphanumerically.
#'
#' @inheritParams ver_order
#'
#' @return A character vector containing the same elements as input, but
#' reordered.
#'
#' @examples
#' ver_sort(c("1.5-0", "1.4-1", "0.0.0.9000", "1.4-0a", "1.4-0"))
#'
#' @seealso \code{\link{ver_order}()}
#' @export
ver_sort <- function(x) {
  x[ver_order(x)]
}
