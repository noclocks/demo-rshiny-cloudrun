FROM rocker/r-ver:latest AS base

RUN apt-get update -y -qq && apt-get -y --no-install-recommends install \
  make \
  git \
  pandoc \
  pandoc-citeproc \
  zlib1g-dev \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  libicu-dev \
  libjpeg-dev \
  libjq-dev \
  libglpk-dev \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get -y autoremove \
  && apt-get -y clean

RUN mkdir -p /usr/local/lib/R/etc/ /usr/lib/R/etc/

RUN echo "options(renv.config.pak.enabled = FALSE, repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" | tee /usr/local/lib/R/etc/Rprofile.site | tee /usr/lib/R/etc/Rprofile.site

RUN R -e 'install.packages("remotes")'

RUN Rscript -e 'remotes::install_version("pkgload",upgrade="never", version = "1.3.4")'
RUN Rscript -e 'remotes::install_version("knitr",upgrade="never", version = "1.47")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.8.1.1")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3.2")'
RUN Rscript -e 'remotes::install_version("testthat",upgrade="never", version = "3.2.1.1")'
RUN Rscript -e 'remotes::install_version("spelling",upgrade="never", version = "2.3.0")'
RUN Rscript -e 'remotes::install_version("rmarkdown",upgrade="never", version = "2.27")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.4.1")'

# RUN R -e 'remotes::install_version("renv", version = "1.0.3")'
# COPY renv.lock.prod renv.lock
# RUN R -e 'renv::restore()'

FROM base AS dev

# COPY renv.lock.prod renv.lock
# RUN R -e 'options(renv.config.pak.enabled = FALSE); renv::restore()'
# COPY *.tar.gz /app.tar.gz
# RUN R -e 'remotes::install_local("/app.tar.gz",upgrade="never")'
# RUN rm /app.tar.gz

RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
RUN rm -rf /build_zone

EXPOSE 5000
USER shiny

CMD R -e "options('shiny.port'=5000,shiny.host='0.0.0.0');library(rshinycloudrun);rshinycloudrun::run_app()"
