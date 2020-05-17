ssumlin = agedeathlinfun(ssum)

ssumlinmod = sapply(anames, function(age){
	causemod(age, ssumlin)
}, simplify=FALSE)

tmp = tabprint(ssumlinmod$tot)

quit(save = "yes")
