function [] = rx(y_ch,Awgn)
    
    global sig block
    
    block.f_rx = (-sig.n_over_sam/2+1:sig.n_over_sam/2)*(sig.F_over_sam/sig.n_over_sam);
    
    %FILTERING
    block.Y_ch_f = ideal_filter(block.f_rx,sig.ideal_fc).*fftshift(fft(y_ch));
    block.y_ch_f = ifft(ifftshift(block.Y_ch_f),'symmetric');
     
    %CLOCK GENERATION
    block.clock_rx = clock_gen(sig.n_sy_c,sig.n_sy_sam*(sig.n_sy_add_over_sam+1));
    block.clock_rx = [block.clock_rx zeros(1,sig.n_over_sam-length(block.clock_rx))];
    clock_rx = block.clock_rx;
    
    %CROSS CORRELATION
    [block.dl_ps,block.xco] = x_correlation(clock_rx,block.y_ch_f,sig.n_over_sam);
    
    %DELAY RECOVERY
    block.delay = block.t_rx(block.dl_ps);
    
    %SIGNAL RECOVERY
    block.y_rx = [block.y_ch_f(round(block.delay/sig.T_over_sam)+1:end) (noise(Awgn,ones(1,round(block.delay/sig.T_over_sam))))]; 
    
    %MIN VARIANCE
    idx = min_variance(block.y_rx,sig,"over_sam");
    
    %CONSTELATION 
    [block.const_d, block.theta] = const_dg(idx,sig,block.y_rx,block.delay);
    
end