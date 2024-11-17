#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'
#' @import shiny
#' @noRd
#' @import datasets
#' @importFrom graphics hist
app_server <- function(input, output, session) {
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x <- datasets::faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    graphics::hist(x, breaks = bins, col = "darkgray", border = "white")
  })
}
