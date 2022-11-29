library ieee;
use ieee.std_logic_1164.all;

-- MOORE MACHINE 
entity FSM is
    port (
        clk,rst :   in std_logic;
        E   :       in std_logic;
        D   :       out std_logic
    );
end FSM;

architecture rtl of FSM is

   type state_type is (A, B, C) ;
    -- A : wait for impulsion 
    -- B rising edge on E 
    -- C wait for E to settle down 
   signal state, next_state : state_type;

   begin

    SYNC_PROC: process (clk)
    begin
            if (clk'event and clk = '1') then
                -- synchronous reset 
                if ( rst ='1') then 
                    state <= A ; 
                else 
                    state <= next_state; 
                end if ; 
            end if;
    end process;

    --MOORE State-Machine - Outputs based on state only
    OUTPUT_DECODE: process (state)
    begin
        if state = B then
            D <= '1';
        else
            D <= '0';
        end if;
    end process;

    NEXT_STATE_DECODE: process (state, E) 
    begin
        case (state) is
            when A =>
                if E = '1' then
                next_state <= B ; 
                end if;

            when B =>
                next_state <= C;

            when C =>
                if E='0' then 
                next_state <= A ; 
                end if;  

            when others =>
                next_state <= A ;
        end case;
    end process;

   end architecture ; 