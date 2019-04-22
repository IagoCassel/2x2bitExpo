entity mult2x2 is
port(

At, Bt: in bit_vector(1 downto 0);
Ct: out bit_vector(3 downto 0)
);

end mult2x2;

architecture mult2x2_arc of mult2x2 is
begin

Ct(0) <= At(0) and Bt(0);
Ct(1) <= (At(1) and Bt(0)) xor (At(0) and Bt(1));
Ct(2) <= ((At(1) and Bt(0)) and (At(0) and Bt(1))) xor (At(1) and Bt(1));
Ct(3) <= ((At(1) and Bt(0)) and (At(0) and Bt(1))) and (At(1) and Bt(1));

end mult2x2_arc;