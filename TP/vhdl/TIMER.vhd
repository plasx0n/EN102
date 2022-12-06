library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- une impulsion d’une durée de 10 cycles 
-- d’horloge doit être générée sur la sortie S à l’aide d’un timer


--S doit etre maintenu indépendament du signal de sortie ?
-- gestion via fsm 


entity timer is
    port (
        clk :           in std_logic;
        i_cmp_valid :   in std_logic ; 
        S :             out std_logic      
    );
end timer;



architecture one_proc_fsm of timer is

    --  counter <=> timer 
    type state_type is (wait_for_cmp, cmp_valid) ;
    signal state,next_state : state_type ; 

    signal counter : unsigned(3 downto 0) ; 

begin
    -- ugly fsm 
    FSM_PROC : process(clk)
    begin
        if rising_edge(clk) then
                case state is
                    
                    when wait_for_cmp =>
                        if(i_cmp_valid='1')then 
                            state <= cmp_valid; 
                        else 
                            state <= wait_for_cmp ; 
                        end if; 
                        
                        S <= '0' ; 
                        counter <= (others=>'0'); 
                    
                    when cmp_valid =>
                        if(counter=to_unsigned(10,4)) then 
                            counter <=(others=>'0'); 
                            S       <='0' ; 
                            state   <= wait_for_cmp ; 
                        else
                            counter <= counter + 1 ;
                            S       <= '1' ; 
                            state   <= cmp_valid ; 
                        end if ; 
                end case;
        end if;
    end process;
end architecture; 

architecture three_proc_fsm of timer is

    --  counter <=> timer 
    type state_type is (wait_for_cmp, cmp_valid) ;
    signal state,next_state : state_type ; 
    
    signal counter : unsigned(3 downto 0) ; 
    
begin

    clk_PROC : process(clk)
    begin
        if(clk'event and clk='1')then
            state <= next_state ; 
        end if;
    end process;

    -- not the prettiest solution 
    -- bot does the job just fine 
    OUTPUT_PROC : process(state,clk)
    begin
        if state=cmp_valid then 
            S <= '1' ;
            if(clk'event and clk='1')then
                counter <= counter+1 ;
            end if; 
        else 
            S <= '0' ; 
            counter <=(others =>'0') ; 
        end if ; 
    end process;

    STATE_PROC : process(state,i_cmp_valid,counter)
    begin
        case state is
        
            when wait_for_cmp =>
                if i_cmp_valid='1' then 
                    next_state <= cmp_valid ; 
                end if ; 
            when cmp_valid => 
                if(counter=to_unsigned(9,4)) then 
                    next_state <= wait_for_cmp ; 
                end if ; 
        end case;
    end process;


end architecture;