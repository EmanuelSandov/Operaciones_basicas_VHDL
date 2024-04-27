library ieee;
use ieee.std_logic_1164.all;
-------------------------------------------------------------------------------------------
entity Sumador is
	port(
		A,B: in std_logic_vector(15 downto 0); 
		ci: in std_logic; 
		co: out std_logic; 
		S:out std_logic_vector(15 downto 0)
	);
end Sumador;
---------------------------------------------------------------------------------
architecture recurrente of Sumador is
	signal c: std_logic_vector(16 downto 0);
	signal rt:std_logic_vector(15 downto 0);
begin
process(A,B,c,ci)
	begin
	c(0)<= ci; --acarreo de entrada
	for i in 0 to 15 loop
	rt(i)<= (A(i) xor  B(i)) xor c(i); -- resta recurrente
	c(i+1)<= ((A(i)and  B(i))or (A(i)and c(i))) or ( B(i)and c(i)); -- acarreo recurrente
	end loop;
 end process;
 co<=c(16);
 S<=rt;
 end recurrente;