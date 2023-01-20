IMAGE ?= docker.dragonfly.co.nz/texlive-22.04

TEXINPUTS := .///:..//latex//:..//graphics//:
RUN ?= docker run -it --rm --net=host --user=$$(id -u):$$(id -g) -e RUN= -e TEXINPUTS=$(TEXINPUTS) -v$$(pwd):/work -w /work $(IMAGE)

#SHELL := /bin/bash
#LATEXMK_VERSION=$(strip $(patsubst Version,,$(shell latexmk -v | grep -oi "version.*")))
#ifeq ($(LATEXMK_VERSION),4.24)
#	LATEXMK_OPTIONS=-pdflatex=xelatex -latex=xelatex -pdf
#else
#	LATEXMK_OPTIONS=-xelatex
#endif
#
all: package/.build

examples/%.tex: examples/%.rnw
	cd examples && Rscript --vanilla -e "library(knitr);opts_chunk\$$set(warning=F, message = FALSE,echo=F,results='asis',fig.lp='fig:',fig.path='images/'); knit('$(<F)',output='$(@F)')"

examples/%.pdf: examples/%.tex examples/test.bib latex/mpi.pdf graphics/FAR.jpg latex/affiliation.dbx clean_examples
	$(RUN) bash -c "cd examples && xelatex $(*) && biber $(*) && xelatex $(*) && xelatex $(*)"

latex/mpi.pdf: latex/mpi.dtx latex/mpi.ins latex/affiliation.dbx clean_latex
	$(RUN) bash -c "cd latex && latex mpi.ins"
	$(RUN) bash -c "cd latex && xelatex mpi.dtx"

.PRECIOUS: package/.build
package/.build: examples/mpi-far.pdf examples/mpi-plenary.pdf examples/mpi-far-draft.pdf examples/mpi-aebr.pdf
	$(RUN) bash -c "cd package && debuild -us -uc && mv ../mpi-latex*{.dsc,.changes,.build,tar.xz} . && touch .build"

.PHONY: clean
clean: clean_examples clean_latex
	rm -rf package/debian/mpi-latex-templates/
	rm -f package/mpi-latex* package/debian/mpi-latex-templates.substvars package/debian/files
	rm -f package/debian/debhelper-build-stamp package/debian/mpi-latex-templates.debhelper.log
	rm -f mpi-latex-templates_*

.PHONY: clean_examples
clean_examples:
	rm -f  examples/*.log examples/*.aux examples/*.out examples/*.bbl examples/*.pdf examples/*.blg \
		examples/*.bcf examples/*.run.xml examples/*.toc examples/*-self.bib  examples/*.nav examples/*.snm \
		examples/*.fdb_latexmk  examples/*.fls

.PHONY: clean_latex
clean_latex:
	rm -f latex/*.cls latex/*.idx latex/*.sty  latex/*.fdb_latexmk latex/*.log latex/*.fls latex/*.ind \
		latex/*.out latex/*.aux latex/*.glo latex/*.pdf latex/*.toc latex/*.ilg

docker:
	docker build -t $(IMAGE) ubuntu-texlive
