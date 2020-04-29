function [] = rx(y_ch)
    
    global sig block
    
    %FILTERING
    block.Y_ch_f = ideal_filter(block.f_tx,sig.ideal_fc).*fftshift(fft(y_ch));
    block.y_ch_f = ifft(ifftshift(block.Y_ch_f),'symmetric');
    
    %OVERSAMPLING
    block.t_rx = (-(sig.n_sam/2)*(1+sig.n_sy_add_over_sam):(sig.n_over_sam-(sig.n_sam/2)*(1+sig.n_sy_add_over_sam)-1))*sig.T_over_sam;
    block.f_rx = (-sig.n_over_sam/2+1:sig.n_over_sam/2)*(sig.F_over_sam/sig.n_over_sam);
    block.y_rx = interp1(block.t_tx,block.y_ch_f,block.t_rx,'previous');
      
    %CLOCK GENERATION
    block.clock_rx = clock_gen(sig.n_sy_c,sig.n_sy_sam*(sig.n_sy_add_over_sam+1));
    block.clock_rx = [block.clock_rx zeros(1,sig.n_over_sam-length(block.clock_rx))];
    clock_rx = block.clock_rx;
    
    %CROSS CORRELATION
    [block.dl_ps,block.xco] = x_correlation(clock_rx,block.y_rx,sig.n_over_sam);
    
    %DELAY RECOVERY
    block.delay = block.t_rx(block.dl_ps);
    
    %SIGNAL RECOVERY
    block.Y_rx = fftshift(fft(block.y_rx));
    block.Y_rx = block.Y_rx.*exp(i*2*pi*block.f_rx*block.delay);
    block.y_rx = ifft(ifftshift(block.Y_rx),'symmetric');
    
    %MIN VARIANCE
    idx = min_variance(block.y_rx,sig,"over_sam");
    
    %CONSTELATION 
    [block.const_d, block.theta] = const_dg(idx,sig,block.y_rx,block.delay);
    
end