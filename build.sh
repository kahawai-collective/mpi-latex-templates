#!/bin/bash
set -ex
export RUN=
export TEXINPUTS=.///:..//latex//:..//graphics//:

./package/debian/mpi-latex-templates.postinst

make
cp mpi-latex-templates*.deb /output/
cp latex/mpi.pdf /output/
cp examples/*.pdf /output/.
#cp examples/*.tex /output/
#cp examples/mpi-tables.tex /output/.
