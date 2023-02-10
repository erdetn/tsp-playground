module main

import os

import tsp
import tsp.signal

import vplot

fn main() {
	mut plotter := vplot.new()

	defer {
		plotter.close()
	}
	plotter.style(vplot.style_linespoints)

	x := [f64(0), 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0, 0, 0, 0]
	h := [f64(1), -1] // filter kernel
	
	// Edge detection (bump enhancement) //
	y := signal.conv[f64](x, h)

	plotter.plot(x, 'x') or { println('${err}') }
	plotter.plot(y, 'y') or { println('${err}') }

	_ := os.input('Press [ENTER] to continue...')
}
