library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 
use IEEE.std_logic_unsigned.all;

entity registre_decalage is
  Port (
  data_in: in STD_LOGIC_VECTOR (7 downto 0);
  clk: in STD_LOGIC;
  reset: in STD_LOGIC;
  E: in STD_LOGIC;
  l_s: in STD_LOGIC;
  sRo: out STD_LOGIC );
  
end registre_decalage;

architecture Behavioral of registre_decalage is
signal registre: STD_LOGIC_VECTOR (7 downto 0) := "00000000";

begin

process(clk) 

begin 
    sRo <= registre(0);
    if rising_edge(clk) then 
        if reset = '1' then 
            registre <= "00000000";
        elsif E = '1' then
            if l_s = '1' then 
                registre <= data_in;
            else
                registre <= '0' & registre (7 downto 1);
            end if;
            sRo <= registre(0);
        end if;    
    end if; 
end process;

end Behavioral;
