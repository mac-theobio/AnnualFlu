## Don't save R session, you'll screw up surv!


tot = surv$H1p+surv$H3p+surv$Bp

den = predict(lm(tot~surv$fluyear))

surv$H1p = surv$H1p/den
surv$H3p = surv$H3p/den
surv$Bp = surv$Bp/den

mainlin = agedeathlinfun(main)

mainlinmod = sapply(anames, function(age){
	causemod(age, mainlin)
}, simplify=FALSE)

tmp = tabprint(mainlinmod$tot)

quit(save = "no")

