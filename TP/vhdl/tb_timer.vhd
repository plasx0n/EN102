library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_timer is
end tb_timer;

architecture rtl of tb_timer is

    component timer is
        port (
            clk :           in std_logic;
            i_cmp_valid :   in std_logic ; 
            S :             out std_logic      
        );
    end component;

signal s_clk,s_cmp_valid : std_logic :='0'; 

begin

    s_clk  <= not s_clk    after 10 ns; 
    s_cmp_valid    <= '0', '1'     after 50 ns , '0' after 70 ns ;  

    inst_timer : timer
    port map(
        clk             => s_clk,
        i_cmp_valid     => s_cmp_valid,
        S               => open 
    ); 



end architecture;