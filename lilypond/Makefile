SHELL=/bin/bash
DATESTAMP:=${shell date '+%Y-%m-%d'}

NAME:=$(shell uname)


LYCMD:=lilypond --eps
LYDIR:=./
LYINPUTS:=$(wildcard $(LYDIR)*.ly)
LYBASES:=$(basename $(LYINPUTS))
LYOUTPUTS:=$(patsubst %,%.eps,$(LYBASES))

%.eps: %.ly 
	$(LYCMD) $^ 
	mkdir -p ../eps
	mv *.eps ../eps

all: eps

eps: $(LYOUTPUTS)

clean:
	rm -f ../eps/*.eps

test:
	@echo $(LYINPUTS)
