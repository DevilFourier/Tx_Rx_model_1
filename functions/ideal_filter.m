function filter = ideal_filter(f,fc)
    
    Nt = length(f);
    N1 = ceil(2*fc/(f(2)-f(1)));
    amp = [zeros(1,(Nt-N1)/2) ones(1,N1) zeros(1,(Nt-N1)/2)];
    phase = 0.*[pi*ones(1,(Nt-N1)/2) -pi*(1/fc)*f((Nt-N1)/2+1:(Nt-(Nt-N1)/2)) -pi*ones(1,(Nt-N1)/2)];
    filter = amp.*exp(i*phase);
    
end