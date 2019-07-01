library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ULA is 
	port
	(
		X, Y 		 :	in  std_logic_vector(15 downto 0);
		S 			 : out std_logic_vector(15 downto 0);
		Z, N		 :	in bit;
		selection : in	 std_logic_vector(2 downto 0));
end ULA;
	
architecture hardware of ULA is
	
	signal saida 				: std_logic_vector(15 downto 0);
	signal saida_somador 	: std_logic_vector(15 downto 0);
	signal saida_subtrator 	: std_logic_vector(15 downto 0);
	signal saida_desloc 		: std_logic_vector(15 downto 0);
	
	component somador_16 is
		port(
			entrada_X_som 			: in 	std_logic_vector(15 downto 0);
			entrada_Y_som 			: in 	std_logic_vector(15 downto 0); 
			SaidaSom 				: out std_logic_vector(15 downto 0);
		);
	end component;
	
	component subtrator_16 is
		port(
			entrada_X_sub 			: in 	std_logic_vector(15 downto 0);
			entrada_Y_sub 			: in 	std_logic_vector(15 downto 0);
			SaidaSub 				: out std_logic_vector(15 downto 0);
		);
	end component;
	
	component desloc is
		port(
			entrada_X_desloc : in std_logic_vector(15 downto 0);
			entrada_Y_desloc : in std_logic_vector(15 downto 0);
			op 			  	  : in std_logic;
			S_desloc 		  : out std_logic_vector(15 downto 0);
		);
	end component;
		
begin
	x1 : somador_16 	PORT MAP(X, Y, saida_somador);
	x2 : subtrator_16 PORT MAP(X, Y, saida_subtrator);
	x3 : saida_desloc PORT MAP(X, Y, op => selection, saida_desloc);
	
	process(X, Y, saida_somador, saida_subtrator, saida_desloc, selection)
	begin
		if		(selection = "000") then saida <= saida_somador;
		elsif (selection = "001") then saida <= saida_subtrator;
		elsif (selection = "010") then saida <= X and Y;
		elsif (selection = "011") then saida <= X or Y;
		elsif (selection = "100") then saida <= X xor Y;
		elsif (selection = "101") then saida <= not X, not Y;
		elsif (selection = "110") then saida <= S_desloc;
		else 	 saida <= S_desloc;
		end if;
	end process;
	
	N <= saida(15);
	Z <= '1' when "0000000000000000" else '0';
	S <= saida;
end hardware;
