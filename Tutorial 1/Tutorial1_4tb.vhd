----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tutorial1_4tb is
end Tutorial1_4tb;

architecture testbench of Tutorial1_4tb is
------ DUT Declaration:------
    component Tutorial1_4 is
         Port ( x : in STD_LOGIC_VECTOR (7 DOWNTO 0):="00000000"; -- Set Input
                y : out STD_LOGIC_VECTOR (2 DOWNTO 0));-- Set Output
    end component;
    ------Signal Declaration:------
    signal x_tb: STD_LOGIC_VECTOR (7 DOWNTO 0); --Input signal
    signal y_tb: STD_LOGIC_VECTOR (2 DOWNTO 0); --Output signal

begin
    ------ DUT Instantiation:------
        dut: Tutorial1_4 Port map (x => x_tb, y => y_tb);
    ------ Stimuli Generation:------
        x_tb <= "00000001" AFTER 40ns, "00000010" AFTER 60ns, "00000100" AFTER 80ns, "00001000" AFTER 100ns, "00010000" AFTER 120ns, "00100000" AFTER 140ns, "01000000" AFTER 160ns, "10000000" AFTER 180ns, "00000011" AFTER 200ns;
                
end testbench;
----------------------------------------------------------------------------------------------------
