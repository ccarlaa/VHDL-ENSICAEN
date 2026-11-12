library IEEE;
use IEEE.std_logic_1164.all;

entity main is
    port (
        reset   : in  std_logic;
        E       : in  std_logic;
        clk     : in  std_logic;
        data_in : in  std_logic_vector(7 downto 0);
        TXD     : out std_logic
    );
end main;

architecture Structural of main is

    component compteur_generique is
        generic (N : integer);
        port (
            E     : in  std_logic;
            reset : in  std_logic;
            clk   : in  std_logic;
            tc    : out std_logic
        );
    end component;

    component registre_decalage is
        port (
            data_in : in  std_logic_vector(7 downto 0);
            clk     : in  std_logic;
            reset   : in  std_logic;
            E       : in  std_logic;
            l_s     : in  std_logic;
            sRo     : out std_logic
        );
    end component;

    component FSM is
        port (
            clk    : in  std_logic;
            reset  : in  std_logic;
            E      : in  std_logic;
            tc8    : in  std_logic;
            tcBaud : in  std_logic;
            sRo    : in  std_logic;
            TXD    : out std_logic;
            l_s    : out std_logic;
            eR     : out std_logic;
            eBaud  : out std_logic;
            e8     : out std_logic
        );
    end component;

    signal eBaud, tcBaud, e8, tc8, sRo, l_s, eR : std_logic;

begin

    U_BAUD : compteur_generique
        generic map (N => 867)
        port map (
            E     => eBaud,
            reset => reset,
            clk   => clk,
            tc    => tcBaud
        );

    U_CPT8 : compteur_generique
        generic map (N => 7)
        port map (
            E     => e8,
            reset => reset,
            clk   => clk,
            tc    => tc8
        );

    U_REG : registre_decalage
        port map (
            data_in => data_in,
            clk     => clk,
            reset   => reset,
            E       => eR,
            l_s     => l_s,
            sRo     => sRo
        );

    U_FSM : FSM
        port map (
            clk    => clk,
            reset  => reset,
            E      => E,
            tc8    => tc8,
            tcBaud => tcBaud,
            sRo    => sRo,
            TXD    => TXD,
            l_s    => l_s,
            eR     => eR,
            eBaud  => eBaud,
            e8     => e8
        );

end Structural;
