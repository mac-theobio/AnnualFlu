swinlin = agedeathlinfun(swin)

swinlinmod = sapply(anames, function(age){
	causemod(age, swinlin)
}, simplify=FALSE)

tmp = tabprint(swinlinmod$tot)

quit(save = "yes")
