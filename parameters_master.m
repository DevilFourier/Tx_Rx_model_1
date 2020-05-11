global sig block

%SIGNAL GENERATION 

%symble period
sig.T_sy = 1e-3;
%number of symbles of the clock
sig.n_sy_c = 16; 
%number of symbles of the prbs
sig.n_sy_prbs = 1024-sig.n_sy_c;
%number of samples per symble
sig.n_sy_sam = 4;
%number of aditional samples inside each symble (always even)
sig.n_sy_add_over_sam = 2;
%cutoff frequency (ideal filter)
sig.ideal_fc = 1e3;
%estimated delay (s)
sig.delay = 5*1e-3;
%total number of symble
sig.n_sy = sig.n_sy_c + sig.n_sy_prbs;

%BESSEL FILTER

%cuttoff frequency
bess_spec.fc = 0.2*1e3;
%filter order
bess_spec.n_bess = 50; 

%NOISE

%variance
awgn.var = 0.1;
%mean
awgn.mean = 0; 
