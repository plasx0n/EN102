library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           init : in STD_LOGIC;
           counter_value : out STD_LOGIC_VECTOR (7 downto 0));
end counter;

architecture Behavioral of counter is

signal count_val : unsigned(7 downto 0);

begin

counter_value_register : process(rst, clk)
begin
	if(rst = '1') then
		count_val <= (others => '0');
	elsif(clk'event and clk = '1') then
		if(init = '1') then
			count_val <= (others =>'0');
		else
			if(enable = '1') then
				if(count_val = to_unsigned(255, 8)) then
					count_val <= to_unsigned(255, 8);
				else
					count_val <= count_val + to_unsigned(255, 1);
				end if;
			end if;
		end if;
	end if;
end process;
  
counter_value <= std_logic_vector(count_val);

end Behavioral;
