broadlin = agedeathlinfun(broad)

broadlinmod = sapply(anames, function(age){
	causemod(age, broadlin)
}, simplify=FALSE)

tmp = tabprint(broadlinmod$tot)

quit(save = "yes")
