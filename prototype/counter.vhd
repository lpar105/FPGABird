library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
	port (Clk, reset, enable: in std_logic;
		changeMode: out std_logic;
		ones : out std_logic_vector(3 downto 0);
		tens : out std_logic_vector(3 downto 0));
end entity;

architecture behave of counter is
begin
	process (clk, reset)
		variable dig1 : std_logic_vector(3 downto 0) := "0000";
		variable dig2 : std_logic_vector(3 downto 0) := "0000";
	begin
	
	if (enable = '1') then
		if (reset ='1') then
			dig1 := "0000";
			dig2 := "0000";
		elsif (rising_edge(clk)) then	
			if (dig1 = "0000" and dig2 = "0001") then
				changeMode <= '1';
				dig1 := "0000";
				dig2 := "0000";
			else
				changeMode <= '0';
			end if;
			
			if (dig1 = "1001") then
				dig1 := "0000";
				dig2 := std_logic_vector(unsigned(dig2) + 1);	
			else 
				dig1 := std_logic_vector(unsigned(dig1) + 1);
			end if;
		end if;
		ones <= dig1;
		tens <= dig2;
	end if;
	end process;

end architecture behave;