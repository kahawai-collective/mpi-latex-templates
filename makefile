SHELL := /bin/bash
PREFIX := TEXINPUTS=.///:
LATEXMK_VERSION=$(strip $(patsubst Version,,$(shell latexmk -v | grep -oi "version.*")))
ifeq ($(LATEXMK_VERSION),4.24)
	LATEXMK_OPTIONS=-pdflatex=xelatex -latex=xelatex -pdf 
else
	LATEXMK_OPTIONS=-xelatex
endif

all: mpi.pdf mpi-far.pdf

mpi-far.pdf: mpi-far.tex test.bib mpi.sty FAR.jpg 
	$(PREFIX) latexmk $(LATEXMK_OPTIONS) mpi-far.tex

mpi.sty: mpi.ins mpi.dtx 
	latex mpi.ins

mpi.pdf: mpi.dtx mpi.sty
	$(PREFIX) latexmk $(LATEXMK_OPTIONS) mpi.dtx

pkg:
	debuild -us -uc

.PHONY: cleanClass clean

cleanClass:
	rm -f mpi.sty mpi.pdf \
		mpi-far.cls mpi-aebr.cls

clean: cleanClass
	rm -f  *.pdf *.aux *.log *.out *.backup *.glo *.idx \
		 *.fdb_latexmk *.fls *-self.bib *.toc *.snm *.nav \
		 *.ilg *-blx.bib *.run.xml *.bbl *.ind *.blg *.bcf \
		 *.xwm
