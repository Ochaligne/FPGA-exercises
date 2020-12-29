library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------------------
entity FSM_Sequence_Detector is
port (
 clk: in std_logic; -- clock signal
 rst: in std_logic; -- reset input
 Data_in: in std_logic; -- binary sequence input
 Detected: out std_logic -- output of the VHDL sequence detector
);
end FSM_Sequence_Detector;
---------------------------------------------------------------
architecture behaviour of FSM_Sequence_Detector is
type Sequence_Detector is (Zero, One, OneOne, OneOneZero, OneOneZeroOne); -- Sequence State Names
signal current_state, next_state: Sequence_Detector; -- State Flags

begin
-- Sequential control of the Sequence Detector
process(clk,rst)
    begin
     if(rst='1') then -- at reset zero the current state
      current_state <= Zero;
     elsif(rising_edge(clk)) then -- change state at turn of the clock
      current_state <= next_state;
     end if;
end process;
---------------------------------------------------------------
-- Next state logic of the Sequence Detector
process(current_state,Data_in)
    begin
        case(current_state) is
         when Zero => -- previous bit sequence
          if(Data_in='1') then -- required bit
           -- "1"
           next_state <= One;
          else
           next_state <= Zero; -- restart sequence
          end if;
         when One => -- previous bit sequence
          if(Data_in='1') then -- required bit
           -- "11"
           next_state <= OneOne;
          else
           next_state <= Zero; -- restart sequence
          end if;  
         when OneOne => -- previous bit sequence
          if(Data_in='0') then -- required bit
           -- "110"
           next_state <= OneOneZero;
          else
           next_state <= One; -- start sequence check again
          end if;  
         when OneOneZero => -- previous bit sequence
          if(Data_in='1') then -- required bit
           -- "1101"
           next_state <= OneOneZeroOne;
          else
           next_state <= Zero; -- restart sequence
          end if; 
         when OneOneZeroOne => -- previous bit sequence
          if(Data_in='1') then -- start sequence check again
           next_state <= One;
          else
           next_state <= Zero; -- restart sequence
          end if;
        end case;
end process;
---------------------------------------------------------------
-- Output logic of the Sequence Detector
process(current_state)
    begin 
       case current_state is -- Detected is low until correct Sequence State Name
         when Zero =>
          Detected <= '0';
         when One =>
          Detected <= '0'; 
         when OneOne => 
          Detected <= '0'; 
         when OneOneZero =>
          Detected <= '0'; 
         when OneOneZeroOne =>
          Detected <= '1';
       end case;
    end process;
end behaviour;
---------------------------------------------------------------
