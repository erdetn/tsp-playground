module main

import tsp
import tsp.signal
import vplot
import os

fn main() {
	x := [0.672957, -0.453061, -0.835088, 0.980334, 0.972232, 0.640295, 0.791619, -0.042803,
	      0.282745,  0.153629,  0.939992, 0.588169, 0.189058, 0.461301 -0.667901, -0.314791]

	z := signal.dft<f64>(x)
	
	z_re := z.map(it.re)
	z_im := z.map(it.im)

	mut plotter := vplot.new()
	plotter.enable_multiplot(vplot.Multiplotter{
		rows: 3
		cols: 1
		title: 'DFT'
	})
	plotter.style(vplot.style_linespoints)

	plotter.plot(x, 'input x')	or {}
	plotter.plot(z_re, 're{X}') or {}
	plotter.plot(z_im, 'im{X}') or {}

	_ := os.input('Press [ENTER] to continue')
	plotter.disable_multiplot()
}