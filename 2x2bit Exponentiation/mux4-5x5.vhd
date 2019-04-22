entity mux4_5x5 is
port(

ENT0, ENT1, ENT2, ENT3: in bit_vector(4 downto 0);
SELm: in bit_vector(1 downto 0);
RESm: out bit_vector(4 downto 0)
);

end mux4_5x5;

architecture mux4_5x5_arc of mux4_5x5 is

component mux4x1 is
port(

ENT: in bit_vector(3 downto 0);
SEL: in bit_vector(1 downto 0);
RES: out bit
);

end component;

begin

mux0 : mux4x1 port map(
ENT(0) => ENT0(0),
ENT(1) => ENT1(0),
ENT(2) => ENT2(0),
ENT(3) => ENT3(0),
SEL => SELm,
RES => RESm(0)
);

mux1 : mux4x1 port map(
ENT(0) => ENT0(1),
ENT(1) => ENT1(1),
ENT(2) => ENT2(1),
ENT(3) => ENT3(1),
SEL => SELm,
RES => RESm(1)
);

mux2 : mux4x1 port map(
ENT(0) => ENT0(2),
ENT(1) => ENT1(2),
ENT(2) => ENT2(2),
ENT(3) => ENT3(2),
SEL => SELm,
RES => RESm(2)
);

mux3 : mux4x1 port map(
ENT(0) => ENT0(3),
ENT(1) => ENT1(3),
ENT(2) => ENT2(3),
ENT(3) => ENT3(3),
SEL => SELm,
RES => RESm(3)
);

mux4 : mux4x1 port map(
ENT(0) => ENT0(4),
ENT(1) => ENT1(4),
ENT(2) => ENT2(4),
ENT(3) => ENT3(4),
SEL => SELm,
RES => RESm(4)
);

end mux4_5x5_arc;
