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

entity Tutorial2_2tb is
end Tutorial2_2tb;

architecture testbench of Tutorial2_2tb is
------ DUT Declaration:------
    component DFF_comb2seq is
         Port ( clk, door, ignition, sbelt : in std_logic; -- Set Inputs
           q : out std_logic);-- Set Output
    end component;
    ------Signal Declaration:------
    signal clk_tb: std_logic := '0';
    signal door_tb: std_logic := '0';
    signal ignition_tb: std_logic := '0';
    signal sbelt_tb: std_logic := '0';
    signal q_tb : std_logic;
         
begin
    ------ DUT Instantiation:------
        dut: DFF_comb2seq Port map (clk => clk_tb, door => door_tb, q => q_tb, ignition => ignition_tb, sbelt => sbelt_tb);
    ------ Stimuli Generation:------
        clk_tb <= NOT clk_tb AFTER 0.5us;
        door_tb <= NOT door_tb AFTER 1us, NOT door_tb AFTER 1.8us, NOT door_tb AFTER 3us, NOT door_tb AFTER 5us, NOT door_tb AFTER 7us, NOT door_tb AFTER 8us;
        ignition_tb <= NOT ignition_tb AFTER 0.8us, NOT ignition_tb AFTER 1.3us, NOT ignition_tb AFTER 2.5us, NOT ignition_tb AFTER 4.5us, NOT ignition_tb AFTER 6.5us, NOT ignition_tb AFTER 8.5us;
        sbelt_tb <= NOT sbelt_tb AFTER 0.5us, NOT sbelt_tb AFTER 1.5us, NOT sbelt_tb AFTER 2.5us, NOT sbelt_tb AFTER 3.8us, NOT sbelt_tb AFTER 6us, NOT sbelt_tb AFTER 7us, NOT sbelt_tb AFTER 9.5us;
end testbench;
----------------------------------------------------------------------------------------------------
