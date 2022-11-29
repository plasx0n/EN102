library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port(
        clk,rst,E : in std_logic;
        val     : in std_logic_vector(7 downto 0);
        S       : out std_logic
    ); 
end top;

architecture rtl of top is

    component comparator is
        port(
            rst:            in std_logic; 
            C  :            in std_logic_vector(7 downto 0 ); 
            val :           in std_logic_vector(7 downto 0 ); 
            o_cmp_valid :   out std_logic
            ); 
    end component; 

    component counter is
        port (
            rst             : in std_logic;
            clk             : in std_logic;
            enable          : in std_logic; 
            counter_value   : out std_logic_vector(7 downto 0)
        );
    end component; 

    component timer is
        port (
            clk :           in std_logic;
            i_cmp_valid :   in std_logic ; 
            S :             out std_logic      
        );
    end component;

    component FSM is
        port (
            clk,rst :   in std_logic;
            E   :       in std_logic;
            D   :       out std_logic
        );
    end component;

    
    signal s_D,s_cmp_valid : std_logic;
    signal s_C : std_logic_vector(7 downto 0);

    signal muxed_rst : std_logic ; 

begin


    TEST_PROC : process(clk)
    begin
        if rising_edge(clk) then
            if s_cmp_valid='1' or rst ='1' then
                muxed_rst <= '1' ; 
            else 
                muxed_rst <= '0' ;                 
            end if;
        end if;
    end process;


    inst_fsm :fsm
    port map(
        clk => clk,
        rst => muxed_rst,
        E   => E,
        D   => s_D 
    );

    inst_counter :counter
    port map(
        clk => clk,
        rst => muxed_rst,
        enable => s_D,
        counter_value => s_C
    );

    inst_comparator : comparator
    port map(
        rst => muxed_rst,
        C   => s_C,
        val => val ,
        o_cmp_valid => s_cmp_valid
    );

    inst_timer: timer
    port map(
        clk => clk,
        i_cmp_valid => s_cmp_valid,
        S => S 
    );


end architecture;