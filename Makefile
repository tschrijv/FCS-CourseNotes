FIGURES_SRC=$(wildcard *.fig)
FIGURES=$(FIGURES_SRC) \
		$(filter-out $(addsuffix .pdf,$(basename $(FIGURES_SRC))), \
			$(wildcard *.pdf))
#all:
#	pdflatex mat.tex

all: fcweng.pdf

fcweng.pdf: fcweng.tex $(addsuffix .pdf, $(basename $(FIGURES))) \
	berekenbaarheideng.tex Foreword/inleidingeng.tex GraphTheory/grafeneng.tex talenautomateneng.tex \
	complexiteiteng.tex prelim.tex
	pdflatex fcweng.tex
	pdflatex fcweng.tex
	pdflatex fcweng.tex
	rm -f *.bak *.aux  *~ *.w fcweng.bbl fcweng.blg



fcwned.pdf: fcwned.tex $(addsuffix .pdf, $(basename $(FIGURES))) \
	berekenbaarheid.tex inleiding.tex grafen.tex talenautomaten.tex \
	complexiteit.tex prelim.tex
	pdflatex fcwned.tex
	pdflatex fcwned.tex
	pdflatex fcwned.tex
	rm -f *.bak *.aux  *~ *.w fcwned.bbl fcwned.blg




%.pdf: %.fig
#	fig2pdf --bbox=dvips --nogv  $< $@
	fig2dev -L pdf --bbox=dvips  $< $@


extra: extrales.tex mn1.eps mn2.eps mn3.eps mn4.eps
	latex extrales.tex
	dvips extrales.dvi -o extrales.ps
	ps2pdf extrales.ps

2dfa: 2dfa.tex 
	latex 2dfa.tex
	dvips 2dfa.dvi -o 2dfa.ps
	ps2pdf 2dfa.ps


error: errata.tex
	latex errata.tex
	latex errata.tex
	dvips  errata.dvi -o errata.ps
	ps2pdf errata.ps

clean:
	rm -f *.bak *.aux *.log *~ *.w *.bbl *.blg *.out *.toc

realclean:
	rm -f *~ *.bak *.aux *.blg *.log *.bbl *.toc  *.pdf

