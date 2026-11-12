library IEEE;
use IEEE.std_logic_1164.all;

package package_UART is
    function log2(n : integer) return integer;
end package package_UART;

package body package_UART is
    function log2(n : integer) return integer is
        variable r : integer := 0;
        variable v : integer := n;
    begin
        while v > 1 loop
            v := v / 2;
            r := r + 1;
        end loop;
        return r;
    end function;
end package body package_UART;