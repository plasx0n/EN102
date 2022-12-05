library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detect_impulsion is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           VAL : in std_logic_vector(7 downto 0);
           E : in STD_LOGIC;
           S : out STD_LOGIC);
end detect_impulsion;

architecture Behavioral of detect_impulsion is

component FSM is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           E : in STD_LOGIC;
           D : out STD_LOGIC);
end component;

component counter is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           init : in STD_LOGIC;
           counter_value : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component comparator is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC);
end component;

component timer is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           start : in STD_LOGIC;

           S : out STD_LOGIC);
end component;

signal D, P : std_logic;
signal init : std_logic;
signal count : std_logic_vector(7 downto 0);
  
begin

my_fsm : FSM Port map( rst => rst,
		        clk => clk,
		        E => E,
	                D => D);
	                
my_count : counter Port map( rst => rst,
		           clk => clk,
		           enable => D,
		           init => init,
		           counter_value => count);

my_comp : comparator Port map( A => count,
			        B => VAL,
			        S => P);

my_timer : timer Port map( rst => rst,
		           clk => clk,
		           start => P,
           		   S => S);

end Behavioral;
