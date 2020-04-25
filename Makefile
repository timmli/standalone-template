SHELL := /bin/bash

STANDALONE_FILES =  myMacros.tex \
	$(wildcard packages/*.sty) 

test_standalone:
	rm -fr test
	mkdir test
	cd test; mkdir standalone-template
	cp -r --parents $(STANDALONE_FILES) test/standalone-template
	cp standalone-template.tex \
		test
	cd test; \
			latexmk -pdf standalone-template.tex

release_standalone:
	rm -fr temp
	mkdir temp
	cd temp; mkdir standalone-template
	cp -r --parents $(STANDALONE_FILES) temp/standalone-template
	cp standalone-template.tex \
		temp
	cd temp; zip -r standalone-template.zip *; mv standalone-template.zip ..
	rm -fr temp
