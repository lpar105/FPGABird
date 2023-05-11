LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;



ENTITY pipe_function IS
	PORT
		(clk, vert_sync:	 IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
			random_num: 		IN std_logic_vector(6 DOWNTO 0);
		  red, green, blue, halfway 			: OUT std_logic;
		FinalGameMode     : IN std_logic;
      turnOnPipe	: IN std_logic);
END pipe_function;

architecture behavior of pipe_function is

SIGNAL pipe_on					: std_logic;
SIGNAL pipe_height 			: std_logic_vector(10 DOWNTO 0);  
SIGNAL pipe_width 			: std_logic_vector(9 DOWNTO 0); 
SIGNAL pipe_y_pos				: std_logic_vector(9 DOWNTO 0);
SiGNAL pipe_x_pos				: std_logic_vector(10 DOWNTO 0);
SIGNAL pipe_x_motion			: std_logic_vector(9 DOWNTO 0);
SIGNAL pipe_gap				: std_logic_vector(10 DOWNTO 0);

BEGIN           

pipe_y_pos <= CONV_STD_LOGIC_VECTOR(240,10);
pipe_height <= CONV_STD_LOGIC_VECTOR(480,11);
pipe_width <= CONV_STD_LOGIC_VECTOR(30,10);


pipe_on <= '1' when ( ('0' & (pipe_x_pos + 15) <= '0' & pixel_column + pipe_width) and ('0' & pixel_column <= '0' & (pipe_x_pos + 15) + pipe_width) 	-- x_pos - size <= pixel_column <= x_pos + size
					and ('0' & pipe_y_pos <= pixel_row + pipe_height) and ('0' & pixel_row <= pipe_y_pos + pipe_height) and not(350 + pipe_gap > pixel_row AND pixel_row > 50 + pipe_gap) and (turnOnPipe = '1'))
					else '0';-- y_pos - size <= pixel_row <= y_pos + size
					
--halfway <= '1' when (pipe_x_pos < 280 AND pipe_x_pos > 250) else '0';
			


-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
Green <= pipe_on;


Move_Pipe: process (vert_sync)
begin
	-- Move ball once every vertical sync
	if (rising_edge(vert_sync)) then
		if (pipe_x_pos + 30 < 0) then
			pipe_gap <= "00000110010" + random_num;
			pipe_x_pos <= CONV_STD_LOGIC_VECTOR(640 + 15,11);	
			pipe_x_motion <= - CONV_STD_LOGIC_VECTOR(2,10);
			halfway <= '1';
		else	
			pipe_x_motion <= - CONV_STD_LOGIC_VECTOR(2,10);
			pipe_x_pos <= pipe_x_pos + pipe_x_motion;
			halfway <= '0';
		end if;
	end if;
end process Move_Pipe;

END behavior;

