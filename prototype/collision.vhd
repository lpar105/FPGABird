LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY collision IS
	PORT (
		clk, red_bird, green_bird, blue_bird, red_pipe, green_pipe, blue_pipe, red_koopa, green_koopa, blue_koopa, red_star, green_star, blue_star, red_oneup, green_oneup, blue_oneup: IN std_logic;
		currentlives : in std_logic_vector(2 downto 0);
		hitTrigger : in std_logic;
		scoreOnes: 	in	std_logic_vector(3 downto 0);
		scoreTens: 	in	std_logic_vector(3 downto 0);
		red, green, blue, hit: OUT std_logic;
		lives: OUT std_logic_vector(2 downto 0)
	);
END collision;

architecture combine of collision is
begin


hit <= green_pipe AND blue_bird;
red <= '0';
green <= green_pipe or green_koopa;
blue <= blue_bird;

process (hitTrigger)
begin
	if ((rising_edge(hitTrigger)) and ((scoreOnes /= "000") or (scoreTens /= "000"))) then
		lives <= currentlives - "001";
	end if;
end process;
		

END combine;
