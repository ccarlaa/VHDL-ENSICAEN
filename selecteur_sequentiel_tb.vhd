library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 
use IEEE.std_logic_unsigned.all; 
 
entity selecteur_sequentiel is 
    Port ( clk : in STD_LOGIC; 
           sel : out STD_LOGIC_VECTOR (1 downto 0)); 
end selecteur_sequentiel; 
 
architecture Behavioral of selecteur_sequentiel is 
signal compteur : std_logic_vector(17 downto 0) :=(others=>'0'); 
begin 
process(clk) 
begin 
    if rising_edge(clk) then 
        compteur <= compteur +1; 
    end if; 
end process; 
sel(1) <= compteur(17); 
sel(0) <= compteur(16); 
end Behavioral; 
                    
