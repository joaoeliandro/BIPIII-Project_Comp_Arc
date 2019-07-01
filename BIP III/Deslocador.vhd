library ieee;
use ieee.std_logic_1164.all;

entity deslocador is
	port(X, Y 	: in 	std_logic_vector(15 downto 0);
		  op 		: in 	std_logic;
		  S 		: out std_logic_vector(15 downto 0));
end deslocador;

architecture hardware of deslocador is
begin
	process(X, Y, op)
	begin
		if (op = '0') then
			if (Y = "0000000000000000") then
				S <= X;
			elsif (Y = "0000000000000001") then
				S <= X(14 downto 0) & '0';
			elsif (Y = "0000000000000010") then
				S <= X(13 downto 0) & "00";
			elsif (Y = "0000000000000011") then
				S <= X(12 downto 0) & "000";
			elsif (Y = "0000000000000100") then
				S <= X(11 downto 0) & "0000";
			elsif (Y = "0000000000000101") then
				S <= X(10 downto 0) & "00000";
			elsif (Y = "0000000000000110") then
				S <= X(9 downto 0) & "000000";
			elsif (Y = "0000000000000111") then
				S <= X(8 downto 0) & "0000000";
			elsif (Y = "0000000000001000") then
				S <= X(7 downto 0) & "00000000";
			elsif (Y = "0000000000001001") then
				S <= X(6 downto 0) & "000000000";
			elsif (Y = "0000000000001010") then
				S <= X(5 downto 0) & "0000000000";
			elsif (Y = "0000000000001011") then
				S <= X(4 downto 0) & "00000000000";
			elsif (Y = "0000000000001100") then
				S <= X(3 downto 0) & "000000000000";
			elsif (Y = "0000000000001101") then
				S <= X(2 downto 0) & "0000000000000";
			elsif (Y = "0000000000001110") then
				S <= X(1 downto 0) & "00000000000000";
			elsif (Y = "0000000000001111") then
				S <= X(0) & "000000000000000";
			else
				S <= "0000000000000000";
			end if;
		else
			if (Y = "0000000000000000") then
				S <= X;
			elsif (Y = "0000000000000001") then
				S <= '0' & X(15 downto 1);
			elsif (Y = "0000000000000010") then
				S <= "00" & X(15 downto 2);
			elsif (Y = "0000000000000011") then
				S <= "000" & X(15 downto 3);
			elsif (Y = "0000000000000100") then
				S <= "0000" & X(15 downto 4);
			elsif (Y = "0000000000000101") then
				S <= "00000" & X(15 downto 5);
			elsif (Y = "0000000000000110") then
				S <= "000000" & X(15 downto 6);
			elsif (Y = "0000000000000111") then
				S <= "0000000" & X(15 downto 7);
			elsif (Y = "0000000000001000") then
				S <= "00000000" & X(15 downto 8);
			elsif (Y = "0000000000001001") then
				S <= "000000000" & X(15 downto 9);
			elsif (Y = "0000000000001010") then
				S <= "0000000000"& X(15 downto 10);
			elsif (Y = "0000000000001011") then
				S <= "00000000000" & X(15 downto 11);
			elsif (Y = "0000000000001100") then
				S <= "000000000000" & X(15 downto 12);
			elsif (Y = "0000000000001101") then
				S <= "0000000000000" & X(15 downto 13);
			elsif (Y = "0000000000001110") then
				S <= "00000000000000" & X(15 downto 14);
			elsif (Y = "0000000000001111") then
				S <= "000000000000000" & X(15);
			else
				S <= "0000000000000000";
			end if;
		end if;
	end process;
end hardware;