-- Autor: Cristiano De Morais Bezerra, Matricula: 2017-13110
-- Data 29/04/2019
-- Projeto Multiplexador Para Unidade 2 da Disciplina: Aquitetura De Computadores E Microprocessadores.



library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1 is 							--       Declarei a entidade (mux_2x1).	 
port (s : in std_logic;							---	
		d : std_logic_vector (1 downto 0);		-- Declarei as entradas e saidas, inclusive utilizando metodo vetor logico.			
		y : out std_logic );						---	
end mux_2x1;									--

architecture defalt of mux_2x1 is 				-- Declarei a arquitetura (defalt).
															  --
signal sb, x1, x2 : std_logic;					-- Declarei os sinais logicos.


component and_2x1 is									-- Declarei o componente and, e inicie o mesmo.
port	(a, b: in std_logic ;							--
		s : out std_logic);								--
end component;											-- finalizei o componente.

component not_2x1 is									-- Declarei o componente not, e inicie o mesmo.
port	(a : in std_logic;								--
			s : out std_logic);							--
end component;											-- finalizei o componente.


component or_2x1 is									-- Declarei o componente not, e inicie o mesmo.
port	(a, b: in std_logic;								--
			s : out std_logic);							--
end component;											-- finalizei o componente.									
			

begin														-- inicializando a arquitetura defalt e mapeamento das portas.								
																--	
c1	: not_2x1 port map (s, sb);							--
c2	: and_2x1 port map (d(0), sb, x1);						--
c3	: and_2x1 port map (s, d(1), x2);						--
c4	: or_2x1 port map (x1, x2, y);						--
																--
end defalt;												-- Finalizando a arquitetura.