global sig block

%SIGNAL GENERATION 

%symble period
sig.T_sy = 1e-3;
%number of symbles of the clock
sig.n_sy_c = 16; 
%number of symbles of the prbs
sig.n_sy_prbs = 1024-sig.n_sy_c;
%number of samples per symble
sig.n_sy_sam = 2;
%number of aditional samples inside each symble (always even)
sig.n_sy_add_over_sam = 2; 
%number of samples per symble (over sampled) 
sig.n_sy_over_sam = sig.n_sy_sam + sig.n_sy_sam*sig.n_sy_add_over_sam;
%total number of symble
sig.n_sy = sig.n_sy_c + sig.n_sy_prbs;
%total number of samples
sig.n_sam = (sig.n_sy_c+sig.n_sy_prbs)*sig.n_sy_sam;
%sample period
sig.T_sam = sig.T_sy/sig.n_sy_sam;
%sample period (over sampled)
sig.T_over_sam = sig.T_sam/(sig.n_sy_add_over_sam+1);
%sampling frequency
sig.F_sam = 1/sig.T_sam; 
%sampling frequency
sig.F_over_sam = 1/sig.T_over_sam; 
%total number of samples (over sampled) 
sig.n_over_sam = sig.n_sy*sig.n_sy_sam + sig.n_sy*sig.n_sy_sam*sig.n_sy_add_over_sam ...
    - sig.n_sy_add_over_sam + sig.n_sam*(1+sig.n_sy_add_over_sam);
%estimated delay (s)
sig.delay = 2*1e-3;

%BESSEL FILTER

%cuttoff frequency
bess_spec.fc = 0.2*1e3;
%filter order
bess_spec.n_bess = 20; 

