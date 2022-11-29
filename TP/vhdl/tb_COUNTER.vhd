library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_counter is
end entity tb_counter;

architecture Behavioral of tb_counter is
    
component counter is
    port (
        rst             : in std_logic;
        clk             : in std_logic;
        enable          : in std_logic; 
        counter_value   : out std_logic_vector(7 downto 0)
    );
end component; 

signal s_rst : std_logic;
signal s_clk : std_logic :='0';
signal s_enable : std_logic := '1'; 
signal s_counter_value : std_logic_vector(7 downto 0);

begin

s_rst           <= '1' , '0' after 20 ns;
s_clk           <= not s_clk after 10 ns; 
-- s_enable        <= '0', '1' after 200 ns ; 

inst_counter : counter
    port map(
        rst             =>  s_rst,
        clk             =>  s_clk,
        enable          =>  s_enable,
        counter_value   =>  s_counter_value);

end architecture;
