LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY ASCII IS

    PORT ( d : in STD_LOGIC_VECTOR (3 DOWNTO 0); --dado em forma de binário de 4 bits
           key : OUT STD_LOGIC_vector (7 downto 0)
			  );
END ENTITY;

architecture comportamnto of ASCII is
begin

process(d)
    begin
	 
	
        case d is
		  
            when "0000" =>
						key <= "00110000";
						
            when "0001" =>
						key <= "00110001";
						
            when "0010" =>
						key <= "00110010";

            when "0011" =>
						key <= "00110011";

            when "0100" =>
                key <= "00110100";

            when "0101" =>
                key <= "00110101";

            when "0110" =>
						key <= "00110110";

            when "0111" =>
						key <= "00110111";

            when "1000" =>
						key <= "00111000";
						
				 when "1001" =>
						key <= "00111001";
				 when "1010" =>
						key <= "00101010";
				 when "1011" =>
						key <= "00100011";

				WHEN OTHERS =>
              key <= "01011111"; 
		
        end case;
end process;
end architecture;