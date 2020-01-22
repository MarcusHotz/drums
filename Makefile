SHELL=/bin/bash
DATESTAMP:=${shell date '+%Y-%m-%d'}

UNAME:=$(shell uname)


all: eps pdf

eps: Makefile
	make -C ./lilypond

png: eps 
	make -C ./eps

pdf: png 
	make -C ./md

clean:
	make -C ./lilypond clean
	make -C ./eps clean
	make -C ./md clean
	rm -f ./pdf/*.pdf

test:
	make -C ./lilypond test

