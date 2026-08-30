library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity logic_gates_tb is
	end logic_gates_tb;

architecture simulation of logic_gates_tb is

	-- Estrcutura de nuestro enitity a probar
	-- esta parte se puede ignorar en VDHL moderno
	component logic_gates is
		port(
		a,b,c : in std_logic; 
		d : out std_logic
	);
	end component logic_gates;

-- Senales de simulacion que conectaremos al entity 
	signal tb_vector : STD_LOGIC_VECTOR(2 downto 0) := "000";
	signal d_out_tb : std_logic;

begin 

	-- Mapeo de puertas logicas con las de simulacion 
	logic_gates_inst: logic_gates
	port map(
						a => tb_vector(0),
						b => tb_vector(1),
						c => tb_vector(2),
						d => d_out_tb
					);

	-- Los loop tienen que estar en un sitmulus
	stimulus : process
		variable bus_vector : UNSIGNED(2 downto 0);
	begin

		for i in 0 to 7 loop
			bus_vector := to_unsigned(i,3); 

			tb_vector <= std_logic_vector(bus_vector);

			wait for 10 ns;
		end loop;
		-- Si no le ponemos esto seguiria corriendo
		wait;
	end process;

end simulation;
