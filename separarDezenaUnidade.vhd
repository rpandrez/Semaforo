library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- Para utilizar o tipo unsigned

entity separarDezenaUnidade is
    port (
        number : in unsigned(6 downto 0);  -- Número de entrada
        dezena : out unsigned(3 downto 0);  -- Saída para a dezena
        unidade : out unsigned(3 downto 0)  -- Saída para a unidade
    );
end entity;

architecture Comportamento of separarDezenaUnidade is

	signal dezena_temp : unsigned(6 downto 0);
	signal unidade_temp:unsigned(6 downto 0);
begin
    
	 dezena_temp <= number/10;  -- Realiza a divisão aritmética por 10 para obter a dezena
    unidade_temp <= number mod 10;  -- Obtém o resto da divisão por 10 para obter a unidade
	 dezena <= dezena_temp(3 downto 0);
	 unidade <= unidade_temp(3 downto 0);

    -- ...
end architecture;
