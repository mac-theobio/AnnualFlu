allquad = quaddeaths(all$tot)

postscript("fit.ps", horizontal="FALSE")
par(mfrow = c(2,2), pty ="s", ps=18, mar=c(2,0,0,1.5))

## Panel 1
plot(
deathdate, all$tot, xlab="Year", ylab="Deaths per month",
ylim=c(100000, 240000), type="l"
)
lines(deathdate, allquad, lty=2)
legend(
1980, 240000,
c("All deaths", "Quad. fit"),
lty=1:2, y.intersp=1.4, cex=0.8
)
mtext("a)", side=3, cex=1.5, line=-2., adj=1.1)

## Panel 2
mtnorm = multrc$tot/allquad
plot(deathdate, multrc$tot,
xlab="Year", ylab="Deaths per month", type = "l",
ylim=c(100000, 240000)
)
# lines(deathdate, atquad, lty=2)
legend(
1980, 240000,
c("R+C deaths", "Norm. R+C deaths"),
lty=1:2, y.intersp=1.4, cex=0.8
)
par (new=TRUE)
plot(deathdate, mtnorm, axes=0, ylim=c(0.6, 1),
	xlab="", ylab="", type = "l", lty=2
)
axis(4)
mtext("Normalized deaths",side=4,line=3) 
mtext("b)", side=3, cex=1.5, line=-2., adj=1.2)

## Panel 3
plot (deathdate, mtnorm, ylim=c(0.6, 1), type = "l", ylab="Normalized deaths")
points (deathdate, ifelse(main[deathmonth]==1, mtnorm, 0))
legend(
1980, 1.0,
c("Norm. R+C deaths", "Influenza months"),
lty=c(1,1), pch=c(NA,1), y.intersp=1.4, cex=0.8
)
mtext("c)", side=3, cex=1.5, line=-2., adj=1.1)

## Panel 4

with (mainlin$tot$all, 
	plot(fluyear, deaths,
		xlab="Year", ylab="Normalized annualized deaths", type = "l",
	)
)
mtext("d)", side=3, cex=1.5, line=-2., adj=1.2)

quit(save="no")
