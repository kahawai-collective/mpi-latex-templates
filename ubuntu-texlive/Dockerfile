FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y tzdata
RUN echo "Pacific/Auckland" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get -y install locales
RUN locale-gen en_NZ.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get update && \
    apt upgrade --yes && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG en_NZ.UTF-8
ENV LANGUAGE en_NZ:en

RUN apt-get update && \
    apt-get install -y --no-install-recommends texlive-full biber software-properties-common devscripts && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Remove usenarrator=true from the apa style to avoid biber error
RUN perl -pi -e 's/usenarrator=true/} % usenarrator=true/' /usr/share/texlive/texmf-dist/tex/latex/biblatex-apa/apa.bbx

RUN apt-get update && \
    apt-get install -y --no-install-recommends debhelper && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-add-repository multiverse && \
    apt-get update && \
    apt-get install -y msttcorefonts && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY fonts/ /usr/local/share/fonts/
