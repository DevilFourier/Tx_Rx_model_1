function Y_tx = tx(bess_spec)
    
    global sig block
    block.t_tx = (-sig.n_sam/2:(1.5*sig.n_sam-1))*sig.T_sam;
    block.f_tx = (-sig.n_sam+1:sig.n_sam).*(sig.F_sam/(2*sig.n_sam));
    block.clock_tx = clock_gen(sig.n_sy_c,sig.n_sy_sam);
    block.prbs_tx = prbs_gen(sig.n_sy_prbs,sig.n_sy_sam);
    block.x_tx=[zeros(1,sig.n_sam/2) block.clock_tx block.prbs_tx zeros(1,sig.n_sam/2)];
    block.X_tx=fftshift(fft(block.x_tx));
    block.H_bess_tx=bessel_filter(block.f_tx,bess_spec.fc,bess_spec.n_bess);
    block.Y_tx = abs(block.H_bess_tx).*block.X_tx;
    block.y_tx = ifft(ifftshift(block.Y_tx),'symmetric');
    Y_tx = block.Y_tx;
    
end