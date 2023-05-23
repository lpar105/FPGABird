LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY mario_painter IS
	PORT
		(clk, vert_sync, horz_sync, enable	: IN std_logic;
		pix_num: out std_logic_vector(4 downto 0));		
END mario_painter;


architecture paint of mario_painter is
begin

	process (horz_sync) 
		variable count :std_logic_vector(4 downto 0) := "00000";
	begin
		if (enable = '1') then
			count := count + 1;
			pix_num <= count;
		else 
			--pix_num <="00000";
		end if;

	end process;

END paint;

