#!/bin/sh

sudo apt-get update
sudo apt-get install texlive-latex-extra texlive-lang-other latexmk 

echo "Instalation finished! Cheking instalation command ..."
tex --version
pdflatex --version

