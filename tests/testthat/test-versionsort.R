test_that("ver_sort works", {
  # deepdep version codes
  expect_equal(
    ver_sort(sample(deepdep_versions)),
    deepdep_versions
  )

  # lme version codes
  expect_equal(
    ver_sort(sample(lme_versions)),
    lme_versions
  )

  # subplex version codes
  expect_equal(
    ver_sort(sample(subplex_versions)),
    subplex_versions
  )

  # xtable version codes
  expect_equal(
    ver_sort(sample(xtable_versions)),
    xtable_versions
  )
})

test_that("ver_order returns empty vector if input is empty too", {
  expect_equal(
    ver_order(character()),
    integer()
  )
})

test_that("ver_sort returns empty vector if input is empty too", {
  expect_equal(
    ver_sort(character()),
    character()
  )
})

test_that("ver_sort accepts components without numbers", {
  expect_equal(
    ver_sort(sample(letter_versions)),
    letter_versions
  )
})
