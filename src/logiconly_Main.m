%%logic only no gui elements

%input variables that would come from gui
%function types 1=exponential 2=normal 3=lognormal
%4=wiebull 5=constant zero
addpath ./data/
addpath ./Classes/
%number of montecarlo runs
NUMBERRUN=Inputs.MCSamples;

%Number of aircraft in local fleet
FLEETAIRCRAFT = Inputs.numAAC + Inputs.numUAC;

%afflicted aircraft with specific damage
AFFLICTEDAIRCRAFT= Inputs.numUAC;

%baseline aircraft reliability--------------------------------------
BASELINEFUNCTIONTYPE=1;
THETAAC=3500;
BASELINEFUNCTION=Rfunction(BASELINEFUNCTIONTYPE,0,0,0,THETAAC);
%average number of hours on each aircraft in the fleet.
AVERAGEFLEETHOURS=100;
%if aircraft is down due to it's own reliability curve 
%number of days aircraft will be down for average maintenance
BASELINEAIRCRAFTMAINT=2;

FLEETFLIGHTHOURSPERDAY=Inputs.avgDur;
%--------------------------------------------------------------------

%Prerepair -----------------------------------------------------------
%reliability curve before application of repair on afflicted aircraft
%zero means aircraft is grounded by discrepancy
PREREPAIRFUNCTIONTYPE=5;
REPAIRTIMEBASE=Materials.RepDur;



PREREPAIRFUNCTION=Rfunction(PREREPAIRFUNCTIONTYPE,0,0,0,0);


%Repair Function--------------------------
%what the repair's reliability curve looks like
POSTREPAIRFUNCTIONTYPE=Reliability.ModelNum;
POSTRFMU=Reliability.mu;
POSTRFSIGMA=Reliability.std;
POSTRFBETA=Reliability.beta;
POSTRFTHETA=Reliability.theta;
POSTREPAIRFUNCTION=Rfunction(POSTREPAIRFUNCTIONTYPE,POSTRFMU,POSTRFSIGMA,POSTRFBETA,POSTRFTHETA);

%----------------------------------------------------------------------
%RepairMaterials

REPAIRMATERIALARRAY=Materials.ForLookup;
sizeofrepairarray=size(REPAIRMATERIALARRAY);
NUMMATERIALS=sizeofrepairarray(1);

%------------------

%--------------Graph inputs--------------------
MINAVAILABILITY=Inputs.numACReq;

NUMBEROFDAYSOFCONCERN=Inputs.lenDur;

PERCENTILERESULT=Inputs.AvStandard*100;

simnumber=1;
aircraftavailforplot=[];
daysforplot=1:NUMBEROFDAYSOFCONCERN;

materials=MaterialDatabase('data/materialsdata.csv');
materials.LoadMaterials;

rep1=1;
afflictedrepairtimearray=[];

while rep1 <= AFFLICTEDAIRCRAFT
    matindex=1;
    highestleadtime=0;
    afflictedrepairtimearray(rep1)=REPAIRTIMEBASE;
    while matindex <=NUMMATERIALS
        qty=REPAIRMATERIALARRAY(matindex,2);
        pn=REPAIRMATERIALARRAY(matindex,1);
        leadtime=materials.UseMaterials(pn,qty{1});
        if leadtime >= highestleadtime
            highestleadtime=leadtime;
            afflictedrepairtimearray(rep1)=REPAIRTIMEBASE+highestleadtime;
        end
        matindex = matindex +1;
    end
    rep1 = rep1 + 1;
end

while simnumber <= NUMBERRUN
    
%all of this should be incased in a while loop for the monte carlo runs
% the days for plot generation should be pulled out and automatically
% generated Jesse how to auotmatically gennerate an array 1... Num days
% without a loop also how to preallocate variable size.
    userfleet=Fleet(FLEETAIRCRAFT,AFFLICTEDAIRCRAFT,AVERAGEFLEETHOURS,BASELINEFUNCTION,BASELINEAIRCRAFTMAINT);
    userfleet.initfleet;

    n=1;

    while n<=AFFLICTEDAIRCRAFT
    %This section could in the future apply diffreing discrepancies to
    %differing aircraft. Right now only one discrepancy type is considered.
    
    
   %check materials availability and apply leadtimes to REPAIRTIMEBASE in
   %the near future 
        userfleet.SetDiscrepancyAndrepair(n,PREREPAIRFUNCTION,POSTREPAIRFUNCTION,afflictedrepairtimearray(n));
        n=n+1;
    end

    DAY=1;

    while DAY<=NUMBEROFDAYSOFCONCERN
    
        aircraftavail=userfleet.getavailaircraft;
        aircraftavailforplot(DAY,simnumber)=aircraftavail;
    
        userfleet.AgeFleet(FLEETFLIGHTHOURSPERDAY);    
    
    
        DAY=DAY+1;
    end
    simnumber = simnumber +1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%RELIABILITY CALCULATION%%%%%%%%%%%%%%%%%%%%% 
day =1; 
aircraftreliability=[]; 
discrepantreliability=[]; 
combinedreliability=[]; 
while day <=NUMBEROFDAYSOFCONCERN 
    hours = AVERAGEFLEETHOURS + day*FLEETFLIGHTHOURSPERDAY; 
    repairhours= day*FLEETFLIGHTHOURSPERDAY; 
    aircraftreliability(day)=BASELINEFUNCTION.Rvalue(hours); 
    discrepantreliability(day)=BASELINEFUNCTION.Rvalue(repairhours); 
    combinedreliability(day)=aircraftreliability(day)*discrepantreliability(day); 
    day = day + 1; 
end 

%after montecarlo array is generated average the columns or otherwise find
%nth percentile for each day then plot results

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%PLOT ITEMS FOR JESSE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aircraftavailsorted=sort(aircraftavailforplot,2);

sumarray=sum(aircraftavailsorted,2);
avgaircraftavail=sumarray/NUMBERRUN;


% fig1=figure(2)
% plot(MINAVAILABILITY,daysforplot)
% plot(daysforplot,aircraftavailforplot)
