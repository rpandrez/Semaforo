library ieee;
use ieee.std_logic_1164.all;

entity Display_LCD is
  port (
    clk_in : in std_logic;
    reset : in std_logic;
    EN : inout std_logic;
    Principal_Dezena : in std_logic_vector(7 downto 0);
    Principal_Unidade : in std_logic_vector(7 downto 0);
    Secundario_Dezena : in std_logic_vector(7 downto 0);
    Secundario_Unidade : in std_logic_vector(7 downto 0);
	 
	 OpCode : in std_logic_vector(7 downto 0);
	 Entrada_Principal_Unidade : in std_logic_vector(7 downto 0);
	 Entrada_Principal_Dezena : in std_logic_vector(7 downto 0);
    Entrada_Secundario_Unidade : in std_logic_vector(7 downto 0);
	 Entrada_Secundario_Dezena : in std_logic_vector(7 downto 0);
    
	 RS : out std_logic;
    RW : out std_logic;
    DB : out std_logic_vector(7 downto 0);
    clk : out std_logic
  );
end entity Display_LCD;

architecture rtl of Display_LCD is

  component clock_divider_lcd is
    port (
      clk_in : in std_logic;
      reset : in std_logic;
      EN : inout std_logic
    );
  end component clock_divider_lcd;

  type state_type is (
    FunctionSet1,
    FunctionSet2,
    FunctionSet3,
    FunctionSet4,
    FunctionSet5,
    FunctionSet6,
    FunctionSet7,
    FunctionSet8,
    FunctionSet9,
    FunctionSet10,
    FunctionSet11,
    FunctionSet12,
    FunctionSet13,
    FunctionSet14,
    FunctionSet15,
    FunctionSet16,
	 
    FunctionSet17,
    FunctionSet18,
    FunctionSet19,
    FunctionSet20,
    FunctionSet21,
    FunctionSet22,
    FunctionSet23,
	 
    ClearDisplay,
    DisplayControl,
    EntryMode,
    WriteData1,
    WriteData2,
    WriteData3,
    WriteData4,
    WriteData5,
    WriteData6,
    WriteData7,
    WriteData8,
    SetAddress1,
    WriteData9,
    WriteData10,
    WriteData11,
    WriteData12,
    WriteData13,
    WriteData14,
    WriteData15,
    WriteData16,
    WriteData17,
    WriteData18,
    WriteData19,
    WriteData20,
    WriteData21,
    WriteData22,
    WriteData23,
    WriteData24,
    WriteData25,
    WriteData26,
    WriteData27,
    WriteData28,
    WriteData29,
    WriteData30,
    WriteData31,	 
    ReturnHome
  );

  signal pr_state, nx_state : state_type;

begin
				
  clk_div : clock_divider_lcd
    port map (
      clk_in => clk_in,
      reset => reset,
      EN => EN
    );

  process (EN)
  begin
    if rising_edge(EN) then
      pr_state <= nx_state;
    end if;
  end process;

  process (pr_state, Principal_Dezena, Principal_Unidade, Secundario_Dezena, Secundario_Unidade)
  begin
    case pr_state is
      when FunctionSet1 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet2;

      when FunctionSet2 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet3;

      when FunctionSet3 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet4;

      when FunctionSet4 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet5;

      when FunctionSet5 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet6;

      when FunctionSet6 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet7;

      when FunctionSet7 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet8;

      when FunctionSet8 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet9;

      when FunctionSet9 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet10;

      when FunctionSet10 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet11;

      when FunctionSet11 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet12;

      when FunctionSet12 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet13;

      when FunctionSet13 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet14;

      when FunctionSet14 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet15;

      when FunctionSet15 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet16;

      when FunctionSet16 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet17;
		  
		when FunctionSet17 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet18;
		
		when FunctionSet18 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet19;
		  
		when FunctionSet19 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet20;
		  
		when FunctionSet20 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet21;
		  
		when FunctionSet21 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet22;
		  
		when FunctionSet22 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= FunctionSet23;

		when FunctionSet23 =>
        RS <= '0';
        RW <= '0';
        DB <= "00111100";
        nx_state <= DisplayControl;
  
		  
      when DisplayControl =>
        RS <= '0';
        RW <= '0';
        DB <= "00001100";
        nx_state <= EntryMode;

      when EntryMode =>
        RS <= '0';
        RW <= '0';
        DB <= "00000110";
        nx_state <= ClearDisplay;

      when ClearDisplay =>
        RS <= '0';
        RW <= '0';
        DB <= "00000001";
        nx_state <= WriteData1;

      when WriteData1 =>
        RS <= '1';
        RW <= '0';
        DB <= "01001111"; --O
        nx_state <= WriteData2;

      when WriteData2 =>
        RS <= '1';
        RW <= '0';
        DB <= "01110000"; --p
        nx_state <= WriteData3;

      when WriteData3 =>
        RS <= '1';
        RW <= '0';
        DB <= "01000011"; --C
        nx_state <= WriteData4;

      when WriteData4 =>
        RS <= '1';
        RW <= '0';
        DB <= "01100100"; --d
        nx_state <= WriteData5;

      when WriteData5 =>
        RS <= '1';
        RW <= '0';
        DB <= "00100000"; -- " "
        nx_state <= WriteData6;

      when WriteData6 =>
        RS <= '1';
        RW <= '0';
        DB <= OpCode;
        nx_state <= WriteData7;

		when WriteData7 =>
        RS <= '1';
        RW <= '0';
        DB <= "00100000"; -- " "
        nx_state <= WriteData8;
		  
		when WriteData8 =>
        RS <= '1';
        RW <= '0';
        DB <= "01010000"; -- P
        nx_state <= WriteData9;
		  
		when WriteData9 =>
        RS <= '1';
        RW <= '0';
        DB <= "00111010"; -- :
        nx_state <= WriteData10;
		  
		when WriteData10 =>
        RS <= '1';
        RW <= '0';
        DB <= Entrada_Principal_Dezena;
        nx_state <= WriteData11;

		when WriteData11 =>
        RS <= '1';
        RW <= '0';
        DB <= Entrada_Principal_Unidade;
        nx_state <= WriteData12;
		  
		when WriteData12 =>
        RS <= '1';
        RW <= '0';
        DB <= "00100000"; -- " "
        nx_state <= WriteData13;
		  
		when WriteData13 =>
        RS <= '1';
        RW <= '0';
        DB <= "01010011"; -- S
        nx_state <= WriteData14;
		  
		when WriteData14 =>
        RS <= '1';
        RW <= '0';
        DB <= "00111010"; -- :
        nx_state <= WriteData15;
		  
		when WriteData15 =>
        RS <= '1';
        RW <= '0';
        DB <= Entrada_Secundario_Dezena;
        nx_state <= WriteData16;

		when WriteData16 =>
        RS <= '1';
        RW <= '0';
        DB <= Entrada_Secundario_Unidade;
        nx_state <= SetAddress1;
		  
      when SetAddress1 => --pula segunda linha
        RS <= '0';
        RW <= '0';
        DB <= "11000000"; 
        nx_state <= WriteData17;

      when WriteData17 =>
        RS <= '1';
        RW <= '0';
        DB <= "01000001"; --A
        nx_state <= WriteData18;

      when WriteData18 =>
        RS <= '1';
        RW <= '0';
        DB <= "01110110"; --v
        nx_state <= WriteData19;

      when WriteData19 =>
        RS <= '1';
        RW <= '0';
        DB <= "00101110"; --.
        nx_state <= WriteData20;

      when WriteData20 =>
        RS <= '1';
        RW <= '0';
        DB <= "01010000"; --P
        nx_state <= WriteData21;

      when WriteData21 =>
        RS <= '1';
        RW <= '0';
        DB <= "00100000"; --" "
        nx_state <= WriteData22;

      when WriteData22 =>
        RS <= '1';
        RW <= '0';
        DB <= Principal_Dezena;
        nx_state <= WriteData23;

      when WriteData23 =>
        RS <= '1';
        RW <= '0';
        DB <= Principal_Unidade;
        nx_state <= WriteData24;

		when WriteData24 =>
        RS <= '1';
        RW <= '0';
        DB <= "00100000"; --" "
        nx_state <= WriteData25;

		when WriteData25 =>
        RS <= '1';
        RW <= '0';
        DB <= "01000001"; --A
        nx_state <= WriteData26;

      when WriteData26 =>
        RS <= '1';
        RW <= '0';
        DB <= "01110110"; --v
        nx_state <= WriteData27;

      when WriteData27 =>
        RS <= '1';
        RW <= '0';
        DB <= "00101110"; --.
        nx_state <= WriteData28;

      when WriteData28 =>
        RS <= '1';
        RW <= '0';
        DB <= "01010011"; --S
        nx_state <= WriteData29;

      when WriteData29 =>
        RS <= '1';
        RW <= '0';
        DB <= "00100000"; --" "
        nx_state <= WriteData30;

      when WriteData30 =>
        RS <= '1';
        RW <= '0';
        DB <= Secundario_Dezena;
        nx_state <= WriteData31;

      when WriteData31 =>
        RS <= '1';
        RW <= '0';
        DB <= Secundario_Unidade;
        nx_state <= ReturnHome;

      when ReturnHome =>
        RS <= '0';
        RW <= '0';
        DB <= "10000000";
        nx_state <= WriteData1;
    end case;
  end process;
end architecture;

