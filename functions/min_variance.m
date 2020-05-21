function [y_min_var,idx] = min_variance(y,n_sam_sy,n_add_sam,n_sy)

    y = [y zeros(1,n_add_sam)];
    for ii=1:n_sam_sy
            s = sum((abs(y(ii:n_sam_sy:length(y))-1).^2));
            var(ii) = s/(length(s)-1);
    end
    
    [m,idx] = min(var);
    y_min_var = y(idx:n_sam_sy:length(y));
    
end
