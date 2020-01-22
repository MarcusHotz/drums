SHELL=/bin/bash
DATESTAMP:=${shell date '+%Y-%m-%d'}

UNAME:=$(shell uname)

IMCMD:=convert
IMDIR:=./
IMINPUTS:=$(wildcard $(IMDIR)*.eps)
IMBASES:=$(basename $(IMINPUTS))
IMOUTPUTS:=$(patsubst %,%.png,$(IMBASES))

%.png: %.eps 
	$(IMCMD) $^ -trim $@
	mv *.png ../md/images/	

all: png

png: $(IMOUTPUTS) 


clean:
	rm -f ../md/images/*.png

