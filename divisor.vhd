LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY clock_divider_lcd IS
    PORT (
        clk_in: IN std_logic;
        reset: IN std_logic;
        EN: BUFFER std_logic
    );
END ENTITY;

ARCHITECTURE circuit_divider OF clock_divider_lcd IS
    CONSTANT DIV_FACTOR : integer := 1000000; -- Valor do fator de divisão -> (F_FPGA / DIV_FACTOR) = FREQUENCIA DESEJADA.
    SIGNAL cnt : integer RANGE 0 TO DIV_FACTOR-1 := 0; -- Contador
BEGIN
    PROCESS (clk_in, reset) -- processo sensível a clk_in e reset
    BEGIN
        IF (reset = '1') THEN -- verifica se o reset está em nível lógico alto
            cnt <= 0; -- Zera o contador
            EN <= '0'; -- Deixa o sinal clock de saída em nível lógico baixo
        ELSIF (rising_edge(clk_in)) THEN -- verifica a borda de subida
            cnt <= cnt + 1;
            IF (cnt = DIV_FACTOR) THEN
                cnt <= 0;
                EN <= not (EN);
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;
