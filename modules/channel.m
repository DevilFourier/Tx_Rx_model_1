function y_ch = channel(y_tx,Awgn)
    
    global sig block
    %OVERSAMPLING
    block.t_rx = (-(sig.n_sam/2)*(1+sig.n_sy_add_over_sam):(sig.n_over_sam-(sig.n_sam/2)*(1+sig.n_sy_add_over_sam)-1))*sig.T_over_sam;
    y_tx = interp1(block.t_tx,y_tx,block.t_rx,'previous');
    
    %SAMPLE DELAY
    block.y_ch = [zeros(1,round(sig.delay/sig.T_over_sam)) y_tx(1:end-round(sig.delay/sig.T_over_sam))];
    
    %GAUSSAIN NOISE ADDITION
    block.y_ch = block.y_ch + noise(Awgn,block.y_ch);
    y_ch = block.y_ch;
    
end