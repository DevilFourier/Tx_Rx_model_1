function ns = noise(Awgn,signal)
    ns = Awgn.var*randn(1,length(signal))+Awgn.mean;
end