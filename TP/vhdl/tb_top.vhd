library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_top is
end tb_top;

architecture rtl of tb_top is


    component top 
    port(
        clk,rst,E   : in std_logic ;
        val         : in std_logic_vector(7 downto 0);
        S           : out std_logic
    );
    end component;  

    signal s_clk, s_rst : std_logic:='1'; 
    signal s_E          : std_logic :='0' ; 
    signal s_val        : std_logic_vector(7 downto 0):=x"09";
begin

    
    s_clk  <= not s_clk    after 10 ns; 
    s_rst  <= '1', '0'     after 100 ns ; 
    s_E    <= not s_E      after 60 ns ; 

    inst_top : top 
    port map(
        clk => s_clk,
        rst => s_rst,
        E   => s_E,
        val => s_val,
        S   => open
    );



end architecture;