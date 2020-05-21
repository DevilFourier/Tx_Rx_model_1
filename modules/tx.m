function y_tx = tx(bess_spec)
    
    global sig block
    block.t_tx = (-sig.n_sam_tx/2:(1.5*sig.n_sam_tx-1))*sig.T_sam_tx;
    block.f_tx = (-sig.n_sam_tx+1:sig.n_sam_tx).*(sig.F_sam_tx/(2*sig.n_sam_tx));
    block.clock_tx = clock_gen(sig.n_sy_c,sig.n_sam_sy_tx);
    block.prbs_tx = prbs_gen(sig.n_sy_prbs,sig.n_sam_sy_tx);
    block.x_tx=[zeros(1,sig.n_sam_tx/2) block.clock_tx block.prbs_tx zeros(1,sig.n_sam_tx/2)];
    block.X_tx=fftshift(fft(block.x_tx));
    block.H_bess_tx=bessel_filter(block.f_tx,bess_spec.fc,bess_spec.n_bess);
    block.Y_tx = abs(block.H_bess_tx)*0+block.X_tx;
    block.y_tx = ifft(ifftshift(block.Y_tx),'symmetric');
    y_tx = block.y_tx;
    
end