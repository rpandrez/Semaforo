library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memTempo is
    port (
        gravarDado   : in std_logic;
        tempo        : in std_logic_vector(6 downto 0);
        tempoSalvo   : out std_logic_vector(6 downto 0)
    );
end entity;

architecture comportamento of memTempo is
    signal tempoInterno : std_logic_vector(6 downto 0);
begin
    process(gravarDado)
    begin
        if rising_edge(gravarDado) then
            tempoInterno <= tempo;
        end if;
    end process;
    
    tempoSalvo <= tempoInterno;
end architecture;