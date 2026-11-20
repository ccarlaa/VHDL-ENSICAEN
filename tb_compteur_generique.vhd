library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 
use IEEE.std_logic_unsigned.all;

entity compteur_generique_tb is
  -- Port ();
end compteur_generique_tb;

architecture Behavioral of compteur_generique_tb is

signal clk_s: STD_LOGIC;
signal reset_s: STD_LOGIC := '0';
signal E_s: STD_LOGIC := '1';
signal tc_s: STD_LOGIC;

component compteur_generique is
generic (N : integer);
    Port (E: in STD_LOGIC;
    reset: in STD_LOGIC;
    clk: in STD_LOGIC;
    tc: out STD_LOGIC );
end component;

begin

inst_compteur_generique : compteur_generique generic map (5208) PORT MAP(
clk => clk_s,
reset => reset_s,
tc => tc_s,
E => E_s
);

 
process_clk : process  
begin 
    clk_s <= '0'; 
    wait for 5 ns; 
    clk_s <= '1'; 
    wait for 5 ns;
end process; 

end Behavioral;
