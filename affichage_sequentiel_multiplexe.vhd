library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
 
entity affichage_sequentiel_multiplexe is 
    Port ( clk : in STD_LOGIC; 
           data_in : in STD_LOGIC_VECTOR (15 downto 0); 
           an : out STD_LOGIC_VECTOR (7 downto 0); 
           seg : out STD_LOGIC_VECTOR (6 downto 0)); 
end affichage_sequentiel_multiplexe; 
 
architecture Structural of affichage_sequentiel_multiplexe is 
 
signal sel : STD_LOGIC_VECTOR (1 downto 0); 
signal data_out : STD_LOGIC_VECTOR (3 downto 0); 
 
component selecteur_sequentiel is 
    Port ( clk : in STD_LOGIC; 
           sel : out STD_LOGIC_VECTOR (1 downto 0)); 
end component; 
 
component multiplexeur_affichage is 
    Port ( sel : in STD_LOGIC_VECTOR (1 downto 0); 
           data_in : in STD_LOGIC_VECTOR (15 downto 0); 
           data_out : out STD_LOGIC_VECTOR (3 downto 0); 
           an : out STD_LOGIC_VECTOR (7 downto 0)); 
end component; 
 
component transcodeur_BCD_7segments is 
    Port ( BCD : in STD_LOGIC_VECTOR (3 downto 0); 
           seg : out STD_LOGIC_VECTOR (6 downto 0)); 
end component; 
 
begin 
 
inst_selecteur_sequentiel : selecteur_sequentiel PORT MAP( 
           clk => clk, 
           sel => sel); 
 
inst_multiplexeur_affichage : multiplexeur_affichage PORT MAP(  
           sel      => sel, 
           data_in  => data_in, 
           data_out => data_out, 
           an       => an); 
 
inst_transcodeur_BCD_7segments : transcodeur_BCD_7segments PORT MAP( 
           BCD => data_out, 
           seg => seg); 
end Structural; 
