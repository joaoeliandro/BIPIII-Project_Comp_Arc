library ieee;
use ieee.std_logic_1164.all;

entity somador_16bits is
	PORT(	X 		: in std_logic_vector(15 downto 0); 
			Y 		: in std_logic_vector(15 downto 0);
			Op 	: in std_logic;
			saida	: out std_logic_vector(15 downto 0);
			Cout 	: out std_logic);
end somador_16bits;

architecture arch OF somador_16bits is

component somador
	PORT(	entrada_X	: in std_logic;
			entrada_Y	: in std_logic;
			op 			: in std_logic;
			saida_som	: out std_logic; 
			cout_som 	: out std_logic);
end component;

signal op1, op2, op3, op4, op5, op6, op7, op8, op9, op10, op11, op12, op13, op14, op15: std_logic;

begin

	OP0: 	somador port map(entrada_X => X(0),  entrada_Y => Y(0),  op => Op,  	saida_som => saida(0),  cout_som => op0);
	OP1: 	somador port map(entrada_X => X(1),  entrada_Y => Y(1),  op => op1,  saida_som => saida(1),  cout_som => op1);
	OP2: 	somador port map(entrada_X => X(2),  entrada_Y => Y(2),  op => op2,  saida_som => saida(2),  cout_som => op2);
	OP3: 	somador port map(entrada_X => X(3),  entrada_Y => Y(3),  op => op3,  saida_som => saida(3),  cout_som => op3);
	OP4: 	somador port map(entrada_X => X(4),  entrada_Y => Y(4),  op => op4,  saida_som => saida(4),  cout_som => op4);
	OP5: 	somador port map(entrada_X => X(5),  entrada_Y => Y(5),  op => op5,  saida_som => saida(5),  cout_som => op5);
	OP6: 	somador port map(entrada_X => X(6),  entrada_Y => Y(6),  op => op6,  saida_som => saida(6),  cout_som => op6);
	OP7: 	somador port map(entrada_X => X(7),  entrada_Y => Y(7),  op => op7,  saida_som => saida(7),  cout_som => op7);
	OP8: 	somador port map(entrada_X => X(8),  entrada_Y => Y(8),  op => op8,  saida_som => saida(8),  cout_som => op8);
	OP9: 	somador port map(entrada_X => X(9),  entrada_Y => Y(9),  op => op9,  saida_som => saida(9),  cout_som => op9);
	OP10: somador port map(entrada_X => X(10), entrada_Y => Y(10), op => op10, saida_som => saida(10), cout_som => op10);
	OP11: somador port map(entrada_X => X(11), entrada_Y => Y(11), op => op11, saida_som => saida(11), cout_som => op11);
	OP12: somador port map(entrada_X => X(12), entrada_Y => Y(12), op => op12, saida_som => saida(12), cout_som => op12);
	OP13: somador port map(entrada_X => X(13), entrada_Y => Y(13), op => op13, saida_som => saida(13), cout_som => op13);
	OP14: somador port map(entrada_X => X(14), entrada_Y => Y(14), op => op14, saida_som => saida(14), cout_som => op14);
	OP15: somador port map(entrada_X => X(15), entrada_Y => Y(15), op => op15, saida_som => saida(15), cout_som => cout);

end;