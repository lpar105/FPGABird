LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY altera_mf;
USE altera_mf.ALL;

ENTITY text_setter IS
	PORT (
		pixel_col : IN std_logic_vector(9 DOWNTO 4);
		pixel_row : IN std_logic_vector(9 DOWNTO 4);
		clk, disable, enable, sw : IN std_logic;
		gameModeText : IN std_logic_vector(2 DOWNTO 0);
		lives : IN Std_logic_vector(2 DOWNTO 0);
		character_address : OUT std_logic_vector(5 DOWNTO 0)
	);
END text_setter;

ARCHITECTURE behave OF text_setter IS
	SIGNAL liveText : std_logic_vector(5 DOWNTO 0);
	SIGNAL HEART : std_logic_vector(5 DOWNTO 0) := "000000";
	SIGNAL A : std_logic_vector(5 DOWNTO 0) := "000001";
	SIGNAL B : std_logic_vector(5 DOWNTO 0) := "000010";
	SIGNAL C : std_logic_vector(5 DOWNTO 0) := "000011";
	SIGNAL D : std_logic_vector(5 DOWNTO 0) := "000100";
	SIGNAL E : std_logic_vector(5 DOWNTO 0) := "000101";
	SIGNAL F : std_logic_vector(5 DOWNTO 0) := "000110";
	SIGNAL G : std_logic_vector(5 DOWNTO 0) := "000111";
	SIGNAL H : std_logic_vector(5 DOWNTO 0) := "001000";
	SIGNAL I : std_logic_vector(5 DOWNTO 0) := "001001";
	SIGNAL J : std_logic_vector(5 DOWNTO 0) := "001010";
	SIGNAL K : std_logic_vector(5 DOWNTO 0) := "001011";
	SIGNAL L : std_logic_vector(5 DOWNTO 0) := "001100";
	SIGNAL M : std_logic_vector(5 DOWNTO 0) := "001101";
	SIGNAL N : std_logic_vector(5 DOWNTO 0) := "001110";
	SIGNAL O : std_logic_vector(5 DOWNTO 0) := "001111";
	SIGNAL P : std_logic_vector(5 DOWNTO 0) := "010000";
	SIGNAL Q : std_logic_vector(5 DOWNTO 0) := "010001";
	SIGNAL R : std_logic_vector(5 DOWNTO 0) := "010010";
	SIGNAL S : std_logic_vector(5 DOWNTO 0) := "010011";
	SIGNAL T : std_logic_vector(5 DOWNTO 0) := "010100";
	SIGNAL U : std_logic_vector(5 DOWNTO 0) := "010101";
	SIGNAL V : std_logic_vector(5 DOWNTO 0) := "010110";
	SIGNAL W : std_logic_vector(5 DOWNTO 0) := "010111";
	SIGNAL X : std_logic_vector(5 DOWNTO 0) := "011000";
	SIGNAL Y : std_logic_vector(5 DOWNTO 0) := "011001";
	SIGNAL Z : std_logic_vector(5 DOWNTO 0) := "011010";

	SIGNAL zero : std_logic_vector(5 DOWNTO 0) := "110000";
	SIGNAL one : std_logic_vector(5 DOWNTO 0) := "110001";
	SIGNAL two : std_logic_vector(5 DOWNTO 0) := "110010";
	SIGNAL three : std_logic_vector(5 DOWNTO 0) := "110011";
	SIGNAL four : std_logic_vector(5 DOWNTO 0) := "110100";
	SIGNAL five : std_logic_vector(5 DOWNTO 0) := "110101";
	SIGNAL six : std_logic_vector(5 DOWNTO 0) := "110110";
	SIGNAL seven : std_logic_vector(5 DOWNTO 0) := "110111";
	SIGNAL eight : std_logic_vector(5 DOWNTO 0) := "111000";
	SIGNAL nine : std_logic_vector(5 DOWNTO 0) := "111001";

	SIGNAL space : std_logic_vector(5 DOWNTO 0) := "100000";
	SIGNAL leftbracket : std_logic_vector(5 DOWNTO 0) := "101000";
	SIGNAL rightbracket : std_logic_vector(5 DOWNTO 0) := "101001";
	SIGNAL dash : std_logic_vector(5 DOWNTO 0) := "101101";
	SIGNAL slash : std_logic_vector(5 DOWNTO 0) := "101111";
	SIGNAL leftsquarebracket : std_logic_vector(5 DOWNTO 0) := "011011";
	SIGNAL rightsquarebracket : std_logic_vector(5 DOWNTO 0) := "011101";
	SIGNAL star : std_logic_vector(5 DOWNTO 0) := "101010";

	SIGNAL prev_mode : std_logic_vector(2 DOWNTO 0);

BEGIN
	PROCESS (pixel_col, pixel_row, gameModeText, disable, lives, enable, clk)
	BEGIN
		IF (enable = '1') THEN -- if game is being played
 
			IF (lives = "101") THEN
				liveText <= five;
			ELSIF (lives = "100") THEN
				liveText <= four;
			ELSIF (lives = "011") THEN
				liveText <= three;
			ELSIF (lives = "010") THEN
				liveText <= two;
			ELSIF (lives = "001") THEN
				liveText <= one;
			ELSE
				liveText <= zero;
			END IF;
 
			IF (gameModeText = "000") THEN -- Training mode
				IF (pixel_row = "00010") THEN
					IF (pixel_col = "00010") THEN
						character_address <= T;
					ELSIF (pixel_col = "00011") THEN
						character_address <= R;
					ELSIF (pixel_col = "00100") THEN
						character_address <= A;
					ELSIF (pixel_col = "00101") THEN
						character_address <= I;
					ELSIF (pixel_col = "00110") THEN
						character_address <= N;
					ELSIF (pixel_col = "00111") THEN
						character_address <= I;
					ELSIF (pixel_col = "01000") THEN
						character_address <= N;
					ELSIF (pixel_col = "01001") THEN
						character_address <= G;
 
					ELSIF (pixel_col = "01011") THEN
						character_address <= M;
					ELSIF (pixel_col = "01100") THEN
						character_address <= O;
					ELSIF (pixel_col = "01101") THEN
						character_address <= D;
					ELSIF (pixel_col = "01110") THEN
						character_address <= E;
					ELSIF (pixel_col = "10000") THEN
					
					ELSIF (pixel_col = "11000") THEN
						character_address <= L;
					ELSIF (pixel_col = "11001") THEN
						character_address <= I;
					ELSIF (pixel_col = "11010") THEN
						character_address <= V;
					ELSIF (pixel_col = "11011") THEN
						character_address <= E;
					ELSIF (pixel_col = "11100") THEN
						character_address <= S;
					ELSIF (pixel_col = "11101") THEN
						character_address <= HEART;
					ELSIF (pixel_col = "11111") THEN
						character_address <= liveText; -- ???????
					ELSE
						character_address <= space;
					END IF;
				ELSE
					character_address <= space;
				END IF;
				------------------------------------------------------
			ELSIF (gameModeText = "001") THEN -- Level 1
				IF (pixel_row = "00010") THEN
					IF (pixel_col = "00010") THEN
						character_address <= G;
					ELSIF (pixel_col = "00011") THEN
						character_address <= A;
					ELSIF (pixel_col = "00100") THEN
						character_address <= M;
					ELSIF (pixel_col = "00101") THEN
						character_address <= E;
					ELSIF (pixel_col = "00111") THEN
						character_address <= M;
					ELSIF (pixel_col = "01000") THEN
						character_address <= O;
					ELSIF (pixel_col = "01001") THEN
						character_address <= D;
					ELSIF (pixel_col = "01010") THEN
						character_address <= E;
 
 
					ELSIF (pixel_col = "10000") THEN
						character_address <= L;
					ELSIF (pixel_col = "10001") THEN
						character_address <= E;
					ELSIF (pixel_col = "10010") THEN
						character_address <= V;
					ELSIF (pixel_col = "10011") THEN
						character_address <= E;
					ELSIF (pixel_col = "10100") THEN
						character_address <= L;
					ELSIF (pixel_col = "10110") THEN
						character_address <= one;
 
					ELSIF (pixel_col = "11000") THEN
						character_address <= L;
					ELSIF (pixel_col = "11001") THEN
						character_address <= I;
					ELSIF (pixel_col = "11010") THEN
						character_address <= V;
					ELSIF (pixel_col = "11011") THEN
						character_address <= E;
					ELSIF (pixel_col = "11100") THEN
						character_address <= S;
					ELSIF (pixel_col = "11101") THEN
						character_address <= HEART;
					ELSIF (pixel_col = "11111") THEN
						character_address <= liveText; -- ???????
					ELSE
						character_address <= space;
					END IF;
				ELSE
					character_address <= space;
				END IF;
 
				---------------------------------------------------------- 
			ELSIF (gameModeText = "010") THEN -- Level 2
				IF (pixel_row = "00010") THEN
					IF (pixel_col = "00010") THEN
						character_address <= G;
					ELSIF (pixel_col = "00011") THEN
						character_address <= A;
					ELSIF (pixel_col = "00100") THEN
						character_address <= M;
					ELSIF (pixel_col = "00101") THEN
						character_address <= E;
					ELSIF (pixel_col = "00111") THEN
						character_address <= M;
					ELSIF (pixel_col = "01000") THEN
						character_address <= O;
					ELSIF (pixel_col = "01001") THEN
						character_address <= D;
					ELSIF (pixel_col = "01010") THEN
						character_address <= E;
 
 
					ELSIF (pixel_col = "10000") THEN
						character_address <= L;
					ELSIF (pixel_col = "10001") THEN
						character_address <= E;
					ELSIF (pixel_col = "10010") THEN
						character_address <= V;
					ELSIF (pixel_col = "10011") THEN
						character_address <= E;
					ELSIF (pixel_col = "10100") THEN
						character_address <= L;
					ELSIF (pixel_col = "10110") THEN
						character_address <= two;
 
					ELSIF (pixel_col = "11000") THEN
						character_address <= L;
					ELSIF (pixel_col = "11001") THEN
						character_address <= I;
					ELSIF (pixel_col = "11010") THEN
						character_address <= V;
					ELSIF (pixel_col = "11011") THEN
						character_address <= E;
					ELSIF (pixel_col = "11100") THEN
						character_address <= S;
					ELSIF (pixel_col = "11101") THEN
						character_address <= HEART;
					ELSIF (pixel_col = "11111") THEN
						character_address <= liveText; -- ???????
 
					ELSE
						character_address <= space;
					END IF;
				ELSE
					character_address <= space;
				END IF;
				-------------------------------------------------------------- 
			ELSE
				IF (pixel_row = "00010") THEN
					IF (pixel_col = "00010") THEN
						character_address <= G;
					ELSIF (pixel_col = "00011") THEN
						character_address <= A;
					ELSIF (pixel_col = "00100") THEN
						character_address <= M;
					ELSIF (pixel_col = "00101") THEN
						character_address <= E;
					ELSIF (pixel_col = "00111") THEN
						character_address <= M;
					ELSIF (pixel_col = "01000") THEN
						character_address <= O;
					ELSIF (pixel_col = "01001") THEN
						character_address <= D;
					ELSIF (pixel_col = "01010") THEN
						character_address <= E;
 
 
					ELSIF (pixel_col = "10000") THEN
						character_address <= L;
					ELSIF (pixel_col = "10001") THEN
						character_address <= E;
					ELSIF (pixel_col = "10010") THEN
						character_address <= V;
					ELSIF (pixel_col = "10011") THEN
						character_address <= E;
					ELSIF (pixel_col = "10100") THEN
						character_address <= L;
					ELSIF (pixel_col = "10110") THEN
						character_address <= three;
 
					ELSIF (pixel_col = "11000") THEN
						character_address <= L;
					ELSIF (pixel_col = "11001") THEN
						character_address <= I;
					ELSIF (pixel_col = "11010") THEN
						character_address <= V;
					ELSIF (pixel_col = "11011") THEN
						character_address <= E;
					ELSIF (pixel_col = "11100") THEN
						character_address <= S;
					ELSIF (pixel_col = "11101") THEN
						character_address <= HEART;
					ELSIF (pixel_col = "11111") THEN
						character_address <= liveText; -- ???????
 
					ELSE
						character_address <= space;
					END IF;
				ELSE
					character_address <= space;
				END IF;
 
			END IF;
 
			IF (disable = '1' AND lives = "000") THEN
				--if (gameModeText = "111") then -- game over title
				
			ELSIF (disable = '1') THEN-- paused screen
				IF (lives = "000") THEN
					IF (pixel_row = "01101") THEN
						IF (pixel_col = "10001") THEN
							character_address <= G;
						ELSIF (pixel_col = "10010") THEN
							character_address <= A;
						ELSIF (pixel_col = "10011") THEN
							character_address <= M;
						ELSIF (pixel_col = "10100") THEN
							character_address <= E;
						ELSIF (pixel_col = "10110") THEN
							character_address <= O;
						ELSIF (pixel_col = "10111") THEN
							character_address <= V;
						ELSIF (pixel_col = "11000") THEN
							character_address <= E;
						ELSIF (pixel_col = "11001") THEN
							character_address <= R;
						ELSE
							character_address <= space;
						END IF;
						character_address <= space;
					--end if;
					END IF;
				ELSE
					IF (pixel_row = "01101") THEN
					IF (pixel_col = "10001") THEN
						character_address <= P;
					ELSIF (pixel_col = "10010") THEN
						character_address <= A;
					ELSIF (pixel_col = "10011") THEN
						character_address <= U;
					ELSIF (pixel_col = "10100") THEN
						character_address <= S;
					ELSIF (pixel_col = "10101") THEN
						character_address <= E;
					ELSIF (pixel_col = "10110") THEN
						character_address <= D;
					END IF;
 
				END IF;
				END IF;
			END IF;
 
		ELSE -- Game has not started, showing MENU
 
			IF (pixel_row = "01001") THEN -- menu
				IF (pixel_col = "10001") THEN
					character_address <= M;
				ELSIF (pixel_col = "10010") THEN
					character_address <= E;
				ELSIF (pixel_col = "10011") THEN
					character_address <= N;
				ELSIF (pixel_col = "10100") THEN
					character_address <= U;
				ELSE
					character_address <= space;
				END IF;
			ELSIF (pixel_row = "01010") THEN -- menu dash line underneath
				IF (pixel_col = "10001") THEN
					character_address <= dash;
				ELSIF (pixel_col = "10010") THEN
					character_address <= dash;
				ELSIF (pixel_col = "10011") THEN
					character_address <= dash;
				ELSIF (pixel_col = "10100") THEN
					character_address <= dash;
				ELSE
					character_address <= space;
				END IF;
			ELSE
				character_address <= space;
			END IF;
 
			IF (pixel_row = "01100") THEN -- to start press key[0]
				IF (pixel_col = "01001") THEN
					character_address <= T;
				ELSIF (pixel_col = "01010") THEN
					character_address <= O;
				ELSIF (pixel_col = "01011") THEN
					character_address <= space;
				ELSIF (pixel_col = "01100") THEN
					character_address <= S;
				ELSIF (pixel_col = "01101") THEN
					character_address <= T;
				ELSIF (pixel_col = "01110") THEN
					character_address <= A;
				ELSIF (pixel_col = "01111") THEN
					character_address <= R;
				ELSIF (pixel_col = "10000") THEN
					character_address <= T;
				ELSIF (pixel_col = "10001") THEN
					character_address <= space;
				ELSIF (pixel_col = "10010") THEN
					character_address <= P;
				ELSIF (pixel_col = "10011") THEN
					character_address <= R;
				ELSIF (pixel_col = "10100") THEN
					character_address <= E;
				ELSIF (pixel_col = "10101") THEN
					character_address <= S;
				ELSIF (pixel_col = "10110") THEN
					character_address <= S;
				ELSIF (pixel_col = "10111") THEN
					character_address <= space;
				ELSIF (pixel_col = "11000") THEN
					character_address <= K;
				ELSIF (pixel_col = "11001") THEN
					character_address <= E;
				ELSIF (pixel_col = "11010") THEN
					character_address <= Y;
				ELSIF (pixel_col = "11011") THEN
					character_address <= leftsquarebracket;
				ELSIF (pixel_col = "11100") THEN
					character_address <= zero;
				ELSIF (pixel_col = "11101") THEN
					character_address <= rightsquarebracket;
				END IF;
 
			ELSIF (pixel_row = "01111") THEN
 
				IF (pixel_col = "00110") THEN
					character_address <= T;
				ELSIF (pixel_col = "00111") THEN
					character_address <= O;
				ELSIF (pixel_col = "01000") THEN
					character_address <= G;
				ELSIF (pixel_col = "01001") THEN
					character_address <= G;
				ELSIF (pixel_col = "01010") THEN
					character_address <= L;
				ELSIF (pixel_col = "01011") THEN
					character_address <= E;
				ELSIF (pixel_col = "01100") THEN
					character_address <= space;
				ELSIF (pixel_col = "01101") THEN
					character_address <= S;
				ELSIF (pixel_col = "01110") THEN
					character_address <= W;
				ELSIF (pixel_col = "01111") THEN
					character_address <= I;
				ELSIF (pixel_col = "10000") THEN
					character_address <= T;
				ELSIF (pixel_col = "10001") THEN
					character_address <= C;
				ELSIF (pixel_col = "10010") THEN
					character_address <= H;
				ELSIF (pixel_col = "10011") THEN
					character_address <= space;
				ELSIF (pixel_col = "10100") THEN
					character_address <= S;
				ELSIF (pixel_col = "10101") THEN
					character_address <= W;
				ELSIF (pixel_col = "10110") THEN
					character_address <= zero;
				ELSIF (pixel_col = "10111") THEN
					character_address <= space;
				ELSIF (pixel_col = "11000") THEN
					character_address <= F;
				ELSIF (pixel_col = "11001") THEN
					character_address <= O;
				ELSIF (pixel_col = "11010") THEN
					character_address <= R;
				ELSIF (pixel_col = "11011") THEN
					character_address <= space;
				ELSIF (pixel_col = "11100") THEN
					character_address <= M;
				ELSIF (pixel_col = "11101") THEN
					character_address <= O;
				ELSIF (pixel_col = "11110") THEN
					character_address <= D;
				ELSIF (pixel_col = "11111") THEN
					character_address <= E;
				END IF;
 
			ELSIF (pixel_row = "10010") THEN
 
				IF (pixel_col = "00111") THEN
					character_address <= T;
				ELSIF (pixel_col = "01000") THEN
					character_address <= R;
				ELSIF (pixel_col = "01001") THEN
					character_address <= A;
				ELSIF (pixel_col = "01010") THEN
					character_address <= I;
				ELSIF (pixel_col = "01011") THEN
					character_address <= N;
				ELSIF (pixel_col = "01100") THEN
					character_address <= I;
				ELSIF (pixel_col = "01101") THEN
					character_address <= N;
				ELSIF (pixel_col = "01110") THEN
					character_address <= G;
 
				ELSIF (pixel_col = "10000") THEN
					character_address <= M;
				ELSIF (pixel_col = "10001") THEN
					character_address <= O;
				ELSIF (pixel_col = "10010") THEN
					character_address <= D;
				ELSIF (pixel_col = "10011") THEN
					character_address <= E;
 
				ELSIF (pixel_col = "10111") THEN
					character_address <= G;
				ELSIF (pixel_col = "11000") THEN
					character_address <= A;
				ELSIF (pixel_col = "11001") THEN
					character_address <= M;
				ELSIF (pixel_col = "11010") THEN
					character_address <= E;
 
				ELSIF (pixel_col = "11100") THEN
					character_address <= M;
				ELSIF (pixel_col = "11101") THEN
					character_address <= O;
				ELSIF (pixel_col = "11110") THEN
					character_address <= D;
				ELSIF (pixel_col = "11111") THEN
					character_address <= E;
				ELSE
					character_address <= space;
				END IF;
 
			END IF;
 
			-- if SW = 0, training mode; SW = 1, game mode
			-- put a box around the current selection
 
			IF (sw = '0') THEN
				IF ((pixel_row = "10001" OR pixel_row = "10011") AND
				 (pixel_col >= "00111" AND pixel_col <= "10011")) THEN
					character_address <= dash; -- Display border around training mode
				END IF;
				ELSIF (sw = '1') THEN
					IF ((pixel_row = "10001" OR pixel_row = "10011") AND
					 (pixel_col >= "10111" AND pixel_col <= "11111")) THEN
						character_address <= dash; -- Display border around game mode
					END IF;
 
					END IF;
 
 
				END IF; -- end if (enable = '1')
				
				IF (liveText = zero AND enable = '1') THEN -- game over
					IF (pixel_row = "01110") THEN
						IF (pixel_col = "01111") THEN
							character_address <= G;
						ELSIF (pixel_col = "10000") THEN
							character_address <= A;
						ELSIF (pixel_col = "10001") THEN
							character_address <= M;
						ELSIF (pixel_col = "10010") THEN
							character_address <= E;
						ELSIF (pixel_col = "10100") THEN
							character_address <= O;
						ELSIF (pixel_col = "10101") THEN
							character_address <= V;
						ELSIF (pixel_col = "10110") THEN
							character_address <= E;
						ELSIF (pixel_col = "10111") THEN
							character_address <= R;
						ELSE
							character_address <= space;
						END IF;
					END IF;
				END IF;
			END PROCESS;

END ARCHITECTURE;