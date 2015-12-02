%Plotting Script
i = 1;

nplots = Flags.Schedule + Flags.RelPlot + Flags.AvailPlot;
a(i) = figure(1), hold on, title('SiDOT Analysis Results');

if Flags.RelPlot
    subplot(nplots,1,i), hold on, grid on
%     plot(daysforplot,singleRel)
    plot([1 1 ],[0 1])
    xlabel('Flight Hours')
    ylabel('Single Aircraft Reliability')
    RlegStr = evalin('base','RlegStr;');
    RlegStr{iter} = [Inputs.RelModel,' ',num2str(iter)];
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