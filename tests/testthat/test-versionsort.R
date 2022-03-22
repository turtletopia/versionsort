test_that("vsort works", {
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
