require(googleAuthR)
require(googleCloudRunner)
require(devtools)
require(golem)
require(dockerfiler)
require(config)

# Check & Build -----------------------------------------------------------
devtools::check()
devtools::build()

# Dockerfile --------------------------------------------------------------
dockerfiler::dock_from_desc()

# Deployment -------------------------------------------------------------
library(googleCloudRunner)
options(cli.ignore_unknown_rstudio_theme = TRUE)

gcp_config <- config::get("gcp", file = "inst/config/config.yml")

# Sys.setenv(
#   "GCE_DEFAULT_PROJECT_ID" = gcp_config$project_id,
#   "GAR_CLIENT_JSON" = gcp_config$client_json,
#   "GCE_AUTH_FILE" = gcp_config$auth_file,
#   "GCS_DEFAULT_BUCKET" = gcp_config$bucket,
#   "CR_REGION" = gcp_config$region,
#   "CR_BUILD_EMAIL" = gcp_config$build_email
# )

golem::add_dockerfile_with_renv()

cr_project_set(gcp_config$project_id)
cr_region_set(gcp_config$region)
cr_email_set(gcp_config$build_email)
cr_bucket_set(gcp_config$bucket)



googleCloudRunner::cr_deploy_docker(
  local = getwd(),
  image_name = pkgload::pkg_name(),
  remote = pkgload::pkg_name(),
  tag = c("latest", "$BUILD_ID"),
  timeout = 600L,
  bucket = gcp_config$bucket,
  projectId = gcp_config$project_id,
  launch_browser = TRUE,
  kaniko_cache = TRUE,
  predefinedAcl = "bucketOwnerFullControl"
)

# golem::add_dockerfile_with_renv(
#   output_dir = fs::path(getwd(), "build"),
#   from = "rocker/r-ver:latest"
# )
