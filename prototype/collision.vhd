LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;



ENTITY collision IS
	PORT
		(clk, red_bird, green_bird, blue_bird, red_pipe, green_pipe, blue_pipe, red_koopa, green_koopa, blue_koopa, red_star, green_star, blue_star, red_oneup, green_oneup, blue_oneup: IN std_logic;
		  red, green, blue, hit: OUT std_logic;
		  lives: OUT Std_logic_vector(9 downto 0));		
END collision;

architecture combine of collision is

BEGIN           

		red <= '0';
		green <= green_pipe;
		blue <= blue_bird;
		
		hit <= green_pipe AND blue_bird;

END combine;

