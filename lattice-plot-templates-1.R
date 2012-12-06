
#------------- lattice plotting functions ----------------#

# Cleveland dot plot  (data frame interface)
dotplot(variety ~ yield | site, groups=year, data=barley,
	drop.unused.levels=T,
	layout=c(3,2), aspect=c(1.05), between=list(y=.4, x=.4),
	xlab=NULL, ylab=NULL,
	main="Yield as a function of Site & Year",
	pch=20, col.symbol=brewer.pal(5, 'Dark2'),
	scales=list(alternating=c(1,1)),
	strip=strip_dot)


# boxplot
bwplot(factor(ALevelChem) ~ GCSE | Sex,
		drop.unused.levels=T,
		data=C, varwidth=T, pch=20, lwd=Null, alpha=.8,
		between=list(y=.4, x=.4), axs="r",
		strip=strip_bw,
		scales = list(alternating=c(1,1))
)

# xyplot
xyplot( counts ~ time | weekday, data=BA1,
		panel=panel_xy1,
		drop.unused.levels=T,
		strip=strip_xy,
		scales=scales_xy,
		main="",
		xlab=NULL,
		ylab=NULL,
		plot.points=F,
		aspect='xy',
		par.settings=list(
			axis.components=list( left=list(pad1=.2),
									bottom=list(pad1=.2) )),
		layout=c(2,2)
)

# kernel density plot




# bar plot
# via the table interface
barchart(tx, between=list(y=1.5, x=1.2),stack=F, xlab="Impressions",
				drop.unused.levels=T,
				panel = function(..., border, col, boxwidth) {
					panel.grid(h=0, v=-1, col='grey65', lwd=0.8,
						lty=1)
					panel.barchart(..., border='transparent',
						col=brewer.pal(8, "Set1"), box.width=0.15)
				},
				strip = strip_bar, key=key
)


# parallel coordinate plots
parallelplot(~PM2[c(2, 3, 4, 5, 6)],
		drop.unused.levels=T,
		auto.key=list)

#------------------ rendering plots to persistent media ----------------#

trellis.device(theme=theme1, retain=T)

