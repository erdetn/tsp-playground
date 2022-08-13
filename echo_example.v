module main

import tsp
import tsp.signal

import vplot
import os

fn main() {
	x := [f64(1),1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]

	y := signal.echo<f64, f64>(x, [
		signal.EchoParameters{delay: 2, attenuation: 0.8},
		signal.EchoParameters{delay: 4, attenuation: 0.2}
	])

	mut plot := vplot.new_plot()
	plot.style(vplot.style_linespoints)
	defer {
		plot.close()
	}
	plot.plot_y(y, 'echo') or {
		println('error: ${err}')
	}

	tsp.print(y, 'y')

	rc := os.input('Press [ENTER] to continue')
}