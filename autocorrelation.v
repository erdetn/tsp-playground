module main

import os

import tsp
import tsp.signal

import vplot

fn main() {
	mut plotter := vplot.new_plot()

	defer {
		plotter.close()
	}
	plotter.style(vplot.style_linespoints)

	x := [f64(0), 1, 4, 8, 12, 16, 12, 8, 4, 1, 0]

	rxx := signal.conv<f64>(x, x)

	plotter.plot_y(x, 'x') or { println('${err}') }
	plotter.plot_y(rxx, 'rxx') or { println('${err}') }
	tsp.print(rxx, 'rxx')

	_ := os.input('Press [ENTER] to continue...')
}