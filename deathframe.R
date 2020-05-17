
causedeath = list(
	multpi=multpi,
	other=multrc-multpi,
	multrc=multrc,
	non = all-multrc,
	all = all
)

causenames = list(
	multpi="P&I",
	other="Other R&C",
	multrc="All R&C",
	non = "Non R&C",
	all = "All deaths"
)

agedeath = sapply(
	names(multpi), function(age){
		as.data.frame(sapply(
			names(causedeath), function(cause){
				causedeath[[cause]][[age]]	
			},
			simplify = FALSE
		))
	},
	simplify = FALSE
)

quit(save="yes")


