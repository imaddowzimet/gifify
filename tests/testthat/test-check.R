context("gifify")

testthat::test_that("throws error", {
  testthat::expect_error(
    gifify("Langoliers clip.mov", text = c("", "", ""), cut = 70)
  )
})
