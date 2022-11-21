library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_decounter is
    port (
        rst             : in std_logic;
        clk             : in std_logic;
        enable          : in std_logic;
        up_down         : in std_logic; 
        counter_value   : out std_logic_vector(2 downto 0)
    );
end entity counter_decounter;

architecture Behavioral of counter_decounter is

    signal count_val : unsigned(2 downto 0) ; 

begin

    counter_value_register : process(rst,clk)
    begin
        if(rst='1') then
            count_val <= (others=>'0');
        elsif (clk'event and clk ='1') then
            if(enable='1') then 
                if(up_down='1') then 
                    if(count_val = to_unsigned(5,3)) then
                        count_val <= to_unsigned(0,3); 
                    else 
                        count_val <= count_val + to_unsigned(1,3) ; 
                    end if; 
                else 
                    if(count_val = to_unsigned(0,3)) then 
                        count_val <= to_unsigned(5,3);
                    else 
                        count_val <= count_val - to_unsigned(1,3); 
                    end if; 
                end if; 
            end if; 
        end if; 
    end process counter_value_register;

counter_value <= std_logic_vector(count_val); 

end architecture;