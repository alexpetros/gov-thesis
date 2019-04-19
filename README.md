# Introduction
Hi! This my thesis for the Dartmouth Government department. This project contains the source code required to build the actual thesis, as well as the images included in each chapter and the R scripts that build them. This project is mostly quantitative, but if you're interested in any of the data that I used, you can find it uploaded here as well.

# Build Instructions
## Requirements
* A TeX installation 
* latexmk (likely comes with your TeX installation)

## Commands
* `make` builds the thesis and outputs a `thesis.pdf` file in the top directory
* `make open` builds the thesis and then opens the pdf for you in your preferred reader
* `make clean` removes all the artifact files. Note that right now it will not remove the build artifacts if you built a chapter as a standalone

# Notes
## Technical problems
I couldn't get the `standalone` package to work perfectly, so if you would like to build an individual chapter, uncomment its bibliography and build it with LaTeXTools. I will try to automate this process with the makefile in the future.

If you get an error that says `../thesis.bib` can't be found, that means you didn't comment out one of the bibliography imports in a subfile. 

## To-do
* Finish conclusion 
* Move HUMINT chapter to the front, finish with some damaging examples
* Introduction needs more damaging examples, convincing puzzle 
* A few more graphics 
