library IEEE;
use IEEE.std_logic_1164.all;

entity comparator is
    port (
        rst :           in std_logic;
        C :             in std_logic_vector(7 downto 0);
        val :           in std_logic_vector(7 downto 0);
        o_cmp_valid :   out std_logic
    );
end comparator;

architecture rtl of comparator is

begin

 	o_cmp_valid <=  '0' when rst ='1' else 
                    '1' when C >= val else '0' ; 

end architecture;