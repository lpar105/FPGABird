library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
	port (Clk, reset: in std_logic;
		digit : out std_logic_vector(3 downto 0));
end entity;

architecture behave of counter is
begin
	process (clk, reset)
		variable dig : std_logic_vector(3 downto 0) := "0000";
	begin
		if (reset ='1') then
			dig := "0000";
		elsif (rising_edge(clk)) then
			if (dig = "1001") then
				dig := "0000";
			else 
				dig := std_logic_vector(unsigned(dig) + 1);
			end if;
		end if;
		digit <= dig;
	end process;

end architecture behave;