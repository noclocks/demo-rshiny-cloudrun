#  ------------------------------------------------------------------------
#
# Title : Package Initialization Script
#    By : Jimmy Briggs
#  Date : 2024-08-13
#
#  ------------------------------------------------------------------------

# library -----------------------------------------------------------------
require(usethis)
require(noclocksr)

# initialize --------------------------------------------------------------
usethis::create_package("rshinycloudrun")
usethis::use_directory("dev", TRUE)
usethis::use_namespace()
usethis::use_roxygen_md()
usethis::use_readme_md()
usethis::use_mit_license("No Clocks, LLC")
usethis::use_git()
usethis::use_github()
usethis::use_github_links()
usethis::use_pkgdown_github_pages()
usethis::use_package_doc()
usethis::use_import_from("rlang", ".data")
usethis::use_import_from("rlang", ".env")
usethis::use_import_from("tibble", "tibble")
usethis::use_import_from("glue", "glue")
usethis::use_tibble()
attachment::att_amend_desc()
devtools::document()

# authors -----------------------------------------------------------------

usethis::use_author(
  "Jimmy",
  "Briggs",
  email = "jimmy.briggs@noclocks.dev",
  role = c("aut", "cre"),
  comment = c(ORCID = "0000-0002-7489-8787")
)

usethis::use_author(
  "Patrick",
  "Howard",
  email = "patrick.howard@noclocks.dev",
  role = c("aut", "rev")
)

usethis::use_author(
  "No Clocks, LLC",
  email = "team@noclocks.dev",
  role = c("cph", "fnd")
)


# github actions ----------------------------------------------------------

usethis::use_github_action(
  name = "document",
  save_as = "roxygen.yml",
  badge = TRUE
)

usethis::use_github_action(
  name = "lint",
  save_as = "lint.yml",
  badge = TRUE
)

usethis::use_github_action(
  name = "pr-commands",
  save_as = "pull-requests.yml",
  badge = TRUE
)

usethis::use_github_action(
  name = "style",
  save_as = "style.yml",
  badge = TRUE
)

usethis::use_github_action(
  name = "test-coverage",
  save_as = "coverage.yml",
  badge = TRUE
)

usethis::use_github_action(
  name = "check-standard",
  save_as = "check.yml",
  badge = TRUE
)

# testing -----------------------------------------------------------------
usethis::use_testthat()
usethis::use_spell_check()
shinytest2::use_shinytest2()
# In your package code, use `rlang::is_installed("shinytest2")` or
# `rlang::check_installed("shinytest2")` to test if shinytest2 is installed.
# Then directly refer to functions with `shinytest2::fun()`.

usethis::use_coverage()


# initial docs ------------------------------------------------------------

usethis::use_vignette("rshinycloudrun", "rshinycloudrun")
usethis::use_vignette("decisions", "Architecture Decision Records")

usethis::use_lifecycle_badge("Experimental")
usethis::use_news_md(open = FALSE)

usethis::use_logo("man/figures/noclocks-logo-circular-texturized.png")

golem::use_favicon(
  "https://raw.githubusercontent.com/noclocks/noclocks-brand/main/src/images/favicons/favicon.ico"
)

# setup config and encryption ---------------------------------------------
# cfg <- yaml::read_yaml("_config.yml")
noclocksr::cfg_init()
noclocksr::cfg_hooks_init()
