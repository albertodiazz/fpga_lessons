library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.encoder7x1_3.all;

-- Nombre para la simulacion ghdl -e
entity test_bench is 
	end test_bench;

architecture simulation of test_bench is

	-- Nombre del gtkwave
	component priority_encoder is 
	port(
				input : in inputs;	
	
				-- Buffer relacionado a la cantidad de inputs que es 3
				output : out  STD_LOGIC_VECTOR(encoder_output-1 downto 0)
			);

	end component priority_encoder;

	-- Recuerda son las senales que nos serviran para mapear nuestro componenete
	signal tb_input : inputs; 
	signal tb_output: STD_LOGIC_VECTOR(encoder_output-1 downto 0);

begin 

	-- Inicializamos el priority encoder
	priority_encoder_inst: entity work.priority_encoder
	port map(
						input => tb_input,
						output => tb_output
					);


	stimulus : process
	begin

	tb_input <= ("1","0","0","0","0","0","0");
	wait for 10 ns;
	tb_input <= ("0","1","0","0","0","0","0");
	wait for 10 ns;
	tb_input <= ("0","0","1","0","0","0","0");
	wait for 10 ns;
	tb_input <= ("0","0","0","1","0","0","0");
	wait for 10 ns;
	tb_input <= ("0","0","0","0","1","0","0");
	wait for 10 ns;
	tb_input <= ("0","0","0","0","0","1","0");
	wait for 10 ns;
	tb_input <= ("0","0","0","0","0","0","1");
	wait for 10 ns;

	wait; 
	end process;

end simulation;
