function [] = rx(y_ch)
    
    global sig block
    %OVERSAMPLING
    block.t_rx = (0:(sig.n_over_sam-1))*sig.T_over_sam;
    block.f_rx = (-sig.n_over_sam/2+1:sig.n_over_sam/2)*(sig.F_over_sam/sig.n_over_sam);
    block.y_rx = interp1(block.t_tx,y_ch,block.t_rx,'previous');
      
    %CLOCK GENERATION
    block.clock_rx = clock_gen(sig.n_sy_c,sig.n_sy_sam*(sig.n_sy_over_sam+1));
    block.clock_rx = [block.clock_rx zeros(1,sig.n_over_sam-length(block.clock_rx))];
    clock_rx = block.clock_rx;
    
    for ii=1:sig.n_over_sam
        block.xco(ii) = sum(block.y_rx.*clock_rx);
        clock_rx = [0 clock_rx(1:end-1)];
    end
    [pk,idx] = findpeaks(block.xco,'SortStr','descend');
    block.dl_ps = idx(1);
    block.delay = block.t_rx(idx(1));
    
    block.Y_rx = fftshift(fft(block.y_rx));
    block.Y_rx = block.Y_rx.*exp(i*2*pi*block.f_rx*block.delay);
    block.y_rx = ifft(ifftshift(block.Y_rx),'symmetric');
    
    
end