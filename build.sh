#!/bin/bash
set -ex
export RUN= 
export TEXINPUTS=.///:..//latex//:..//graphics//: 
make
cp mpi-latex-templates*.deb /output/

