library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity comparator is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

begin

process(A, B)
begin
	if(unsigned(A) = unsigned(B)) then
		S <= '1';
	else
		S <= '0';
	end if;
end process;

end Behavioral;

