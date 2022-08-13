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

	x := [f64(0), 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0, 0, 0, 0]
	h := [f64(1), -1] // filter kernel
	
	// Edge detection (bump enhancement) //
	y := signal.conv<f64>(x, h)

	plotter.plot_y(x, 'x') or { println('${err}') }
	plotter.plot_y(y, 'y') or { println('${err}') }

	_ := os.input('Press [ENTER] to continue...')
}