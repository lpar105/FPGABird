library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity collision is
  port (
    clk, red_bird, green_bird, blue_bird, red_pipe, green_pipe, blue_pipe, red_koopa, green_koopa, blue_koopa, red_star, green_star, blue_star, red_oneup, green_oneup, blue_oneup: in std_logic;
    currentlives : in std_logic_vector(2 downto 0);
    enable: in std_logic;
    red, green, blue, hit: out std_logic;
    lives: out std_logic_vector(2 downto 0)
  );
end collision;

architecture combine of collision is
  signal collisionhit : std_logic := '0';
  signal immunityhit : std_logic := '0';
  signal red_immune : std_logic;
  signal collision_counter : unsigned(8 downto 0); -- value of this can be changed for sensitivity
  signal hit_delay_counter : unsigned(26 downto 0);
  signal lives_set: std_logic := '0';
begin

  red_immune <= '0' when hit_delay_counter = to_unsigned(0, hit_delay_counter'length) else 
		  '1' when blue_bird = '1' else
			'0' ;
	
  --oneup is actually star lmao. the symbol file is REFUSING to update
  red <= red_immune or red_oneup;
  green <= green_pipe or green_koopa or green_oneup;
  blue <= blue_bird;

  collisionhit <= (green_pipe or green_koopa) and blue_bird;
  immunityhit <= red_oneup and blue_bird;

  process (clk)
  begin
    if rising_edge(clk) then
		if (lives_set = '0') then
			lives <= "101";
			lives_set <= '1';
		end if;
        if collisionhit = '1' or immunityhit = '1' then
          if hit_delay_counter = to_unsigned(0, hit_delay_counter'length) then
            collision_counter <= collision_counter - 1;
            if collision_counter = to_unsigned(0, collision_counter'length) then
					if (immunityhit = '0') then
						hit <= '1';
						lives <= std_logic_vector(unsigned(currentlives) - 1);
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
end combine;
