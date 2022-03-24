test_that("ver_oldest works", {
  # deepdep version codes
  expect_equal(
    ver_oldest(sample(deepdep_versions)),
    deepdep_versions[1]
  )
  
  # lme version codes
  expect_equal(
    ver_oldest(sample(lme_versions)),
    lme_versions[1]
  )
  
  # subplex version codes
  expect_equal(
    ver_oldest(sample(subplex_versions)),
    subplex_versions[1]
  )
  
  # xtable version codes
  expect_equal(
    ver_oldest(sample(xtable_versions)),
    xtable_versions[1]
  )
})

test_that("ver_oldest considers no component to be alphanumerically first", {
  expect_equal(
    ver_oldest(sample(c("0.2.5", "0.2.5.1", "0.2.5.2", "0.2.5.3", "0.2.5.4"))),
    "0.2.5"
  )
})

test_that("ver_oldest extracts number subcomponent correctly", {
  # In other words, 10 > 9 (including 9b8a) in the case presented below
  expect_equal(
    ver_oldest(sample(c("3.10-0 (1999/06/26)", "3.9b8a-2 (1999/06/07)"))),
    "3.9b8a-2 (1999/06/07)"
  )
})

test_that("ver_oldest returns exactly one answer even if there are duplicates", {
  expect_equal(
    ver_oldest(sample(c("0.2.5", "0.2.5", "0.2.5.3", "0.2.5.4", "0.3.0"))),
    "0.2.5"
  )
})

test_that("ver_oldest accepts components without numbers", {
  expect_equal(
    ver_oldest(sample(letter_versions)),
    letter_versions[1]
  )
})

test_that("ver_oldest raises an exception when passed a vector of length 0", {
  expect_error(
    ver_oldest(character()),
    "cannot select oldest version when given empty input"
  )
})
