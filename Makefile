## This is AnnualFlu. Not clear it does anything
## Created and abandoned (maybe for Judy)
## Rescuing from yushan mirror 2020 May 17 (Sun)

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard Makefile.*)

Sources += $(wildcard *.R)

Sources += $(wildcard *.txt)

Sources += $(wildcard *.html)

######################################################################

### Makestuff

Sources += Makefile 

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

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
