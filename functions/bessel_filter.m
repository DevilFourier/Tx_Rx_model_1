function H_bess = bessel_filter(f,fc,n_bess)
    
    w0 = 2*pi*fc;
    n_sam = length(f);
    fk = zeros(1,n_sam);
    a0 = factorial(2*n_bess)/(2^(n_bess)*factorial(n_bess));
    for k=1:n_bess
        ak = factorial(2*n_bess-k)/(2^(n_bess-k)*factorial(k)*factorial(n_bess-k));
        fk = sum([fk; ak.*((((2*pi*f)*i)/w0).^k)]);
    end
    H_bess = a0./(a0+fk);
    
end
