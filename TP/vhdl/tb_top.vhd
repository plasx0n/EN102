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

    -- inputs 
    signal s_clk, s_rst : std_logic:='1'; 
    signal s_E          : std_logic :='0' ; 
    signal s_val        : std_logic_vector(7 downto 0):=x"09";
    
    --outputs 
    signal s_S          : std_logic;

    --some constants
    constant period : time := 10 ns;

begin

    
    s_clk  <= not s_clk    after period ; 
    s_rst  <= '1', '0'     after 10*period ; 
    s_E    <= not s_E      after 6*period ; 

    -- configurations a test 
    -- train binaire random 
    -- vérifier S et le reset avec val 

    inst_top : top 
    port map(
        clk => s_clk,
        rst => s_rst,
        E   => s_E,
        val => s_val,
        S   => s_S 
    );



end architecture;