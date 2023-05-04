library ieee; 
use ieee.std_logic_1164.all;

entity lfsr_7_plain is 
	port (
		i_clk           : in  std_logic;
		i_rstb          : in  std_logic;
		i_sync_reset    : in  std_logic;
		i_seed          : in  std_logic_vector (6 downto 0);
		i_en            : in  std_logic;
		o_lsfr          : out std_logic_vector (6 downto 0));
	end lfsr_7_plain;
	
architecture rtl of lfsr_7_plain is   

signal r_lfsr           : std_logic_vector (7 downto 1):= "0010101";
	begin  
		o_lsfr  <= r_lfsr(7 downto 1);
		p_lfsr : process (i_clk,i_rstb) begin 
		
		if rising_edge(i_clk) then 
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