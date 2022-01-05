# -------------------------------------------------------
#
# This image inherits uoa-inzight-lite-base:dev image,
# updates packages from docker.stat.auckland.ac.nz
# repository and installs the shiny app for Lite
#
# ----------------------------------------

FROM scienceis/uoa-inzight-lite-base:latest

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

ENV BUILD_DATE "2022-01-06"

RUN apt-get update --allow-releaseinfo-change

RUN apt-get update && apt-get install -y git

Run R -e "install.packages('shiny', type='source')"
RUN R -e "install.packages(c('survey', 'RcppTOML', 'srvyr', 'styler', 'readr', 'readtext'))"
RUN R -e "install.packages('https://r.docker.stat.auckland.ac.nz/src/contrib/iNZightPlots_2.13.5.tar.gz', repos = NULL, type = 'source', dependencies = TRUE)"
RUN R -e "install.packages('https://r.docker.stat.auckland.ac.nz/src/contrib/iNZightTools_1.12.1.tar.gz', repos = NULL, type = 'source', dependencies = TRUE)" \
  && rm -rf /tmp/* /var/tmp/*
