module main

import tsp
import tsp.signal
import vplot
import os

fn main() {
	x := [0.0, 4.0, 8.0, 12.0, 16.0, 12.0, 8.0, 4.0, 0.0]

	z := signal.dft[f64](x)

	z_re := z.map(it.re)
	z_im := z.map(it.im)
	pz := signal.dft_power(z)
	xi := signal.idft(z)

	mut plotter := vplot.new()
	plotter.enable_multiplot(vplot.Multiplotter{
		rows: 5
		cols: 1
		title: 'DFT'
	})

	plotter.style(vplot.style_linespoints)
	plotter.plot(x, 'input x') or {}
	plotter.plot(z_re, 're{X}') or {}
	plotter.plot(z_im, 'im{X}') or {}
	plotter.plot(pz, 'Power(X)') or {}
	plotter.plot(xi, 'idft(x)') or {}

	for j := 0; j < x.len; j++ {
		println('[$j] x=${x[j]:.6f}, xi=${xi[j]:.6f}')
	}

	_ := os.input('Press [ENTER] to continue')
	plotter.disable_multiplot()
}
