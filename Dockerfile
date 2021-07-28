# ----------------------------------------
#
# The primary intention of this image is to inherit
# uoa-inzight-base image and install Lite specific 
# packages
#
# ----------------------------------------
FROM scienceis/uoa-inzight-lite-base:latest

MAINTAINER "Science IS Team" ws@sit.auckland.ac.nz

ENV BUILD_DATE "2021-07-28"

# Install (via R) all of the necessary packages (R will automatially install dependencies):
RUN R -e "install.packages(c('survey', 'RcppTOML', 'srvyr', 'styler'))" 
RUN R -e "install.packages('https://r.docker.stat.auckland.ac.nz/src/contrib/iNZightPlots_2.13.4.tar.gz', repos = NULL, type = 'source', dependencies = TRUE)"
RUN R -e "install.packages('https://r.docker.stat.auckland.ac.nz/src/contrib/iNZightTools_1.11.3.tar.gz', repos = NULL, type = 'source', dependencies = TRUE)" \
  && rm -rf /tmp/* /var/tmp/*
