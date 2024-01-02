library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Definição da entidade
entity dig2int is
    port (
        dezena  : in  std_logic_vector(3 downto 0);
        unidade : in  std_logic_vector(3 downto 0);
        soma    : out std_logic_vector(6 downto 0)
    );
end dig2int;

-- Definição da arquitetura
architecture comportamento of dig2int is
    signal dezena_int  : integer range 0 to 9;
    signal unidade_int : integer range 0 to 9;
begin
    dezena_int  <= to_integer(unsigned(dezena));
    unidade_int <= to_integer(unsigned(unidade));

    soma <= std_logic_vector(to_unsigned(dezena_int * 10 + unidade_int, 7));
end comportamento;
