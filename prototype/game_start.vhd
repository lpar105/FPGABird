LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;

ENTITY game_start IS
    PORT (
        pb1, sw0     : IN std_logic;
        FinalGameMode, GameOn     : OUT std_logic);
END game_start;

ARCHITECTURE start OF game_start IS

	 SIGNAL setGame : std_logic := '0';
    SIGNAL gameMode : std_logic := '1';

BEGIN

    -- output
    process (pb1, sw0) 
    BEGIN
        if (falling_edge(pb1)) then
            setGame <= '1';			
		  end if;
		  
		  if (setGame = '0') then
			FinalGameMode <= sw0;
		  end if;
		  GameOn <= setGame;
    END PROCESS;

END start;
