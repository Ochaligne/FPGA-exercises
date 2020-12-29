----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Olivier Chaligne
-- 
-- Create Date: 25.01.2020 14:55:21
-- Design Name: Full Adder
-- Module Name: Tutorial1_2b - Behavioral
-- Project Name: Tutorial1_2b
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

entity Tutorial1_2b is -- I/O Settings
    Port ( A : in STD_LOGIC; -- Set A as input
           B : in STD_LOGIC; -- Set B as input
           Cin : in STD_LOGIC; -- Set Cin as input
           SUM : out STD_LOGIC; -- Set SUM as output
           Cout : out STD_LOGIC); -- Set Cout as output
end Tutorial1_2b;

architecture Behavioral of Tutorial1_2b is  
    
begin -- Outputs behaviour
    SUM <=  A XOR B XOR Cin; -- Behaviour for output SUM
    Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ; -- Behaviour for output Cout

end Behavioral;
