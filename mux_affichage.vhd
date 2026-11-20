library IEEE; 
use IEEE.std_logic_1164.all; 
entity multiplexeur_affichage is 
  
Port ( sel : in STD_LOGIC_VECTOR (1 downto 0); 
data_in : in STD_LOGIC_VECTOR (15 downto 0); 
data_out : out STD_LOGIC_VECTOR (3 downto 0); 
an : out STD_LOGIC_VECTOR (7 downto 0)); 
end multiplexeur_affichage; 
  
architecture Behavioral of multiplexeur_affichage is 
  
begin 
with sel select 
data_out <= data_in(3 downto 0)   when "00", 
data_in(7 downto 4)   when "01", 
data_in(11 downto 8)  when "10", 
data_in(15 downto 12) when others; 
  
with sel select 
an  <= "11111110" when "00", 
"11111101" when "01", 
"11111011" when "10", 
"11110111" when others; 
  
end Behavioral; 
