LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY star IS
	PORT
		 (clk, vert_sync, enable	: IN std_logic;
        pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  random_num: 		IN std_logic_vector(6 DOWNTO 0);
		  pipe_x1_pos		: IN std_logic_vector(10 DOWNTO 0);
		  pipe_x2_pos		: IN std_logic_vector(10 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END star;


architecture fly of star is

SIGNAL star_on					: std_logic;
SIGNAL size 					: std_logic_vector(9 DOWNTO 0);  
SIGNAL star_y_pos				: std_logic_vector(10 DOWNTO 0);
SiGNAL star_x_pos				: std_logic_vector(10 DOWNTO 0);  	
SIGNAL star_x_motion			: std_logic_vector(9 DOWNTO 0);
SIGNAL rand: std_logic;

BEGIN           


size <= CONV_STD_LOGIC_VECTOR(8,10);

star_on <= '1' when ( ('0' & star_x_pos <= '0' & pixel_column + size) and ('0' & pixel_column <= '0' & star_x_pos + size) 	-- x_pos - size <= pixel_column <= x_pos + size
					and ('0' & star_y_pos <= pixel_row + size) and ('0' & pixel_row <= star_y_pos + size) and (enable = '1') and rand = '1')  else	-- y_pos - size <= pixel_row <= y_pos + size
			'0';


-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
red <= star_on;
green <= star_on;

Move_Star: process (vert_sync)
begin
	-- Move pipes to the left once every vertical sync
	if (rising_edge(vert_sync)) then
		if ((pipe_x1_pos > 0) and (pipe_x1_pos < 460)) then
			star_x_pos <= pipe_x1_pos + CONV_STD_LOGIC_VECTOR(180,11);
		else
			star_x_pos <= pipe_x2_pos - CONV_STD_LOGIC_VECTOR(140,11);
		end if;
		
		if (star_x_pos > 635) then
			star_y_pos <= random_num & "010"	+ CONV_STD_LOGIC_VECTOR(200,11);
			rand <= random_num(3);
		end if;
	end if;
end process Move_Star;


END fly;

