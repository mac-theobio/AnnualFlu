## Month lengths
## Start in 1979, leap year is in 1980

monthlen = c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
monthlen = c(monthlen, monthlen, monthlen, monthlen)
monthlen[14]=29
monthlen=monthlen/30.4375
monthlen

## Functions to read in age-structure death matrix as data frame,
## normalize by month length

dtot = "All.ages"

agenames = list(
		d0 = "Age 0 to 4",
		d10 = "Age 5 to 14" ,
		d40 = "Age 15 to 54" ,
		d60 = "Age 55 to 64" ,
		d70 = "Age 65 to 74" ,
		d80 = "Age 75 to 84" ,
		d90 = "Age 85 and up" ,
		young = "Less than 65 yo" ,
		old = "Greater than 64 yo" ,
		tot = "All ages",
		unk = "Unknown age group!!"
	)

# dtot is used for tot in the input files
# Keep it this way; we divide by DivMonth here but not in other frames
deathframe = function(inf)
{
	farm = data.frame(
		d0=inf$d0,
		d10 =inf$d10,
		d40 =inf$d40,
		d60 =inf$d60,
		d70 =inf$d70,
		d80 =inf$d80,
		d90 =inf$d90,
		young = inf$d0+inf$d10+inf$d40+inf$d60,
		old = inf$d70+inf$d80+inf$d90,
		tot =inf$dtot
	)
	as.data.frame(lapply(farm, DivMonth))
}

elderframe = function(inf)
{
	farm = data.frame(
		young = inf$young,
		old = inf$old
	)
	as.data.frame(farm)
}

totframe = function(inf)
{
	list (tot=inf$tot)
}

DivMonth = function(deaths)
{
	deaths/monthlen
}

## Read in national input files

all = read.table("all.in", header=TRUE)
deathyear = all$year
deathmonth=all$month
deathdate=all$year+(all$month-1)/12
all = deathframe(all)

multflu = deathframe(read.table("multflu.in", header=TRUE))
undflu = deathframe(read.table("undflu.in", header=TRUE))
multpi = deathframe(read.table("multpi.in", header=TRUE))
undpi = deathframe(read.table("undpi.in", header=TRUE))
multrc = deathframe(read.table("multrc.in", header=TRUE))
undrc = deathframe(read.table("undrc.in", header=TRUE))

plot(deathdate, all$dtot, type = "l")
plot(deathdate, undpi$dtot, type = "l")
plot(deathdate, multpi$dtot, type = "l")
plot(deathdate, undrc$dtot, type = "l")
plot(deathdate, multrc$dtot, type = "l")

quit(save="yes")
