library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity envia is
    port (
        output : out std_logic_vector(6 downto 0)
    );
end entity;

architecture comportamento of envia is
	 begin
        output <= "1100011";
end architecture;

--====================================================================================-- 
--                             HD44780 CHAR DATA HEX VALUES                           --
--====================================================================================-- 
--   = x"20",		0 = x"30",		Q = x"40",		P = x"50",		\ = x"60",		p = x"70",
-- ! = x"21",		1 = x"31",		A = x"41",		Q = x"51",		a = x"61",		q = x"71",
-- " = x"22",		2 = x"32",		B = x"42",		R = x"52",		b = x"62",		r = x"72",
-- # = x"23",		3 = x"33",		C = x"43",		S = x"53",		c = x"63",		s = x"73",
-- $ = x"24",		4 = x"34",		D = x"44",		T = x"54",		d = x"64",		t = x"74",
-- % = x"25",		5 = x"35",		E = x"45",		U = x"55",		e = x"65",		u = x"75",
-- & = x"26",		6 = x"36",		F = x"46",		V = x"56",		f = x"66",		v = x"76",
-- ' = x"27",		7 = x"37",		G = x"47",		W = x"57",		g = x"67",		w = x"77",	
-- ( = x"28",		8 = x"38",		H = x"48",		X = x"58",		h = x"68",		x = x"78",
-- ) = x"29",		9 = x"39",		I = x"49",		Y = x"59",		i = x"69",		y = x"79",
-- * = x"2A",		: = x"3A",		J = x"4A",		Z = x"5A",		j = x"6A",		z = x"7A",		
-- + = x"2B",		; = x"3B",		K = x"4B",		[ = x"5B",		k = x"6B",		{ = x"7B",
-- , = x"2C",		< = x"3C",		L = x"4C",		Y! = x"5C",		l = x"6C",		| = x"7C",
-- - = x"2D",		= = x"3D",		M = x"4D",		] = x"5D",		m = x"6D",		} = x"7D",
-- . = x"2E",		> = x"3E",		N = x"4E",		^ = x"5E",		n = x"6E",		-> = x"7E",
-- / = x"2F",		? = x"3F",		O = x"4F",		_ = x"5F",		o = x"6F",		<- = x"7F",

