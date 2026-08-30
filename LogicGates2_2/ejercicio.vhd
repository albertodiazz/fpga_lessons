library ieee;
use ieee.std_logic_1164.all;

entity logic_gates is 
	port( 
	a, b, c : in std_logic;
	d : OUT std_logic
);
end logic_gates;

architecture flow_logic of logic_gates is
	signal flow1, flow2 : std_logic;
begin
	flow1 <= (a and b);
	flow2 <= flow1 or not c;
	d <= not (a and flow2); 
end flow_logic;
