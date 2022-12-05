library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timer is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           start : in STD_LOGIC;
           S : out STD_LOGIC);
end timer;

architecture Behavioral of timer is

signal timer_val : unsigned(3 downto 0);
signal start_reg : std_logic_vector(1 downto 0);
signal edge_start : std_logic;

begin

start_register : process(rst, clk)
begin
	if(rst = '1') then
		start_reg <= (others => '0');
	elsif(clk'event and clk='1') then
		start_reg(1) <= start;
		start_reg(0) <= start_reg(1);
	end if;
end process;

edge_start <= not(start_reg(0)) and start_reg(1);

timer_value_register : process(rst, clk)
begin
	if(rst = '1') then
		timer_val <= to_unsigned(11, 4);
	elsif(clk'event and clk = '1') then
		if(edge_start = '1') then
			timer_val <= (others =>'0');
		elsif( timer_val /= to_unsigned(11, 4)) then
			timer_val <= timer_val + to_unsigned(1, 4);
		else
			timer_val <= to_unsigned(11, 4);
		end if;			
	end if;
end process;
  
S <= '1' when (timer_val /= to_unsigned(0,4) and timer_val /=  to_unsigned(11,4)) else '0';

end Behavioral;
