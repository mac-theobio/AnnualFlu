baselin = agedeathlinfun(base)

baselinmod = sapply(anames, function(age){
	causemod(age, baselin)
}, simplify=FALSE)

tmp = tabprint(baselinmod$tot)

quit(save = "yes")
