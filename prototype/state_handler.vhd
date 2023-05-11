LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;

ENTITY state_handler IS
	PORT (
		sw, start, pause, play_1, play_2, play_3 : IN std_logic;
		score, lives : IN std_logic_vector(9 DOWNTO 0);
		last_mode : IN std_logic_vector(2 downto 0);
		enable : OUT std_logic;
		mode : OUT std_logic_vector(1 downto 0)
	);
END state_handler;

ARCHITECTURE flap OF state_handler IS
	SIGNAL setGame : std_logic := '0';
BEGIN
	-- output
	process (start, sw)
	BEGIN
		if (falling_edge(start)) then
			setGame <= '1';
		end if;
		
		if (setGame = '0') then
			if (sw = '0') then
				mode <= "00"; --training
			else
				mode <= "01"; --game mode
			end if;
		end if;
		enable <= setGame;
	END PROCESS;
END flap;
