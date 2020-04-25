function [] = plot_data(plt,block)    
    for ii=1:size(plt,2)
        switch plt{ii}
            case 'x_tx'
                figure
                plot(block.t_tx/1e-3,block.x_tx,'-b','LineWidth',1.4)
                xlim([block.t_tx(1) block.t_tx(end)]/1e-3)
                ylim([-1.5 1.5])
                xlabel('time [ms]')
                ylabel('Amplitude')
                title('x_{tx}')
            case 'X_tx_mod'
                figure
                plot(block.f_tx/1e3,abs(block.X_tx).^2,'-b','LineWidth',1.4)
                xlim([block.f_tx(1) block.f_tx(end)]/1e3)
                xlabel('frequency [KHz]')
                ylabel('Amplitude')
                title('X_{tx} Module')
            case 'X_tx_pha'
                figure
                plot(block.f_tx/1e3,rad2deg(angle(block.X_tx)),'-b','LineWidth',1.4)
                xlim([block.f_tx(1) block.f_tx(end)]/1e3)
                xlabel('frequency [KHz]')
                ylabel('\theta')
                title('X_{tx} Phase')
            case 'y_tx'
                figure
                plot(block.t_tx/1e-3,block.y_tx,'-b','LineWidth',1.4)
                xlim([block.t_tx(1) block.t_tx(end)]/1e-3)
                ylim([-1.5 1.5])
                xlabel('time [ms]')
                ylabel('Amplitude')
                title('y_{tx}')
            case 'Y_tx_mod'
                figure
                plot(block.f_tx/1e3,abs(block.Y_tx).^2,'-b','LineWidth',1.4)
                xlim([block.f_tx(1) block.f_tx(end)]/1e3)
                xlabel('frequency [KHz]')
                ylabel('Amplitude')
                title('Y_{tx} Module')
            case 'Y_tx_pha'
                figure
                plot(block.f_tx/1e3,rad2deg(angle(block.Y_tx)),'-b','LineWidth',1.4)
                xlim([block.f_tx(1) block.f_tx(end)]/1e3)
                xlabel('frequency [KHz]')
                ylabel('\theta')
                title('Y_{tx} Phase')
            case 'y_ch'
                figure
                plot(block.t_tx/1e-3,block.y_ch,'-b','LineWidth',1.4)
                xlim([block.t_tx(1) block.t_tx(end)]/1e-3)
                ylim([-1.5 1.5])
                xlabel('time [ms]')
                ylabel('Amplitude')
                title('y_{ch}')
            case 'Y_ch_mod'
                figure
                plot(block.f_tx/1e3,abs(block.Y_ch).^2,'-b','LineWidth',1.4)
                xlim([block.f_tx(1) block.f_tx(end)]/1e3)
                xlabel('frequency [KHz]')
                ylabel('Amplitude')
                title('Y_{ch} Module')
            case 'Y_ch_pha'
                figure
                plot(block.f_tx/1e3,rad2deg(angle(block.Y_ch)),'-b','LineWidth',1.4)
                xlim([block.f_tx(1) block.f_tx(end)]/1e3)
                xlabel('frequency [KHz]')
                ylabel('\theta')
                title('X_{ch} Phase')
            case 'y_rx'
                figure
                plot(block.t_rx/1e-3,block.y_rx,'-b','LineWidth',1.4)
                xlim([block.t_rx(1) block.t_rx(end)]/1e-3)
                ylim([-1.5 1.5])
                xlabel('time [ms]')
                ylabel('Amplitude')
                title('y_{rx}')
           case 'clock_rx'
                figure
                plot(block.t_rx/1e-3,block.clock_rx,'-b','LineWidth',1.4)
                xlim([block.t_rx(1) block.t_rx(end)]/1e-3)
                ylim([-1.5 1.5])
                xlabel('time [ms]')
                ylabel('Amplitude')
                title('clock_{rx}')
            case 'xco'
                figure
                hold on
                plot(block.t_rx/1e-3,block.xco,'-b','LineWidth',1.4)
                plot(block.t_rx(block.dl_ps)/1e-3,block.xco(block.dl_ps),'*r','LineWidth',3)
                xlim([block.t_rx(1) block.t_rx(end)]/1e-3)
                xlabel('time [ms]')
                ylabel('Amplitude')
                title('Cross Correlation')
            case 'Hb_mod'
                figure
                plot(block.f_tx/1e3,abs(block.H_bess).^2,'-b','LineWidth',1.4)
                xlim([block.f_tx(1) block.f_tx(end)]/1e3)
                xlabel('frequency [KHz]')
                ylabel('Amplitude')
                title('Bessel Filter')
            case 'const'
                figure
                scatter(block.const.*cos(block.theta),block.const.*sin(block.theta))
                xlim([-1.5 1.5])
                ylim([-1.5 1.5])
                xlabel('I')
                ylabel('Q')
                title('Constellation')
        end
end