SHELL=/bin/bash
DATESTAMP:=${shell date '+%Y-%m-%d'}

UNAME:=$(shell uname)


all: 
	make -C ./lilypond
	make -C ./eps
	make -C ./md

clean:
	make -C ./lilypond clean
	make -C ./eps clean
	make -C ./md clean

test:
	make -C ./lilypond test

