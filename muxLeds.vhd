library ieee;
use ieee.std_logic_1164.all;

-- Entidade do muxLeds
entity muxLeds is
    port (
        selector : in std_logic_vector(3 downto 0); -- Seletor de 4 bits
		  tecladoLEDverde: in std_logic_vector(11 downto 0);
        tecladoLEDvermelho: in std_logic_vector(11 downto 0);
        tecladoLEDamarelo: in std_logic_vector(5 downto 0);
        autoLEDverde: in std_logic_vector(11 downto 0);
        autoLEDvermelho: in std_logic_vector(11 downto 0);
        autoLEDamarelo: in std_logic_vector(5 downto 0);
        vpLEDverde: in std_logic_vector(11 downto 0);
        vpLEDvermelho: in std_logic_vector(11 downto 0);
        vpLEDamarelo: in std_logic_vector(5 downto 0);
        vsLEDverde: in std_logic_vector(11 downto 0);
        vsLEDvermelho: in std_logic_vector(11 downto 0);
        vsLEDamarelo: in std_logic_vector(5 downto 0);
        LEDverde: out std_logic_vector(11 downto 0);
        LEDvermelho: out std_logic_vector(11 downto 0);
        LEDamarelo: out std_logic_vector(5 downto 0)
		  --tempoP: out unsigned (6 downto 0);
		  --tempoS: out unsigned (6 downto 0)
		  
    );
end entity muxLeds;

-- Arquitetura do muxLeds
architecture comportamento of muxLeds is
begin
    with selector select
        LEDverde <= tecladoLEDverde when "0000",
                    autoLEDverde when "0001",
                    vpLEDverde when "0010",
                    vsLEDverde when "0011",
                    (others => '0') when others;
        
    with selector select
        LEDvermelho <= tecladoLEDvermelho when "0000",
                    autoLEDvermelho when "0001",
                    vpLEDvermelho when "0010",
                    vsLEDvermelho when "0011",
                    (others => '0') when others;
        
    with selector select
        LEDamarelo <= tecladoLEDamarelo when "0000",
                    autoLEDamarelo when "0001",
                    vpLEDamarelo when "0010",
                    vsLEDamarelo when "0011",
                    (others => '0') when others;
							 
--    with selector select
--        tempoP     <= autoTempoP when "0000",
--                      vpTempoP when "0001",
--                     vsTempoP when "0010",
--                      tecladoTempoP when "0011",
--                      (others => '0') when others;
--    with selector select
--        tempoS     <= autoTempoS when "0000",
--                      vpTempoS when "0001",
--                      vsTempoS when "0010",
--                      tecladoTempoS when "0011",
--                      (others => '0') when others;
							 
end architecture comportamento;
