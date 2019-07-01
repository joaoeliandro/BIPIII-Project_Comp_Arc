library ieee;
use ieee.std_logic_1164.all;

entity PC is
	PORT(	entrada 	: in 	std_logic_vector(10 downto 0);
			clk 		: in 	std_logic;
			EN 		: in 	std_logic;
			rst 		: in 	std_logic;
			saida 	: out std_logic_vector(10 downto 0));
end PC;

architecture hardware of PC is
begin
	process(entrada, clk, EN, rst)
	begin
		if(rst = '1') 
		then
			saida <= (others => '0');
		elsif(rising_edge(clk)) 
		then
			if(EN = '1') 
			then
				saida <= entrada;
			end if;
		end if;
	end process;
end hardware;
