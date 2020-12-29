----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2020 10:21:47
-- Design Name: 
-- Module Name: Tutorial3_2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
  Port (A : in signed(7 downto 0);
        B : in signed(7 downto 0);
        Op_Code : in STD_LOGIC_VECTOR (2 downto 0);
        Op_Out : out signed(7 downto 0));

end ALU;

architecture Behavioral of ALU is

begin
    with Op_Code select
    Op_Out <= "00000000" when "000",
              A when "001",
              (A + 1) when "010",
              (A - 1) when "011",
              (A - B) when "100",
              NOT A when "101",
              (A AND B) when "110",
              (A OR B) when "111",
              "ZZZZZZZZ" when others;     
                           
end Behavioral;
