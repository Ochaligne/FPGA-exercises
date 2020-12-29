----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Olivier Chaligne
-- 
-- Create Date: 25.01.2020 16:56:25
-- Design Name: Tutorial 1_3 4 to 1 Mux
-- Module Name: Tutorial1_3 - Behavioral
-- Project Name: Tutorial 1_3
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
----------------------------------------------------------------------------------
entity mux4to1 is
port( D0,D1,D2,D3 : std_logic_vector(3 downto 0);
        A,B: in std_logic;
        F: out std_logic_vector(3 downto 0));
end mux4to1;

Architecture behaviour of mux4to1 is
Begin

    F<= D0 when (A='0' and B='0') else
        D1 when (A='0' and B='1') else
        D2 when (A='1' and B='0') else
        D3;

end behaviour;
----------------------------------------------------------------------------------
