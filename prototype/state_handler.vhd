LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;

ENTITY state_handler IS
	PORT (
		sw, start, pause, play_1, play_2, changeMode : IN std_logic;
		score : IN std_logic_vector(9 DOWNTO 0);
		lives : IN std_logic_vector(2 DOWNTO 0);
		last_mode : IN std_logic_vector(2 downto 0);
		enable : OUT std_logic;
		disable : OUT std_logic;
		mode : OUT std_logic_vector(2 downto 0)
	);
END state_handler;

ARCHITECTURE flap OF state_handler IS
	SIGNAL setGame : std_logic := '0';
	SIGNAL pauseGame : std_logic := '0';
BEGIN

	pauseGame <= NOT pauseGame when falling_edge(pause) and setGame = '1' else pauseGame;
	
	-- output
	process (start, sw, setGame, changeMode)
	BEGIN
		
		if (falling_edge(start)) then
			setGame <= NOT setGame;
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
			end if;
		end if;
		
		if (setGame = '1' and lives = "000") then
			enable <= '0';
		elsif (setGame = '1') then
			enable <= '1';
		else
			enable <= '0';
		end if;
		
		disable <= pauseGame;
	END PROCESS;
END flap;
