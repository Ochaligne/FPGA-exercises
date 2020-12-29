library ieee;
use ieee.std_logic_1164.ALL;
 ---------------------------------------------------------------
entity Tutorial4_1tb is
end Tutorial4_1tb;
--------------------------------------------------------------- 
architecture testbench of Tutorial4_1tb is 
 
------ DUT Declaration:------ 
     component FSM_Sequence_Detector
        Port(
             clk : IN  std_logic;
             rst : IN  std_logic;
             Data_in : IN  std_logic;
             Detected : OUT  std_logic
            );
        end component;
        ------Signal Declaration:------
       signal clk_tb : std_logic := '0'; -- test bench signal for the clock
       signal rst_tb : std_logic := '0'; -- test bench signal for the reset
       signal Data_in_tb : std_logic := '0'; -- test bench signal for the data input
       signal Detected_tb : std_logic; -- test bench signal for the output

begin
 
------ DUT Instantiation:------
   uut: FSM_Sequence_Detector Port map (clk => clk_tb, rst => rst_tb, Data_in => Data_in_tb, Detected => Detected_tb); -- connect testbench to circuit

----- Stimuli Generation:------
   clk_tb <= not clk_tb after 5ns; -- switch clock every 5ns
   stim_proc: process -- After reset switch input every 10ns
   begin  
      Data_in_tb <= '0';
      rst_tb <= '1'; -- reset input
         wait for 10 ns;
      rst_tb <= '0'; -- reset off
        wait for 10 ns;
      Data_in_tb <= '1';
        wait for 10 ns;
      Data_in_tb <= '1';
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
      Data_in_tb <= '1';
        wait for 10 ns;
      Data_in_tb <= '1'; 
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