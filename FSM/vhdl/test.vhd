library ieee;
use ieee.std_logic_1164.all;

-- MOORE MACHINE 
entity FSM is
    port (
        clk : in std_logic;
        D1,D2 : in std_logic;
        P1,P2 : out std_logic
    );
end FSM;

architecture rtl of FSM is

   type state_type is (A, B, C, D);
   signal state, next_state : state_type;
   --Declare internal signals for all outputs of the state-machine
--    signal <output>_i : std_logic; 
   --other outputs

   begin
--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (clk)
   begin
        if (clk'event and clk = '1') then
            state <= next_state; 
        end if;
   end process;

   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
        if state = A then
            P1 <= '0';
            P2 <= '0';
        elsif state = B then 
            P1 <= '1';
            P2 <= '0';
        elsif state = C then 
            P1 <= '0';
            P2 <= '0';
        elsif state = D then 
            P1 <= '0';
            P2 <= '1';

        end if;
   end process;

   NEXT_STATE_DECODE: process (state, D1,D2)
   begin
      case (state) is
        when A =>
            if D1 = '1' and D2='0' then
               next_state <= B ;
            elsif D1='0' and D2='1' then
                next_state <=D ; 
            end if; 

        when B =>
            if D1 = '0' and D2= '0'  then
                next_state <= C ;
            elsif D1='0' and D2='1' then
                next_state <=D ;
            end if ; 

        when C =>
        if D1 = '1' and D2='0' then
            next_state <= B ;
         elsif D1='0' and D2='1' then
             next_state <=D ; 
         end if; 

        when D =>
        if D1 = '0'  and D2 ='0' then
            next_state <= B ;
         elsif D1='1' and D2='0' then
             next_state <= A ; 
         end if; 

      end case;
   end process;

   end architecture ; 