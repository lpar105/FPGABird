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
		clk, disable: in std_logic;
		gameModeText : in std_logic_vector(2 downto 0);
		lives: in Std_logic_vector(2 downto 0);
		character_address: out std_logic_vector(5 downto 0));
END text_setter;

architecture behave of text_setter is
SIGNAL liveText: std_logic_vector(5 downto 0);
begin
		

    process (pixel_col, pixel_row, gameModeText, disable, lives) 
    begin
	 
			
		   if (lives = "101") then
				liveText <= "110101"; --5
			elsif (lives = "100") then
				liveText <= "110100"; --4
			elsif (lives = "011") then
				liveText <= "110011"; --3
			elsif (lives = "010") then
				liveText <= "110010"; --2
			elsif (lives = "001") then
				liveText <= "110001"; --1
			else
				liveText <= "110001"; --0
			end if;
		
			
        if (gameModeText = "000") then -- Training mode
            if(pixel_row = "00010") then
                if (pixel_col ="00010") then
                    character_address <= "010100"; -- T
                elsif (pixel_col ="00011") then
                    character_address <= "010010"; -- R
                elsif (pixel_col ="00100") then
                    character_address <= "000001"; -- A
                elsif (pixel_col ="00101") then
                    character_address <= "001001"; -- I
                elsif (pixel_col ="00110") then
                    character_address <= "001110"; -- N
                elsif (pixel_col ="00111") then
                    character_address <= "001001"; -- I
                elsif (pixel_col ="01000") then
                    character_address <= "001110"; -- N
                elsif (pixel_col ="01001") then
                    character_address <= "000111"; -- G
						  
					 elsif (pixel_col ="01011") then
                    character_address <= "001101"; -- M
                elsif (pixel_col ="01100") then
                    character_address <= "001111"; -- O
                elsif (pixel_col ="01101") then
                    character_address <= "000100"; -- D
                elsif (pixel_col ="01110") then
                    character_address <= "000101"; -- E
                else
                    character_address <= "100000"; -- blank space
                end if;
            else 
                character_address <= "100000"; -- blank space
              end if;
			------------------------------------------------------
        elsif (gameModeText = "001") then -- Level 1
            if(pixel_row= "00010") then
                if (pixel_col ="00010") then
                    character_address <= "000111"; -- G
                elsif (pixel_col ="00011") then
                    character_address <= "000001"; -- A
                elsif (pixel_col ="00100") then
                    character_address <= "001101"; -- M
                elsif (pixel_col ="00101") then
                    character_address <= "000101"; -- E
                elsif (pixel_col ="00111") then
                    character_address <= "001101"; -- M
                elsif (pixel_col ="01000") then
                    character_address <= "001111"; -- O
                elsif (pixel_col ="01001") then
                    character_address <= "000100"; -- D
                elsif (pixel_col ="01010") then
                    character_address <= "000101"; -- E
						  
						  
					 elsif (pixel_col ="10000") then
                    character_address <= "001100"; -- L
                elsif (pixel_col ="10001") then
                    character_address <= "000101"; -- E
                elsif (pixel_col ="10010") then
                    character_address <= "010110"; -- V
                elsif (pixel_col ="10011") then
                    character_address <= "000101"; -- E
                elsif (pixel_col ="10100") then
                    character_address <= "001100"; -- L
                elsif (pixel_col ="10110") then
                    character_address <= "110001"; -- 1
						  
					 elsif (pixel_col ="11000") then
                    character_address <= "001100"; -- L
                elsif (pixel_col ="11001") then
                    character_address <= "001001"; -- I
                elsif (pixel_col ="11010") then
                    character_address <= "010110"; -- V
                elsif (pixel_col ="11011") then
                    character_address <= "000101"; -- E
					 elsif (pixel_col ="11100") then
                    character_address <= "010011"; -- S
					 elsif (pixel_col ="11101") then
                    character_address <= "110111"; -- -
					 elsif (pixel_col ="11111") then
                    character_address <= liveText; -- ???????
                else
                    character_address <= "100000"; -- blank space
                end if;
            else 
                character_address <= "100000"; -- blank space
            end if;
			----------------------------------------------------------	
			elsif (gameModeText = "010") then -- Level 2
            if(pixel_row= "00010") then
                if (pixel_col ="00010") then
                    character_address <= "000111"; -- G
                elsif (pixel_col ="00011") then
                    character_address <= "000001"; -- A
                elsif (pixel_col ="00100") then
                    character_address <= "001101"; -- M
                elsif (pixel_col ="00101") then
                    character_address <= "000101"; -- E
                elsif (pixel_col ="00111") then
                    character_address <= "001101"; -- M
                elsif (pixel_col ="01000") then
                    character_address <= "001111"; -- O
                elsif (pixel_col ="01001") then
                    character_address <= "000100"; -- D
                elsif (pixel_col ="01010") then
                    character_address <= "000101"; -- E
						  
						  
					 elsif (pixel_col ="10000") then
                    character_address <= "001100"; -- L
                elsif (pixel_col ="10001") then
                    character_address <= "000101"; -- E
                elsif (pixel_col ="10010") then
                    character_address <= "010110"; -- V
                elsif (pixel_col ="10011") then
                    character_address <= "000101"; -- E
                elsif (pixel_col ="10100") then
                    character_address <= "001100"; -- L
                elsif (pixel_col ="10110") then
                    character_address <= "110010"; -- 2
						  
					 elsif (pixel_col ="11000") then
                    character_address <= "001100"; -- L
                elsif (pixel_col ="11001") then
                    character_address <= "001001"; -- I
                elsif (pixel_col ="11010") then
                    character_address <= "010110"; -- V
                elsif (pixel_col ="11011") then
                    character_address <= "000101"; -- E
					 elsif (pixel_col ="11100") then
                    character_address <= "010011"; -- S
					 elsif (pixel_col ="11101") then
                    character_address <= "110111"; -- -
					 elsif (pixel_col ="11111") then
                    character_address <= liveText; -- ???????
					
                else
                    character_address <= "100000"; -- blank space
                end if;
            else 
                character_address <= "100000"; -- blank space
            end if;
			--------------------------------------------------------------	
			else
            if(pixel_row= "00010") then
                if (pixel_col ="00010") then
                    character_address <= "000111"; -- G
                elsif (pixel_col ="00011") then
                    character_address <= "000001"; -- A
                elsif (pixel_col ="00100") then
                    character_address <= "001101"; -- M
                elsif (pixel_col ="00101") then
                    character_address <= "000101"; -- E
                elsif (pixel_col ="00111") then
                    character_address <= "001101"; -- M
                elsif (pixel_col ="01000") then
                    character_address <= "001111"; -- O
                elsif (pixel_col ="01001") then
                    character_address <= "000100"; -- D
                elsif (pixel_col ="01010") then
                    character_address <= "000101"; -- E
						  
						  
					 elsif (pixel_col ="10000") then
                    character_address <= "001100"; -- L
                elsif (pixel_col ="10001") then
                    character_address <= "000101"; -- E
                elsif (pixel_col ="10010") then
                    character_address <= "001010"; -- V
                elsif (pixel_col ="10011") then
                    character_address <= "000101"; -- E
                elsif (pixel_col ="10100") then
                    character_address <= "001100"; -- L
                elsif (pixel_col ="10110") then
                    character_address <= "110011"; -- 3
						  
					 elsif (pixel_col ="11000") then
                    character_address <= "001100"; -- L
                elsif (pixel_col ="11001") then
                    character_address <= "001001"; -- I
                elsif (pixel_col ="11010") then
                    character_address <= "010110"; -- V
                elsif (pixel_col ="11011") then
                    character_address <= "000101"; -- E
					 elsif (pixel_col ="11100") then
                    character_address <= "010011"; -- S
					 elsif (pixel_col ="11101") then
                    character_address <= "110111"; -- -
					 elsif (pixel_col ="11111") then
                    character_address <= liveText; -- ???????
						  
                else
                    character_address <= "100000"; -- blank space
                end if;
            else 
                character_address <= "100000"; -- blank space
            end if;
				
        end if;
		  
		  if (disable = '1') then
				if (pixel_row = "01101") then
                if (pixel_col ="10001") then
                    character_address <= "010000"; -- P
                elsif (pixel_col ="10010") then
                    character_address <= "000001"; -- A
                elsif (pixel_col ="10011") then
                    character_address <= "010101"; -- U
                elsif (pixel_col ="10100") then
                    character_address <= "010011"; -- S
                elsif (pixel_col ="10101") then
                    character_address <= "000101"; -- E
                elsif (pixel_col ="10110") then
                    character_address <= "000100"; -- D
					end if;
					
				end if;
			end if;
	
    end process;

end architecture;
