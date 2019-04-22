entity geral is
port(

BAS: in bit_vector(1 downto 0);
EXP: in bit_vector(1 downto 0);
RE: out bit_vector(4 downto 0)
);

end geral;

architecture geral_arc of geral is

signal M2x2: bit_vector(3 downto 0);
signal M4x4: bit_vector(7 downto 0);

component mux4_5x5 is
port(

ENT0, ENT1, ENT2, ENT3: in bit_vector(4 downto 0);
SELm: in bit_vector(1 downto 0);
RESm: out bit_vector(4 downto 0)
);

end component;

component mult2x2 is
port(

At, Bt: in bit_vector(1 downto 0);
Ct: out bit_vector(3 downto 0)
);

end component;

component mult4x4 is
port(

Af, Bf: in bit_vector(3 downto 0);
Cf: out bit_vector(7 downto 0)
);

end component;

begin

mu2x2 : mult2x2 port map(
At => BAS,
Bt => BAS,
Ct => M2x2
);

mu4x4 : mult4x4 port map(
Af => M2x2,
Bf(0) => BAS(0),
Bf(1) => BAS(1),
Bf(2) => '0',
Bf(3) => '0',
Cf => M4x4
);

mux : mux4_5x5 port map(
ENT0(0) => '1',
ENT0(1) => '0',
ENT0(2) => '0',
ENT0(3) => '0',
ENT0(4) => '0',
ENT1(0) => BAS(0),
ENT1(1) => BAS(1),
ENT1(2) => '0',
ENT1(3) => '0',
ENT1(4) => '0',
ENT2(0) => M2x2(0),
ENT2(1) => M2x2(1),
ENT2(2) => M2x2(2),
ENT2(3) => M2x2(3),
ENT2(4) => '0',
ENT3(0) => M4x4(0),
ENT3(1) => M4x4(1),
ENT3(2) => M4x4(2),
ENT3(3) => M4x4(3),
ENT3(4) => M4x4(4),
SELm => EXP,
RESm => RE
);

end geral_arc;