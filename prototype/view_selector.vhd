LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY view_selector IS
	PORT
		(red_game, green_game, blue_game, text_in, enable: IN std_logic;
			 mode: IN std_logic_vector(2 downto 0);
			 red, green, blue: OUT Std_logic);		
END view_selector;


architecture views of view_selector is
begin
	
	process(enable)
	BEGIN
		if (enable = '0') then -- Game in Menu Mode 
		
			red <= text_in or red_game;
			green <= green_game;
			blue <= blue_game;
		
		else -- Game is running
			
			red <= text_in or red_game;
			green <= green_game;
			blue <= blue_game;
		
		end if;
	end process;
	
END views;

