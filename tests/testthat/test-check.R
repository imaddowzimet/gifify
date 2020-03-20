context("gifify")

testthat::test_that("throws error", {
  testthat::expect_error(
    videolink <- "Langoliers clip.mov",
    text  <- c("", "", ""),
    gifify(videolink, text = text, cut = 70)
  )
})
