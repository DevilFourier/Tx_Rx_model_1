function [idx,xco] = x_correlation(pilot,y_rx,n_sam)
    %CROSS CORRELATION
    for ii=1:n_sam
        xco(ii) = sum(y_rx.*pilot);
        pilot = [0 pilot(1:end-1)];
    end
    [pk,idx] = max(xco);
end