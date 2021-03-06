function [] = rx(y_ch,Awgn)
    
    global sig block
    
    %FILTERING
    block.f_ch = (-sig.n_sam_ch/2+1:sig.n_sam_ch/2)*(sig.F_sam_ch/sig.n_sam_ch);
    block.Y_ch_f = ideal_filter(block.f_ch,sig.ideal_fc).*fftshift(fft(y_ch));
    block.y_ch_f = ifft(ifftshift(block.Y_ch_f),'symmetric');
    
    %RANDOM SAMPLING
    [block.y_rx_sam,idx] = random_sampling(y_ch,sig.n_sam_sy_ch,sig.n_add_sam_ch,2*sig.n_sy,sig.T_sam_ac/sig.T_sam_ch,sig.n_sam_ac_sy);
    
    %OVERSAMPLING
    block.t_rx_sam = linspace(0,1,sig.n_sam_ac);
    block.t_rx = linspace(0,1,sig.n_sam_rx);
    block.y_rx = interp1(block.t_rx_sam,block.y_rx_sam,block.t_rx, 'previous');

    block.clock_rx = clock_gen(sig.n_sy_c, sig.n_sam_sy_ch);
    block.clock_rx = [block.clock_rx zeros(1,sig.n_sam_rx - length(block.clock_rx))];

    %CROSS CORRELATION
    [block.dl_ps,block.xco] = x_correlation(block.clock_rx,block.y_rx,sig.n_sam_rx);
    
    %DELAY RECOVERY
    block.delay = block.t_rx(block.dl_ps);
  
%     block.f_rx = (-sig.n_over_sam/2+1:sig.n_over_sam/2)*(sig.F_over_sam/sig.n_over_sam);
%     

%      

%     

%     

%     
%     %SIGNAL RECOVERY
%     block.y_rx = [block.y_ch_f(round(block.delay/sig.T_over_sam)+1:end) (noise(Awgn,ones(1,round(block.delay/sig.T_over_sam))))]; 
% 
%     
%     %CONSTELATION 
%     [block.const_d, block.theta] = const_dg(idx,sig,block.y_rx,block.delay);
    
end