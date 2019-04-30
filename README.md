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

### Bibliography connections
I used the excellent LaTeXTools package for Sublime to write the entirety of this thesis, and Zotero's BetterBibLaTeX to create the `.bib` file.

In order to properly connect the two, you need to switch the LaTeXTools `biblography` preference from `"traditional"` to `"new"`. This changes the parser to one that is capable of reading the preferred BibLaTeX date format.

## Notes
### Technical problems
I couldn't get the `standalone` package to work perfectly, so if you would like to build an individual chapter, uncomment its bibliography and build it with LaTeXTools. I will try to automate this process with the makefile in the future.

If you get an error that says `../thesis.bib` can't be found, that means you didn't comment out one of the bibliography imports in a subfile. 

### To-do
* Front matter
    - Acknowledgments 
* Introduction
    - literature review needs to be better
* Espionage
    - add a few damaging examples
* Planes
    - Farquhar on planes
* Satellites
    - add Khrushchev on satellites 
* Conclusion 
    - finish it 
* Style
    - A few more graphics!
    - Font (diff for header and body)
