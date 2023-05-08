library IEEE;
use IEEE.std_logic_1164.all;
entity pll is
	port(refclk, reset:in std_logic;
	outclk_0, locked: out std_logic);
end entity pll;

library IEEE;
use IEEE.std_logic_1164.all;
entity text_setter is
	port(pixel_row, pixel_col: in std_logic_vector(9 downto 4);
	clk: in std_logic;
	character_address: out std_logic_vector(5 downto 0));
end entity text_setter;

library IEEE;
use IEEE.std_logic_1164.all;
entity char_rom is
	port(character_address: in std_logic_vector(5 downto 0);
	font_row, font_col: in std_logic_vector(2 downto 0);
	clock: in std_logic;
	rom_mux_output: out std_logic);
end entity char_rom;

library IEEE;
use IEEE.std_logic_1164.all;
entity VGA_SYNC is
	port(clk, red, green, blue: in std_logic;
	red_out, green_out, blue_out, horiz_sync_out, vert_sync_out: out std_logic;
	pixel_row, pixel_column: out std_logic_vector(9 downto 0));
end entity VGA_SYNC;

library IEEE;
use IEEE.std_logic_1164.all;
entity to_SevenSeg is
	port (digit : in std_logic_vector(3 downto 0);
		SevenSeg_out : out std_logic_vector(6 downto 0));
end entity;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY Mario IS
	PORT
		( clk, vert_sync, left_click, enable	: IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END Mario;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;



ENTITY collision IS
	PORT
		(clk, red_bird, green_bird, blue_bird, red_pipe, green_pipe, blue_pipe, red_koopa, green_koopa, blue_koopa, red_star, green_star, blue_star, red_oneup, green_oneup, blue_oneup: IN std_logic;
		  red, green, blue, hit: OUT std_logic;
		  lives: OUT Std_logic_vector(9 downto 0));		
END collision;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
	port (Clk, reset: in std_logic;
		digit : out std_logic_vector(3 downto 0));
end entity;

library ieee; 
use ieee.std_logic_1164.all;

entity lfsr is 
	port (
		clk: in  std_logic;
		o_lsfr: out std_logic_vector (6 downto 0));
	end lfsr;

	
LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY MOUSE IS
   PORT( clock_25Mhz, reset 		: IN std_logic;
         mouse_data					: INOUT std_logic;
         mouse_clk 					: INOUT std_logic;
         left_button, right_button	: OUT std_logic;
		 mouse_cursor_row 			: OUT std_logic_vector(9 DOWNTO 0); 
		 mouse_cursor_column 		: OUT std_logic_vector(9 DOWNTO 0));       	
END MOUSE;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;



ENTITY pipes IS
	PORT
		(clk, vert_sync, enable	: IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
			random_num: 		IN std_logic_vector(6 DOWNTO 0);
		  red, green, blue, halfway 			: OUT std_logic);		
END pipes;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY koopas IS
	PORT
		(clk, vert_sync, enable	: IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
			random_num: 		IN std_logic_vector(6 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END koopas;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY one_up IS
	PORT
		(clk, vert_sync, enable	: IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
			random_num: 		IN std_logic_vector(6 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END one_up;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY star IS
	PORT
		(clk, vert_sync, enable	: IN std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
			random_num: 		IN std_logic_vector(6 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END star;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY state_handler IS
	PORT
		(sw, start, pause, play_1, play_2, play_3	: IN std_logic;
          score, lives	: IN std_logic_vector(9 DOWNTO 0);
			 last_mode: IN std_logic_vector(2 downto 0);
		  enable 			: OUT std_logic;
		  mode: Out std_logic_vector(2 downto 0));		
END state_handler;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

ENTITY view_selector IS
	PORT
		(red_game, green_game, blue_game, text_in, switch: IN std_logic;
			 mode: IN std_logic_vector(2 downto 0);
			 red, green, blue: OUT Std_logic);		
END view_selector;
