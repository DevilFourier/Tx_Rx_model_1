function prbs = prbs_gen(n_sy_prbs,n_sy_sam)
    %PRBS
    lev=[1 -1];
    p=([0:(n_sy_sam-1)]>=0);
    prbs=(randsample(lev,1)).*p;
    for i=1:(n_sy_prbs-1)
        prbs=[prbs (randsample(lev,1)).*p]; 
    end
end





