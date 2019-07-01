library ieee;
use ieee.std_logic_1164.all;

entity somsub is
	PORT(	X 			: in  std_logic_vector(15 downto 0); 
			Y 			: in  std_logic_vector(15 downto 0);
			Op 		: in  std_logic;
			saida 	: out std_logic_vector(15 downto 0));
end somsub;

architecture hardware of somsub is

	component somador_16bits is
		PORT(	X 			: in  std_logic_vector(15 downto 0); 
				Y 			: in  std_logic_vector(15 downto 0);
				entrada 	: in  std_logic;
				saida 	: out std_logic_vector(15 downto 0);
				Cout 		: out std_logic);
	end component;

	component mux2_1 is
		PORT(	Entrada_A	:	in  std_logic_vector(15 downto 0);
				Entrada_B 	: 	in  std_logic_vector(15 downto 0);
				Seletor 		: 	in  std_logic;
				saida 		: 	out std_logic_vector(15 downto 0));
	end component;

	signal mux_somador: std_logic_vector(15 downto 0);

begin

	mux		: mux2_1 		  port map(Entrada_B => NOT(Y), Entrada_A => Y, Seletor => Op, saida => mux_somador);
	somador	: somador_16bits port map(X => X, Y => mux_somador, entrada => Op, saida => saida);

end hardware;