module main

import tsp
import tsp.fir

fn main() {
	window := fir.hamming(10)
	//fir.hanning(10)

	mut i := 0
	for w in window {
		println('w[${i}] = ${w}')
		i++
	}
}