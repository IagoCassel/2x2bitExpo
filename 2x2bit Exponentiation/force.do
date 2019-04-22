vsim geral
add wave *

force BAS(0) 0 0ns, 1 100ns -repeat 200ns
force BAS(1) 0 0ns, 1 200ns

force EXP(0) 0 0ns, 1 25ns -repeat 50ns
force EXP(1) 0 0ns, 1 50ns -repeat 100ns

run 400ns