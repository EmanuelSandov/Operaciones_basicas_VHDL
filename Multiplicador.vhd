library ieee;
use ieee.std_logic_1164.all;

entity multiplicador is
    port (
        A, B: in std_logic_vector(7 downto 0);
		  Cout:out std_logic;
        ResultadoF: out std_logic_vector(16 downto 0);
		  flag_zero: out std_logic;
		  flag_signo:out std_logic;
		  flag_acarreo:out std_logic;
		  flag_overflow:out std_logic
    );
end multiplicador;

architecture comportamental of multiplicador is
	
	Component Sumador
	port(
	A: in std_logic_vector(15 downto 0);
	B: in std_logic_vector (15 downto 0);
	Ci: in std_logic;
	Co: out std_logic;
	s: out std_logic_vector (15 downto 0)
	);
end component;

	signal C: std_logic_vector(127 downto 0);
	signal Carry: std_logic_vector (6 downto 0);
	signal SumTem1,SumTem2,SumTem3,SumTem4,SumTem5,SumTem6,SumTem7: std_logic_vector (15 downto 0);
	
begin
	 C(0) <= A(0) and B(0);
	 C(1) <= A(1) and B(0);
	 C(2) <= A(2) and B(0);
	 C(3) <= A(3) and B(0);
	 C(4) <= A(4) and B(0);
	 C(5) <= A(5) and B(0);
	 C(6) <= A(6) and B(0);
	 C(7) <= A(7) and B(0);
	 C(8) <= '0';
	 C(9) <= '0';
	 C(10)<= '0';
	 C(11)<= '0';
	 C(12)<= '0';
	 C(13)<= '0';
	 C(14)<= '0';
	 C(15)<= '0';
	 
	 C(16) <= '0';
	 C(17) <= A(0) and B(1);
	 C(18) <= A(1) and B(1);
	 C(19) <= A(2) and B(1);
	 C(20) <= A(3) and B(1);
	 C(21) <= A(4) and B(1);
	 C(22) <= A(5) and B(1);
	 C(23) <= A(6) and B(1);
	 C(24) <= A(7) and B(1);
	 C(25) <= '0';
	 C(26) <= '0';
	 C(27) <= '0';
	 C(28) <= '0';
	 C(29) <= '0';
	 C(30) <= '0';
	 C(31) <= '0';
	 
	 --Suma final
	--Componenete suma
	Sum0: Sumador port map(
	A=> C(15 downto 0),
	B=> C(31 downto 16),
	Ci=> '0',
	Co=> Carry(0),
	s=> SumTem1
	);
	
	 C(32) <= '0';
	 C(33) <= '0';
	 C(34) <= A(0) and B(2);
	 C(35) <= A(1) and B(2);
	 C(36) <= A(2) and B(2);
	 C(37) <= A(3) and B(2);
	 C(38) <= A(4) and B(2);
	 C(39) <= A(5) and B(2);
	 C(40) <= A(6) and B(2);
	 C(41) <= A(7) and B(2);
	 C(42) <= '0';
	 C(43) <= '0';
	 C(44) <= '0';
	 C(45) <= '0';
	 C(46) <= '0';
	 C(47) <= '0';
	 
	 --Suma final
	--Componenete suma
	Sum1: Sumador port map(
	A=> SumTem1,
	B=> C(47 downto 32),
	Ci=> Carry(0),
	Co=> Carry(1),
	s=> SumTem2
	);
	
    C(48) <= '0';
	 C(49) <= '0';
	 C(50) <= '0';
	 C(51) <= A(0) and B(3);
	 C(52) <= A(1) and B(3);
	 C(53) <= A(2) and B(3);
	 C(54) <= A(3) and B(3);
	 C(55) <= A(4) and B(3);
	 C(56) <= A(5) and B(3);
	 C(57) <= A(6) and B(3);
	 C(58) <= A(7) and B(3);
	 C(59) <= '0';
	 C(60) <= '0';
	 C(61) <= '0';
	 C(62) <= '0';
	 C(63) <= '0';
	 
	  --Suma final
	--Componenete suma
	Sum2: Sumador port map(
	A=> SumTem2,
	B=> C(63 downto 48),
	Ci=> Carry(1),
	Co=> Carry(2),
	s=> SumTem3
	);
	
	 C(64) <= '0';
	 C(65) <= '0';
	 C(66) <= '0';
	 C(67) <= '0';
	 C(68) <= A(0) and B(4);
	 C(69) <= A(1) and B(4);
	 C(70) <= A(2) and B(4);
	 C(71) <= A(3) and B(4);
	 C(72) <= A(4) and B(4);
	 C(73) <= A(5) and B(4);
	 C(74) <= A(6) and B(4);
	 C(75) <= A(7) and B(4);
	 C(76) <= '0';
	 C(77) <= '0';
	 C(78) <= '0';
	 C(79) <= '0';

	 
--Suma final
	--Componenete suma
	Sum3: Sumador port map(
	A=> SumTem3,
	B=> C(79 downto 64),
	Ci=> Carry(2),
	Co=> Carry(3),
	s=> SumTem4
	);
	
	 C(80) <= '0';
	 C(81) <= '0';
	 C(82) <= '0';
	 C(83) <= '0';
	 C(84) <= '0';
	 C(85) <= A(0) and B(5);
	 C(86) <= A(1) and B(5);
	 C(87) <= A(2) and B(5);
	 C(88) <= A(3) and B(5);
	 C(89) <= A(4) and B(5);
	 C(90) <= A(5) and B(5);
	 C(91) <= A(6) and B(5);
	 C(92) <= A(7) and B(5);
	 C(93) <= '0';
	 C(94) <= '0';
	 C(95) <= '0';

	 
--Suma final
	--Componenete suma
	Sum4: Sumador port map(
	A=> SumTem4,
	B=> C(95 downto 80),
	Ci=> Carry(3),
	Co=> Carry(4),
	s=> SumTem5
	);
	
	 C(96) <= '0';
	 C(97) <= '0';
	 C(98) <= '0';
	 C(99) <= '0';
	 C(100) <= '0';
	 C(101) <= '0';
	 C(102) <= A(0) and B(6);
	 C(103) <= A(1) and B(6);
	 C(104) <= A(2) and B(6);
	 C(105) <= A(3) and B(6);
	 C(106) <= A(4) and B(6);
	 C(107) <= A(5) and B(6);
	 C(108) <= A(6) and B(6);
	 C(109) <= A(7) and B(6);
	 C(110) <= '0';
	 C(111) <= '0';

	 
--Suma final
	--Componenete suma
	Sum5: Sumador port map(
	A=> SumTem5,
	B=> C(111 downto 96),
	Ci=> Carry(4),
	Co=> Carry(5),
	s=> SumTem6
	);
	
	 C(112) <= '0';
	 C(113) <= '0';
	 C(114) <= '0';
	 C(115) <= '0';
	 C(116) <= '0';
	 C(117) <= '0';
	 C(118) <= '0';
	 C(119) <= A(0) and B(7);
	 C(120) <= A(1) and B(7);
	 C(121) <= A(2) and B(7);
	 C(122) <= A(3) and B(7);
	 C(123) <= A(4) and B(7);
	 C(124) <= A(5) and B(7);
	 C(125) <= A(6) and B(7);
	 C(126) <= A(7) and B(7);
	 C(127) <= '0';

	 
--Suma final
	--Componenete suma
	Sum6: Sumador port map(
	A=> SumTem6,
	B=> C(127 downto 112),
	Ci=> Carry(5),
	Co=> Carry(6),
	s=> SumTem7
	);
	
	 ResultadoF <= Carry(6) & SumTem7;
	 
flag_zero <= '1' when (Carry(6) & SumTem7 = "00000000000000000") else '0';
flag_signo <= A(7) xor B(7);  -- asumiendo que todos los números son positivos
flag_acarreo <= '0';
flag_overflow <= '0';
	
end comportamental;