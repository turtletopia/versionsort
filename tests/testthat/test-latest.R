test_that("ver_latest works", {
  # deepdep version codes
  expect_equal(
    ver_latest(sample(deepdep_versions)),
    deepdep_versions[length(deepdep_versions)]
  )
  
  # lme version codes
  expect_equal(
    ver_latest(sample(lme_versions)),
    lme_versions[length(lme_versions)]
  )
  
  # subplex version codes
  expect_equal(
    ver_latest(sample(subplex_versions)),
    subplex_versions[length(subplex_versions)]
  )
  
  # xtable version codes
  expect_equal(
    ver_latest(sample(xtable_versions)),
    xtable_versions[length(xtable_versions)]
  )
})

test_that("ver_latest considers no component to be alphanumerically first", {
  expect_equal(
    ver_latest(sample(c("0.2.2", "0.2.5", "0.2.5.2", "0.2.5.3", "0.2.5.4"))),
    "0.2.5.4"
  )
})

test_that("ver_latest extracts number subcomponent correctly", {
  # In other words, 10 > 9 (including 9b8a) in the case presented below
  expect_equal(
    ver_latest(sample(c("3.10-0 (1999/06/26)", "3.9b8a-2 (1999/06/07)"))),
    "3.10-0 (1999/06/26)"
  )
})

test_that("ver_latest returns exactly one answer even if there are duplicates", {
  expect_equal(
    ver_latest(sample(c("0.2.5", "0.2.5.3", "0.2.5.4", "0.3.0", "0.3.0"))),
    "0.3.0"
  )
})

test_that("ver_latest accepts components without numbers", {
  expect_equal(
    ver_latest(sample(letter_versions)),
    letter_versions[length(letter_versions)]
  )
})

test_that("ver_latest raises an exception when passed a vector of length 0", {
  expect_error(
    ver_latest(character()),
    "cannot select latest version when given empty input"
  )
})
