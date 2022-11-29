library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port (
        rst             : in std_logic;
        clk             : in std_logic;
        enable          : in std_logic;
        counter_value   : out std_logic_vector(7 downto 0)
    );
end entity counter;

architecture Behavioral of counter is

    signal count_val : unsigned(7 downto 0) ; 

begin
    counter_value_register : process(clk)
    begin
        if (clk'event and clk ='1') then
            if(rst='1')then
                count_val <= x"00";
            elsif(enable='1') then 
                if count_val = to_unsigned(255,8) then 
                    count_val <= (others=>'0'); 
                else 
                    count_val <= count_val + 1 ; 
                end if; 
            end if;
        end if; 
    end process; 



counter_value <= std_logic_vector(count_val); 

end architecture;