LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY bird IS
	PORT
		( pb1, pb2, clk, vert_sync, left_click	: IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END bird;

architecture flap of bird is

SIGNAL ball_on					: std_logic;
SIGNAL size 					: std_logic_vector(9 DOWNTO 0);  
SIGNAL ball_y_pos				: std_logic_vector(9 DOWNTO 0);
SiGNAL ball_x_pos				: std_logic_vector(10 DOWNTO 0);
SIGNAL ball_y_motion			: std_logic_vector(9 DOWNTO 0);

BEGIN           

size <= CONV_STD_LOGIC_VECTOR(8,10);
-- ball_x_pos and ball_y_pos show the (x,y) for the centre of ball
ball_x_pos <= CONV_STD_LOGIC_VECTOR(320,11);

ball_on <= '1' when ( ('0' & ball_x_pos <= '0' & pixel_column + size) and ('0' & pixel_column <= '0' & ball_x_pos + size) 	-- x_pos - size <= pixel_column <= x_pos + size
					and ('0' & ball_y_pos <= pixel_row + size) and ('0' & pixel_row <= ball_y_pos + size) )  else	-- y_pos - size <= pixel_row <= y_pos + size
			'0';


-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
Red <=  pb1;
Green <= (not pb2) and (not ball_on);
Blue <=  not ball_on;


Move_Ball: process (vert_sync) 
variable prev_click_status: std_logic := '0';
variable velocity: integer := 150;
variable thrust: integer := 0;	
begin
	-- Move ball once every vertical sync
	if (rising_edge(vert_sync)) then
		-- Update thrust 
		if (thrust <= 20) then
			thrust := 0;
		else
			thrust := thrust - 10;
		end if;
		
		-- Set motion
		if(left_click = '1' and prev_click_status = '0') then
			velocity := 150;
			thrust := 150;
			ball_y_motion <= - CONV_STD_LOGIC_VECTOR(0,10);
		elsif (ball_y_pos < 470 or thrust > 0) then
			velocity := velocity + 20 - thrust;
			ball_y_motion <= CONV_STD_LOGIC_VECTOR(velocity/100,10);
		else
			ball_y_motion <= CONV_STD_LOGIC_VECTOR(0,10);
		end if;
		ball_y_pos <= ball_y_pos + ball_y_motion;
		
		-- Update previous click status
		if(left_click = '1') then
			prev_click_status := '1';
		else 
			prev_click_status := '0';
		end if;
	end if;
end process Move_Ball;

END flap;

