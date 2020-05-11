%%%% sweep %%%
close all; clear all; clc;
parameters_master;

%total number of symble
sig.n_sy = 4096;

for ii = [1:sig.n_sy/2]
    %number of symbles of the clock
    sig.n_sy_c = ii; 
    %number of symbles of the prbs
    sig.n_sy_prbs = sig.n_sy-sig.n_sy_c;
    parameters_slave;
    
    main;
    
    error = abs(sig.delay - block.delay);
    
    if error == 0
        break
    end
    clear block;
    global block
end
ii
sig.n_sy-ii


