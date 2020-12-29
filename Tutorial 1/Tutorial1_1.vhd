----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Olivier Chaligne
-- 
-- Create Date: 25.01.2020 10:10:20
-- Design Name: 
-- Module Name: Tutorial1_1 - Behavioral
-- Project Name: Tutorial 1 exercises
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL; -- Main Libraries
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tutorial1_1 is --Description of I/O
 Port ( A, B, C, D: in std_logic; -- Set Inputs
        F: out std_logic);-- Set Output
end Tutorial1_1;

architecture Behavioral of Tutorial1_1 is
begin
    F <= ((not B and C and not D) or ((B and C) and (A xor D))); -- Function of Input to output for F

end Behavioral;
