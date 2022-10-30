module main

import os
import tsp 
import tsp.iir
import vplot
import samples

fn main() {
	mut plotter := vplot.new()
	plotter.style(vplot.style_linespoints)
	plotter.enable_multiplot(vplot.Multiplotter {
		rows: 2
		cols: 1
		title: 'IIR Filter'
	})

	println(tsp.version())

	c := [
        f32(0.0025892381),
        0.5913599133, 0.8879900575,-2.0000000000, 1.0000000000,
        0.9156184793, 0.6796731949,-2.0000000000, 1.0000000000,
        1.3316441774, 0.5193183422,-2.0000000000, 1.0000000000
        ]


	samples := samples.get_samples()
	mut y := []f64{cap: samples.len}

	mut filter := iir.new(c) or {
		println('$err')
		return
	}

	mut i := 0
	mut ys := f64(0)
	for sample in samples {
		ys = f64(filter.filter(f32(sample)))
		// println('[$i] fir($sample) -> y = $y>')
		y << ys
		i++
	}

	plotter.plot(samples, 'samples') or  {}
	plotter.plot(y, 'filtered samples') or  {}

	_ := os.input('Press [ENTER] to continue...')
	plotter.disable_multiplot()
}
