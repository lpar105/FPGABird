LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;

ENTITY state_handler IS
	PORT (
		sw, start, pause, play_1, play_2, changeMode : IN std_logic;
		score, lives : IN std_logic_vector(9 DOWNTO 0);
		last_mode : IN std_logic_vector(2 downto 0);
		enable : OUT std_logic;
		mode : OUT std_logic_vector(2 downto 0)
	);
END state_handler;

ARCHITECTURE flap OF state_handler IS
	SIGNAL setGame : std_logic := '0';
BEGIN
	-- output
	process (start, sw, setGame, changeMode)
	BEGIN
		if (falling_edge(start)) then
			setGame <= '1';
		end if;
		
		if (setGame = '0') then
			if (sw = '0') then
				mode <= "000"; --training
			else
				mode <= "001"; --game mode level 1
			end if;	
		elsif (rising_edge(changeMode)) then
			if (last_mode = "001") then
				 mode <= "010";
			elsif (last_mode = "010") then
				 mode <= "011";
			else
			end if;
		else
		end if;
		enable <= setGame;
	END PROCESS;
END flap;
