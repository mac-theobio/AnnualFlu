# Influenza mortality

## Mortality due to influenza in the US: an annualized regression approach using multiple-cause mortality data.

[__Am. J. Epidemiol.__ 163:181](https://academic.oup.com/aje/article/163/2/181/95820), Jonathan Dushoff, Joshua B. Plotkin, Cecile Viboud, David J. D. Earn, Lone Simonsen

## Data files

### US mortality data

Age groups 0-4, 5-14, 15-54, 55-64, 65-74, 75-84, 85+, total

All deaths [all.txt](all.txt).  
Multiple-cause influenza deaths [multflu.txt](multflu.txt).  
Multiple-cause P&I deaths [multpi.txt](multpi.txt).  
Multiple-cause R&C deaths [multrc.txt](multrc.txt).  
Underlying-cause influenza deaths [undflu.txt](undflu.txt).  
Underlying-cause P&I deaths [undpi.txt](undpi.txt).  
Underlying-cause R&C deaths [undrc.txt](undrc.txt).  
[*All US mortality files*](death.zip)

### New York metro mortality data

Age groups 0-4, 5-14, 15-54, 55-64, 65-74, 75-84, 85+, total

All deaths [nyall.txt](nyall.txt).  
Multiple-cause influenza deaths [nymultflu.txt](nymultflu.txt).  
Multiple-cause P&I deaths [nymultpi.txt](nymultpi.txt).  
Multiple-cause R&C deaths [nymultrc.txt](nymultrc.txt).  
Underlying-cause influenza deaths [nyundflu.txt](nyundflu.txt).  
Underlying-cause P&I deaths [nyundpi.txt](nyundpi.txt).  
Underlying-cause R&C deaths [nyundrc.txt](nyundrc.txt).  
[*All NY mortality files*](nydeath.zip)

### IL and IN mortality data

Age groups 0-4, 5-14, 15-54, 55-64, 65-74, 75-84, 85+, total

All deaths [iiall.txt](iiall.txt).  
Multiple-cause influenza deaths [iimultflu.txt](iimultflu.txt).  
Multiple-cause P&I deaths [iimultpi.txt](iimultpi.txt).  
Multiple-cause R&C deaths [iimultrc.txt](iimultrc.txt).  
Underlying-cause influenza deaths [iiundflu.txt](iiundflu.txt).  
Underlying-cause P&I deaths [iiundpi.txt](iiundpi.txt).  
Underlying-cause R&C deaths [iiundrc.txt](iiundrc.txt).  
[*All IL and IN mortality files*](iideath.zip)

## R scripts

Import death data [deaths.R](deaths.R) [deathframe.R](deathframe.R)

Normalization functions [exc.R](exc.R)

Time series figure [fit.R](fit.R)

Regression functions [regress.R](regress.R)

Main regression, with CI [conf.R](conf.R)

Different summer, winter choices: [season.R](season.R) [main.R](main.R)
[swin.R](swin.R) [short.R](short.R) [ssum.R](ssum.R) [broad.R](broad.R)
[base.R](base.R)

Removing surveillance trend [trendmain.R](trendmain.R)

Serfling estimates [serfdeaths.R](serfdeaths.R) [serfling.R](serfling.R)

Weather regressions [wreg.R](wreg.R) [wmain.R](wmain.R)

[*All R scripts*](scripts.zip)

-----------------------------------------------------------------------

_When these files are used, appropriate citation should be made to the
paper cited above, and to this web address (http://mac-theobio.github.io/AnnualFlu/)._
