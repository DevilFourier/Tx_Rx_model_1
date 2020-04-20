function y_ch = channel(Y_tx)
    
    global sig block
    block.Y_ch = Y_tx.*exp(i*2*pi*block.f_tx*sig.delay); 
    block.y_ch = ifft(ifftshift(block.Y_ch),'symmetric');
    y_ch = block.y_ch;
    
end