function idx = min_variance(y_rx,sig,type)
    %MIN VARIANCE
    if type=="over_sam"
        ll = sig.n_over_sam;
        jj = ll-(sig.n_sy_add_over_sam+1)*(sig.n_sam/2)-(sig.n_sy_sam-1)*sig.n_sy_add_over_sam-sig.n_sy_sam;
        kk = sig.n_sy_over_sam;
    end 
    if type=="sam"
        ll = 2*sig.n_sam;
        jj = ll - sig.n_sy_sam;
        kk = sig.n_sy_sam;
    end
    
    for ii=1:kk
        var_rx(ii) = var(abs(y_rx(ii:(kk):jj)));
    end
    [m,idx(1)] = min(var_rx);
    
    if type=="sam"
        idx(1) = idx(1) + ll/4;
        idx(2) = jj-ll/4;
        idx(3) = kk;
    end
    if type=="over_sam"
        idx(1) = idx(1) + (sig.n_sy_add_over_sam+1)*(sig.n_sam/2);
        idx(2) = jj;
        idx(3) = kk;
    end
end