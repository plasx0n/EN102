library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_counter_decounter_univ is
end entity tb_counter_decounter_univ;

architecture Behavioral of tb_counter_decounter_univ is
    
component counter_decounter_univ is
    port (
        rst             : in std_logic;
        clk             : in std_logic;
        enable          : in std_logic;
        init            : in std_logic; 
        up_down         : in std_logic;
        load            : in std_logic;
        incr_value      : in std_logic_vector(2 downto 0); 
        load_value      : in std_logic_vector(2 downto 0); 
        counter_value   : out std_logic_vector(2 downto 0)
    );
end component; 

signal s_rst : std_logic;
signal s_clk : std_logic :='0';
signal s_enable, s_init, s_up_down, s_load : std_logic;
signal s_counter_value : std_logic_vector(2 downto 0);
signal s_load_val, s_incr_value : std_logic_vector ( 2 downto 0); 

begin

s_rst           <= '1' , '0' after 123 ns;
s_clk           <= not s_clk after 10 ns; 
s_enable        <= '0', '1' after 200 ns ; 
s_init          <= '1', '0' after 300 ns ; 
s_up_down       <= '0', '1' after 500 ns; 
s_load          <= '0', '1' after 900 ns , '0' after 1000 ns ; 
s_incr_value    <= "001" , "010" after 1200 ns ; 
s_load_val      <= "100"; 

inst_counter : counter_decounter_univ
    port map(
        rst             =>  s_rst,
        clk             =>  s_clk,
        enable          =>  s_enable,
        init            =>  s_init,
        up_down         =>  s_up_down,
        load            =>  s_load,
        load_value      =>  s_load_val,
        incr_value      =>  s_incr_value,
        counter_value   =>  s_counter_value);

end architecture;
