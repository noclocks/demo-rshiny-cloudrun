# syntax=docker/dockerfile:1

FROM rocker/r-ver:latest AS base
FROM base AS build

RUN apt-get update -y -qq && apt-get -y --no-install-recommends install \
  make \
  git \
  pandoc \
  zlib1g-dev \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  libicu-dev \
  libjpeg-dev \
  libjq-dev \
  libglpk-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN Rscript -e 'install.packages("pak")'
RUN mkdir /build
ADD . ./build
WORKDIR /build
RUN Rscript -e 'pak::local_install(ask = FALSE)'
WORKDIR /
RUN rm -rf /build

FROM base AS final

COPY --from=build --chown=shiny /usr/local/lib/R/site-library /usr/local/lib/R/site-library
COPY --from=build --chown=shiny /usr/local/lib/R/library /usr/local/lib/R/library
ARG UID=10001
RUN adduser \
  --disabled-password \
  --gecos "" \
  --home "/nonexistent" \
  --shell "/sbin/nologin" \
  --no-create-home \
  --uid "${UID}" \
  shiny
USER shiny
EXPOSE 5000
ENV PORT=5000
ENV R_CONFIG_ACTIVE="production"
CMD [ "R", "-e", "options('shiny.port'=5000,'shiny.host'='0.0.0.0');library(rshinycloudrun);rshinycloudrun::run_app()" ]
