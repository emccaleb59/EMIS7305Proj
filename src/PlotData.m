%Plotting Script
i = 1;
BaseACRelPlot = [0 1];
RepairACRelPlot = [0 1];
RelPlotDays = [0 1];


AvailPlotDays = [0 1];
AvailPlot = [0 1];


figure(1),grid on, title('Monte Carlo Simulation Results')
xlabel('Days of Simulation'),ylabel('Available Aircraft')


nplots = Flags.Schedule + Flags.RelPlot + Flags.AvailPlot;
a(i) = figure(2), hold on, title('SiDOT Analysis Results');

if Flags.RelPlot
    subplot(nplots,1,i), hold on, grid on
    RlegStr = evalin('base','RlegStr;');
    if iter == 1
        plot(RelPlotDays,BaseACRelPlot,'--k')
        RlegStr{1} = 'Base Aircraft Reliability';
        if Flags.Rel
            plot([0 Inputs.lenDur],[Limits.Reliability Limits.Reliability],'-k','LineWidth',2.0)
            RlegStr{2} = 'Reliability Requirement';
        end
    end
    
%     plot(daysforplot,singleRel)
    plot([1 1 ],[0 1])
    xlabel('Flight Hours')
    ylabel('Single Aircraft Reliability')
    
    RlegStr{iter+1+Flags.Rel} = [Inputs.RelModel,' ',num2str(iter)];
    assignin('base','RlegStr',RlegStr);
    legend(RlegStr)
    i = i + 1;
end

if Flags.AvailPlot
    subplot(nplots,1,i), hold on, grid on
%     plot(daysforplot,singleRel)
    plot([0 1],[1 2])
    xlabel('Flight Hours')
    ylabel(['Aircraft Availability - ',Inputs.AvDesc])
    AlegStr = evalin('base','AlegStr;');
    AlegStr{iter} = [Inputs.RelModel,' ',num2str(iter)];
    assignin('base','AlegStr',RlegStr);
    legend(AlegStr)
end    