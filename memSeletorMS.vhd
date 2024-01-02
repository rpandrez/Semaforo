library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memSeletorMS is
    port (
        gravarDado   : in std_logic;
        seletorMS    : in std_logic_vector(3 downto 0);
        seletorSalvo : out std_logic_vector(3 downto 0)
    );
end entity;

architecture comportamento of memSeletorMS is
    signal seletorInterno : std_logic_vector(3 downto 0);
begin
    process(gravarDado)
    begin
        if rising_edge(gravarDado) then
            seletorInterno <= seletorMS;
        end if;
    end process;
    
    seletorSalvo <= seletorInterno;
end architecture;