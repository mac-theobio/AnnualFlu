anames = c("tot", "young", "old")

########## Functions

## Quadratic fit to provided time series

quaddeaths = function(rate, date=deathdate)
{
	qm = lm(rate~date+I(date^2))
	fitrate = predict(qm)
	fitrate
}

## Converts monthly time series to an annual series of deaths between
## the specified winter months _above average of other months_

WinterDeaths = function(deaths, year, month, winter)
{
   fluyear = ifelse(month>7,year+1,year)
   flumonth = ifelse(month>7,month-7,month+5)
	one = 0*deaths+1

	count = aggregate (one, list(fluyear=fluyear), sum)
   deaths = ifelse(winter, deaths, 0)
   agg = aggregate(deaths, list(fluyear=fluyear), sum)
   fluyear = as.numeric(levels(agg$fluyear))
   data.frame(fluyear = fluyear[count$x==12],
		deaths = agg$x[count$x==12])
}

WinterExcDeaths = function(deaths, year, month, winter, summer)
{
   fluyear = ifelse(month>7,year+1,year)
   flumonth = ifelse(month>7,month-7,month+5)
	one = 0*deaths+1

	count = aggregate (one, list(fluyear=fluyear), sum)
   wdeaths = ifelse(winter, deaths, 0)
   sdeaths = ifelse(summer, deaths, 0)

	wintlen = 12*sum(ifelse(winter, 1, 0))/length(winter)
	sumlen = 12*sum(ifelse(summer, 1, 0))/length(summer)

   agg = aggregate(wdeaths, list(fluyear=fluyear), sum)
   sagg = aggregate(sdeaths, list(fluyear=fluyear), sum)
   fluyear = as.numeric(levels(agg$fluyear))
   aframe = data.frame(fluyear = fluyear[count$x==12],
		deaths = agg$x[count$x==12])
   sframe = data.frame(fluyear = fluyear[count$x==12],
		deaths = sagg$x[count$x==12])
	aframe$deaths = aframe$deaths - wintlen*sframe$deaths/sumlen
	aframe
}


NormLinExc = function (deaths, all, agename="age", causename = "cause",
	basemon=10, date=deathdate, year=deathyear,
	month=deathmonth, winter, summer)
{
	name = paste(causename, agename)
	qd = quaddeaths(all, date)
	plot (date, all, "l", xlab="", ylab=name,
		main="Quad fit to den. series"
	)
	points(date[winter], all[winter], pch=19, col="blue")
	lines(date, qd)
	
	wintlen = 12*sum(ifelse(winter, 1, 0))/length(winter)
	wq = WinterDeaths(qd, year, month, winter)/wintlen

	norm = deaths/qd

	wn = WinterExcDeaths(norm, year, month, winter, summer)
	plot (wn$fluyear, wn$deaths, "l", xlab="", ylab=name,
		main="Norm. ann. deaths")
	lines(c(1970,2010), c(0,0))

	data.frame(fluyear=wn$fluyear, deaths=wn$deaths, den = wq$deaths)
}

agedeathlinfun = function(season){
	winter = (season[deathmonth] == 1)
	summer = (season[deathmonth] == 2)
	(sapply(anames,
		function(age) {
			sapply(names(agedeath[[age]]),
				function(cause){
					NormLinExc(agedeath[[age]][[cause]], agedeath[[age]]$all,
						agenames[[age]], causenames[[cause]], 
						winter = winter, summer=summer
					)
				}
			, simplify = FALSE)
		}
	, simplify = FALSE))
}

quit(save = "yes")
