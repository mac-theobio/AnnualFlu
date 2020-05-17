serfframe = data.frame(
	fluyear=serf$fluyear, deaths = serf$deaths/serf$pop, den = serf$pop
)

curr = merge(serfframe, surv)

bigserfmodel = FluSurv(serfframe)

confpredict(bigserfmodel)
