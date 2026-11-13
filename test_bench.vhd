library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
end entity;

architecture main of test_bench is
    component main
	port (
        reset   : in  std_logic;
        E       : in  std_logic;
        clk     : in  std_logic;
        data_in : in  std_logic_vector(7 downto 0);
        TXD     : out std_logic
    );
    end component;

    signal u_data_in : std_logic_vector(7 downto 0) := "10101010";
    signal u_rst, u_clk, u_TXD: std_logic := '0';
    signal u_E: std_logic := '0';

begin
    tb_main: main 
        port map(
            reset => u_rst,
            E => u_E,
            clk => u_clk,
            data_in => u_data_in,
            TXD => u_TXD
        );

    u_clk <= not u_clk after 1 ns;

    process
    begin
        wait for 20 ns;
        u_E <= '0';
        wait for 20 ns;
        u_E <= '1';
    end process;

end architecture;
