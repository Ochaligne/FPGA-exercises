----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Olivier Chaligne
-- 
-- Create Date: 25.01.2020 18:19:16
-- Design Name: Encoder 8 to 3
-- Module Name: Tutorial1_4 - Behavioral
-- Project Name: Tutorial 1 - exercise 4
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
------------------------------------------------------------------------------------
entity Tutorial1_4 is
    Port ( x : in STD_LOGIC_VECTOR (7 DOWNTO 0); -- 8 inputs x 
           y : out STD_LOGIC_VECTOR (2 DOWNTO 0)); -- 3 outputs y
end Tutorial1_4;
------------------------------------------------------------------------------------
architecture Encoder of Tutorial1_4 is

begin
    with x select
        y <= "000" when "00000001", -- select output y for input x
             "001" when "00000010",
             "010" when "00000100",
             "011" when "00001000",
             "100" when "00010000",
             "101" when "00100000",
             "110" when "01000000",
             "111" when "10000000",
             "ZZZ" when others;
             

end Encoder;
--------------------------------------------------------------------------------------