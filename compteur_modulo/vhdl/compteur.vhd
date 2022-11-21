library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port (
        clk             : in std_logic;
        counter_value   : out std_logic_vector(2 downto 0)
    );
end entity counter;

architecture Behavioral of counter is

    signal count_val : unsigned(2 downto 0) := (others => '0') ; 

begin

    counter_value_register : process(clk)
    begin
        if (clk'event and clk ='1') then
            count_val <= count_val + 1 ; 
        end if; 
    end process counter_value_register;

counter_value <= std_logic_vector(count_val); 

end architecture;