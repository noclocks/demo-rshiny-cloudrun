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
# golem::add_dockerfile_with_renv()
# dockerfiler::dock_from_desc()
# golem::add_dockerfile_with_renv(
#   output_dir = fs::path(getwd(), "build"),
#   from = "rocker/r-ver:latest"
# )

# Deployment -------------------------------------------------------------
options(cli.ignore_unknown_rstudio_theme = TRUE)
gcp_config <- config::get("gcp", file = "inst/config/config.yml")

cr_project_set(gcp_config$project_id)
cr_region_set(gcp_config$region)
cr_email_set(gcp_config$build_email)
cr_bucket_set(gcp_config$bucket)

repo <- cr_buildtrigger_repo("noclocks/demo-rshiny-cloudrun")

cr_deploy_docker_trigger(
  repo,
  image = "demo-rshiny-cloudrun"
)

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
