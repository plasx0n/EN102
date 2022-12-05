library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           E : in STD_LOGIC;
           D : out STD_LOGIC);
end FSM;

architecture Behavioral of FSM is


   type state_type is (st_wait, st_detect, st_tempo);
   signal state, next_state : state_type;
   
begin

    state_reg : process (rst, clk)
    begin
        if(rst = '1') then
            state <= st_wait;
        elsif (clk'event and clk = '1') then
                state <= next_state;
        end if;
    end process;

   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
      case state is
        when st_wait =>
            D <= '0';
        when st_detect => 
            D <= '1';
	when st_tempo => 
            D <= '0';
      end case;
    end process;

   NEXT_STATE_DECODE: process (state, E)
   begin     
      case (state) is
         when st_wait =>
            if(E = '0') then
                next_state <= st_wait;
            else
                next_state <= st_detect;
            end if;
        when st_detect => 
		next_state <= st_tempo;
	when st_tempo =>
            if(E = '0') then
		next_state <= st_wait;
	    else 
		next_state <= st_tempo;
	    end if;
      end case;
   end process;

end Behavioral;
