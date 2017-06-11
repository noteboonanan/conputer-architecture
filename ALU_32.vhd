----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:41 06/11/2017 
-- Design Name: 
-- Module Name:    ALU_32 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_32 is
port(  
        a,b : in signed(31 downto 0); --input operands
        operation : in unsigned(3 downto 0); --Operation to be performed
        result : out signed(31 downto 0);  --output of ALU
        zero : out std_logic
        );
end ALU_32;

architecture Behavioral of ALU_32 is

--temporary signal declaration.
signal a_in,b_in,result_out : signed(31 downto 0) := (others => '0');

begin

a_in <= a;
b_in <= b;
result <= result_out;

process(operation, a, b)
	variable temp: signed(31 downto 0);
begin
	case operation is
		when "0000" => temp := a_in and b_in;  --and gate
		when "0001" => temp := a_in or b_in;   --OR gate
		when "0010" => temp := a_in + b_in;    --addition
		when "0110" => temp := a_in - b_in;    --subtraction
		when "0111" => 
			  if a_in < b_in then     --SLT (set on less than) gate
					temp   := (others => '1');
					else
					temp   := (others => '0');
			  end if;
		when "1100" => temp := a_in nor b_in;  --NOR gate    
		when others => NULL;
	end case; 
	if temp  = (31 downto 0=>'0') then
		zero <= '1';
	else
		zero <= '0';
	end if;
	result_out <= temp;
end process;
end Behavioral;