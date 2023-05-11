LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY one_up IS
	PORT
		(clk, vert_sync, enable	: IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
			random_num: 		IN std_logic_vector(6 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END one_up;


architecture flap of one_up is
begin


END flap;

