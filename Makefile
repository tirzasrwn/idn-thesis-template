build: clean
	mkdir ./build
	# First run is generating main.aux to create main.bbl
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./build main.tex
	bibtex ./build/main.aux
	cp ./build/main.bbl ./build/main.bbl ./
	# Second run is compile with main.bbl
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./build main.tex
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=./build main.tex
	cp ./build/main.pdf ./

clean:
	-rm *.aux *.pdf *.l* *.f* *.synctex.gz *.toc *.out *.bbl *.blg ./chapters/*.aux
	-rm -frv ./build

