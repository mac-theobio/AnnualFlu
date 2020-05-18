## This is AnnualFlu. Not clear it does anything
## Created and abandoned (maybe for Judy)
## Rescuing from yushan mirror 2020 May 17 (Sun)

## http://mac-theobio.github.io/AnnualFlu/
## http://mac-theobio.github.io/AnnualFlu/test

current: target
-include target.mk

-include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard *.md)

Ignore += $(wildcard *.html)

index.html: index.md
	$(ghh_r)

## git rm index.html index.dmu dh.pl index.gh.html test.gh.html test.md ##
## 2020 May 18 (Mon) 14:59#

######################################################################

Sources += $(wildcard Makefile.*)

Sources += $(wildcard *.R)

Sources += $(wildcard *.txt)

Ignore += annualflu/
Sources += $(wildcard *.zip *.pl)

######################################################################

### Makestuff

Sources += Makefile README.md

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

localstuff: 
	ln -s ../makestuff .
	ls makestuff/Makefile

-include makestuff/os.mk

-include makestuff/wrapR.mk
-include makestuff/pandoc.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
