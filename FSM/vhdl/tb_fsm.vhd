library ieee;
use ieee.std_logic_1164.all;

entity tb_fsm is
end tb_fsm;

architecture behaviorla of tb_fsm is

    signal s_D1,s_D2: std_logic:='0' ; 
    signal s_clk : std_logic :='1' ; 
    signal s_P1,s_P2 : std_logic ; 

    -- MOORE MACHINE 
    component FSM is
        port (
            clk,D1,D2 :       in std_logic;
            P1,P2   :       out std_logic
        );
    end component;

begin



    s_clk           <= not s_clk    after 10 ns; 

    s_D1            <= '0', '1'     after 5 ns  ,
                            '0'     after 50 ns , 
                            '1'     after 85 ns ,
                            '0'     after 130 ns ,
                            '1'     after 170 ns ;
    
            s_D2    <= '0', '1'     after 25 ns ,
                            '0'     after 55 ns , 
                            '1'     after 95 ns ,
                            '0'     after 117 ns ,
                            '1'     after 150 ns ;
 

    inst_fsm : FSM
        port map(
            clk => s_clk,
            D1   => s_D1,
            D2   => s_D2,
            P1   => s_P1,
            P2   => s_P2 
        ); 


end architecture ; 