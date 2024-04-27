library ieee;
use ieee.std_logic_1164.all;

entity Divi is
port(
A,B: in std_logic_vector(7 downto 0); 
R:out std_logic_vector(7 downto 0);
C:out std_logic_vector(7 downto 0);
flag_zero: out std_logic;
flag_signo:out std_logic;
flag_acarreo:out std_logic;
flag_overflow:out std_logic
);
end Divi;

architecture A of Divi is
signal Result,Result1,Result2,Result3,Result4,Result5,Result6,Result7,Result8: std_logic_vector(15 downto 0):="0000000000000000";
signal R1,R2,R3,R4,R5,R6,R7: std_logic_vector(15 downto 0):="0000000000000000";
signal carry:std_logic_vector(7 downto 0);
signal divisor:std_logic_vector(15 downto 0):="0000000000000000";
signal Rest1,Rest2,Rest3,Rest4,Rest5,Rest6,Rest7,Rest8:std_logic_vector(15 downto 0);
signal B1,B2: std_logic_vector(15 downto 0);
signal c_carry:std_logic;

Component Sumador
	port(
	A: in std_logic_vector(15 downto 0);
	B: in std_logic_vector (15 downto 0);
	Ci: in std_logic;
	Co: out std_logic;
	s: out std_logic_vector (15 downto 0)
	);
end component;

Component Complemento2_16
	port(
		input_c2_a : in std_logic_vector(15 downto 0);
		carry_c2 : out std_logic;
		output_c2_a : out std_logic_vector(15 downto 0)
	);
end component;

begin
	result(8 downto 1)<=A; 
	B1<="00000000" & B(7 downto 0);
	
	Complemento: Complemento2_16 port map(
	input_c2_a=>B1,
	carry_c2=> c_carry,
	output_c2_a=>B2
	);
	
	divisor(15 downto 8)<= B2(7 downto 0);
	
	Res0: Sumador port map(
	A=> result,
	B=> divisor,
	Ci=> '0',
	Co=> Carry(0),
	s=> Rest1
	);
	
Result1(0) <= Result(0) when carry(0) = '0' else carry(0);
Result1(1) <= Result(1) when carry(0) = '0' else Rest1(1);
Result1(2) <= Result(2) when carry(0) = '0' else Rest1(2);
Result1(3) <= Result(3) when carry(0) = '0' else Rest1(3);
Result1(4) <= Result(4) when carry(0) = '0' else Rest1(4);
Result1(5) <= Result(5) when carry(0) = '0' else Rest1(5);
Result1(6) <= Result(6) when carry(0) = '0' else Rest1(6);
Result1(7) <= Result(7) when carry(0) = '0' else Rest1(7);
Result1(8) <= Result(8) when carry(0) = '0' else Rest1(8);
Result1(9) <= Result(9) when carry(0) = '0' else Rest1(9);
Result1(10) <= Result(10) when carry(0) = '0' else Rest1(10);
Result1(11) <= Result(11) when carry(0) = '0' else Rest1(11);
Result1(12) <= Result(12) when carry(0) = '0' else Rest1(12);
Result1(13) <= Result(13) when carry(0) = '0' else Rest1(13);
Result1(14) <= Result(14) when carry(0) = '0' else Rest1(14);
Result1(15) <= Result(15) when carry(0) = '0' else Rest1(15);

R1(0) <= Result1(15);
R1(1) <= Result1(0);
R1(2) <= Result1(1);
R1(3) <= Result1(2);
R1(4) <= Result1(3);
R1(5) <= Result1(4);
R1(6) <= Result1(5);
R1(7) <= Result1(6);
R1(8) <= Result1(7);
R1(9) <= Result1(8);
R1(10) <= Result1(9);
R1(11) <= Result1(10);
R1(12) <= Result1(11);
R1(13) <= Result1(12);
R1(14) <= Result1(13);
R1(15) <= Result1(14);

Res1: Sumador port map(
	A=> R1,
	B=> divisor,
	Ci=> '0',
	Co=> Carry(1),
	s=> Rest2
	);
	
Result2(0) <= R1(0) when carry(1) = '0' else Carry(1);
Result2(1) <= R1(1) when carry(1) = '0' else Rest2(1);
Result2(2) <= R1(2) when carry(1) = '0' else Rest2(2);
Result2(3) <= R1(3) when carry(1) = '0' else Rest2(3);
Result2(4) <= R1(4) when carry(1) = '0' else Rest2(4);
Result2(5) <= R1(5) when carry(1) = '0' else Rest2(5);
Result2(6) <= R1(6) when carry(1) = '0' else Rest2(6);
Result2(7) <= R1(7) when carry(1) = '0' else Rest2(7);
Result2(8) <= R1(8) when carry(1) = '0' else Rest2(8);
Result2(9) <= R1(9) when carry(1) = '0' else Rest2(9);
Result2(10) <= R1(10) when carry(1) = '0' else Rest2(10);
Result2(11) <= R1(11) when carry(1) = '0' else Rest2(11);
Result2(12) <= R1(12) when carry(1) = '0' else Rest2(12);
Result2(13) <= R1(13) when carry(1) = '0' else Rest2(13);
Result2(14) <= R1(14) when carry(1) = '0' else Rest2(14);
Result2(15) <= R1(15) when carry(1) = '0' else Rest2(15);

R2(0) <= Result2(15);
R2(1) <= Result2(0);
R2(2) <= Result2(1);
R2(3) <= Result2(2);
R2(4) <= Result2(3);
R2(5) <= Result2(4);
R2(6) <= Result2(5);
R2(7) <= Result2(6);
R2(8) <= Result2(7);
R2(9) <= Result2(8);
R2(10) <= Result2(9);
R2(11) <= Result2(10);
R2(12) <= Result2(11);
R2(13) <= Result2(12);
R2(14) <= Result2(13);
R2(15) <= Result2(14);

	
	Res2: Sumador port map(
	A=> R2,
	B=> divisor,
	Ci=> '0',
	Co=> Carry(2),
	s=> Rest3
	);

Result3(0) <= R2(0) when carry(2) = '0' else Carry(2);
Result3(1) <= R2(1) when carry(2) = '0' else Rest3(1);
Result3(2) <= R2(2) when carry(2) = '0' else Rest3(2);
Result3(3) <= R2(3) when carry(2) = '0' else Rest3(3);
Result3(4) <= R2(4) when carry(2) = '0' else Rest3(4);
Result3(5) <= R2(5) when carry(2) = '0' else Rest3(5);
Result3(6) <= R2(6) when carry(2) = '0' else Rest3(6);
Result3(7) <= R2(7) when carry(2) = '0' else Rest3(7);
Result3(8) <= R2(8) when carry(2) = '0' else Rest3(8);
Result3(9) <= R2(9) when carry(2) = '0' else Rest3(9);
Result3(10) <= R2(10) when carry(2) = '0' else Rest3(10);
Result3(11) <= R2(11) when carry(2) = '0' else Rest3(11);
Result3(12) <= R2(12) when carry(2) = '0' else Rest3(12);
Result3(13) <= R2(13) when carry(2) = '0' else Rest3(13);
Result3(14) <= R2(14) when carry(2) = '0' else Rest3(14);
Result3(15) <= R2(15) when carry(2) = '0' else Rest3(15);

R3(0) <= Result3(15);
R3(1) <= Result3(0);
R3(2) <= Result3(1);
R3(3) <= Result3(2);
R3(4) <= Result3(3);
R3(5) <= Result3(4);
R3(6) <= Result3(5);
R3(7) <= Result3(6);
R3(8) <= Result3(7);
R3(9) <= Result3(8);
R3(10) <= Result3(9);
R3(11) <= Result3(10);
R3(12) <= Result3(11);
R3(13) <= Result3(12);
R3(14) <= Result3(13);
R3(15) <= Result3(14);

Res3: Sumador port map(
	A=> R3,
	B=> divisor,
	Ci=> '0',
	Co=> Carry(3),
	s=> Rest4
	);

Result4(0) <= R3(0) when carry(3) = '0' else Carry(3);
Result4(1) <= R3(1) when carry(3) = '0' else Rest4(1);
Result4(2) <= R3(2) when carry(3) = '0' else Rest4(2);
Result4(3) <= R3(3) when carry(3) = '0' else Rest4(3);
Result4(4) <= R3(4) when carry(3) = '0' else Rest4(4);
Result4(5) <= R3(5) when carry(3) = '0' else Rest4(5);
Result4(6) <= R3(6) when carry(3) = '0' else Rest4(6);
Result4(7) <= R3(7) when carry(3) = '0' else Rest4(7);
Result4(8) <= R3(8) when carry(3) = '0' else Rest4(8);
Result4(9) <= R3(9) when carry(3) = '0' else Rest4(9);
Result4(10) <= R3(10) when carry(3) = '0' else Rest4(10);
Result4(11) <= R3(11) when carry(3) = '0' else Rest4(11);
Result4(12) <= R3(12) when carry(3) = '0' else Rest4(12);
Result4(13) <= R3(13) when carry(3) = '0' else Rest4(13);
Result4(14) <= R3(14) when carry(3) = '0' else Rest4(14);
Result4(15) <= R3(15) when carry(3) = '0' else Rest4(15);

R4(0) <= Result4(15);
R4(1) <= Result4(0);
R4(2) <= Result4(1);
R4(3) <= Result4(2);
R4(4) <= Result4(3);
R4(5) <= Result4(4);
R4(6) <= Result4(5);
R4(7) <= Result4(6);
R4(8) <= Result4(7);
R4(9) <= Result4(8);
R4(10) <= Result4(9);
R4(11) <= Result4(10);
R4(12) <= Result4(11);
R4(13) <= Result4(12);
R4(14) <= Result4(13);
R4(15) <= Result4(14);

Res4: Sumador port map(
	A=> R4,
	B=> divisor,
	Ci=> '0',
	Co=> Carry(4),
	s=> Rest5
	);

Result5(0) <= R4(0) when carry(4) = '0' else Carry(4);
Result5(1) <= R4(1) when carry(4) = '0' else Rest5(1);
Result5(2) <= R4(2) when carry(4) = '0' else Rest5(2);
Result5(3) <= R4(3) when carry(4) = '0' else Rest5(3);
Result5(4) <= R4(4) when carry(4) = '0' else Rest5(4);
Result5(5) <= R4(5) when carry(4) = '0' else Rest5(5);
Result5(6) <= R4(6) when carry(4) = '0' else Rest5(6);
Result5(7) <= R4(7) when carry(4) = '0' else Rest5(7);
Result5(8) <= R4(8) when carry(4) = '0' else Rest5(8);
Result5(9) <= R4(9) when carry(4) = '0' else Rest5(9);
Result5(10) <= R4(10) when carry(4) = '0' else Rest5(10);
Result5(11) <= R4(11) when carry(4) = '0' else Rest5(11);
Result5(12) <= R4(12) when carry(4) = '0' else Rest5(12);
Result5(13) <= R4(13) when carry(4) = '0' else Rest5(13);
Result5(14) <= R4(14) when carry(4) = '0' else Rest5(14);
Result5(15) <= R4(15) when carry(4) = '0' else Rest5(15);

R5(0) <= Result5(15);
R5(1) <= Result5(0);
R5(2) <= Result5(1);
R5(3) <= Result5(2);
R5(4) <= Result5(3);
R5(5) <= Result5(4);
R5(6) <= Result5(5);
R5(7) <= Result5(6);
R5(8) <= Result5(7);
R5(9) <= Result5(8);
R5(10) <= Result5(9);
R5(11) <= Result5(10);
R5(12) <= Result5(11);
R5(13) <= Result5(12);
R5(14) <= Result5(13);
R5(15) <= Result5(14);

Res5: Sumador port map(
	A=> R5,
	B=> divisor,
	Ci=> '0',
	Co=> Carry(5),
	s=> Rest6
	);

Result6(0) <= R5(0) when carry(5) = '0' else Carry(5);
Result6(1) <= R5(1) when carry(5) = '0' else Rest6(1);
Result6(2) <= R5(2) when carry(5) = '0' else Rest6(2);
Result6(3) <= R5(3) when carry(5) = '0' else Rest6(3);
Result6(4) <= R5(4) when carry(5) = '0' else Rest6(4);
Result6(5) <= R5(5) when carry(5) = '0' else Rest6(5);
Result6(6) <= R5(6) when carry(5) = '0' else Rest6(6);
Result6(7) <= R5(7) when carry(5) = '0' else Rest6(7);
Result6(8) <= R5(8) when carry(5) = '0' else Rest6(8);
Result6(9) <= R5(9) when carry(5) = '0' else Rest6(9);
Result6(10) <= R5(10) when carry(5) = '0' else Rest6(10);
Result6(11) <= R5(11) when carry(5) = '0' else Rest6(11);
Result6(12) <= R5(12) when carry(5) = '0' else Rest6(12);
Result6(13) <= R5(13) when carry(5) = '0' else Rest6(13);
Result6(14) <= R5(14) when carry(5) = '0' else Rest6(14);
Result6(15) <= R5(15) when carry(5) = '0' else Rest6(15);

R6(0) <= Result6(15);
R6(1) <= Result6(0);
R6(2) <= Result6(1);
R6(3) <= Result6(2);
R6(4) <= Result6(3);
R6(5) <= Result6(4);
R6(6) <= Result6(5);
R6(7) <= Result6(6);
R6(8) <= Result6(7);
R6(9) <= Result6(8);
R6(10) <= Result6(9);
R6(11) <= Result6(10);
R6(12) <= Result6(11);
R6(13) <= Result6(12);
R6(14) <= Result6(13);
R6(15) <= Result6(14);

Res6: Sumador port map(
	A=> R6,
	B=> divisor,
	Ci=> '0',
	Co=> Carry(6),
	s=> Rest7
	);

Result7(0) <= R6(0) when carry(6) = '0' else Carry(6);
Result7(1) <= R6(1) when carry(6) = '0' else Rest7(1);
Result7(2) <= R6(2) when carry(6) = '0' else Rest7(2);
Result7(3) <= R6(3) when carry(6) = '0' else Rest7(3);
Result7(4) <= R6(4) when carry(6) = '0' else Rest7(4);
Result7(5) <= R6(5) when carry(6) = '0' else Rest7(5);
Result7(6) <= R6(6) when carry(6) = '0' else Rest7(6);
Result7(7) <= R6(7) when carry(6) = '0' else Rest7(7);
Result7(8) <= R6(8) when carry(6) = '0' else Rest7(8);
Result7(9) <= R6(9) when carry(6) = '0' else Rest7(9);
Result7(10) <= R6(10) when carry(6) = '0' else Rest7(10);
Result7(11) <= R6(11) when carry(6) = '0' else Rest7(11);
Result7(12) <= R6(12) when carry(6) = '0' else Rest7(12);
Result7(13) <= R6(13) when carry(6) = '0' else Rest7(13);
Result7(14) <= R6(14) when carry(6) = '0' else Rest7(14);
Result7(15) <= R6(15) when carry(6) = '0' else Rest7(15);

R7(0) <= Result7(15);
R7(1) <= Result7(0);
R7(2) <= Result7(1);
R7(3) <= Result7(2);
R7(4) <= Result7(3);
R7(5) <= Result7(4);
R7(6) <= Result7(5);
R7(7) <= Result7(6);
R7(8) <= Result7(7);
R7(9) <= Result7(8);
R7(10) <= Result7(9);
R7(11) <= Result7(10);
R7(12) <= Result7(11);
R7(13) <= Result7(12);
R7(14) <= Result7(13);
R7(15) <= Result7(14);

	Res7: Sumador port map(
	A=> R7,
	B=> divisor,
	Ci=> '0',
	Co=> Carry(7),
	s=> Rest8
	);

Result8(0) <= R7(0) when carry(7) = '0' else Carry(7);
Result8(1) <= R7(1) when carry(7) = '0' else Rest8(1);
Result8(2) <= R7(2) when carry(7) = '0' else Rest8(2);
Result8(3) <= R7(3) when carry(7) = '0' else Rest8(3);
Result8(4) <= R7(4) when carry(7) = '0' else Rest8(4);
Result8(5) <= R7(5) when carry(7) = '0' else Rest8(5);
Result8(6) <= R7(6) when carry(7) = '0' else Rest8(6);
Result8(7) <= R7(7) when carry(7) = '0' else Rest8(7);
Result8(8) <= R7(8) when carry(7) = '0' else Rest8(8);
Result8(9) <= R7(9) when carry(7) = '0' else Rest8(9);
Result8(10) <= R7(10) when carry(7) = '0' else Rest8(10);
Result8(11) <= R7(11) when carry(7) = '0' else Rest8(11);
Result8(12) <= R7(12) when carry(7) = '0' else Rest8(12);
Result8(13) <= R7(13) when carry(7) = '0' else Rest8(13);
Result8(14) <= R7(14) when carry(7) = '0' else Rest8(14);
Result8(15) <= R7(15) when carry(7) = '0' else Rest8(15);

C<=result8(7 downto 0);
R<=result8(15 downto 8);

flag_zero<= '1' when result8(7 downto 0) = "00000000" else '0';
flag_signo <= A(7) xor B(7);
flag_acarreo <= '0';
flag_overflow <= '0'; --Como es desvordamiento no sobrepoasa los 5 bits

end A; 