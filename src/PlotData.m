%Plotting Script
pc = {'-r','-b','-g','--r','--b','--g','-.r','-.b','-.g'};

i = 1;


RelPlotDays = 0:1:Inputs.lenDur;
AvailPlotDays = RelPlotDays;

BaseACRelPlot = [1.0 aircraftreliability];
RepairACRelPlot = [1.0 discrepantreliability];

if Inputs.AvStandard > 0
    indexAvail = floor((1-Inputs.AvStandard) * Inputs.MCSamples);
    AvailPlot(1) = Inputs.numAAC;
    for j = 1:Inputs.lenDur
        AvailPlot(j+1) = aircraftavailsorted(j,indexAvail);
    end
else
    AvailPlot = [Inputs.numAAC; avgaircraftavail];
end


%% STart Plot 1
A{1} = figure(1),grid on, hold on, title('Monte Carlo Simulation Results')
xlabel('Days of Simulation'),ylabel('Available Aircraft')
plot([0 Inputs.lenDur],[Inputs.numACReq Inputs.numACReq],'-k','LineWidth',2.0)
plot(daysforplot,aircraftavailforplot)
plot([0 Inputs.lenDur],[Inputs.numACReq Inputs.numACReq],'-k','LineWidth',2.0)
legend('Minimum Availability Required','Monte Carlo Availibility','Location','NorthEast')
xlim([0 Inputs.lenDur]),ylim([0 max(max(aircraftavailforplot))+2])
hold off

nplots = Flags.RelPlot + Flags.AvailPlot;
A{2} = figure(2), hold on, title('SiDOT Analysis Results');
%% Start Plot 2
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
    
    plot(RelPlotDays,RepairACRelPlot,cell2mat(pc(iter)))
    xlim([0 Inputs.lenDur]),ylim([0 1])
    xlabel('Mission Days')
    ylabel('Single Aircraft Reliability')
    
    RlegStr{iter+1+Flags.Rel} = [num2str(iter),'-',Inputs.RelModel];
    assignin('base','RlegStr',RlegStr);
    legend(RlegStr,'Location','SouthEast')
    i = i + 1;
end

if Flags.AvailPlot
    subplot(nplots,1,i), hold on, grid on
%     plot(daysforplot,singleRel)

    xlabel('Mission Days')
    ylabel(['Aircraft Availability'])
    AlegStr = evalin('base','AlegStr;');
    if iter == 1
        plot([0 Inputs.lenDur],[Inputs.numACReq Inputs.numACReq],'-k','LineWidth',2.0)
        AlegStr{1} = 'Minimum Availability Req';
        if Flags.Schedule
            plot([Limits.Schedule Limits.Schedule],[0 100000],'--k','LineWidth',2.0)
            AlegStr{2} = 'Schedule Requirement';
        end
    end
    AlegStr{iter+Flags.Schedule+1} = [num2str(iter),'-',Inputs.RelModel,' ',Inputs.AvDesc];
    assignin('base','AlegStr',AlegStr);
    plot(AvailPlotDays,AvailPlot,cell2mat(pc(iter)))
    xlim([0 Inputs.lenDur]),ylim([0 max(max(aircraftavailforplot))+2])
    legend(AlegStr,'Location','SouthEast')
end    

assignin('base','plots',A);