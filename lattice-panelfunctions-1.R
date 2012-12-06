#----------------- lattice panel functions -------------------#

# a panel function is supplied as argument to "panel"
# the panel function (usually) consists of one or more panel
# expressions

panel_xy1 = function(x, y, col, ...) {
	panel.fill(col='grey85');
	panel.loess(x, y, span=2/3, degree=2,
		family='gaussian', lwd=1.4, col.line='#ED9121',
		horizontal=F, ...);
	panel.axis(outside = TRUE, tck = .5,
		line.col = 'grey20',
		text.col = 'grey35');
	panel.grid(h=-12, v=-20, col='white', lwd=.5, lty=1);
	panel.xyplot(x, y, col='#6D9BC3', na.rm=T,
		pch=20, cex=.4, alpha=.9, ...)
}

panel_xy2 = function(...) {
		panel.background("grey75");
		panel.fill('grey75');
		panel.grid(h=-5, v=-10, col.line="#FFFFFF", lty=1, lwd=.6);
		panel.xyplot(...)
}


#---------------------- key -------------------------#

# passed in to the 'key' argument
# location of key: via either the 'space' parameter c("left", "right", "top",
# "bottom"), or the 'x, y, corner' parameter, which places the key inside
# the plot
draw.key(corner=c(0,0))

simpleKey(text=levels(D$factor1)[1:6],
			space="right", points=T)

auto.key=list(corner=(0, 0), columns=2)

#---------------------- strip -------------------------#

# strip expressions are results returned from calling 'strip.custom'
# and are passed in as arguments to the 'strip' parameter

strip_dot = strip.custom(strip.names=T, strip.levels=T,
	par.strip.text=list(cex=.8, col='#FFFFFF', font=4))

strip_bw = strip.custom(strip.names=T, strip.levels=T,
	par.strip.text=list(cex=.8, col='#FFFFFF', font=4))

strip_xy = strip.custom(strip.names=T, strip.levels=T,
	par.strip.text=list(cex=.8, col='#FFFFFF', font=4))

strip_bar = strip.custom(strip.names=T, strip.levels=T,
	par.strip.text=list(cex=.8, col='#FFFFFF', font=4))

strip_pp = strip.custom(strip.names=T, strip.levels=T,
	par.strip.text=list(cex=.8, col='#FFFFFF', font=4))

#---------------------- scales ------------------------#
# scale expressions are lists passed in as arguments to
# the 'scales' parameter in a lattice plot fn
# most important parameters in scales expression:
# (i) 'relation': has values of 'same', 'sliced', or 'free'

scales_xy = list( x=list( draw=T, lwd=1.4, tick.number=14,
					font=2, col='navy', cex=.75,
					col.line='maroon', axs='i', rot=45),
				y=list( draw=T, lwd=1.4, tick.number=10,
					font=1, col='grey50', col.line='maroon'))

scales_xy1 = list(	y=list(relation='free', rot=0),
              		x=list(axs='i', relation='free',
              			tick.number=12, rot=25))

scales_bw = list(	y=list(draw=T, relation='same', rot=0),
              		x=list(draw=T, axs='i', relation='same',
              			tick.number=8, alternating=c(1,1),
              			draw=T))

