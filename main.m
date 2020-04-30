%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                 
%                                  MODEL                                   %                                    
%                                                                          %
%     0000000000          00000000000000000          0000000000            %  
%     0        0   Y_tx   0               0   y_ch   0        0            %
%     0   Tx   0----------0    Channel    0----------0   Rx   0-----block  %
%     0        0   -->    0               0   -->    0        0            %
%     0000000000          00000000000000000          0000000000            %
%                                                                          %    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%LOAD FUNCTION, MODULES AND PARAMETERS
addpath(genpath('functions/'));
addpath(genpath('modules/'));

%TX
Y_tx = tx(bess_spec);

%CHANNEL 
y_ch = channel(Y_tx,awgn);

%RX
rx(y_ch);
 
% fprintf('Estimated delay: %d\n',sig.delay)
% fprintf('Real delay (filter + channel): %d\n',block.delay)
% fprintf('Phase: %d\n',rem(rad2deg(block.theta),360))
