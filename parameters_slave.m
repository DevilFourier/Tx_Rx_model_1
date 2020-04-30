%number of samples per symble (over sampled) 
sig.n_sy_over_sam = sig.n_sy_sam + sig.n_sy_sam*sig.n_sy_add_over_sam;
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
