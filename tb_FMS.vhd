library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_FMS is
--  Port ( );
end tb_FMS;

architecture Behavioral of tb_FMS is


component FSM is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        E      : in  STD_LOGIC;
        tc8    : in  STD_LOGIC;
        tcBaud : in  STD_LOGIC;
        sRo    : in  STD_LOGIC;
        TXD    : out STD_LOGIC;
        l_s    : out STD_LOGIC;
        eR     : out STD_LOGIC;
        eBaud  : out STD_LOGIC;
        e8     : out STD_LOGIC
    );
end component;

signal clk_s: STD_LOGIC;
signal reset_s  :   STD_LOGIC := '0';
signal E_s      :   STD_LOGIC;
signal tc8_s    :   STD_LOGIC;
signal tcBaud_s :   STD_LOGIC;
signal sRo_s    :   STD_LOGIC;
signal TXD_s    :  STD_LOGIC;
signal l_s_s    :  STD_LOGIC;
signal eR_s     :  STD_LOGIC;
signal eBaud_s  :  STD_LOGIC;
signal e8_s     :  STD_LOGIC;

begin

tb_FMS: FSM PORT MAP(
        clk => clk_s,
        reset => reset_s,
        E => E_s,
        tc8 => tc8_s,
        tcBaud => tcBaud_s,
        sRo => sRo_s,
        TXD => TXD_s,
        l_s => l_s_s,
        eR => eR_s,
        eBaud => eBaud_s,
        e8 => e8_s        
);

process_clk : process  
begin 
    clk_s <= '0'; 
    wait for 5 ns; 
    clk_s <= '1'; 
    wait for 5 ns;
end process; 

process_fms : process  
begin 
    E_s <= '0'; 
    wait for 20 ns; 
    E_s <= '1'; 
    wait for 20 ns;
    tcBaud_s <= '0'; 
    wait for 20 ns;
    tcBaud_s <= '1'; 
    wait for 20 ns;
    tc8_s <= '1'; 
    wait for 20 ns;
end process; 

end Behavioral;
