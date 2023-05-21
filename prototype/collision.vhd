LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY collision IS
	PORT (
		clk, red_bird, green_bird, blue_bird, red_pipe, green_pipe, blue_pipe, red_koopa, green_koopa, blue_koopa, red_star, green_star, blue_star, red_oneup, green_oneup, blue_oneup: IN std_logic;
		currentlives : in std_logic_vector(2 downto 0);
		hitTrigger : in std_logic;
		setLives : in std_logic;
		red, green, blue, hit: OUT std_logic;
		lives: OUT std_logic_vector(2 downto 0)
	);
END collision;

architecture combine of collision is
begin


hit <= green_pipe AND blue_bird;
red <= '0';
green <= green_pipe;
blue <= blue_bird;

process (hitTrigger, setLives)
variable prev_hit_status: std_logic := '0'; 
begin
	if (rising_edge(hitTrigger) and prev_hit_status = '0') then
		lives <= currentlives - "001";
	end if;
	-- Update previous click status
		if(hitTrigger = '1') then
			prev_hit_status := '1';
		else 
			prev_hit_status := '0';
		end if;
	
end process;
		

END combine;
