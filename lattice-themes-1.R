# 2 options to deploy themes:

	# source the theme (themes in this script are all functions) then call it; or
	
	# add the code below to e.g., .RProfile

setHook(packageEvent('lattice', 'attach'),
	function(...) {
		lattice.options(default.args = list(as.table=T))
		lattice.options(default.theme =
			function() {
				switch(EXPR = .Device,
					postscript = ,
					pdf = theme_xy(color=T),
					theme_xy('pdf', color=T))
			})
	})


# notes: the theme must be loaded in the current environment & the
# function called before calling any lattice plot function
# show.settings() will render the themable elements

#--------------------- lattice themes ---------------#

theme_dot = function() {
	mt = trellis.par.get();
	mt$axis.components = list(	left=list(tck=.7, pad1=1, pad2=1),
								top=list(tck=0, pad1=.2, pad2=0),
								right=list(	tck=0, 	pad1=0, pad2=1 ),
								bottom=list(tck=.3, pad1=0, pad2=0 ),
								left=list(tck=.3, pad1=0, pad2=0)
	);
	mt$par.main.text = list(col="#004164", font=3, cex=1.1);
	mt$superpose.symbol = list(
			col=c("#2E5894", "#B38342",
				"#2F8568", "#99B2B7", "#F9CC58", "#CB4F57"),
			fill=c("#B38342", "#2F8568",
				"#99B2B7", "#F9CC58", "#CB4F57"),
			lwd=.8,
			font=3);
	mt$dot.line = list(lty=1, lwd=.6, alpha=.75, col="#555555");
	mt$layout.heights = list(axis=list(bottom=.2));
	mt$fontsize = list(text=9, points=9);
	mt$strip.background = list(col='steelblue2');
	mt$strip.shingle = list(col='steelblue2');
	mt$strip.border = list(col='transparent');
	mt$axis.components = list(left=list(tck=.8, pad1=0, pad2=0 ),
								top=list(tck=0 , pad1=0, pad2=0 ),
								right=list(	tck=0, pad1=0, pad2=0 ),
								bottom=list(tck=.4, pad1=0, pad2=0 )
	);
	mt$axis.text = list(col='grey60', cex=.8);
	mt$axis.line = list(lwd=0);
	mt$par.xlab.text = list(col="#A9A9A9", lineheight=.8, font=1);
	mt$par.ylab.text = list(col="steelblue4", lineheight=.8, font=1)
	mt$axis.components = list( top=list(tck=0),
                        		bottom=list(tck=0.6),
								left=list(tck=0.6));
	mt$layout.heights = list(top.padding = 3,
							main.key.padding = 0,
							key.axis.padding = 0,
							axis.xlab.padding = 0,
							xlab.key.padding = 0,
							key.sub.padding = 0,
							bottom.padding = 4);
	mt$layout.widths = list(left.padding = 1,
							key.ylab.padding = 0,
							ylab.axis.padding = 0,
							axis.key.padding = 0,
							right.padding = 1.5);
	trellis.par.set(mt)
}

# theme for bar plots
theme_bar = function() {
	mt = trellis.par.get();
	mt$axis.components = list(	left=list(tck=.7, pad1=1, pad2=1),
								top=list(tck=0, pad1=.2, pad2=0),
								right=list(	tck=0, 	pad1=0, pad2=1 ),
								bottom=list(tck=.3, pad1=0, pad2=0 ),
								left=list(tck=.3, pad1=0, pad2=0)
	);
	mt$plot.polygon = list(col=c("#2E5894", "#B38342", "#2F8568",
		"#99B2B7", "#F9CC58", "#CB4F57"), border=NULL, alpha=.85,
		lwd=NULL);
	mt$superpose.polygon = list(col=c("#2E5894", "#B38342", "#2F8568",
		"#99B2B7", "#F9CC58", "#CB4F57"), border=NULL, alpha=.85,
		lwd=NULL);
	mt$par.main.text = list(col="#004164", font=3, cex=1.1);
	mt$dot.line = list(lty=1, lwd=.6, alpha=.75, col="#555555");
	mt$layout.heights = list(axis=list(bottom=.2));
	mt$fontsize = list(text=9, points=9);
	mt$layout.heights = list(axis.top=.3, main=.4, top.padding=.7);
	mt$strip.background = list(col='steelblue2');
	mt$strip.shingle = list(col='steelblue2');
	mt$strip.border = list(col='transparent');
	mt$axis.components = list(left=list(tck=.8, pad1=0, pad2=0 ),
								top=list(tck=0 , pad1=0, pad2=0 ),
								right=list(	tck=0, pad1=0, pad2=0 ),
								bottom=list(tck=.4, pad1=0, pad2=0 ));
	mt$superpose.symbol = list(col=c("#2E5894", "#B38342", "#2F8568",
		"#99B2B7", "#F9CC58", "#CB4F57"), fill=c("#B38342", "#2F8568",
		"#99B2B7", "#F9CC58", "#CB4F57"), lwd=.8, font=3);
	mt$axis.text = list(col='grey60', cex=.8);
	mt$axis.line = list(lwd=0);
	mt$par.xlab.text = list(col="#A9A9A9", lineheight=.8, font=1);
	mt$par.ylab.text = list(col="steelblue4", lineheight=.8, font=1)
	mt$axis.components = list( top=list(tck=0),
                        		bottom=list(tck=0.6),
								left=list(tck=0.6));
	mt$layout.heights = list(top.padding = 0,
							main.key.padding = 0,
							key.axis.padding = 0,
							axis.xlab.padding = 0,
							xlab.key.padding = 0,
							key.sub.padding = 0,
							bottom.padding = 0);
	mt$layout.widths = list(left.padding = 1,
							key.ylab.padding = 0,
							ylab.axis.padding = 0,
							axis.key.padding = 0,
							right.padding = 1.5);
	trellis.par.set(mt)
}

# theme for boxplots
theme_bw = function() {
	mt = trellis.par.get();
	mt$box.rectangle = list( alpha = .85, fill = brewer.pal(12, "Set3"),
								col = FALSE, lwd = 0);
	mt$par.main.text = list(col="#004164", font=3, cex=1.1);
	mt$dot.line = list( lwd = 1, lty = 1, col = '#808080');
	mt$box.umbrella = list( col= "#00416A", lty=1, lwd = .8);
	mt$dot.symbol = list(pch = 20, col = brewer.pal(8, "Dark2") );
	mt$axis.components = list(	left=list(tck=.7, pad1=1, pad2=1),
								top=list(tck=0, pad1=.2, pad2=0),
								right=list(	tck=0, 	pad1=0, pad2=1 ),
								bottom=list(tck=.3, pad1=0, pad2=0 ),
								left=list(tck=.3, pad1=0, pad2=0)
	);
	mt$box.dot = list(lty = 1, lwd = 0, col = "#FFFFFF" );
	mt$plot.symbol = list(col = "#808080", fill= "#808080", cex = .5,
							alpha = .7, pch=20);
	mt$superpose.symbol = list(col=c("#2E5894", "#B38342", "#2F8568",
		"#99B2B7", "#F9CC58", "#CB4F57"), fill=c("#B38342", "#2F8568",
		"#99B2B7", "#F9CC58", "#CB4F57"), lwd=.8, font=3);
	mt$layout.heights = list(axis=list(bottom=.2));
	mt$fontsize = list(text=9, points=9);
	mt$layout.heights = list(axis.top=.3, main=.4, top.padding=.7);
	mt$strip.background = list(col='steelblue2');
	mt$strip.shingle = list(col='steelblue2');
	mt$strip.border = list(col='transparent');
	mt$axis.components = list(left=list(tck=.8, pad1=0, pad2=0 ),
								top=list(tck=0 , pad1=0, pad2=0 ),
								right=list(	tck=0, pad1=0, pad2=0 ),
								bottom=list(tck=.4, pad1=0, pad2=0 )
	);
	mt$axis.text = list(col='grey60', cex=.9);
	mt$axis.line = list(lwd=0);
	mt$par.xlab.text = list(col="#A9A9A9", lineheight=.8, font=1);
	mt$par.ylab.text = list(col="#A9A9A9", lineheight=.8, font=1)
	mt$axis.components = list( top=list(tck=0),
                        		bottom=list(tck=0.6),
								left=list(tck=0.6));
	mt$layout.heights = list(top.padding = 0,
							main.key.padding = 0,
							key.axis.padding = 0,
							axis.xlab.padding = 0,
							xlab.key.padding = 0,
							key.sub.padding = 0,
							bottom.padding = 0);
	mt$layout.widths = list(left.padding = 1,
							key.ylab.padding = 0,
							ylab.axis.padding = 0,
							axis.key.padding = 0,
							right.padding = 1.5);
	trellis.par.set(mt)
}

# theme for parallel coordinate plots
theme_pp = function() {
	mt = trellis.par.get();
	mt$box.rectangle = list( alpha = .85, fill = brewer.pal(12, "Set3"),
								col = FALSE, lwd = 0);
	mt$par.main.text = list(col="#004164", font=3, cex=1.1);
	mt$dot.line = list( lwd = 1, lty = 1, col = '#808080');
	mt$box.umbrella = list( col= "#00416A", lty=1, lwd = .8);
	mt$dot.symbol = list(pch = 20, col = brewer.pal(8, "Dark2") );
	mt$axis.components = list(	left=list(tck=.7, pad1=1, pad2=1),
								top=list(tck=0, pad1=.2, pad2=0),
								right=list(	tck=0, 	pad1=0, pad2=1 ),
								bottom=list(tck=.3, pad1=0, pad2=0 ),
								left=list(tck=.3, pad1=0, pad2=0)
	);
	mt$superpose.symbol = list(col=c("#2E5894", "#B38342", "#2F8568",
		"#99B2B7", "#F9CC58", "#CB4F57"), fill=c("#B38342", "#2F8568",
		"#99B2B7", "#F9CC58", "#CB4F57"), lwd=.8, font=3);
	mt$plot.line = list(col=c("#2E5894", "#B38342", "#2F8568",
		"#99B2B7", "#F9CC58", "#CB4F57"), lwd=.8);
	mt$add.text = list(col="grey40", cex=.85, font=3);
	mt$box.dot = list(lty = 1, lwd = 0, col = "#FFFFFF" );
	mt$plot.symbol = list(col = c("#2E5894", "#808080", "#B38342",
		"#2F8568", "#99B2B7", "#F9CC58", "#CB4F57"),
		cex = .5, alpha = .8, pch=20);
	mt$superpose.line = list(col = c("#2E5894", "#808080", "#B38342",
		"#2F8568", "#99B2B7", "#F9CC58", "#CB4F57"), alpha=.85, lwd=.8);
	mt$layout.heights = list(axis=list(bottom=.2));
	mt$fontsize = list(text=9, points=9);
	mt$layout.heights = list(axis.top=.3, main=.4, top.padding=.7);
	mt$strip.background = list(col='steelblue2');
	mt$strip.shingle = list(col='steelblue2');
	mt$strip.border = list(col='transparent');
	mt$axis.components = list(left=list(tck=.8, pad1=0, pad2=0 ),
								top=list(tck=0 , pad1=0, pad2=0 ),
								right=list(	tck=0, pad1=0, pad2=0 ),
								bottom=list(tck=.4, pad1=0, pad2=0 )
	);
	mt$axis.text = list(col='grey60', cex=.9);
	mt$axis.line = list(lwd=0);
	mt$par.xlab.text = list(col="#A9A9A9", lineheight=.8, font=1);
	mt$par.ylab.text = list(col="#A9A9A9", lineheight=.8, font=1)
	mt$axis.components = list( top=list(tck=0),
                        		bottom=list(tck=0.6),
								left=list(tck=0.6));
	mt$layout.heights = list(top.padding = 0,
							main.key.padding = 0,
							key.axis.padding = 0,
							axis.xlab.padding = 0,
							xlab.key.padding = 0,
							key.sub.padding = 0,
							bottom.padding = 0);
	mt$layout.widths = list(left.padding = 1,
							key.ylab.padding = 0,
							ylab.axis.padding = 0,
							axis.key.padding = 0,
							right.padding = 1.5);
	trellis.par.set(mt)
}


# theme for xyplots (line/scatter/hybrid/timeseries)
theme_xy = function() {
	mt = trellis.par.get();
	mt$box.rectangle = list( alpha = .85, fill = brewer.pal(12, "Set3"),
								col = FALSE, lwd = 0);
	mt$dot.line = list( lwd = 1, lty = 1, col = '#808080');
	mt$par.main.text = list(col="#004164", font=3, cex=1.1);
	mt$box.umbrella = list( col= "#00416A", lty=1, lwd = .8);
	mt$dot.symbol = list(pch = 20, col = brewer.pal(8, "Dark2") );
	mt$axis.components = list(	left=list(tck=.7, pad1=1, pad2=1),
								top=list(tck=0, pad1=.2, pad2=0),
								right=list(	tck=0, 	pad1=0, pad2=1 ),
								bottom=list(tck=.3, pad1=0, pad2=0 ),
								left=list(tck=.3, pad1=0, pad2=0));
	mt$box.dot = list(lty=1, lwd=0, col="#FFFFFF" );
	mt$plot.symbol = list(col=F, fill="#D9603B", cex=.75,
							alpha=.7, pch=20);
	mt$regions = list(col=c("#9E0142", "#D53E4F", "#F46D43", "#FDAE61",
			"#FEE08B", "#FFFFBF", "#E6F598", "#ABDDA4", "#66C2A5",
			"#3288BD", "#5E4FA2"), alpha=.7);
	mt$plot.line = list(col="#49796B");
	mt$layout.heights = list(axis=list(bottom=.2));
	mt$fontsize = list(text=9, points=9);
	mt$layout.heights = list(axis.top=.3, main=.4, top.padding=.7);
	mt$strip.background = list(col='steelblue2');
	mt$strip.shingle = list(col='steelblue2');
	mt$strip.border = list(col='transparent');
	mt$axis.components = list(left=list(tck=.8, pad1=0, pad2=0 ),
								top=list(tck=0 , pad1=0, pad2=0 ),
								right=list(	tck=0, pad1=0, pad2=0 ),
								bottom=list(tck=.4, pad1=0, pad2=0 )
	);
	mt$axis.text = list(col='grey60', cex=.9);
	mt$add.text = list(col="grey40", cex=.75);
	mt$axis.line = list(lwd=0);
	mt$par.xlab.text = list(col="#A9A9A9", lineheight=.8, font=1);
	mt$par.ylab.text = list(col="#A9A9A9", lineheight=.8, font=1)
	mt$axis.components = list( top=list(tck=0),
                        		bottom=list(tck=0.6),
								left=list(tck=0.6));
	mt$layout.heights = list(top.padding = 0,
							main.key.padding = 0,
							key.axis.padding = 0,
							axis.xlab.padding = 0,
							xlab.key.padding = 0,
							key.sub.padding = 0,
							bottom.padding = 0);
	mt$layout.widths = list(left.padding = 1,
							key.ylab.padding = 0,
							ylab.axis.padding = 0,
							axis.key.padding = 0,
							right.padding = 1.5);
	trellis.par.set(mt)
}

# theme for cloud, wireframe plots
theme_3d = function() {
	mt = trellis.par.get();
	mt$box.rectangle = list( alpha = .85, fill = brewer.pal(12, "Set3"),
								col = FALSE, lwd = 0);
	mt$plot.polygon = list(col = c("#2E5894", "#808080", "#B38342",
		"#2F8568", "#99B2B7", "#F9CC58", "#CB4F57"), alpha=.85,
		border=NULL);
	mt$box.3d = list(col="#497CB3", lwd=1.5);
	mt$dot.line = list( lwd = 1, lty = 1, col = '#808080');
	mt$par.main.text = list(col="#004164", font=3, cex=1.1);
	mt$box.umbrella = list( col= "#00416A", lty=1, lwd = .8);
	mt$dot.symbol = list(pch = 20, col = brewer.pal(8, "Dark2") );
	mt$regions = list(col=c("#9E0142", "#D53E4F", "#F46D43", "#FDAE61",
			"#FEE08B", "#FFFFBF", "#E6F598", "#ABDDA4", "#66C2A5",
			"#3288BD", "#5E4FA2"), alpha=.7);
	mt$axis.components = list(	left=list(tck=.7, pad1=1, pad2=1),
								top=list(tck=0, pad1=.2, pad2=0),
								right=list(	tck=0, 	pad1=0, pad2=1 ),
								bottom=list(tck=.3, pad1=0, pad2=0 ),
								left=list(tck=.3, pad1=0, pad2=0));
	mt$box.dot = list(lty=1, lwd=0, col="#FFFFFF" );
	mt$plot.symbol = list(col=F, fill="#D9603B", cex=.75,
							alpha=.7, pch=20);
	mt$plot.line = list(col="#49796B");
	mt$layout.heights = list(axis=list(bottom=.2));
	mt$fontsize = list(text=9, points=9);
	mt$layout.heights = list(axis.top=.3, main=.4, top.padding=.7);
	mt$strip.background = list(col='steelblue2');
	mt$strip.shingle = list(col='steelblue2');
	mt$strip.border = list(col='transparent');
	mt$axis.components = list(left=list(tck=.8, pad1=0, pad2=0 ),
								top=list(tck=0 , pad1=0, pad2=0 ),
								right=list(	tck=0, pad1=0, pad2=0 ),
								bottom=list(tck=.4, pad1=0, pad2=0 )
	);
	mt$axis.text = list(col='grey60', cex=.9);
	mt$add.text = list(col="grey40", cex=.75);
	mt$par.xlab.text = list(col="#315A78", lineheight=.8, font=1);
	mt$par.ylab.text = list(col="#315A78", lineheight=.8, font=1);
	mt$axis.components = list( top=list(tck=0),
                        		bottom=list(tck=0.6),
								left=list(tck=0.6));
	mt$layout.heights = list(top.padding = 3,
							main.key.padding = 0,
							key.axis.padding = 0,
							axis.xlab.padding = 2,
							xlab.key.padding = 0,
							key.sub.padding = 0,
							bottom.padding = 3);
	mt$layout.widths = list(left.padding = 1,
							key.ylab.padding = 0,
							ylab.axis.padding = 0,
							axis.key.padding = 0,
							right.padding = 1.5);
	trellis.par.set(mt)
}




