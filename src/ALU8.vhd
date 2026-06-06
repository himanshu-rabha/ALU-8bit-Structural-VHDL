library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity ALU8 is

    Port (

        A    : in  STD_LOGIC_VECTOR(7 downto 0);

        B    : in  STD_LOGIC_VECTOR(7 downto 0);

        SEL  : in  STD_LOGIC_VECTOR(1 downto 0);



        Y    : out STD_LOGIC_VECTOR(7 downto 0);

        Cout : out STD_LOGIC

    );

end ALU8;



architecture Structural of ALU8 is



component RCA4

    Port (

        A    : in  STD_LOGIC_VECTOR(3 downto 0);

        B    : in  STD_LOGIC_VECTOR(3 downto 0);

        Cin  : in  STD_LOGIC;

        Sum  : out STD_LOGIC_VECTOR(3 downto 0);

        Cout : out STD_LOGIC

    );

end component;



signal SUM8 : STD_LOGIC_VECTOR(7 downto 0);

signal CLOW : STD_LOGIC;

signal CHIGH : STD_LOGIC;



begin



RCA_LOW : RCA4

port map(

    A => A(3 downto 0),

    B => B(3 downto 0),

    Cin => '0',

    Sum => SUM8(3 downto 0),

    Cout => CLOW

);



RCA_HIGH : RCA4

port map(

    A => A(7 downto 4),

    B => B(7 downto 4),

    Cin => CLOW,

    Sum => SUM8(7 downto 4),

    Cout => CHIGH

);



Cout <= CHIGH;



process(A,B,SEL,SUM8)

begin



case SEL is



    when "00" =>

        Y <= SUM8;



    when "01" =>

        Y <= A and B;



    when "10" =>

        Y <= A or B;
		
	when "11" =>
		  Y <= A xor B;



    when others =>
		  Y <=(others => '0');



end case;



end process;



end Structural;


