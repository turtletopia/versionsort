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
      # Early return if the solution was found
      if (length(indices) == 1) return(indices)
      
      # Extract n-th components of version code
      # Empty components are extracted as NA (e.g. 4-th component of 1.5.0)
      nth_components <- vapply(
        version_components[indices], `[`, FUN.VALUE = character(1), position
      )
      if (all(is.na(nth_components))) return(indices)
      
      # Omit NA components (it is guaranteed that there is at least one non-NA component)
      indices <- indices[which(!is.na(nth_components))]
      nth_components <- vapply(
        version_components[indices], `[`, FUN.VALUE = character(1), position
      )
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
      # Compare numeric values first
      indices <- indices[which(initial_number == max(initial_number))]
      
      # Compare codes only if necessary
      if (length(indices) > 1 & any(additional_code != "")) {
        indices <- indices[which(additional_code == max(additional_code))]
      }
      indices
    },
    seq_len(max(lengths(version_components))),
    init = seq_along(version_components)
  )
  x[ret[1]]
}