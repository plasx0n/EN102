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
   signal <output>_i : std_logic;  -- example output signal
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
      --insert statements to decode internal output signals
      --below is simple example
      if state = st3_<name> then
         <output>_i <= '1';
      else
         <output>_i <= '0';
      end if;
   end process;

   NEXT_STATE_DECODE: process (state, <input1>, <input2>, ...)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
        when A =>
            if <input_1> = '1' then
               next_state <= st2_<name>;
            end if;

        when B =>
            if <input_2> = '1' then
               next_state <= st3_<name>;
            end if;

        when C =>
            next_state <= st1_<name>;

        when D =>
            next_state <= st1_<name>;

        when others =>
            next_state <= st1_<name>;
      end case;
   end process;

   end architecture ; 