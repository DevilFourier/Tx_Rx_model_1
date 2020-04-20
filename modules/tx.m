function Y_tx = tx(bess_spec)
    
    global sig block
    block.t_tx = (0:(sig.n_sam-1))*sig.T_sam;
    block.f_tx = (-sig.n_sam/2+1:sig.n_sam/2).*(sig.F_sam/sig.n_sam);
    block.clock_tx = clock_gen(sig.n_sy_c,sig.n_sy_sam);
    block.prbs_tx = prbs_gen(sig.n_sy_prbs,sig.n_sy_sam);
    block.x_tx=[block.clock_tx block.prbs_tx];
    block.X_tx=fftshift(fft(block.x_tx));
    block.H_bess=bessel_filter(block.f_tx,bess_spec.fc,bess_spec.n_bess);
    block.Y_tx = block.H_bess.*block.X_tx;
    Y_tx = block.Y_tx;
    
end