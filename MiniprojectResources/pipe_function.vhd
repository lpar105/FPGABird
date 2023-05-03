LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;



ENTITY pipe_function IS
	PORT
		(pb1, pb2, clk, vert_sync, left_click	: IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
			random_num: 		IN std_logic_vector(6 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END pipe_function;

architecture behavior of pipe_function is

SIGNAL pipe_on					: std_logic;
SIGNAL pipe_height 			: std_logic_vector(9 DOWNTO 0);  
SIGNAL pipe_width 			: std_logic_vector(9 DOWNTO 0); 
SIGNAL pipe_y_pos				: std_logic_vector(9 DOWNTO 0);
SiGNAL pipe_x_pos				: std_logic_vector(10 DOWNTO 0);
SIGNAL pipe_x_motion			: std_logic_vector(9 DOWNTO 0);

BEGIN           

pipe_y_pos <= CONV_STD_LOGIC_VECTOR(240,10);
pipe_height <= CONV_STD_LOGIC_VECTOR(150,10);
pipe_width <= CONV_STD_LOGIC_VECTOR(30,10);


pipe_on <= '1' when ( ('0' & pipe_x_pos <= '0' & pixel_column + pipe_width) and ('0' & pixel_column <= '0' & pipe_x_pos + pipe_width) 	-- x_pos - size <= pixel_column <= x_pos + size
					and ('0' & pipe_y_pos <= pixel_row + pipe_height) and ('0' & pixel_row <= pipe_y_pos + pipe_height) )  else	-- y_pos - size <= pixel_row <= y_pos + size
			'0';


-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
Red <=  pb1;
Green <= (not pb2) and (not pipe_on);
Blue <=  not pipe_on;


Move_Pipe: process (vert_sync)
		variable z: std_logic_vector(6 DOWNTO 0);
begin
	-- Move ball once every vertical sync
	if (rising_edge(vert_sync)) then
		if (pipe_x_pos < 10) then
			z := random_num;
			pipe_x_pos <= CONV_STD_LOGIC_VECTOR(unsigned(z) + 100,11);	
			pipe_x_motion <= - CONV_STD_LOGIC_VECTOR(2,10);
		else
			pipe_x_motion <= - CONV_STD_LOGIC_VECTOR(2,10);
			pipe_x_pos <= pipe_x_pos + pipe_x_motion;
		end if;
	end if;
end process Move_Pipe;

END behavior;

