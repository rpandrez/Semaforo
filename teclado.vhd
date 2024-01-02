LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY teclado IS PORT  (clk: IN STD_LOGIC; 
                                 COl: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                                 row: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                                 d: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                                 dav: OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE funcionamento OF teclado IS

    SIGNAL freeze: STD_LOGIC;
    SIGNAL data: STD_LOGIC_VECTOR (3 DOWNTO 0);

    BEGIN

        PROCESS (Clk)
        VARIABLE ring: STD_LOGIC_VECTOR (3 DOWNTO 0);
        
        BEGIN
            
            IF (clk'EVENT AND clk = '1') THEN
                IF freeze = '0' THEN
                CASE ring IS
                    WHEN "1110" => ring := "1101";
                    WHEN "1101" => ring := "1011";
                    WHEN "1011" => ring := "0111";
                    WHEN "0111" => ring := "1110";
                    WHEN OTHERS => ring := "1110";
                END CASE;
                END IF;
                dav <= freeze;
            END IF;

            row <= ring;
            
            CASE ring IS
                WHEN "0111" => data(3 DOWNTO 2) <= "11"; --como o pino da placa é invertido o correto é "1111"
                WHEN "1011" => data(3 DOWNTO 2) <= "10";
                WHEN "1101" => data(3 DOWNTO 2) <= "01";
                WHEN "1110" => data(3 DOWNTO 2) <= "00";
                WHEN OTHERS => data(3 DOWNTO 2) <= "00";
            END CASE;
            
            CASE col IS
                WHEN "011" => data(1 DOWNTO 0) <= "10"; freeze <= '1';
                WHEN "101" => data(1 DOWNTO 0) <= "01"; freeze <= '1';
                WHEN "110" => data(1 DOWNTO 0) <= "00"; freeze <= '1';
                WHEN OTHERS => data(1 DOWNTO 0) <= "00"; freeze <= '0';
            END CASE;

            IF freeze = '1' THEN d <= data;
            ELSE d <= "1111";
            END IF;
        END PROCESS;
END ARCHITECTURE;