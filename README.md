# Reciprocal Tolerance 
## Introduction
Hi! This my thesis for the Dartmouth Government department. This project contains the source code required to build the actual thesis, as well as the images included in each chapter and the R scripts that build them. This project is mostly quantitative, but if you're interested in any of the data that I used, you can find it uploaded here as well.

## Build Instructions
### Requirements
You need a TeX installation with pdflatex, biber, and latexmk. If you've ever built a TeX file locally, you almost certainly have all of these. 

If you don't have one, search around. For OSX, `brew cask install mactex` will install everything you need. 

Even though you shouldn't need the GUI, don't install `mactex-no-gui`, because that doesn't include latexmk for some reason.

### Commands
* `make` builds the thesis and outputs a `thesis.pdf` file in the top directory
* `make open` builds the thesis and then opens the pdf for you in your preferred reader
* `make clean` removes all the artifact files from a top-level build.  
* `latexmk -C` in a subdirectory will clean up a build there if you built a single chapter. Will try to add this to the makefile later

## Notes
### Technical problems
I couldn't get the `standalone` package to work perfectly, so if you would like to build an individual chapter, uncomment its bibliography and build it with LaTeXTools. I will try to automate this process with the makefile in the future.

If you get an error that says `../thesis.bib` can't be found, that means you didn't comment out one of the bibliography imports in a subfile. 

### To-do
* Introduction
    - more damaging examples (really sell the puzzle)
    - literature review needs to be better
    - research design 
* Espionage
    - game theory
    - add a few damaging examples
* Planes
    - Cuban missile example
    - Farquhar on planes
* Satellites
    - add Khrushchev on satellites 
* Conclusion 
    - finish it 
* A few more graphics!
