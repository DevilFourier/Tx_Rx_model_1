function y_ch = channel(y_tx,Awgn)
    
    global sig block
    %OVERSAMPLING
    block.t_ch = (-(sig.n_sam_tx/2)*(1+sig.n_add_sam_ch):(sig.n_sam_ch-(sig.n_sam_tx/2)*(1+sig.n_add_sam_ch)-1))*sig.T_sam_ch;
    y_tx = interp1(block.t_tx,y_tx,block.t_ch);
    y_tx(isnan(y_tx))=0;
    
    %SAMPLE DELAY
    block.y_ch = [zeros(1,sig.sam_delay) y_tx(1:end-sig.sam_delay)];
    
    %GAUSSAIN NOISE ADDITION
    block.y_ch = block.y_ch + noise(Awgn,block.y_ch);
    y_ch = block.y_ch;
    
end