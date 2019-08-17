FIGURES_SRC=$(wildcard */figures/*.fig)
FIGURES=$(FIGURES_SRC) \
		$(filter-out $(addsuffix .pdf,$(basename $(FIGURES_SRC))), \
			$(wildcard */figures/*.pdf))

all: fcweng.pdf

fcweng.pdf: fcweng.tex $(addsuffix .pdf, $(basename $(FIGURES))) \
	Computability/berekenbaarheideng.tex Foreword/inleidingeng.tex GraphTheory/grafeneng.tex LanguagesAutomata/talenautomateneng.tex \
	Complexity/complexiteiteng.tex Definitions/definitions.tex
	pdflatex fcweng.tex
	pdflatex fcweng.tex
	pdflatex fcweng.tex
	rm -f *.bak *.aux  *~ *.w fcweng.bbl fcweng.blg

%.pdf: %.fig
#	fig2pdf --bbox=dvips --nogv  $< $@
	fig2dev -L pdf --bbox=dvips  $< $@

error: errata.tex
	latex errata.tex
	latex errata.tex
	dvips  errata.dvi -o errata.ps
	ps2pdf errata.ps

clean:
	rm -f *.bak *.aux *.log *~ *.w *.bbl *.blg *.out *.toc

realclean:
	rm -f *~ *.bak *.aux *.blg *.log *.bbl *.toc *.pdf */figures/*.pdf
