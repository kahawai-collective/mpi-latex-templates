MPI Latex Templates
=========================

This package generates LaTeX class and style files to create documents in the 
format needed for MPI science reports.

## Installing the package

1. Download the latest debian file from https://gorbachev.io/#/report/MPI-Latex-Templates
2. Run `sudo dpkg -i ../mpi-latex-templates_XXX_all.deb`, where `XXX` is the version number of the package

## Using the package

At this point the following latex classes will be available for you to use:

 - mpi-aebr
 - mpi-far


## Documentation

General documentation is generated in the file `mpi.pdf`. There is an example 
far.tex file in the examples directory showing how the package can be used. 

## Incompatible Packages

The MPI package will not work correctly with the following packages:

 - subfig (use subcaption instead)

## Building the package on Ubuntu

1. Checkout the branch corresponding to the version of Ubuntu that you are using 
    (this makes sure that the right version of biber and biblatex are used).
2. Run `make`. If you don't have access to docker.dragonfly.co.nz, run
    `export RUN= && export TEXINPUTS=.///:..//latex//:..//graphics//: && make`, 
    to build without using docker. You will neeed to have the `texlive-full` and `biber`
    packages installed.

## Example references from the MPI style guide

Cooke, J.G. (1994). Nutrient transformations in a natural wetland receiving sewage effluent and the implications for waste treatment. *Water Science and Technology 29 (4)*: 209–217.

Constable, J.D.; Scott, P.H.; Connor, M.A. (1989). Fixed bed nitrification as a potential means of enhancing nitrogen removal rates in a sewage lagoon. *In*: Australian Water and Wastewater Association, Proceedings of the 13th Federal Convention. pp 192–196. 6–10 March 1989, Canberra.
 
Ayling, T.; Cox, G. (1982). Collins guide to the sea fishes of New Zealand. Collins, Auckland. 343 p. 
