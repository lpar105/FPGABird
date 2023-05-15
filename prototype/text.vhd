LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY text_setter IS
    PORT
	 (pixel_row, pixel_col: in std_logic_vector(9 downto 4);
		clk: in std_logic;
		gameModeText : in std_logic_vector(2 downto 0);
		character_address: out std_logic_vector(5 downto 0));
END text_setter;

architecture behave of text_setter is
begin

    process (pixel_col, pixel_row, gameModeText) 
    begin
        if (gameModeText = "000") then -- Training mode
            if(pixel_row = "00100") then
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
                else
                    character_address <= "100000"; -- blank space
                end if;
            else 
                character_address <= "100000"; -- blank space
            end if;
        else -- Game mode
            if(pixel_row= "00100") then
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
                else
                    character_address <= "100000"; -- blank space
                end if;
            else 
                character_address <= "100000"; -- blank space
            end if;
        end if;
	
    end process;

end architecture;
