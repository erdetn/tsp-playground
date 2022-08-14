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
	pz   := signal.dft_power(z)
	xi   := signal.idft(z)

	mut plotter := vplot.new()
	plotter.enable_multiplot(vplot.Multiplotter{
		rows: 5
		cols: 1
		title: 'DFT'
	})
	plotter.style(vplot.style_linespoints)

	plotter.plot(x,    'input x')	or {}
	plotter.plot(z_re, 're{X}')     or {}
	plotter.plot(z_im, 'im{X}')     or {}
	plotter.plot(pz,   'Power(X)')  or {}
	plotter.plot(xi,   'idft(x)')   or {}

	for j := 0; j < x.len; j++ {
		println('[${j}] x=${x[j]:.6f}, xi=${xi[j]:.6f}')
	}

	_ := os.input('Press [ENTER] to continue')
	plotter.disable_multiplot()
}
