LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_SIGNED.all;

ENTITY game_start IS
    PORT (
        pb1, sw0, sw1     : IN std_logic;
        FinalGameMode     : OUT std_logic;
        GameOn            : OUT std_logic
    );
END game_start;

ARCHITECTURE start OF game_start IS

    SIGNAL gameMode : std_logic;
    -- 1 is training, 2 is game mode

BEGIN           

    Set_Mode: PROCESS (sw0, sw1) 
    BEGIN
        -- set to game mode
        IF (rising_edge(sw0)) THEN
            gameMode <= '0';
        ELSEIF (rising_edge(sw1)
				gameMode <= '1';
        ELSE
		  END IF;
		  GameOn <= '0';
    END PROCESS Set_Game;

    Start_Game: PROCESS (pb1) 
    BEGIN
        -- finalize 
        IF (rising_edge(pb1)) THEN
            FinalGameMode <= gameMode;
            GameOn <= '1';
        END IF;
    END PROCESS Start_Game;

END start;
