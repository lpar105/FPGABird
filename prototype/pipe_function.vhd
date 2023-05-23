LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;



ENTITY pipes IS
	PORT
		(clk, vert_sync, enable, disable		: IN std_logic;
       pixel_row, pixel_column				: IN std_logic_vector(9 DOWNTO 0);
		 random_num								: IN std_logic_vector(6 DOWNTO 0);
		 game_mode									: IN std_logic_vector(2 DOWNTO 0); 
		 red, green, blue, halfway 			: OUT std_logic;
		 x1									: OUT std_logic_vector(10 DOWNTO 0); 	
		 x2									: OUT std_logic_vector(10 DOWNTO 0)); 	 
END pipes;

architecture behavior of pipes is

SIGNAL pipe1_on					: std_logic;
SIGNAL pipe2_on					: std_logic;
SIGNAL pipe_height 				: std_logic_vector(10 DOWNTO 0);  
SIGNAL pipe_width 				: std_logic_vector(9 DOWNTO 0); 
SIGNAL pipe1_y_pos				: std_logic_vector(9 DOWNTO 0);
SIGNAL pipe2_y_pos				: std_logic_vector(9 DOWNTO 0);
SiGNAL pipe1_x_pos				: std_logic_vector(10 DOWNTO 0);  
SiGNAL pipe2_x_pos				: std_logic_vector(10 DOWNTO 0);	
SIGNAL pipe_x_motion				: std_logic_vector(9 DOWNTO 0);
SIGNAL pipe1_gap					: std_logic_vector(10 DOWNTO 0);
SIGNAL pipe2_gap					: std_logic_vector(10 DOWNTO 0);

BEGIN           

pipe1_y_pos <= CONV_STD_LOGIC_VECTOR(240,10);
pipe2_y_pos <= CONV_STD_LOGIC_VECTOR(240,10);
pipe_height <= CONV_STD_LOGIC_VECTOR(480,11);
pipe_width <= CONV_STD_LOGIC_VECTOR(30,10);


pipe1_on <= '1' when ( ('0' & (pipe1_x_pos + 15) <= '0' & pixel_column + pipe_width) and ('0' & pixel_column <= '0' & (pipe1_x_pos + 15) + pipe_width) 	-- x_pos - size <= pixel_column <= x_pos + size
					and ('0' & pipe1_y_pos <= pixel_row + pipe_height) and ('0' & pixel_row <= pipe1_y_pos + pipe_height) and not(250 + pipe1_gap > pixel_row AND pixel_row > 150 + pipe1_gap) and (pixel_row > 60) and (enable = '1'))
					else '0';-- y_pos - size <= pixel_row <= y_pos + size
					
pipe2_on <= '1' when ( ('0' & (pipe2_x_pos + 15) <= '0' & pixel_column + pipe_width) and ('0' & pixel_column <= '0' & (pipe2_x_pos + 15) + pipe_width) 	-- x_pos - size <= pixel_column <= x_pos + size
					and ('0' & pipe2_y_pos <= pixel_row + pipe_height) and ('0' & pixel_row <= pipe2_y_pos + pipe_height) and not(250 + pipe2_gap > pixel_row AND pixel_row > 150 + pipe2_gap) and (pixel_row > 60) and (enable = '1'))
					else '0';-- y_pos - size <= pixel_row <= y_pos + size
					
--halfway <= '1' when (pipe_x_pos < 280 AND pipe_x_pos > 250) else '0';
			


-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
Green <= pipe1_on or pipe2_on;
x1 <= pipe1_x_pos;
x2 <= pipe2_x_pos;


Move_Pipe: process (vert_sync)
variable speed: integer := 2;
begin
	-- Move pipes to the left once every vertical sync
	if (rising_edge(vert_sync)) then
	
		if (game_mode = "010") then
			speed := 3;
		elsif (game_mode = "011") then
			speed := 4;
		else
			speed := 2;
		end if;
		
		if (disable = '1') then
			NULL;
		elsif (pipe1_x_pos < 0) then				
			pipe2_x_pos <= CONV_STD_LOGIC_VECTOR(320,11);
			pipe1_x_pos <= CONV_STD_LOGIC_VECTOR(640,11);
			pipe1_gap <= "00000001110" + random_num;			
			pipe_x_motion <= - CONV_STD_LOGIC_VECTOR(speed,10);
			halfway <= '1';
		elsif (pipe2_x_pos < 0) then		
			pipe1_x_pos <= CONV_STD_LOGIC_VECTOR(320,11);
			pipe2_x_pos <= CONV_STD_LOGIC_VECTOR(640,11);
			pipe2_gap <= "00000001110" + random_num;	
			
			pipe_x_motion <= - CONV_STD_LOGIC_VECTOR(speed,10);
			halfway <= '1';
		else	
			pipe_x_motion <= - CONV_STD_LOGIC_VECTOR(speed,10);
			pipe1_x_pos <= pipe1_x_pos + pipe_x_motion;
			pipe2_x_pos <= pipe2_x_pos + pipe_x_motion;
			halfway <= '0';
		end if;
	end if;
end process Move_Pipe;

END behavior;