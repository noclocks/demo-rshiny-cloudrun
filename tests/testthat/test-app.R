# Configure this test to fit your need
test_that(
  "app launches",
  {
    golem::expect_running(sleep = 5)
  }
)
