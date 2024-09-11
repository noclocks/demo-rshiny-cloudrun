<h1 align="center">R Shiny App on GCP Cloud Run Demo</h1>

<p align="center"><a href="CHANGELOG.md">Changelog</a>  &middot;  <a href="https://docs.noclocks.dev/gmhleasrdemo-rshiny-cloudrun/">Documentation</a>  &middot;  <a href="https://github.com/noclocks/demo-rshiny-cloudrun/pkgs/container/demo-rshiny-cloudrun">Docker Containers</a></p>

<p align="center">
  <img src="man/figures/r-shiny.svg" width="100px" height="auto" alt="R Shiny"/>
  <img src="man/figures/google-cloud-run-svgrepo-com.svg" width="100px" height="auto" alt="Google Cloud Run"/>
</p>

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&pause=1000&center=true&vCenter=true&multiline=true&width=450&height=80&lines=R+Shiny+Google+Cloud+Run;Built+by+No+Clocks%2C+LLC" alt="Typing SVG"/>
</p>

***

> [!NOTE]
> This is an R package built by [No Clocks, LLC](https://noclocks.dev) for demonstration purposes.
> It aims to showcase how to develop and deploy an R Shiny app as a package to Google Cloud Platform's (GCP) Cloud Run
>service using Docker.

***

## Contents

- [Badges](#badges)
- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
- [Deployment](#deployment)
  - [Pre-Requisites](#pre-requisites)
- [Code of Conduct](#code-of-conduct)

## Badges

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Build and Push to GHCR](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/docker-ghcr.yml/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/docker-ghcr.yml)
[![Build and Deploy to Cloud Run](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/docker-gcp.yml/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/docker-gcp.yml)
[![R CMD Check](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/check.yml/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/check.yml)
[![Test Coverage](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/coverage.yml/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/coverage.yml)
[![Code Style](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/style.yml/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/style.yml)
[![Lint](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/lint.yml/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/lint.yml)
[![Dependabot Updates](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/dependabot/dependabot-updates)
[![Document (Roxygen)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/roxygen.yml/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/roxygen.yml)
[![pages-build-deployment](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/pages/pages-build-deployment)
[![pkgdown](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/pkgdown.yml/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/pkgdown.yml)
[![Pkgdown Multi](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/pkgdown-multi.yml/badge.svg)](https://github.com/noclocks/demo-rshiny-cloudrun/actions/workflows/pkgdown-multi.yml)
<!-- badges: end -->

## Overview

This repository contains an R package that demonstrates how to build and deploy an R Shiny app to Google Cloud Platform's
(GCP) Cloud Run service using Docker.

## Installation

You can install the development version of `rshinycloudrun` from GitHub with your preferred installation method below:

> [!WARNING]
> Notice that although the R package is named `rshinycloudrun`, the GitHub repository is named `demo-rshiny-cloudrun`.
> This is for internal organization purposes and should not affect the installation process.

```r
# Install using remotes
remotes::install_github("noclocks/demo-rshiny-cloudrun")

# Or using devtools
devtools::install_github("noclocks/demo-rshiny-cloudrun")

# Or using pak
pak::pkg_install("noclocks/demo-rshiny-cloudrun")
```

## Usage

Once installed, you can load the package and run the Shiny app using the following commands:

```r
library(rshinycloudrun)
run_app()
```

## Deployment

The package is set up to build and deploy the R Shiny app to Google Cloud Platform's (GCP) Cloud Run service using Docker.

### Pre-Requisites

1. [Google Cloud Platform (GCP) Account](https://cloud.google.com/)
2. [Docker Desktop](https://www.docker.com/products/docker-desktop)
3. [R](https://www.r-project.org/)
4. [RStudio](https://www.rstudio.com/products/rstudio/download/)
5. [R Shiny](https://shiny.rstudio.com/)
6. [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
7. [Google Cloud Run](https://cloud.google.com/run/docs/quickstarts/build-and-deploy)

## Code of Conduct

Please note that the `rshinycloudrun` package is released with a
[Contributor Code of Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

***

© 2024 [No Clocks, LLC](https://noclocks.dev)
