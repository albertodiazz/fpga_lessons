all: 
	ghdl -a logic_gates.vhd
	ghdl -a logic_gates_tb.vhd
	ghdl -e logic_gates_tb
	ghdl -r logic_gates_tb --wave=logic_gates.ghw

wave:
	gtkwave logic_gates.ghw

clean:
	rm -f *.o *.cf logic_gates_tb logic_gates.ghw
