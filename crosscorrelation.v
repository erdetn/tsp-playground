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

	x := [f64(3), 11, -17, 0, 11, -14, 22, -24, 15, 0, -17, 21, -31]
	h := [f64(-2), -2, 0, 2, 2]
	
	y := signal.conv[f64](x, h)

	rxy := signal.conv[f64](x, y)

	plotter.plot(x, 'x') or { println('${err}') }
	plotter.plot(y, 'y') or { println('${err}') }
	// plotter.plot_y(rxy, 'rxy') or { println('${err}') }


	_ := os.input('Press [ENTER] to continue...')
}
