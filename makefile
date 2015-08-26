
#set the a .dvi name that corresponds to your main .tex file
MAINPDFFILE = uw2015.pdf
MAINTEXFILE = $(MAINPDFFILE:.pdf=.tex)

all: $(MAINPDFFILE)

# convert markdown to tex
# %.tex: %.md
# 	pandoc -f markdown -t latex $< | sed 's/\(\\includegraphics.*\)\.[^}]*}/\1}/' > $@

# %.Rtex: %.Rmd
# 	./rmd2rtex.sh $< > $@

# %.tex: %.Rtex
# 	Rscript -e "library(knitr); knit('$<')"

citations:
	bibtool ~/Dropbox/Research/All.bib -x uw2015.aux > uw2015.bib


%.eps: %.png
	convert $< $@

$(MAINPDFFILE): $(MAINTEXFILE)
	latexmk -use-make $(MAINTEXFILE)

# cleans anything that can be re-generated automatically, plus emacs backups
clean: 
	latexmk -C

fullclean: clean
	git clean -x -f
	rm -rf figure cache

.PHONY : all pdf ps dvi clean $(MAINTEXFILE)
