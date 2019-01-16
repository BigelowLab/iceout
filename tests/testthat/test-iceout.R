context("Dataset integrity")
test_that("Datasets are unmangled", {

  tmpenv <- new.env()

  usgs <- data("usgs_iceout", package = "iceout", envir = tmpenv)
  me <- data("me_iceout", package = "iceout", envir = tmpenv)
  mn <- data("mn_iceout", package = "iceout", envir = tmpenv)

  expect_equal(usgs, "usgs_iceout")
  expect_equal(me, "me_iceout")
  expect_equal(mn, "mn_iceout")

  expect_equal(dim(tmpenv[["usgs_iceout"]]), c(3372, 9))
  expect_equal(dim(tmpenv[["me_iceout"]]), c(1131, 6))
  expect_equal(dim(tmpenv[["mn_iceout"]]), c(10261, 10))

})

context("Plotting operations")
test_that("Plots compose and build correctly", {

  gg1 <- plot_iceout("usgs", "New Hampshire", "First.Conn")
  gb1 <- ggplot2::ggplot_build(gg1)

  expect_is(gg1, "gg")
  expect_equal(dim(gb1$data[[1]]), c(86, 10))

  gg2 <- plot_iceout("me", "Maine", "Long Pond", town = "Belgrade")
  gb2 <- ggplot2::ggplot_build(gg2)

  expect_is(gg2, "gg")
  expect_equal(dim(gb2$data[[1]]), c(11, 10))

  gg3 <- plot_iceout("mn", "Minnesota", "Minnewaska")
  gb3 <- ggplot2::ggplot_build(gg3)

  expect_is(gg3, "gg")
  expect_equal(dim(gb3$data[[1]]), c(306, 10))

})
