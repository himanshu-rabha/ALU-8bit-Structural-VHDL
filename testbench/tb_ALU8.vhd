library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity tb_ALU8 is

end tb_ALU8;



architecture behavior of tb_ALU8 is



component ALU8

    Port (

        A    : in  STD_LOGIC_VECTOR(7 downto 0);

        B    : in  STD_LOGIC_VECTOR(7 downto 0);

        SEL  : in  STD_LOGIC_VECTOR(1 downto 0);

        Y    : out STD_LOGIC_VECTOR(7 downto 0);

        Cout : out STD_LOGIC

    );

end component;



signal A    : STD_LOGIC_VECTOR(7 downto 0);

signal B    : STD_LOGIC_VECTOR(7 downto 0);

signal SEL  : STD_LOGIC_VECTOR(1 downto 0);

signal Y    : STD_LOGIC_VECTOR(7 downto 0);

signal Cout : STD_LOGIC;



begin



UUT : ALU8

port map(

    A => A,

    B => B,

    SEL => SEL,

    Y => Y,

    Cout => Cout

);



stim_proc : process

begin



A <= "00001010"; --10

B <= "00000101"; --5



SEL <= "00"; -- ADD

wait for 100 ns;



SEL <= "01"; -- AND

wait for 100 ns;



SEL <= "10"; -- OR

wait for 100 ns;



SEL <= "11"; -- XOR

wait for 100 ns;



wait;



end process;



end behavior;
