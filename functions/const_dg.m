function [const_d, theta] = const_dg(idx,sig,vec,delay)
    %CONSTELLATION 
    const_d = vec(idx(1):idx(3):idx(2));
    theta = pi*(delay/sig.T_sy);
end