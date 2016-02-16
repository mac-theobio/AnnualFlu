# AnnualFlu
## Maybe started copying from wrong place. Check /home/dushoff/arc/lalashan/princeton/dis/research/flu/mortality/longann/comp

### Hooks for the editor to set the default target

current: target

target pngtarget pdftarget vtarget acrtarget: deaths.Rout 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.txt *.R)

deaths.Rout: $(wildcard *.txt) deaths.R

######################################################################

## Crib

%.R:
	/bin/cp $(Drop)/annualflu/$@ .


### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
