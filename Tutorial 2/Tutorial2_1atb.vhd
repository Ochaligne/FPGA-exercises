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

entity Tutorial2_1atb is
end Tutorial2_1atb;

architecture testbench of Tutorial2_1atb is
------ DUT Declaration:------
    component D_FF is
         Port ( clk, d : in std_logic; -- Set Inputs
           q : out std_logic);-- Set Output
    end component;
    ------Signal Declaration:------
    signal clk_tb: std_logic := '0';
    signal d_tb: std_logic := '0';
    signal q_tb : std_logic;
    
begin
    ------ DUT Instantiation:------
        dut: D_FF Port map (clk => clk_tb, d => d_tb, q => q_tb);
    ------ Stimuli Generation:------
        clk_tb <= NOT clk_tb AFTER 0.5us;
        d_tb <= '1' AFTER 1us, '0' AFTER 1.8us, '1' AFTER 3us, '0' AFTER 5us, '1' AFTER 7us, '0' AFTER 8us;
        

end testbench;
----------------------------------------------------------------------------------------------------
