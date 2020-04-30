%%%% sweep %%%
close all; clear all; clc;
parameters_master;

%total number of symble
sig.n_sy = 1024;

error(1:20) = 1;
for ii = [21:sig.n_sy/2]
    %number of symbles of the clock
    sig.n_sy_c = ii; 
    %number of symbles of the prbs
    sig.n_sy_prbs = sig.n_sy-sig.n_sy_c;
    parameters_slave;
    
    main;
    
    error(ii) = abs(sig.delay - block.delay);
    
    if sum(error(ii:-1:ii-20)) == 0
        break
    end
    clear block;
    global block
end
ii-20
sig.n_sy-ii+20


