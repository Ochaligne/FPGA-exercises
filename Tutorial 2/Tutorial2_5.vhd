----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.02.2020 15:23:56
-- Design Name: 
-- Module Name: Tutorial2_5 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux8to8 is
    Port ( A, B, C, D : in STD_LOGIC_VECTOR (7 DOWNTO 0); -- 4 data inputs of 8 bit
           sel : in STD_LOGIC_VECTOR (1 DOWNTO 0); -- 2 bit 
           clk : in STD_LOGIC; -- clock input
           ena : in STD_LOGIC; -- output enable input
           Q : out STD_LOGIC_VECTOR (7 DOWNTO 0)); -- system output
           
end Mux8to8;

architecture Behavioral of Mux8to8 is
-- Shift register behaviour-------------------------------------------------------
    signal temp: STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
    process(clk, ena) -- enable can be activated at anytime.
        begin
        if rising_edge(clk) then
            if ena = '1' then -- if enable activated
               Q <= temp; -- output will be set to temp signal used to store mux output.
            else
               Q <= "ZZZZZZZZ"; -- If not enable the output set to high impedance Z
            end if;
         end if;
    end process;
 --  4 to 1 8 bit Mux behaviour--------------------------------------------------  
 temp <= A when sel="00" else -- A is output if selector is at 00
         B when sel="01" else -- A is output if selector is at 01
         C when sel="10" else -- C is output if selector is at 10
         D; -- D is output otherwise
end Behavioral;
