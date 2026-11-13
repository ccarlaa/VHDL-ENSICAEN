library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 
use IEEE.std_logic_unsigned.all;

use work.package_UART.ALL;

entity compteur_generique is
generic (N : integer);
    Port (E: in STD_LOGIC;
    reset: in STD_LOGIC;
    clk: in STD_LOGIC;
    tc: out STD_LOGIC );
end compteur_generique;

architecture Behavioral of compteur_generique is
signal compteur: STD_LOGIC_VECTOR (log2(N) downto 0) := (others =>'0');

begin
process(clk)
begin
    if rising_edge(clk) then 
        if reset = '1' then 
            compteur <= (others =>'0');
        elsif E = '1' then
            if compteur = N then
                compteur <= (others =>'0');
            else 
                compteur <= compteur + 1;
            end if;
        end if;  
    end if; 
    
end process;

tc <= '1' when compteur = N else '0';
end Behavioral;
