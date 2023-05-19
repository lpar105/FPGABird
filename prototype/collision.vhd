LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY collision IS
	PORT (
		clk, red_bird, green_bird, blue_bird, red_pipe, green_pipe, blue_pipe, red_koopa, green_koopa, blue_koopa, red_star, green_star, blue_star, red_oneup, green_oneup, blue_oneup: IN std_logic;
		currentlives : in std_logic_vector(2 downto 0);
		gameMode : in std_logic_vector(2 downto 0);
		red, green, blue, hit: OUT std_logic;
		lives: OUT std_logic_vector(2 downto 0)
	);
END collision;

architecture combine of collision is
begin

changeMode: process(gameMode)
begin

		if (gameMode = "001") then
			lives <= "100";
		elsif (gameMode = "010") then
			lives <= "010";
		elsif (gameMode = "011") then
			lives <= "001";
		else
		end if;
end process changeMode; 

hit <= green_pipe AND blue_bird;
red <= '0';
green <= green_pipe;
blue <= blue_bird;
		

END combine;
