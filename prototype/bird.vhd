LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY Mario IS
	PORT
		( clk, vert_sync, left_click, enable, disable	: IN std_logic;
        pixel_row, pixel_column					: IN std_logic_vector(9 DOWNTO 0);
		  red, green, blue 							: OUT std_logic);		
END Mario;

architecture flap of Mario is

SIGNAL bird_on					: std_logic;
SIGNAL size 					: std_logic_vector(9 DOWNTO 0);  
SIGNAL bird_y_pos				: std_logic_vector(9 DOWNTO 0):= "0011110000";
SIGNAL bird_x_pos				: std_logic_vector(10 DOWNTO 0);
SIGNAL bird_y_motion			: std_logic_vector(9 DOWNTO 0);

BEGIN           

size <= CONV_STD_LOGIC_VECTOR(8,10);
-- bird_x_pos and ball_y_pos show the (x,y) for the centre of bird
bird_x_pos <= CONV_STD_LOGIC_VECTOR(320,11);

bird_on <= '1' when ( ('0' & bird_x_pos <= '0' & pixel_column + size) and ('0' & pixel_column <= '0' & bird_x_pos + size) 	-- x_pos - size <= pixel_column <= x_pos + size
					and ('0' & bird_y_pos <= pixel_row + size) and ('0' & pixel_row <= bird_y_pos + size) and (enable = '1'))  else	-- y_pos - size <= pixel_row <= y_pos + size
			'0';


-- Colours for pixel data on video signal
-- Changing the background and bird
blue <= bird_on;


Move_Mario: process (vert_sync) 
variable prev_click_status: std_logic := '0';
variable velocity: integer := 150;
variable thrust: integer := 0;	
begin
	-- Move bird once every vertical sync
	if (rising_edge(vert_sync)) then
	if (enable = '1') then
		-- Update thrust 
		if (thrust <= 20) then
			thrust := 0;
		else
			thrust := thrust - 6;
		end if;
		
		-- Set motion
		if (disable = '1') then
			-- don't move when paused and dead
			bird_y_motion <= CONV_STD_LOGIC_VECTOR(0,10);
		elsif(left_click = '1' and prev_click_status = '0') then
		   -- Push the bird
			velocity := 150;
			if (thrust >= 20) then
				-- Smaller thrust when spam clicking
				thrust :=  thrust + 35;
			else
				thrust :=  100;
			end if;
			bird_y_motion <= - CONV_STD_LOGIC_VECTOR(0,10);
		elsif (bird_y_pos < 470 or thrust > 0) then
			-- Fall
			velocity := velocity + 20 - thrust;
			bird_y_motion <= CONV_STD_LOGIC_VECTOR(velocity/100,10);
		else
			-- Don't fall if off screen (no wrapping)
			bird_y_motion <= CONV_STD_LOGIC_VECTOR(0,10);
		end if;
		bird_y_pos <= bird_y_pos + bird_y_motion;
		
		if (bird_y_pos > 413) then
			-- Stick to floor
			bird_y_pos <= CONV_STD_LOGIC_VECTOR(413,10);
			velocity := 0;
		end if;
		
		if (bird_y_pos < 64) then
			-- Stick to ceiling
			bird_y_pos <= CONV_STD_LOGIC_VECTOR(68,10);
			velocity := 0;
		end if;
		
		-- Update previous click status so click and hold does nothing
		if(left_click = '1') then
			prev_click_status := '1';
		else 
			prev_click_status := '0';
		end if;
	end if;
	end if;
end process Move_Mario;

END flap;

