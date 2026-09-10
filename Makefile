LATEXMK ?= latexmk

PAPER := seminar-paper
TALK  := slides

DOCS := paper/$(PAPER).tex talk/$(TALK).tex

.PHONY: all paper talk lint clean

all: paper talk

paper:
	cd paper && $(LATEXMK) $(PAPER).tex

talk:
	cd talk && $(LATEXMK) $(TALK).tex

lint:
	chktex -q $(DOCS)

clean:
	cd paper && $(LATEXMK) -C $(PAPER).tex
	cd talk && $(LATEXMK) -C $(TALK).tex
