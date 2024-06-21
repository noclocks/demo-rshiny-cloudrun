#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    add_external_resources(),
    # Your application UI logic
    fluidPage(
      titlePanel("Hello World!"),
      sidebarLayout(
        sidebarPanel(
          sliderInput(
            "bins",
            "Number of Bins:",
            min = 1,
            max = 50,
            value = 30
          )
        ),
        mainPanel(
          plotOutput("distPlot")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
add_external_resources <- function() {
  shiny::addResourcePath(
    "www",
    app_sys("app/www")
  )

  tags$head(
    golem::favicon("favicon", ext = "png"),
    golem::bundle_resources(
      path = app_sys("app/www"),
      app_title = "Hello World!"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
