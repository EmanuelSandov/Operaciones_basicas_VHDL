library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-----------------------------------------------------------------------------
entity Complemento2_16 is
	port(
		input_c2_a : in std_logic_vector(15 downto 0);
		carry_c2 : out std_logic;
		output_c2_a : out std_logic_vector(15 downto 0)
	);
end entity;
-------------------------------------------------------------------------------------
architecture Behavioral of Complemento2_16 is
	component Sumador
		Port ( 
		A, B : in std_logic_vector(15 downto 0);
			ci:in std_logic;
			co : out std_logic;
			S : out std_logic_vector(15 downto 0)
		);
	end component;
	--Signals
	signal carry_c2_aux : std_logic;
	signal output_c2_a_aux : std_logic_vector(15 downto 0);
begin

	Sum1 : Sumador
		port map(
			A => not input_c2_a,
			B => "0000000000000001",
			ci=>'0',
			co => carry_c2_aux,
			s => output_c2_a_aux
		);
		output_c2_a <= output_c2_a_aux;
end architecture;