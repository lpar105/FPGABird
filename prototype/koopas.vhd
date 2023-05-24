LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY koopas IS
	PORT
		 (clk, vert_sync, enable	: IN std_logic;
        pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  random_num: 		IN std_logic_vector(6 DOWNTO 0);
		  pipe_x1_pos		: IN std_logic_vector(10 DOWNTO 0);
		  pipe_x2_pos		: IN std_logic_vector(10 DOWNTO 0);
		  game_mode									: IN std_logic_vector(2 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END koopas;


architecture fly of koopas is

SIGNAL koopa_on					: std_logic;
SIGNAL size 					   : std_logic_vector(9 DOWNTO 0);  
SIGNAL koopa_y_pos				: std_logic_vector(10 DOWNTO 0);
SiGNAL koopa_x_pos				: std_logic_vector(10 DOWNTO 0);  	
SIGNAL koopa_x_motion			: std_logic_vector(9 DOWNTO 0);

BEGIN           


size <= CONV_STD_LOGIC_VECTOR(8,10);

koopa_on <= '1' when ( ('0' & koopa_x_pos <= '0' & pixel_column + size) and ('0' & pixel_column <= '0' & koopa_x_pos + size) 	-- x_pos - size <= pixel_column <= x_pos + size
					and ('0' & koopa_y_pos <= pixel_row + size) and ('0' & pixel_row <= koopa_y_pos + size) and (enable = '1') and (game_mode = "011" or game_mode = "010"))  else	-- y_pos - size <= pixel_row <= y_pos + size
			'0';


-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
Green <= koopa_on;

Move_Pipe: process (vert_sync)
begin
	-- Move pipes to the left once every vertical sync
	if (rising_edge(vert_sync)) then
		if ((pipe_x1_pos > 0) and (pipe_x1_pos < 460)) then
			koopa_x_pos <= pipe_x1_pos + CONV_STD_LOGIC_VECTOR(180,11);
		else
			koopa_x_pos <= pipe_x2_pos - CONV_STD_LOGIC_VECTOR(140,11);
		end if;
		
		if (koopa_x_pos > 635) then
			koopa_y_pos <= random_num + CONV_STD_LOGIC_VECTOR(200,11);
		end if;
	end if;
end process Move_Pipe;


END fly;

