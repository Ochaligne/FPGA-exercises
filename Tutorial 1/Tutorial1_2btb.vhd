library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tutorial1_2btb is
end Tutorial1_2btb;

architecture testbench of Tutorial1_2btb is
------ DUT Declaration:------
    component Tutorial1_2b is
         Port ( A, B, Cin : in std_logic; -- Set Inputs
           SUM, Cout : out std_logic);-- Set Output
    end component;
    ------Signal Declaration:------
    signal A_tb: std_logic := '0';
    signal B_tb: std_logic := '0';
    signal Cin_tb: std_logic := '0';
    signal SUM_tb : std_logic;
    signal Cout_tb : std_logic;
begin
    ------ DUT Instantiation:------
        dut: Tutorial1_2b Port map (A => A_tb, B => B_tb, Cin => Cin_tb,Cout => Cout_tb, SUM => SUM_tb);
    ------ Stimuli Generation:------
        A_tb <= NOT A_tb AFTER 40ns;
        B_tb <= NOT B_tb AFTER 60ns;
        Cin_tb <= NOT Cin_tb AFTER 80ns;

end testbench;
