
WinterFrame = function(x, year, month, firstyear=0, lastyear=0)
{
   fluyear = ifelse(month>7,year+1,year)
   flumonth = ifelse(month>7,month-7,month+5)

	first=ifelse(firstyear==0, 1+min(year), firstyear)
	last=ifelse(lastyear==0, max(year), lastyear)

	oct = x[(fluyear>=first) & (fluyear<=last) & (month==10)]
	nov = x[(fluyear>=first) & (fluyear<=last) & (month==11)]
	dec = x[(fluyear>=first) & (fluyear<=last) & (month==12)]
	jan = x[(fluyear>=first) & (fluyear<=last) & (month==1)]
	feb = x[(fluyear>=first) & (fluyear<=last) & (month==2)]
	mar = x[(fluyear>=first) & (fluyear<=last) & (month==3)]
	apr = x[(fluyear>=first) & (fluyear<=last) & (month==4)]

   data.frame(fluyear = first:last, oct=oct, nov=nov, dec=dec,
		jan=jan, feb=feb, mar=mar, apr=apr,
		early=nov+dec, mid=jan+feb, late=mar+apr,
		first=nov+dec+jan, second=feb+mar+apr,
		winter = nov+dec+jan+feb+mar+apr
	)
}

temp <- read.table("newark.in", header=TRUE)
mean = tapply(temp$rmtC, temp$month, mean)
cold = pmax(c(mean)-temp$rmtC, 0)
ct1 = pmax(10-temp$rmtC, 0)
ct2 = pmax(20-temp$rmtC, 0)

coldf = WinterFrame(cold, temp$year, temp$month)
cf1 = WinterFrame(ct1, temp$year, temp$month)
cf2 = WinterFrame(ct2, temp$year, temp$month)

quit(save = "yes")
