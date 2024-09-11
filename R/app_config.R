#' App Sys
#'
#' @description
#' Access files in the current app.
#'
#' @param ... (Optional) Character Vector(s) specifying paths and file(s)
#' within the R package's installation folder. Defaults to nothing which returns
#' the root of the app package folder.
#'
#' @return Character vector of positive length, containing the file paths that
#'   matched `...`, or the empty string, `""`, if none matched.
#'
#' @seealso [system.file()]
#'
#' @examples
#' config_file <- app_sys("config/config.yml")
app_sys <- function(...) {
  system.file(..., package = "rshinycloudrun")
}


#' Get App Config
#'
#' @description
#' Retrieves a value from the app package's configuration file, `config.yml`.
#'
#' @param value (Required) Value to retrieve from the config file.
#' @param config (Optional) Configuration environment to use. Defaults to the
#'   `APP_CONFIG_ACTIVE`'s environment variable, if available, and if not, uses
#'   `R_CONFIG_ACTIVE`'s environment variable. Finally if still unset,
#'   defaults to `default`.
#' @param use_parent (Optional) Logical, scan the parent directory for config file.
#'   Defaults to `TRUE`.
#' @param file (Optional) Character path to the location of the config file. Defaults
#'   to the `config.yml` file in the app package's root installation directory
#'   via `app_sys("config.yml")`.
#'
#' @return The value from the config file.
#'
#' @importFrom config get
get_app_config <- function(
  value,
  config = Sys.getenv(
    "APP_CONFIG_ACTIVE",
    Sys.getenv(
      "R_CONFIG_ACTIVE",
      "default"
    )
  ),
  use_parent = TRUE,
  file = app_sys("config.yml")
) {
  config::get(
    value = value,
    config = config,
    file = file,
    use_parent = use_parent
  )
}
