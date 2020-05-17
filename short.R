shortlin = agedeathlinfun(short)

shortlinmod = sapply(anames, function(age){
	causemod(age, shortlin)
}, simplify=FALSE)

tmp = tabprint(shortlinmod$tot)

quit(save = "yes")
