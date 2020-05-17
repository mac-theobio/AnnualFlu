WFluSurv = function(dframe, cold, first=firstflu, last=lastflu)
{

	curr = merge(dframe, surv)

	curr$Bp = ifelse(curr$fluyear>=first, curr$Bp, NA)
	curr$Bp= ifelse(curr$fluyear<=last, curr$Bp, NA)

	model = lm(deaths~H1p+H3p+Bp+cold, data=curr)
	plot(model)
	list(model=model, fluyear=curr$fluyear[!is.na(curr$Bp)],
		den=curr$den[!is.na(curr$Bp)])
}

lineprint = function(mod, vnames)
{
	sum = summary(mod$model)
	fs = as.list(sum$fs)
	PF = 1-pf(fs$value, fs$numdf, fs$dendf)
	P  = sum$coef[vnames,4]
	pred = confpredict(mod)$pred
	f = (data.frame(
		mean = pred[c(vnames, "Total")],
		P  = c(sum$coef[vnames,4], PF)
	))
	rownames(f) = c(names(vnames), "Total")
	f
}

wcausemod = function(name, death, cold, first=0)
{
	sapply(death[[name]], WFluSurv, simplify=FALSE, cold=cold, first=first)
}

confprint = function(mod, vnames)
{
	sum = summary(mod$model)
	fs = as.list(sum$fs)
	PF = 1-pf(fs$value, fs$numdf, fs$dendf)
	P  = sum$coef[vnames,4]
	pred = confpredict(mod)
	f = (data.frame(
		mean = pred[c(vnames, "Total"), ],
		P  = c(sum$coef[vnames,4], PF)
	))
	rownames(f) = c(names(vnames), "Total")
	f
}

vnames = c(
	H3N2 = "H3p",
	H1N1 = "H1p",
	B = "Bp",
	Cold = "cold"
)


