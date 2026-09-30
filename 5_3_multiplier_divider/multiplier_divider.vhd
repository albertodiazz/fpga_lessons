-- Tengo que realizar un multiplier y divider de forma CONCURRENTE 
-- a y b => inputs 8 bits
-- x => resultado de multiplicar 2 numeros de 8 bits
-- y ==> es a/2

-- Por lo tanto a y b son numero Z+ 

------ Main Coide ------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;


entity multiplier_divider is 
	-- en range representamos los 8 bits 2 ** 8 = 256 como UNSIGNED
	-- de ser -128, ... , 127 seria SIGNED
	port(
				a, b: in INTEGER range 0 to 255; 
				x,y: out INTEGER  
			);
end multiplier_divider;

architecture multiplier_divider of multiplier_divider is  

begin 
	x <= a * b;
	y <= a/2;
end multiplier_divider;
