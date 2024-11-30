#!/bin/bash
set -ex
export RUN=
export TEXINPUTS=.///:..//latex//:..//graphics//:

    TEXMFLOCAL=/output
    echo copying apa.bbx into $TEXMFLOCAL
    mkdir -p ${TEXMFLOCAL}/tex/latex/
    cp -r /usr/share/texlive/texmf-dist/tex/latex/biblatex-apa ${TEXMFLOCAL}/tex/latex/
    echo patching apa.bbx to work with biber 2.17
    perl -p -e 's/usenarrator=true/} % usenarrator=true/' /usr/share/texlive/texmf-dist/tex/latex/biblatex-apa/apa.bbx > ${TEXMFLOCAL}/tex/latex/biblatex-apa/apa.bbx
    echo patching apa.bbx to disable "(APA 10.2:32) Remove PUBLISHER if it is the same as AUTHOR"
    perl -pi -e 's/(\\step\[fieldset=publisher, null\])/%% \1/' ${TEXMFLOCAL}/tex/latex/biblatex-apa/apa.bbx

# make
# cp mpi-latex-templates*.deb /output/
# cp latex/mpi.pdf /output/
# cp examples/*.pdf /output/.
# #cp examples/*.tex /output/
# #cp examples/mpi-tables.tex /output/.
