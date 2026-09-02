all: 
	ghdl -a ejercicio.vhd
	ghdl -a ejercicio_tb.vhd
	# Ojo esto busca el nombre de la entidad declarada
	# que en este caso es nuestro test bench
	ghdl -e logic_gates_tb 
	ghdl -r logic_gates_tb --wave=logic_gates.ghw --stop-time=80ns

wave:
	gtkwave logic_gates.ghw

synth:
	ghdl -a ejercicio.vhd
	# Lo pasamos a verilog
	ghdl --synth --out=verilog logic_gates original > original.v
	ghdl --synth --out=verilog logic_gates equivalencia > equivalencia.v
	yosys -p "read_verilog original.v; synth -top logic_gates; stat; show -format svg -prefix original_yosys"
	yosys -p "read_verilog equivalencia.v; synth -top logic_gates; stat; show -format svg -prefix equivalencia_yosys"

clean:
	rm -f *.o *.cf logic_gates logic_gates.ghw *.v
