library ieee; 
use ieee.std_logic_1164.all;

entity lfsr is 
	port (
		clk: in  std_logic;
		o_lsfr: out std_logic_vector (6 downto 0));
	end lfsr;
	
architecture rtl of lfsr is   

signal r_lfsr: std_logic_vector (7 downto 1):= "0010101";
	begin  
		o_lsfr  <= r_lfsr(7 downto 1);
		p_lfsr : process (clk) begin 
		
		if rising_edge(clk) then 
				r_lfsr(7) <= r_lfsr(1);
				r_lfsr(6) <= r_lfsr(7) xor r_lfsr(1);
				r_lfsr(5) <= r_lfsr(6);
				r_lfsr(4) <= r_lfsr(5);
				r_lfsr(3) <= r_lfsr(4);
				r_lfsr(2) <= r_lfsr(3);
				r_lfsr(1) <= r_lfsr(2);
  end if; 
end process p_lfsr; 
end architecture rtl;