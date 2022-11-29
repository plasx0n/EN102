library ieee;
use ieee.std_logic_1164.all;

entity tb_fsm is
end tb_fsm;

architecture behaviorla of tb_fsm is

    signal s_clk ,s_rst , s_E , s_D: std_logic:='0' ; 

    -- MOORE MACHINE 
    component FSM is
        port (
            clk,rst :   in std_logic;
            E   :       in std_logic;
            D   :       out std_logic
        );
    end component;

begin

    s_clk           <= not s_clk    after 10 ns; 
    s_rst           <= '1' , '0'    after 10 ns;
    s_E             <= '0', '1'     after 40 ns , '0' after 80 ns ;  

    inst_fsm : FSM
        port map(
            rst => s_rst,
            clk => s_clk,
            E   => s_E,
            D   => s_D 
        ); 


end architecture ; 