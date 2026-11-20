# Build both CVs and copy the PDFs to the repo root (these copies are committed).
#   make        build both
#   make clean  remove build folders

PDFS := Mert_Onder_CV_EN.pdf Mert_Onder_CV_DE.pdf

all: $(PDFS)

Mert_Onder_CV_EN.pdf: en/cv.tex shared/preamble.tex
	latexmk -pdf -interaction=nonstopmode -halt-on-error en/cv.tex
	cp en/build/cv.pdf $@

Mert_Onder_CV_DE.pdf: de/cv.tex shared/preamble.tex
	latexmk -pdf -interaction=nonstopmode -halt-on-error de/cv.tex
	cp de/build/cv.pdf $@

clean:
	rm -rf en/build de/build

.PHONY: all clean
