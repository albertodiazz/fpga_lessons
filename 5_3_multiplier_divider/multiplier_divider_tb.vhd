library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_tb is 
	end test_tb;


architecture simulation of test_tb is

	component multiplier_divider is
		port( 
		a, b: in INTEGER range 0 to 255; 
		x,y: out INTEGER  
	);
	end component multiplier_divider;

	 -- Las senales no tienen in y ni out
		signal a_tb, b_tb: INTEGER range 0 to 255;
		signal x_tb, y_tb: INTEGER; 


begin
		multiplier_divider_inst: multiplier_divider
		 port map(
		    a => a_tb,
		    b => b_tb,
		    x => x_tb,
		    y => y_tb
		);

		stimulus: process
		begin
		a_tb <= 2;
		b_tb <= 4;
		wait for 10 ns;
		a_tb <= 2;
		b_tb <= 5;
		wait for 10 ns;
		a_tb <= 8;
		b_tb <= 1;
		wait for 10 ns;
		a_tb <= 2;
		b_tb <= 1;
		wait for 10 ns;
		wait;
		end process;

end simulation;
