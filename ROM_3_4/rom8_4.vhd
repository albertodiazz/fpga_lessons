-- Todo aun tenemos pendiente optimizar la memoria y ocupar bien un decoder
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

package my_data_types is

	type size_palabras is array (3 downto 0) of bit;
	type mem1 is array(0 to 7) of size_palabras;

end my_data_types;

use work.my_data_types.all;

entity rom_ejercicio is
	PORT(
				Input : IN bit_vector(2 downto 0);
				Output : Out size_palabras
			);
end rom_ejercicio;

architecture rtl of rom_ejercicio is 

	constant memoria : mem1 := (
	0 => "0110",
	1 => "1001",
	2 => "1100",
	3 => "0001",
	4 => "0010",
	5 => "0000",
	6 => "1111",
	7 => "1010"
);

begin 
	Output <= memoria(0) when Input = "000" else 
						memoria(1) when Input = "001" else 
						memoria(2) when Input = "010" else 
						memoria(3) when Input = "011" else 
						memoria(4) when Input = "100" else 
						memoria(5) when Input = "101" else 
						memoria(6) when Input = "110" else 
						memoria(7);
end rtl;
