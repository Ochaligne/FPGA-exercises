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

entity Tutorial2_1ctb is
end Tutorial2_1ctb;

architecture testbench of Tutorial2_1ctb is
------ DUT Declaration:------
    component D_FFa is
         Port (rst,clk, d : in std_logic; -- Set Inputs
           q : out std_logic);-- Set Output
    end component;
    ------Signal Declaration:------
    signal clk_tb: std_logic := '0';
     signal rst_tb: std_logic := '0';
    signal d_tb: std_logic := '0';
    signal q_tb : std_logic;
    
begin
    ------ DUT Instantiation:------
        dut: D_FFa Port map (clk => clk_tb, d => d_tb, q => q_tb, rst => rst_tb);
    ------ Stimuli Generation:------
        clk_tb <= NOT clk_tb AFTER 0.5us;
        rst_tb <= NOT rst_tb AFTER 9us;
        d_tb <= '1' AFTER 1us, '0' AFTER 1.8us, '1' AFTER 3us, '0' AFTER 5us, '1' AFTER 7us, '0' AFTER 8us, '1' AFTER 8.5us;
        

end testbench;
----------------------------------------------------------------------------------------------------
