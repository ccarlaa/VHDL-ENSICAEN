library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 
use IEEE.std_logic_unsigned.all;

entity FSM is
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
end FSM;

architecture Behavioral of FSM is
    type type_etat is (attente, load, sync, decalage, stop);
    signal etat_present : type_etat := attente;
    signal etat_suivant : type_etat;
begin

    PROC_SEQ : process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                etat_present <= attente;
            else
                etat_present <= etat_suivant;
            end if;
        end if;
    end process PROC_SEQ;

    COMB_G : process (etat_present, E, tc8, tcBaud, sRo)
    begin
        etat_suivant <= etat_present;
        TXD   <= '1';
        l_s   <= '0';
        eR    <= '0';
        eBaud <= '0';
        e8    <= '0';

        case etat_present is
            when attente =>
                if E = '0' then
                    etat_suivant <= load;
                end if;

            when load =>
                l_s <= '1';
                eR  <= '1';
                TXD   <= '1';
                if E = '1' then
                    etat_suivant <= sync;
                end if;

            when sync =>
                TXD   <= '0';
                eBaud <= '1';
                if tcBaud = '1' then
                    etat_suivant <= decalage;
                end if;

            when decalage =>
                TXD   <= sRo;
                eBaud <= '1';
                if tcBaud = '1' then
                    eR <= '1';
                    e8 <= '1';
                    if tc8 = '1' then
                        etat_suivant <= stop;
                    end if;
                end if;

            when stop =>
                TXD   <= '1';
                eBaud <= '1';
                if tcBaud = '1' then
                    etat_suivant <= attente;
                end if;
        end case;
    end process COMB_G;

end Behavioral;
