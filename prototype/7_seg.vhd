library IEEE;
use IEEE.std_logic_1164.all;

entity to_SevenSeg is
	port (digit1, digit2 : in std_logic_vector(3 downto 0);
		ones, tens : out std_logic_vector(6 downto 0));
end entity;

architecture arc1 of to_SevenSeg is
	begin
		ones <= "1111001" when digit1 = "0001" else -- 1
			"0100100" when digit1 = "0010" else
			"0110000" when digit1 = "0011" else
			"0011001" when digit1 = "0100" else
			"0010010" when digit1 = "0101" else
			"0000010" when digit1 = "0110" else
			"1111000" when digit1 = "0111" else
			"0000000" when digit1 = "1000" else
			"0010000" when digit1 = "1001" else
			"1000000" when digit1 = "0000" else
			"1111111";
		tens <= "1111001" when digit2 = "0001" else -- 1
			"0100100" when digit2 = "0010" else
			"0110000" when digit2 = "0011" else
			"0011001" when digit2 = "0100" else
			"0010010" when digit2 = "0101" else
			"0000010" when digit2 = "0110" else
			"1111000" when digit2 = "0111" else
			"0000000" when digit2 = "1000" else
			"0010000" when digit2 = "1001" else
			"1000000" when digit2 = "0000" else
			"1111111";
end architecture arc1;