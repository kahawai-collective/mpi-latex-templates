FROM dragonflyscience/dragonfly-reports-22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends devscripts debhelper build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Run the same hacks that happen on package installation
COPY mpi-latex-templates.postinst /tmp/mpi-latex-templates.postinst
RUN bash /tmp/mpi-latex-templates.postinst
