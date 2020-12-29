----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Olivier Chaligne
-- 
-- Create Date: 25.01.2020 13:34:23
-- Design Name: Half Adder.
-- Module Name: Tutorial1_2 - Behavioral
-- Project Name: Tutorial 1 - exercise 2
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

entity Tutorial1_2 is -- I/O Port setting
    Port ( A : in STD_LOGIC; -- A set as input
           B : in STD_LOGIC; -- B set as input
           SUM : out STD_LOGIC; -- SUM set as output
           Carry : out STD_LOGIC); -- Carry set as output
end Tutorial1_2;

architecture Behavioral of Tutorial1_2 is

begin -- Function behaviour description

    SUM <= A xor B; -- SUM output set to A exclusive or B
    Carry <= A and B; -- Carry output set to A and B

end Behavioral;
