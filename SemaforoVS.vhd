library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity semaforoVS is
    port(
        clk: in std_logic;
        reset: in std_logic;
		  enable: in std_logic;
        LEDverde: out std_logic_vector(11 downto 0);
        LEDvermelho: out std_logic_vector(11 downto 0);
        LEDamarelo: out std_logic_vector(5 downto 0)
    );
end entity semaforoVS;

architecture comportamento of semaforoVS is
    type estados is (s0, s1);
    signal estadoPresente, estadoProximo: estados;
    signal count: unsigned(32 downto 0);
    signal lights: std_logic_vector(29 downto 0);
	 signal temp_lights: std_logic_vector(29 downto 0);
	 
	
	constant YELLOW_TIME : natural := 5;   -- Tempo em segundos para o estado amarelo



begin

    sequencial: process(clk, reset)
    begin
        if reset = '1' and enable = '1' then
            estadoPresente <= s0;
				count <= (others => '0');       -- Reinicia o contador
        
		  elsif rising_edge(clk) then
            estadoPresente <= estadoProximo;
				
				if count = (YELLOW_TIME) * 50_000_000 then
					count <= (others => '0');
				else
					count <= count + 1;
				
				end if;
			
        end if;
   
	end process sequencial;

    combinacional: process(estadoPresente, count)
    begin
        
        case estadoPresente is
            
				when s0 =>
                temp_lights <= "100100100100100100101010101010"; -- P1 = on, P2 = off, S1 = off, S2 = on =: INICIO DO SEMAFORO
                
                if count >= YELLOW_TIME * 50_000_000 then
                    estadoProximo <= s1;
                else
                    estadoProximo <= s0;
                end if;
                     
            when s1 =>
               
				 	 temp_lights <= "010001001010001001010110101010"; -- P1 = on, P2 = off, S1 = off, S2 = off =: Amarelo na VIA SECUNDARIA S2	
				
                if count >= YELLOW_TIME * 50_000_000 then
                    estadoProximo <= s1;
                else
                    estadoProximo <= s1;
                end if;		

            when others =>
                --estadoProximo <= s0;
        end case;
        
        -- Atribuição final ao sinal lights
        lights <= temp_lights;
    end process combinacional;

    -- Semaforos pedestres
    LEDverde(0) <= lights(0); 
    LEDvermelho(0) <= lights(1); 
    LEDverde(1) <= lights(2); 
    LEDvermelho(1) <= lights(3); 
    LEDverde(2) <= lights(4); 
    LEDvermelho(2) <= lights(5); 
    LEDverde(3) <= lights(6); 
    LEDvermelho(3) <= lights(7); 
    LEDverde(4) <= lights(8); 
    LEDvermelho(4) <= lights(9); 
    LEDverde(5) <= lights(10); 
    LEDvermelho(5) <= lights(11); 

    -- Semaforos veículos
    LEDverde(6) <= lights(12); 
    LEDvermelho(6) <= lights(13); 
    LEDamarelo(0) <= lights(14);
    LEDverde(7) <= lights(15); 
    LEDvermelho(7) <= lights(16); 
    LEDamarelo(1) <= lights(17);
    LEDverde(8) <= lights(18); 
    LEDvermelho(8) <= lights(19); 
    LEDamarelo(2) <= lights(20);
    LEDverde(9) <= lights(21); 
    LEDvermelho(9) <= lights(22); 
    LEDamarelo(3) <= lights(23);
    LEDverde(10) <= lights(24); 
    LEDvermelho(10) <= lights(25); 
    LEDamarelo(4) <= lights(26);
    LEDverde(11) <= lights(27); 
    LEDvermelho(11) <= lights(28); 
    LEDamarelo(5) <= lights(29);

end architecture comportamento;