### Fifth attempt to do AJE revisions
### Using many-month baseline, with sensitivity
### Lots of stuff deleted, most recent versions in public/ and wholestats/

include $(MKDIR)/standard.def
# include $(MKDIR)/out.mk

tmpcurr: wmain.tab.tex

all: notarget

####################### CRIB #######################

input:
	cp ../wholestats/*.in .

%.R: ../%.R
	$(COPY)

%.pl: ../%.pl
	$(COPY)

## Read surveillance data
surv.R.dat: surv.R

## Read death data
deaths.R.dat: deaths.R
deathframe.R.dat: deaths.R.dat deathframe.R

### Normalization functions

exc.R.dat: deathframe.R.dat exc.R

### Regression functions

regress.R.dat: surv.R.dat deathframe.R.dat exc.R.dat regress.R

### Anything specific should have its own name, starting with W.

wreg.R.dat: regress.R.dat wreg.R

wmain.R.dat: wreg.R.dat weather.R.dat season.R.dat wmain.R

wmain.tab.tex: wmain.R.dat wmain.tab.tmp wtab.pl
	wtab.pl $^ > $@
