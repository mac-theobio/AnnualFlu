
firstflu = 1 + min(deathyear)
lastflu = max(deathyear)

##### Functions

FluSurv = function(dframe, first=firstflu, last=lastflu)
{

	curr = merge(dframe, surv)

	curr$Bp = ifelse(curr$fluyear>=first, curr$Bp, NA)
	curr$Bp= ifelse(curr$fluyear<=last, curr$Bp, NA)

	model = lm(deaths~H1p+H3p+Bp, data=curr)
	plot(model)
	list(model=model, fluyear=curr$fluyear[!is.na(curr$Bp)],
		den=curr$den[!is.na(curr$Bp)])
}

confpredict = function(mod)
{
	lmod = mod$model
	den = mod$den
	ivars =  attr(lmod$terms,"term.labels")
   pred = sapply(ivars,
      function(w) {
			lmod$coefficients[[w]]*mean(lmod$model[[w]]*den)
   	}
	)
   upr = sapply(ivars,
      function(w) {
			(confint(lmod, w)[[2]])*mean(lmod$model[[w]]*den)
   	}
	)
   lwr = sapply(ivars,
      function(w) {
			(confint(lmod, w)[[1]])*mean(lmod$model[[w]]*den)
   	}
	)
	diff = upr-pred
	ss = sum(diff*diff)
	tot = sum(pred)
	pred = c(pred, Total=tot)
	lwr = c(lwr, Total=tot-sqrt(ss))
	upr = c(upr, Total=tot+sqrt(ss))
	data.frame(pred=pred, lwr=lwr, upr=upr)
}

causemod = function(name, death, first=0)
{
	sapply(death[[name]], FluSurv, simplify=FALSE, first=first)
}

regprint = function(cmod)
{
	sapply(names(cmod),
		function(cause){
			print(causenames[[cause]])
			print(summary(cmod[[cause]]$model))
			print((confpredict(cmod[[cause]]))$pred)
		}
	)
}

tabprint = function(cmod)
{
	sapply(names(cmod),
		function(cause){
			name = causenames[[cause]]
			mod = cmod[[cause]]
			sum = summary(cmod[[cause]]$model)
			fs = as.list(sum$fs)
			PF = 1-pf(fs$value, fs$numdf, fs$dendf)
			P  = sum$coef[vnames,4]
			pred = confpredict(mod)$pred
			print (data.frame(
				mean = pred[c(vnames, "Total")],
				P  = c(sum$coef[vnames,4], PF)
			))
		}
	)
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

attribdeath = function(mframe)
{
	mod = mframe$model
	deaths=mod$model$deaths
	pred = confpredict(mframe)$pred
	tot = mean(deaths*mframe$den)
	list (att=pred[["Total"]], total=tot)
}

######## Execute

vnames = c(H3N2 = "H3p", H1N1 = "H1p", B = "Bp")

# attribdeath(mainlinmod$tot$all)
