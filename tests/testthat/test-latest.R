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
