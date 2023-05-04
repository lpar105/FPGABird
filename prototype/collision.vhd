LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;



ENTITY collision IS
	PORT
		(clk, red_bird, green_bird, blue_bird, red_pipe, green_pipe, blue_pipe: IN std_logic;
		  red, green, blue, hit: OUT std_logic);		
END collision;

architecture combine of collision is

BEGIN           

		red <= '0';
		green <= green_pipe;
		blue <= blue_bird;
		
		hit <= green_pipe AND blue_bird;

END combine;

