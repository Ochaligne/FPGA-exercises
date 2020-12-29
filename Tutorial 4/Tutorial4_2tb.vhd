library ieee;
use ieee.std_logic_1164.ALL;
 ---------------------------------------------------------------
entity Tutorial4_2tb is
end Tutorial4_2tb;
--------------------------------------------------------------- 
architecture testbench of Tutorial4_2tb is 
 
------ DUT Declaration:------ 
     component FSM_Sequence_Detector
        Port(
             clk : IN  std_logic;
             rst : IN  std_logic;
             Data_in : IN  std_logic;
             Z1 : OUT  std_logic;
             Z2 : OUT  std_logic
            );
        end component;
        ------Signal Declaration:------
       signal clk_tb : std_logic := '0'; -- test bench signal for the clock
       signal rst_tb : std_logic := '0'; -- test bench signal for the reset
       signal Data_in_tb : std_logic := '0'; -- test bench signal for the data input
       signal Z1_tb : std_logic := '0'; -- test bench signal for the Z1 output
       signal Z2_tb : std_logic := '0'; -- test bench signal for the Z2 output


begin
 
------ DUT Instantiation:------
   uut: FSM_Sequence_Detector Port map (clk => clk_tb, rst => rst_tb, Data_in => Data_in_tb, Z1 => Z1_tb, Z2 => Z2_tb); -- connect testbench to circuit

----- Stimuli Generation:------
   clk_tb <= not clk_tb after 5ns; -- switch clock every 5ns
   stim_proc: process -- After reset switch input every 10ns
   begin  
      Data_in_tb <= '0';
      rst_tb <= '1'; -- reset input
         wait for 10 ns;
      rst_tb <= '0'; -- reset off
        wait for 1 ns;
      Data_in_tb <= '1';
        wait for 10 ns;
      Data_in_tb <= '1';
        wait for 10 ns;
      Data_in_tb <= '1'; 
        wait for 10 ns;
      Data_in_tb <= '0'; 
        wait for 10 ns;
      Data_in_tb <= '0'; 
        wait for 10 ns;
      Data_in_tb <= '1';
        wait for 10 ns;
      Data_in_tb <= '1';
        wait for 10 ns;
      Data_in_tb <= '1';
        wait for 10 ns;
      Data_in_tb <= '0'; 
        wait for 10 ns;
      Data_in_tb <= '0'; 
        wait for 10 ns;
      Data_in_tb <= '1'; 
        wait for 10 ns;
      Data_in_tb <= '0';
        wait;  
   end process;
end testbench;
---------------------------------------------------------------
