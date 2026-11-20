library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.package_UART.ALL;

entity compteur_generique is
    generic (N : integer := 10);
    port (
        E     : in  std_logic;
        reset : in  std_logic;
        clk   : in  std_logic;
        tc    : out std_logic
    );
end compteur_generique;

architecture Behavioral of compteur_generique is
    signal compteur : unsigned(log2(N-1) downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                compteur <= (others => '0');
            elsif E = '1' then
                if compteur = N-1 then
                    compteur <= (others => '0');
                else
                    compteur <= compteur + 1;
                end if;
            end if;
        end if;
    end process;

    tc <= '1' when (compteur = N-1) else '0';
    -- tc <= '1' when (E = '1' and compteur = N-1) else '0';
end Behavioral;
