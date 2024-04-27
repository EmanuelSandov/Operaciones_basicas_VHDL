library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------
entity Converti is
    Port (
        S : in  std_logic_vector(11 downto 0);
		  output_bcd : out std_logic_vector(15 downto 0)
    );
end Converti;
------------------------------------------------------------------------
architecture Behavioral of Converti is
	--Señal resultante P
	signal P:std_logic_vector(15 downto 0):=(others=>'0');
	--Señales para guardar los neebles
	signal UNI, DEC, CEN, MIL:std_logic_vector(3 downto 0);
begin
    process (S)
			--Variable para almacenar el ressultado que luego pasa a p
        variable Temp : std_logic_vector(27 downto 0);
    begin
			for i in 0 to 27 loop
				Temp(i):='0';
			end loop;
			Temp(11 downto 0):= S(11 downto 0);
			--Proceso para neeble de las unidades
			for i in 0 to 11 loop --- U
				--Chequeo del primer nieble
				if Temp(15 downto 12) > 4 then
					Temp(15 downto 12):=Temp(15 downto 12)+3;
				end if;
				--Chequeo del segundo nieble
			if Temp(19 downto 16) >4 then --- D
					Temp(19 downto 16):=Temp(19 downto 16)+3;
				end if;
				--Chequeo del tercer nieble
			if Temp(23 downto 20) >4 then --- C
					Temp(23 downto 20):=Temp(23 downto 20)+3;
				end if;
				--Chequeo del cuarto nieble
			if Temp(27 downto 24) >4 then --- M
					Temp(27 downto 24):=Temp(27 downto 24)+3;
				end if;
			Temp(27 downto 1):=Temp(26 downto 0);
			end loop;
			P<=Temp(27 downto 12);		
			output_bcd <= Temp(27 downto 12);
		end process;
end Behavioral;