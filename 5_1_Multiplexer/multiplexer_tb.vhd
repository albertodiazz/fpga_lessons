library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mux_4x8.all;

entity test_bench is 
	end test_bench;

architecture simulation of test_bench is  

	component multiplexor is 
		port(
					x : in inputs;	
					sel : in integer range 0 to num_inputs-1;
					m : out STD_LOGIC_VECTOR(size_buffer-1 downto 0) -- solo es un output
				);
	end component multiplexor;

	-- Senales de test bench, son tus pruebas
	-- Ocupamos input para poder asignarle valores en el loop
	signal tb_vector : inputs; 
	signal tb_sel: integer range 0 to num_inputs-1 := 0;
	signal tb_m: STD_LOGIC_VECTOR(size_buffer-1 downto 0) := (others=>'0');

begin 	

		-- Tenemos que hacer el mapeo de nuestro entity
	multiplexto_enitiy: entity work.multiplexor 	
	port map(
						x => tb_vector,
						sel => tb_sel,
						m => tb_m
					);

	stimulus : process
	begin

		for i in 0 to num_inputs-1 loop
			tb_vector(i) <= STD_LOGIC_VECTOR(to_unsigned(i**2,size_buffer)); 
			tb_sel <= i;
			wait for 10 ns;
		end loop;

	end process;

end simulation;
