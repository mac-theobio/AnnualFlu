mainlin = agedeathlinfun(main)

mainlinmod = sapply(anames, function(age){
	causemod(age, mainlin)
}, simplify=FALSE)

tmp = tabprint(mainlinmod$tot)

quit(save = "yes")
