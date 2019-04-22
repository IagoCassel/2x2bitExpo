entity mult4x4 is
port(

Af, Bf: in bit_vector(3 downto 0);
Cf: out bit_vector(7 downto 0)
);

end mult4x4;

architecture mult4x4_arc of mult4x4 is

signal F0: bit_vector(2 downto 0);
signal F1, F2, F3: bit_vector(3 downto 0);
signal S0, S1: bit_vector(3 downto 0);
signal C0, C1, C2: bit_vector(3 downto 0);

component bit_adder is

port(
A, B, Ci  : in bit;
S : out bit_vector(1 downto 0)
);
end component;

begin

Cf(0) <= Af(0) and Bf(0);
F0(0) <= Af(1) and Bf(0);
F0(1) <= Af(2) and Bf(0);
F0(2) <= Af(3) and Bf(0);

F1(0) <= Af(0) and Bf(1);
F1(1) <= Af(1) and Bf(1);
F1(2) <= Af(2) and Bf(1);
F1(3) <= Af(3) and Bf(1);

adder00 : bit_adder port map(
A => F0(0),
B => F1(0),
Ci => '0',
S(0) => S0(0),
S(1) => C0(0)
);

adder01 : bit_adder port map(
A => F0(1),
B => F1(1),
Ci => C0(0),
S(0) => S0(1),
S(1) => C0(1)
);

adder02 : bit_adder port map(
A => F0(2),
B => F1(2),
Ci => C0(1),
S(0) => S0(2),
S(1) => C0(2)
);

adder03 : bit_adder port map(
A => '0',
B => F1(3),
Ci => C0(2),
S(0) => S0(3),
S(1) => C0(3)
);

Cf(1) <= S0(0);

F2(0) <= Af(0) and Bf(2);
F2(1) <= Af(1) and Bf(2);
F2(2) <= Af(2) and Bf(2);
F2(3) <= Af(3) and Bf(2);

adder10 : bit_adder port map(
A => F2(0),
B => S0(1),
Ci => '0',
S(0) => S1(0),
S(1) => C1(0)
);

adder11 : bit_adder port map(
A => F2(1),
B => S0(2),
Ci => C1(0),
S(0) => S1(1),
S(1) => C1(1)
);

adder12 : bit_adder port map(
A => F2(2),
B => S0(3),
Ci => C1(1),
S(0) => S1(2),
S(1) => C1(2)
);

adder13 : bit_adder port map(
A => F2(3),
B => C0(2),
Ci => C1(2),
S(0) => S1(3),
S(1) => C1(3)
);

Cf(2) <= S1(0);

F3(0) <= Af(0) and Bf(3);
F3(1) <= Af(1) and Bf(3);
F3(2) <= Af(2) and Bf(3);
F3(3) <= Af(3) and Bf(3);

adder20 : bit_adder port map(
A => F3(0),
B => S1(1),
Ci => '0',
S(0) => Cf(3),
S(1) => C2(0)
);

adder21 : bit_adder port map(
A => F3(1),
B => S1(2),
Ci => C2(0),
S(0) => Cf(4),
S(1) => C2(1)
);

adder22 : bit_adder port map(
A => F3(2),
B => S1(3),
Ci => C2(1),
S(0) => Cf(5),
S(1) => C2(2)
);

adder23 : bit_adder port map(
A => F3(3),
B => '0',
Ci => C2(2),
S(0) => Cf(6),
S(1) => Cf(7)
);

end mult4x4_arc;
