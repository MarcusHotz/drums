SHELL=/bin/bash
DATESTAMP:=${shell date '+%Y-%m-%d'}

UNAME:=$(shell uname)

PDDIR:=./
PDINPUTS:=$(wildcard $(PDDIR)*.md)
PDBASES:=$(basename $(PDINPUTS))
PDOUTPUTS:=$(patsubst %,%.pdf,$(PDBASES))

%.pdf: %.md
	pandoc $^ -o $@ --standalone --listings --template eisvogel -f markdown
	mkdir -p ../pdf
	mv *.pdf ../pdf

all: pdf


pdf: $(PDOUTPUTS)

clean:
	rm -f ../pdf/*.pdf
