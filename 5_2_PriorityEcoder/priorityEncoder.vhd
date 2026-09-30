-- Tengo que realizar un priority enconder de 7 inputs a un 1 bit. 
-- El output del enconder deber representar la direccion del bit mas alto
-- en el orden de los inputs
-- {0,1,1,0,0,1,0} El Msb mas alto de izquierda a derecha es 1 con una direccion 6
-- {1,2,3,4,5,6,7} dominio Z+, de esta forma tienes que represtarlos, sin contar el 0

------ Main Coide ------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

package my_priority_encoder is 
	generic (
						G_num_inputs: positive := 7; -- cantidad de inputs	
						G_size_buffer: positive := 1;   
						G_size_output: positive := 3 -- Encoder output
					);

					constant encoder_output: positive := G_size_output;
	-- 4 x 8 : 4 inputs con un tamanno de 8 bits
	type inputs is array (G_num_inputs downto 1) of BIT_VECTOR(G_size_buffer-1 downto 0);

end package my_priority_encoder;

------ Multiplexor 4 x 8 : 4 inputs con un tamanno de 8 bits ------------------------
package encoder7x1_3 is new work.my_priority_encoder
	generic map (
								G_num_inputs => 7,
								G_size_buffer => 1,
								G_size_output => 3
							);

------ Main Coide ------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.encoder7x1_3.all;

entity priority_encoder is 
	port(
				input : in inputs;	
				-- Buffer relacionado a la cantidad de inputs que es 3
				output : out  STD_LOGIC_VECTOR(encoder_output-1 downto 0)
			);
end priority_encoder;	

architecture priority_encoder of priority_encoder is 
begin 

	process(input)
	begin 
		output <= (others=>'0');
		for i in input'range loop
			if input(i) = "1" then 
				output <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, output'length));
				exit;
			end if;
		end loop;
	end process;

end priority_encoder;
