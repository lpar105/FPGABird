LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

<<<<<<< Updated upstream


ENTITY collision IS
	PORT
		(clk, red_bird, green_bird, blue_bird, red_pipe, green_pipe, blue_pipe, red_koopa, green_koopa, blue_koopa, red_star, green_star, blue_star, red_oneup, green_oneup, blue_oneup: IN std_logic;
		  red, green, blue, hit: OUT std_logic;
		  lives: OUT Std_logic_vector(9 downto 0));		
END collision;

architecture combine of collision is
=======
entity collision is
  port (
    clk, red_bird, green_bird, blue_bird, red_pipe, green_pipe, blue_pipe, red_koopa, green_koopa, blue_koopa, red_star, green_star, blue_star, red_oneup, green_oneup, blue_oneup: in std_logic;
    currentlives : in std_logic_vector(2 downto 0);
    enable: IN std_logic;
    red, green, blue, hit: out std_logic;
    lives: out std_logic_vector(2 downto 0);
	 gameOver: OUT std_logic
  );
end collision;

architecture combine of collision is
  signal collisionhit : std_logic := '0';
  signal immunityhit : std_logic := '0';
  signal red_immune : std_logic;
  signal collision_counter : unsigned(8 downto 0); -- value of this can be changed for sensitivity
  signal hit_delay_counter : unsigned(26 downto 0);
  signal lives_temp : std_logic_vector(2 downto 0);
begin
>>>>>>> Stashed changes

BEGIN           

		red <= '0';
		green <= green_pipe;
		blue <= blue_bird;
		
		hit <= green_pipe AND blue_bird;

END combine;

<<<<<<< Updated upstream
=======
  process (clk)
  begin
    if rising_edge(clk) then
        if collisionhit = '1' or immunityhit = '1' then
          if hit_delay_counter = to_unsigned(0, hit_delay_counter'length) then
            collision_counter <= collision_counter - 1;
            if collision_counter = to_unsigned(0, collision_counter'length) then
					if (immunityhit = '0') then
						hit <= '1';
						lives_temp <= std_logic_vector(unsigned(currentlives) - 1);
				   end if;
               hit_delay_counter <= (others => '1');
               collision_counter <= (others => '1');
            end if;
          else
            hit <= '0';
            collision_counter <= (others => '1');
          end if;
        else
          if hit_delay_counter > 0 then
            hit_delay_counter <= hit_delay_counter - 1;
          end if;
        end if;
      end if;
  end process;
  
  gameOver <= '1' when (lives_temp = "000") else '0';
  lives <= lives_temp;

  
end combine;
>>>>>>> Stashed changes
