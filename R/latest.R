#' Find the latest version code
#'
#' @description `ver_latest()` returns the latest of the version codes.
#'
#' @inheritParams ver_order
#'
#' @return A character vector with one element.
#'
#' @examples
#' ver_latest(c("1.3-0", "1.4-1", "0.0.0.9000", "1.4-0a", "1.4-0"))
#'
#' @export
ver_latest <- function(x) {
  version_components <- strsplit(x, "[^\\w]+", perl = TRUE)
  ret <- Reduce(
    function(indices, position) {
      # Extract n-th components of version code
      # Empty components are extracted as NA (e.g. 4-th component of 1.5.0)
      nth_components <- vapply(
        version_components[indices], `[`, FUN.VALUE = character(1), position
      )
      if (all(is.na(nth_components))) return(indices)
      # Filter out all indices that are not equal to the maximum
      Filter(
        function(index) {
          version_components[[index]][position] == max(nth_components, na.rm = TRUE)
        },
        indices
      )
    },
    seq_len(max(lengths(version_components))),
    init = seq_along(version_components)
  )
  x[ret[length(ret)]]
}