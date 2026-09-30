all: 
	ghdl -a --std=08 priorityEncoder.vhd
	ghdl -a --std=08 priorityEncoder_tb.vhd
	# Ojo esto busca el nombre de la entidad declarada
	# que en este caso es nuestro test bench
	ghdl -e --std=08 test_bench 
	ghdl -r --std=08 test_bench --vcd=priority_encoder.vcd --stop-time=80ns

wave:
	gtkwave priority_encoder.vcd

synth:
	ghdl -a ejercicio.vhd
	# Lo pasamos a verilog
	ghdl --synth --out=verilog logic_gates original > original.v
	yosys -p "read_verilog original.v; synth -top logic_gates; stat; show -format svg -prefix original_yosys"

clean:
	rm -f *.o *.cf logic_gates logic_gates.ghw *.v
