function clock = clock_gen(n_sy_c,n_sy_sam)
    %CLOCK SIGNAL
    p=ones(1,n_sy_sam);
    clock=p;
    for i=1:(n_sy_c-1)
        clock=[clock p.*(1-2*(rem(i,2)~=0))]; 
    end
end
    