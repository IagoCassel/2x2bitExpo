entity bit_adder is

port(
A, B, Ci  : in bit;
S : out bit_vector(1 downto 0)
);
end bit_adder;

architecture bit_adder_arc of bit_adder is

begin

S(0) <= ((A XOR B) XOR Ci);
S(1) <= ((Ci AND (A XOR B)) OR (A AND B));

end bit_adder_arc;