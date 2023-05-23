LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY text_setter IS
    PORT
	 (pixel_col: in std_logic_vector(9 downto 4);
	  pixel_row: in std_logic_vector(9 downto 4);
		clk, disable, enable, sw: in std_logic;
		gameModeText : in std_logic_vector(2 downto 0);
		lives: in Std_logic_vector(2 downto 0);
		character_address: out std_logic_vector(5 downto 0));
END text_setter;

architecture behave of text_setter is
SIGNAL liveText: std_logic_vector(5 downto 0);
SIGNAL A : std_logic_vector(5 downto 0) := "000001"; 
SIGNAL B : std_logic_vector(5 downto 0) := "000010";
SIGNAL C : std_logic_vector(5 downto 0) := "000011";
SIGNAL D : std_logic_vector(5 downto 0) := "000100";
SIGNAL E : std_logic_vector(5 downto 0) := "000101";
SIGNAL F : std_logic_vector(5 downto 0) := "000110";
SIGNAL G : std_logic_vector(5 downto 0) := "000111";
SIGNAL H : std_logic_vector(5 downto 0) := "001000";
SIGNAL I : std_logic_vector(5 downto 0) := "001001";
SIGNAL J : std_logic_vector(5 downto 0) := "001010";
SIGNAL K : std_logic_vector(5 downto 0) := "001011";
SIGNAL L : std_logic_vector(5 downto 0) := "001100";
SIGNAL M : std_logic_vector(5 downto 0) := "001101";
SIGNAL N : std_logic_vector(5 downto 0) := "001110";
SIGNAL O : std_logic_vector(5 downto 0) := "001111";
SIGNAL P : std_logic_vector(5 downto 0) := "010000";
SIGNAL Q : std_logic_vector(5 downto 0) := "010001";
SIGNAL R : std_logic_vector(5 downto 0) := "010010";
SIGNAL S : std_logic_vector(5 downto 0) := "010011";
SIGNAL T : std_logic_vector(5 downto 0) := "010100";
SIGNAL U : std_logic_vector(5 downto 0) := "010101";
SIGNAL V : std_logic_vector(5 downto 0) := "010110";
SIGNAL W : std_logic_vector(5 downto 0) := "010111";
SIGNAL X : std_logic_vector(5 downto 0) := "011000";
SIGNAL Y : std_logic_vector(5 downto 0) := "011001";
SIGNAL Z : std_logic_vector(5 downto 0) := "011010";

SIGNAL zero : std_logic_vector(5 downto 0) := "110000";
SIGNAL one : std_logic_vector(5 downto 0) := "110001";
SIGNAL two : std_logic_vector(5 downto 0) := "110010";
SIGNAL three : std_logic_vector(5 downto 0) := "110011";
SIGNAL four : std_logic_vector(5 downto 0) := "110100";
SIGNAL five : std_logic_vector(5 downto 0) := "110101";
SIGNAL six : std_logic_vector(5 downto 0) := "110110";
SIGNAL seven : std_logic_vector(5 downto 0) := "110111";
SIGNAL eight : std_logic_vector(5 downto 0) := "111000";
SIGNAL nine : std_logic_vector(5 downto 0) := "111001";

SIGNAL space : std_logic_vector(5 downto 0) := "100000";
SIGNAL leftbracket : std_logic_vector(5 downto 0) := "101000";
SIGNAL rightbracket : std_logic_vector(5 downto 0) := "101001";
SIGNAL dash : std_logic_vector(5 downto 0) := "101101";
SIGNAL slash : std_logic_vector(5 downto 0) := "101111";
SIGNAL leftsquarebracket : std_logic_vector(5 downto 0) := "011011";
SIGNAL rightsquarebracket : std_logic_vector(5 downto 0) := "011101";
SIGNAL star : std_logic_vector(5 downto 0) := "101010";

SIGNAL prev_mode : std_logic_vector(2 DOWNTO 0);

begin
		

    process (pixel_col, pixel_row, gameModeText, disable, lives, enable, clk) 
    begin
	 
		if (enable = '1') then -- if game is being played
			
		   if (lives = "101") then
				liveText <= five;
			elsif (lives = "100") then
				liveText <= four;
			elsif (lives = "011") then
				liveText <= three;
			elsif (lives = "010") then
				liveText <= two;
			elsif (lives = "001") then
				liveText <= one;
			else
				liveText <= zero;
			end if;
		
			
        if (gameModeText = "000") then -- Training mode
            if(pixel_row = "00010") then
                if (pixel_col ="00010") then
                    character_address <= T;
                elsif (pixel_col ="00011") then
                    character_address <= R;
                elsif (pixel_col ="00100") then
                    character_address <= A;
                elsif (pixel_col ="00101") then
                    character_address <= I;
                elsif (pixel_col ="00110") then
                    character_address <= N;
                elsif (pixel_col ="00111") then
                    character_address <= I;
                elsif (pixel_col ="01000") then
                    character_address <= N;
                elsif (pixel_col ="01001") then
                    character_address <= G;
						  
					 elsif (pixel_col ="01011") then
                    character_address <= M;
                elsif (pixel_col ="01100") then
                    character_address <= O;
                elsif (pixel_col ="01101") then
                    character_address <= D;
                elsif (pixel_col ="01110") then
                    character_address <= E;
                else
                    character_address <= space;
                end if;
            else 
                character_address <= space;
              end if;
			------------------------------------------------------
        elsif (gameModeText = "001") then -- Level 1
            if(pixel_row= "00010") then
                if (pixel_col ="00010") then
                    character_address <= G;
                elsif (pixel_col ="00011") then
                    character_address <= A;
                elsif (pixel_col ="00100") then
                    character_address <= M;
                elsif (pixel_col ="00101") then
                    character_address <= E;
                elsif (pixel_col ="00111") then
                    character_address <= M;
                elsif (pixel_col ="01000") then
                    character_address <= O;
                elsif (pixel_col ="01001") then
                    character_address <= D;
                elsif (pixel_col ="01010") then
                    character_address <= E;
						  
						  
					 elsif (pixel_col ="10000") then
                    character_address <= L;
                elsif (pixel_col ="10001") then
                    character_address <= E;
                elsif (pixel_col ="10010") then
                    character_address <= V;
                elsif (pixel_col ="10011") then
                    character_address <= E;
                elsif (pixel_col ="10100") then
                    character_address <= L;
                elsif (pixel_col ="10110") then
                    character_address <= one;
						  
					 elsif (pixel_col ="11000") then
                    character_address <= L;
                elsif (pixel_col ="11001") then
                    character_address <= I;
                elsif (pixel_col ="11010") then
                    character_address <= V;
                elsif (pixel_col ="11011") then
                    character_address <= E;
					 elsif (pixel_col ="11100") then
                    character_address <= S;
					 elsif (pixel_col ="11101") then
                    character_address <= dash;
					 elsif (pixel_col ="11111") then
                    character_address <= liveText; -- ???????
                else
                    character_address <= space;
                end if;
            else 
                character_address <= space;
            end if;
			----------------------------------------------------------	
			elsif (gameModeText = "010") then -- Level 2
            if(pixel_row= "00010") then
                if (pixel_col ="00010") then
                    character_address <= G;
                elsif (pixel_col ="00011") then
                    character_address <= A;
                elsif (pixel_col ="00100") then
                    character_address <= M;
                elsif (pixel_col ="00101") then
                    character_address <= E;
                elsif (pixel_col ="00111") then
                    character_address <= M;
                elsif (pixel_col ="01000") then
                    character_address <= O;
                elsif (pixel_col ="01001") then
                    character_address <= D;
                elsif (pixel_col ="01010") then
                    character_address <= E;
						  
						  
					 elsif (pixel_col ="10000") then
                    character_address <= L;
                elsif (pixel_col ="10001") then
                    character_address <= E;
                elsif (pixel_col ="10010") then
                    character_address <= V;
                elsif (pixel_col ="10011") then
                    character_address <= E;
                elsif (pixel_col ="10100") then
                    character_address <= L;
                elsif (pixel_col ="10110") then
                    character_address <= two;
						  
					 elsif (pixel_col ="11000") then
                    character_address <= L;
                elsif (pixel_col ="11001") then
                    character_address <= I;
                elsif (pixel_col ="11010") then
                    character_address <= V;
                elsif (pixel_col ="11011") then
                    character_address <= E;
					 elsif (pixel_col ="11100") then
                    character_address <= S;
					 elsif (pixel_col ="11101") then
                    character_address <= dash;
					 elsif (pixel_col ="11111") then
                    character_address <= liveText; -- ???????
					
                else
                    character_address <= space;
                end if;
            else 
                character_address <= space;
            end if;
			--------------------------------------------------------------	
			else
            if(pixel_row= "00010") then
                if (pixel_col ="00010") then
                    character_address <= G;
                elsif (pixel_col ="00011") then
                    character_address <= A;
                elsif (pixel_col ="00100") then
                    character_address <= M;
                elsif (pixel_col ="00101") then
                    character_address <= E;
                elsif (pixel_col ="00111") then
                    character_address <= M;
                elsif (pixel_col ="01000") then
                    character_address <= O;
                elsif (pixel_col ="01001") then
                    character_address <= D;
                elsif (pixel_col ="01010") then
                    character_address <= E;
						  
						  
					 elsif (pixel_col ="10000") then
                    character_address <= L;
                elsif (pixel_col ="10001") then
                    character_address <= E;
                elsif (pixel_col ="10010") then
                    character_address <= V;
                elsif (pixel_col ="10011") then
                    character_address <= E;
                elsif (pixel_col ="10100") then
                    character_address <= L;
                elsif (pixel_col ="10110") then
                    character_address <= three;
						  
					 elsif (pixel_col ="11000") then
                    character_address <= L;
                elsif (pixel_col ="11001") then
                    character_address <= I;
                elsif (pixel_col ="11010") then
                    character_address <= V;
                elsif (pixel_col ="11011") then
                    character_address <= E;
					 elsif (pixel_col ="11100") then
                    character_address <= S;
					 elsif (pixel_col ="11101") then
                    character_address <= dash;
					 elsif (pixel_col ="11111") then
                    character_address <= liveText; -- ???????
						  
                else
                    character_address <= space;
                end if;
            else 
                character_address <= space;
            end if;
				
        end if;
		  
		  if (disable = '1') then
				if (pixel_row = "01101") then
                if (pixel_col ="10001") then
                    character_address <= P;
                elsif (pixel_col ="10010") then
                    character_address <= A;
                elsif (pixel_col ="10011") then
                    character_address <= U;
                elsif (pixel_col ="10100") then
                    character_address <= S;
                elsif (pixel_col ="10101") then
                    character_address <= E;
                elsif (pixel_col ="10110") then
                    character_address <= D;
					end if;
					
				end if;
			end if;
		
		else -- Game has not started, showing MENU
		
			if (pixel_row = "01001") then -- menu
				 if (pixel_col = "10001") then
					  character_address <= M;
				 elsif (pixel_col ="10010") then
					  character_address <= E;
				 elsif (pixel_col ="10011") then
					  character_address <= N;
				 elsif (pixel_col ="10100") then
					  character_address <= U;
					else
					character_address <= space;
				end if;
			elsif (pixel_row = "01010") then -- menu dash line underneath
				 if (pixel_col = "10001") then
					  character_address <= dash;
				 elsif (pixel_col ="10010") then
					  character_address <= dash;
				 elsif (pixel_col ="10011") then
					  character_address <= dash;
				 elsif (pixel_col ="10100") then
					  character_address <= dash;
				else
					character_address <= space;
				end if;
			 else
				character_address <= space;
			end if;
			
			if (pixel_row = "01100") then -- to start press key[0]
                if (pixel_col ="01001") then
                    character_address <= T;
                elsif (pixel_col ="01010") then
                    character_address <= O;
                elsif (pixel_col ="01011") then
                    character_address <= space;
                elsif (pixel_col ="01100") then
                    character_address <= S;
                elsif (pixel_col ="01101") then
                    character_address <= T;
                elsif (pixel_col ="01110") then
                    character_address <= A;
					 elsif (pixel_col ="01111") then
                    character_address <= R;
					 elsif (pixel_col ="10000") then
                    character_address <= T;
					 elsif (pixel_col ="10001") then
                    character_address <= space;
                elsif (pixel_col ="10010") then
                    character_address <= P;
                elsif (pixel_col ="10011") then
                    character_address <= R;
					 elsif (pixel_col ="10100") then
                    character_address <= E;
					 elsif (pixel_col ="10101") then
                    character_address <= S;
					 elsif (pixel_col ="10110") then
                    character_address <= S;
					 elsif (pixel_col ="10111") then
                    character_address <= space;
					 elsif (pixel_col ="11000") then
                    character_address <= K;
					 elsif (pixel_col ="11001") then
                    character_address <= E;
					 elsif (pixel_col ="11010") then
                    character_address <= Y;
					 elsif (pixel_col ="11011") then
                    character_address <= leftsquarebracket;
					 elsif (pixel_col ="11100") then
                    character_address <= zero;
					 elsif (pixel_col ="11101") then
                    character_address <= rightsquarebracket;
					end if;
					
			elsif(pixel_row = "01111") then
					
					 if (pixel_col ="00110") then
                    character_address <= T;
                elsif (pixel_col ="00111") then
                    character_address <= O;
                elsif (pixel_col ="01000") then
                    character_address <= G;
                elsif (pixel_col ="01001") then
                    character_address <= G;
                elsif (pixel_col ="01010") then
                    character_address <= L;
                elsif (pixel_col ="01011") then
                    character_address <= E;
					 elsif (pixel_col ="01100") then
                    character_address <= space;
					 elsif (pixel_col ="01101") then
                    character_address <= S;
					 elsif (pixel_col ="01110") then
                    character_address <= W;
                elsif (pixel_col ="01111") then
                    character_address <= I;
                elsif (pixel_col ="10000") then
                    character_address <= T;
					 elsif (pixel_col ="10001") then
                    character_address <= C;
					 elsif (pixel_col ="10010") then
                    character_address <= H;
					 elsif (pixel_col ="10011") then
                    character_address <= space;
					 elsif (pixel_col ="10100") then
                    character_address <= S;
					 elsif (pixel_col ="10101") then
                    character_address <= W;
					 elsif (pixel_col ="10110") then
                    character_address <= zero;
					 elsif (pixel_col ="10111") then
                    character_address <= space ;
					 elsif (pixel_col ="11000") then
                    character_address <= F;
					 elsif (pixel_col ="11001") then
                    character_address <= O;
					 elsif (pixel_col ="11010") then
                    character_address <= R;
					 elsif (pixel_col ="11011") then
                    character_address <= space;
					 elsif (pixel_col ="11100") then
                    character_address <= M;
					 elsif (pixel_col ="11101") then
                    character_address <= O;
					 elsif (pixel_col ="11110") then
                    character_address <= D;
					 elsif (pixel_col ="11111") then
                    character_address <= E;
					end if;
	
			elsif(pixel_row = "10010") then
			
                if (pixel_col ="00111") then
                    character_address <= T;
                elsif (pixel_col ="01000") then
						  character_address <= R;
					 elsif (pixel_col ="01001") then
						  character_address <= A;
					 elsif (pixel_col ="01010") then
						  character_address <= I;
					 elsif (pixel_col ="01011") then
						  character_address <= N;
					 elsif (pixel_col ="01100") then
						  character_address <= I;
					 elsif (pixel_col ="01101") then
						  character_address <= N;
					 elsif (pixel_col ="01110") then
						  character_address <= G;
						  
					 elsif (pixel_col ="10000") then
						  character_address <= M;
					 elsif (pixel_col ="10001") then
						  character_address <= O;
					 elsif (pixel_col ="10010") then
						  character_address <= D;
					 elsif (pixel_col ="10011") then
						  character_address <= E;
						  
					 elsif (pixel_col ="10111") then
						  character_address <= G;
					 elsif (pixel_col ="11000") then
						  character_address <= A;
					 elsif (pixel_col ="11001") then
						  character_address <= M;
					 elsif (pixel_col ="11010") then
						  character_address <= E;
						  
					 elsif (pixel_col ="11100") then
						  character_address <= M;
					 elsif (pixel_col ="11101") then
						  character_address <= O;
					 elsif (pixel_col ="11110") then
                    character_address <= D;
                elsif (pixel_col ="11111") then
                    character_address <= E;
					else 
						character_address <= space;
					end if;
					
			end if;
			
			-- if SW = 0, training mode ; SW = 1, game mode
			-- put a box around the current selection
					
			 if (sw = '0') then
				  if ((pixel_row = "10001" or pixel_row = "10011") and
						(pixel_col >= "00111" and pixel_col <= "10011")) then
						character_address <= dash;  -- Display border around training mode
				  end if;
			 elsif (sw = '1') then
				  if ((pixel_row = "10001" or pixel_row = "10011") and
						(pixel_col >= "10111" and pixel_col <= "11111")) then
						character_address <= dash;  -- Display border around game mode
				  end if;
				  
			 end if;
			
		end if; --  end if (enable = '1')

    end process;

end architecture;
