library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tecladoMap is
  Port (
    lincol : in  std_logic_vector(3 downto 0);
    NSbutton : in  std_logic;
	 enableFF : out std_logic;
	 opCode: out  std_logic_vector(3 downto 0);
    dtp, utp, dts, uts : out std_logic_vector(3 downto 0)         
  );
end tecladoMap;
	
architecture comportamento of tecladoMap is
  type estados is (zerarSaidas, escreverOC, escreverDTP, escreverUTP, escreverDTS, escreverUTS, gravarFF);
  attribute ENUM_ENCONDING : string;
  attribute ENUM_ENCONDING of estados: TYPE IS "sequential";
  
  signal estadoPresente, estadoProximo : estados;
  
BEGIN
  
	
	process (NSbutton)
	begin
    if rising_edge(NSbutton) then
      estadoPresente <= estadoProximo;
	 end if;
	end process;
	
	
	combinacional: PROCESS(estadoPresente, lincol)
	BEGIN
		CASE estadoPresente IS
			when zerarSaidas=>
				enableFF <= '0';
				opCode <= "0000";
				DTP <= "0000";
				UTP <= "0000";
				DTS<= "0000";
				UTS <= "0000";
				
				estadoProximo <= escreverOC;
			
			
			when escreverOC=>
				if lincol /= "1111" and lincol /= "1100" then
					case lincol is
						when "0000" =>
							opCode <= "0001";
											  
						when "0001" =>
							opCode <= "0010";
											  
						when "0010" =>
							opCode <= "0011";
						
						when "1101" =>
							opCode <= "0000";
											  
						when others =>
							opCode <= "0000";
					end case;
				end if;
								
								
				if NSbutton = '0' then
					estadoProximo <= escreverDTP;
				else
					estadoProximo <= escreverOC;
				end if;						
			
			
			when escreverDTP =>
				if lincol /= "1111" and lincol /= "1100" then
					case lincol is
						when "0000" =>
						  	dtp <= "0001";
											  
						when "0001" =>
							dtp <= "0010";
											  
						when "0010" =>
							dtp <= "0011";
											  
						when "0100" =>
							dtp <= "0100";
											  
						when "0101" =>
							dtp <= "0101";
											  
						when "0110" =>
							dtp <= "0110";
											  
						when "1000" =>
							dtp <= "0111";
											  
						when "1001" =>
							dtp <= "1000";
											  
						when "1010" =>
							dtp <= "1001";
						
						when "1101" =>
							dtp <= "0000";
											  
						when others =>
								  
					end case;
				end if;
								
								
				if NSbutton = '0' then
					estadoProximo <= escreverUTP;			
				else
					estadoProximo <= escreverDTP;
				end if;
			
			when escreverUTP =>
				if lincol /= "1111" and lincol /= "1100" then
					case lincol is
						when "0000" =>
						  	utp <= "0001";
											  
						when "0001" =>
							utp <= "0010";
											  
						when "0010" =>
							utp <= "0011";
											  
						when "0100" =>
							utp <= "0100";
											  
						when "0101" =>
							utp <= "0101";
											  
						when "0110" =>
							utp <= "0110";
											  
						when "1000" =>
							utp <= "0111";
											  
						when "1001" =>
							utp <= "1000";
											  
						when "1010" =>
							utp <= "1001";
						
						when "1101" =>
							utp <= "0000";
											  
						when others =>
								  
					end case;
				end if;
								
								
				if NSbutton = '0' then
					estadoProximo <= escreverDTS;
				else
					estadoProximo <= escreverUTP;
				end if;


			when escreverDTS =>
				if lincol /= "1111" and lincol /= "1100" then
					case lincol is
						when "0000" =>
						  	dts <= "0001";
											  
						when "0001" =>
							dts <= "0010";
											  
						when "0010" =>
							dts <= "0011";
											  
						when "0100" =>
							dts <= "0100";
											  
						when "0101" =>
							dts <= "0101";
											  
						when "0110" =>
							dts <= "0110";
											  
						when "1000" =>
							dts <= "0111";
											  
						when "1001" =>
							dts <= "1000";
											  
						when "1010" =>
							dts <= "1001";
						
						when "1101" =>
							dts <= "0000";
											  
						when others =>
								  
					end case;
				end if;
								
								
				if NSbutton = '0' then
					estadoProximo <= escreverUTS;
				else
					estadoProximo <= escreverDTS;
				end if;

			when escreverUTS =>
				if lincol /= "1111" and lincol /= "1100" then
					case lincol is
						when "0000" =>
						  	uts <= "0001";
											  
						when "0001" =>
							uts <= "0010";
											  
						when "0010" =>
							uts <= "0011";
											  
						when "0100" =>
							uts <= "0100";
											  
						when "0101" =>
							uts <= "0101";
											  
						when "0110" =>
							uts <= "0110";
											  
						when "1000" =>
							uts <= "0111";
											  
						when "1001" =>
							uts <= "1000";
											  
						when "1010" =>
							uts <= "1001";
						
						when "1101" =>
							uts <= "0000";
											  
						when others =>
								  
					end case;
				end if;
								
								
				if NSbutton = '0' then
					estadoProximo <= zerarSaidas;
				else
					estadoProximo <= escreverUTS;
				end if;
			
			when gravarFF =>
				
				enableFF <= '1';
				
				if NSbutton = '0' then
					estadoProximo <= zerarSaidas;
				else
					estadoProximo <= gravarFF;
				end if;
		
		
		
		
		END CASE;
	END PROCESS;
END ARCHITECTURE;