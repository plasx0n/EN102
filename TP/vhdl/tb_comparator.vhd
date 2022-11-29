library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_comparator is
end tb_comparator;

architecture rtl of tb_comparator is

    component comparator is
        port(
            rst     : in std_logic; 
            C  :        in std_logic_vector(7 downto 0 ); 
            val :           in std_logic_vector(7 downto 0 ); 
            o_cmp_valid :   out std_logic
            ); 
    end component; 

        
    signal clk,s_rst              :std_logic:='0' ;  
    signal counter          :unsigned(7 downto 0):=x"00"; 
    signal s_val,s_C        :std_logic_vector(7 downto 0):=(others=>'0') ; 
    signal s_cmp_valid      :std_logic ; 

begin

    s_rst <= '1' , '0' after 30 ns, '1' after 250 ns, '0' after 270 ns; 
    s_val <= x"09" ; 
    clk <= not clk after 10 ns ; 

    CLK_PROC : process(clk)
    begin
        if s_rst='1' then 
            counter <=x"00"; 
        else 
            if(clk'event and clk ='1') then 
                counter <= counter +1 ;  
             end if ;        
        end if ; 
    end process;

    s_C <=std_logic_vector(counter); 

    inst_comp : comparator
    port map(
        rst         => s_rst, 
        C           => s_C,
        val         => s_val , 
        o_cmp_valid => s_cmp_valid
    );

end architecture;
