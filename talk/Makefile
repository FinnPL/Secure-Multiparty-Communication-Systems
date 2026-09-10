BUILDDIR=build
LATEX=lualatex --interaction=nonstopmode --halt-on-error --shell-escape %O %S
LATEXMK=latexmk -bibtex -pdf -pdflatex="$(LATEX)" -use-make -M -MP

TARGETS=$(patsubst %.tex,%.pdf,$(wildcard *.tex))

.SECONDARY:
.SUFFIXES:

.SECONDEXPANSION:

.PHONY: default
default: $(BUILDDIR)/slides.pdf

.PHONY: all
all: $(BUILDDIR)/$(TARGETS)

$(BUILDDIR)/%.pdf: %.tex beamerthemeComsys.sty
	@mkdir -p $(@D)
	$(LATEXMK) -MF $@.d --outdir=$(@D) $<

$(BUILDDIR)/%.pdf: $(BUILDDIR)/%.tex
	@mkdir -p $(@D)
	$(LATEXMK) -MF $@.d --outdir=$(@D) $<

$(BUILDDIR)/%-cropped.pdf: %.pdf
	@mkdir -p $(@D)
	pdfcrop $< $@

.PHONY: clean
clean:
	rm -rf $(BUILDDIR) $(TARGETS)

-include *.mk

include $(wildcard $(BUILDDIR)/*.d)
include $(wildcard $(BUILDDIR)/*/*.d)
