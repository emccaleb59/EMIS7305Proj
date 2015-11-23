%%logic only no gui elements

%input variables that would come from gui
%function types 1=exponential 2=normal 3=lognormal
%4=wiebull 5=constant zero

%number of montecarlo runs
NUMBERRUN=100;

%Number of aircraft in local fleet
FLEETAIRCRAFT = 30;

%afflicted aircraft with specific damage
AFFLICTEDAIRCRAFT= 0;

%baseline aircraft reliability--------------------------------------
BASELINEFUNCTIONTYPE=1;
THETAAC=2500;
BASELINEFUNCTION=Rfunction(BASELINEFUNCTIONTYPE,0,0,0,THETAAC);
%average number of hours on each aircraft in the fleet.
AVERAGEFLEETHOURS=100;
%if aircraft is down due to it's own reliability curve 
%number of days aircraft will be down for average maintenance
BASELINEAIRCRAFTMAINT=2;

FLEETFLIGHTHOURSPERDAY=1.5;
%--------------------------------------------------------------------

%Prerepair -----------------------------------------------------------
%reliability curve before application of repair on afflicted aircraft
%zero means aircraft is grounded by discrepancy
PREREPAIRFUNCTIONTYPE=5;


%Repair Function--------------------------
%what the repair's reliability curve looks like
POSTREPAIRFUNCTION=2;

%------------------

%--------------Graph inputs--------------------
MINAVAILABILITY=15;

NUMBEROFDAYSOFCONCERN=60;

PERCENTILERESULT=90;


%all of this should be incased in a while loop for the monte carlo runs
% the days for plot generation should be pulled out and automatically
% generated Jessey how to auotmatically gennerate an array 1... Num days
% without a loop
userfleet=Fleet(FLEETAIRCRAFT,AFFLICTEDAIRCRAFT,AVERAGEFLEETHOURS,BASELINEFUNCTION,BASELINEAIRCRAFTMAINT);
userfleet.initfleet;
DAY=1;
daysforplot=[];
aircraftavailforplot=[];

while DAY<=NUMBEROFDAYSOFCONCERN
    daysforplot{DAY}=DAY;
    
    aircraftavail=userfleet.getavailaircraft;
    aircraftavailforplot{DAY}=aircraftavail;
    
    userfleet.ageaircraft(FLEETFLIGHTHOURSPERDAY)    
    
    
    DAY=DAY+1;
end


%after montecarlo array is generated average the columns or otherwise find
%nth percentile for each day then plot results

fig1=figure
plot(MINAVAILABILITY,daysforplot)
plot(daysforplot,aircraftavailforplot)
