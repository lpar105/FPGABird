library ieee;
use ieee.std_logic_1164.all;

entity lfsr is 
  port (
    clk: in  std_logic;
    o_lsfr1: out std_logic_vector (6 downto 0);
    o_lsfr2: out std_logic_vector (6 downto 0)
  );
end lfsr;
	
architecture rtl of lfsr is   

  signal r_lfsr1: std_logic_vector (7 downto 1):= "0010101";
  signal r_lfsr2: std_logic_vector (7 downto 1):= "0010101";
  
begin  

  p_lfsr1 : process (clk) begin 
    if rising_edge(clk) then 
      r_lfsr1(7) <= r_lfsr1(1);
      r_lfsr1(6) <= r_lfsr1(7) xor r_lfsr1(1);
      r_lfsr1(5) <= r_lfsr1(6);
      r_lfsr1(4) <= r_lfsr1(5);
      r_lfsr1(3) <= r_lfsr1(4);
      r_lfsr1(2) <= r_lfsr1(3);
      r_lfsr1(1) <= r_lfsr1(2);
    end if; 
  end process p_lfsr1; 
	
  o_lsfr1  <= r_lfsr1(7 downto 1);
	
  p_lfsr2 : process (clk) begin 
    if rising_edge(clk) then 
      r_lfsr2(7) <= r_lfsr2(1);
      r_lfsr2(6) <= r_lfsr2(7) xor r_lfsr2(1);
      r_lfsr2(5) <= r_lfsr2(6);
      r_lfsr2(4) <= r_lfsr2(5);
      r_lfsr2(3) <= r_lfsr2(4);
      r_lfsr2(2) <= r_lfsr2(3);
      r_lfsr2(1) <= r_lfsr2(2);
    end if; 
  end process p_lfsr2; 
	
  o_lsfr2  <= r_lfsr2(7 downto 1);
  
end architecture rtl;
