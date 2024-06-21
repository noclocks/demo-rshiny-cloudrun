FROM rocker/verse:4.4.1
RUN apt-get update && apt-get install -y   && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/local/lib/R/etc/ /usr/lib/R/etc/
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" | tee /usr/local/lib/R/etc/Rprofile.site | tee /usr/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_version("pkgload",upgrade="never", version = "1.3.4")'
RUN Rscript -e 'remotes::install_version("knitr",upgrade="never", version = "1.47")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.8.1.1")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3.2")'
RUN Rscript -e 'remotes::install_version("testthat",upgrade="never", version = "3.2.1.1")'
RUN Rscript -e 'remotes::install_version("spelling",upgrade="never", version = "2.3.0")'
RUN Rscript -e 'remotes::install_version("rmarkdown",upgrade="never", version = "2.27")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.4.1")'
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
RUN rm -rf /build_zone
EXPOSE 80
CMD R -e "options('shiny.port'=80,shiny.host='0.0.0.0');library(rshinycloudrun);rshinycloudrun::run_app()"
