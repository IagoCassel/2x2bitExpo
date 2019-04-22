entity mux4x1 is
port(

ENT: in bit_vector(3 downto 0);
SEL: in bit_vector(1 downto 0);
RES: out bit
);

end mux4x1;

architecture mux4x1_arc of mux4x1 is

signal A: bit_vector(3 downto 0);

begin

A(0) <= ENT(0) and (not SEL(0)) and (not SEL(1));
A(1) <= ENT(1) and SEL(0) and (not SEL(1));
A(2) <= ENT(2) and (not SEL(0)) and SEL(1);
A(3) <= ENT(3) and SEL(0) and SEL(1);

RES <= A(3) or A(2) or A(1) or A(0);

end mux4x1_arc;