------ Main Coide ------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package my_data_types is 
	generic (
						G_num_inputs: positive := 4; -- cantidad de inputs	
						G_size_buffer: positive := 8 -- size buffer input y ouput
					);

					constant num_inputs: positive := G_num_inputs; 
					constant size_buffer: positive := G_size_buffer; 
	-- 4 x 8 : 4 inputs con un tamanno de 8 bits
	type inputs is array (num_inputs-1 downto 0) of STD_LOGIC_VECTOR(size_buffer-1 downto 0);

end package my_data_types;

------ Multiplexor 4 x 8 : 4 inputs con un tamanno de 8 bits ------------------------
package mux_4x8 is new work.my_data_types
	generic map (
								G_num_inputs => 4,
								G_size_buffer => 8
							);

------ Main Coide ------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mux_4x8.all;

entity multiplexor is 
	port(
				x : in inputs;	
				-- Hay que restringir por seguridad
				sel : in integer range 0 to num_inputs-1;
				m : out STD_LOGIC_VECTOR(size_buffer-1 downto 0) -- solo es un output
			);
end multiplexor;	

architecture multiplexor of multiplexor is 
begin 
	m <= x(sel);
end multiplexor;
