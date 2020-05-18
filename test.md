# Influenza mortality

## Mortality due to influenza in the US: an annualized regression
approach using multiple-cause mortality data.  [__Am. J. Epidemiol.__ 163:181](https://academic.oup.com/aje/article/163/2/181/95820)

## Data files

### US mortality data

Age groups 0-4, 5-14, 15-54, 55-64, 65-74, 75-84, 85+, total

All deaths  {{all.txt}}.|
Multiple-cause influenza deaths {{multflu.txt}}.|
Multiple-cause P&I deaths {{multpi.txt}}.|
Multiple-cause R&C deaths {{multrc.txt}}.|
Underlying-cause influenza deaths {{undflu.txt}}.|
Underlying-cause P&I deaths {{undpi.txt}}.|
Underlying-cause R&C deaths {{undrc.txt}}.|
{death.zip __All US mortality files__}

### New York metro mortality data

Age groups 0-4, 5-14, 15-54, 55-64, 65-74, 75-84, 85+, total

All deaths  {{nyall.txt}}.|
Multiple-cause influenza deaths {{nymultflu.txt}}.|
Multiple-cause P&I deaths {{nymultpi.txt}}.|
Multiple-cause R&C deaths {{nymultrc.txt}}.|
Underlying-cause influenza deaths {{nyundflu.txt}}.|
Underlying-cause P&I deaths {{nyundpi.txt}}.|
Underlying-cause R&C deaths {{nyundrc.txt}}.|
{nydeath.zip __All NY mortality files__}

### IL and IN mortality data

Age groups 0-4, 5-14, 15-54, 55-64, 65-74, 75-84, 85+, total

All deaths  {{iiall.txt}}.|
Multiple-cause influenza deaths {{iimultflu.txt}}.|
Multiple-cause P&I deaths {{iimultpi.txt}}.|
Multiple-cause R&C deaths {{iimultrc.txt}}.|
Underlying-cause influenza deaths {{iiundflu.txt}}.|
Underlying-cause P&I deaths {{iiundpi.txt}}.|
Underlying-cause R&C deaths {{iiundrc.txt}}.|
{iideath.zip __All IL and IN mortality files__}

## R scripts

Import death data {{deaths.R}} {{deathframe.R}} 

Normalization functions {{exc.R}}

Time series figure {{fit.R}}

Regression functions {{regress.R}}

Main regression, with CI {{conf.R}}

Different summer, winter choices: {{season.R}} {{main.R}} {{swin.R}} {{short.R}} {{ssum.R}} {{broad.R}} {{base.R}}

Removing surveillance trend {{trendmain.R}}

Serfling estimates {{serfdeaths.R}} {{serfling.R}}

Weather regressions {{wreg.R}} {{wmain.R}}

{scripts.zip __All R scripts__}

----------------------------------------------------------------------

When these files are used, appropriate citation should be made to the
paper cited above, and to this web address
(http://mac-theobio.github.io/AnnualFlu/).
