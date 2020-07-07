global sig block

%SIGNAL GENERATION 

%COMMUM
%symble period
sig.T_sy = 1e-3;
%number of symbles of the clock
sig.n_sy_c = 20; 
%number of symbles of the prbs
sig.n_sy_prbs = 64-sig.n_sy_c;
%total number of symble
sig.n_sy = sig.n_sy_c + sig.n_sy_prbs;

%TX
%number of samples per symble on TX
sig.n_sam_sy_tx = 2;
%total number of samples on TX
sig.n_sam_tx = (sig.n_sy_c+sig.n_sy_prbs)*sig.n_sam_sy_tx;
%sample period on TX
sig.T_sam_tx = sig.T_sy/sig.n_sam_sy_tx;
%sampling frequency on TX
sig.F_sam_tx = 1/sig.T_sam_tx;

%CH
%number of aditional samples inside each symble on CH (always even)
sig.n_add_sam_ch = 2;
%cutoff frequency (ideal filter)
sig.ideal_fc = 1e3;
%number of samples per symble (over sampled) 
sig.n_sam_sy_ch = sig.n_sam_sy_tx + sig.n_sam_sy_tx*sig.n_add_sam_ch; %- sig.n_add_sam_ch/2;
%sample period on CH
sig.T_sam_ch = sig.T_sam_tx/(sig.n_add_sam_ch+1);
%sampling frequency on CH
sig.F_sam_ch = 1/sig.T_sam_ch; 
%total number of samples on CH 
sig.n_sam_ch = sig.n_sy*sig.n_sam_sy_tx + sig.n_sy*sig.n_sam_sy_tx*sig.n_add_sam_ch ...
    - sig.n_add_sam_ch + sig.n_sam_tx*(1+sig.n_add_sam_ch);
%channel delay (seconds)
sig.delay = 0*1e-3;
%chennel delay (samples)
sig.sam_delay = round(sig.delay/sig.T_sam_ch);

%RX
%sampling acquisition period
sig.T_sam_ac = 0.5*sig.T_sy;
%samples by symble
sig.n_sam_ac_sy = sig.T_sy/sig.T_sam_ac;
%number of aditional samples inside each symble on CH (always even)
sig.n_add_sam_rx = 2;
%total number of acquisition samples
sig.n_sam_ac = 2*sig.n_sy*(sig.T_sy/sig.T_sam_ac);
%total number of samples on RX
sig.n_sam_rx = (2*sig.n_sy*(sig.T_sy/sig.T_sam_ac)-1)*sig.n_add_sam_rx + 2*sig.n_sy*(sig.T_sy/sig.T_sam_ac);

%BESSEL FILTER
%cuttoff frequency
bess_spec.fc = 0.2*1e3;
%filter order
bess_spec.n_bess = 50; 

%NOISE
%variance
Awgn.var = 0.1;
%mean
Awgn.mean = 0; 

