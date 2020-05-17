currcold = cf1$winter

mainlin = agedeathlinfun(main)

mainlinmod = sapply(anames, function(age){
	wcausemod(age, mainlin, currcold)
}, simplify=FALSE)

tmp = confprint(mainlinmod$tot$all, vnames)
tmp

quit(save = "yes")

