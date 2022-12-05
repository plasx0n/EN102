library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_detect_impulsion is
end tb_detect_impulsion;

architecture Behavioral of tb_detect_impulsion is

component detect_impulsion is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           VAL : in std_logic_vector(7 downto 0);
           E : in STD_LOGIC;
           S : out STD_LOGIC);
end component;

signal rst : std_logic;
signal clk  : std_logic := '0';

signal E, S : std_logic;
signal VAL : std_logic_vector(7 downto 0);
	                                
begin

uut : detect_impulsion Port map( rst => rst,
			          clk => clk,
			          VAL => VAL,
			          E => E,
			          S => S);
VAL <= "00000100";           
clk <= not clk after 10 ns;	
rst <= '1', '0' after 123 ns;
    
E <= '0', '1' after 500 ns, '0' after 515 ns, '1' after 616 ns, '0' after 812 ns, '1' after 911 ns, '0' after 1201 ns, '1' after 1321 ns, '0' after 1432 ns, '1' after 1543 ns, '0' after 1656 ns, '1' after 1892 ns;
    
end Behavioral;
