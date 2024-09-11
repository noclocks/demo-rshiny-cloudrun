test_that("app server", {
  server <- app_server
  expect_type(server, "closure")
  fmls <- formals(app_server)
  for (i in c("input", "output", "session")) {
    expect_true(i %in% names(fmls))
  }
})

testServer(app_server, {

  # Set and test an input
  session$setInputs(bins = 2)
  expect_equal(input$bins, 2)

})

