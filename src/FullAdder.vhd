----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:32 05/29/2026 
-- Design Name: 
-- Module Name:    FullAdder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end FullAdder;

architecture Structural of FullAdder is



component Halfadder

    Port (

        A     : in  STD_LOGIC;

        B     : in  STD_LOGIC;

        Sum   : out STD_LOGIC;

        Carry : out STD_LOGIC

    );

end component;



signal S1 : STD_LOGIC;

signal C1 : STD_LOGIC;

signal C2 : STD_LOGIC;



begin



HA1 : Halfadder

port map(

    A => A,

    B => B,

    Sum => S1,

    Carry => C1

);



HA2 : Halfadder

port map(

    A => S1,

    B => Cin,

    Sum => Sum,

    Carry => C2

);



Cout <= C1 or C2;



end Structural;



