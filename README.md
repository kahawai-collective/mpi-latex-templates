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

## Using the package on Windows 10

The package can be used on Windows 10 (and optionally with TeXstudio) as follows:

1. Follow the instructions at https://marcus.handte.org/2017/11/18/using-texstudio-with-texlive-from-ubuntu-on-wsl/ but applying these additions/corrections:
   - (step 1) run `sudo apt-get update` (and, ideally, `sudo apt-get upgrade`) before installing texlive
   - (step 1) install the texlive-full package instead of the various texlive packages mentioned: `sudo apt-get install texlive-full`. This takes a while.  The full texlive distribution may be overkill for many purposes, but it is currently a dependency of mpi-latex-templates.
   - (step 4) when configuring the commands in TeXstudio (Options->Configure TeXstudio->Commands) refer to the image https://marcus.handte.org/wp-content/uploads/sites/2/2017/11/texstudio-1024x669.jpg and see section 1.2 of the TeXstudio manual
   - (step 4) in the TeXstudio build options (Options->Configure TeXstudio->Build) set XeLaTeX as the Default Compiler and Biber as the Default Bibliography Tool

2. Install mpi-latex-templates within the WSL Ubuntu shell as described above (Installing the package).
