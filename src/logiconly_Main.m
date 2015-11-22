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
THETAAC=2000;
BASELINEFUNCTION=Rfunction(BASELINEFUNCTIONTYPE,0,0,0,THETAAC);
%average number of hours on each aircraft in the fleet.
AVERAGEFLEETHOURS=100;
%if aircraft is down due to it's own reliability curve 
%number of days aircraft will be down for average maintenance
BASELINEAIRCRAFTMAINT=2;

FLEETFLIGHTHOURSPERDAY=3;
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

PERCENTILERESULTBETTER=90;



userfleet=Fleet(FLEETAIRCRAFT,AFFLICTEDAIRCRAFT,AVERAGEFLEETHOURS,BASELINEFUNCTION,BASELINEAIRCRAFTMAINT);
userfleet.initfleet;
DAY=1;
daysforplot=[];
aircraftavailforplot=[];

while DAY<=NUMBEROFDAYSOFCONCERN
    daysforplot{DAY}=DAY;
    
    aircraftavail=userfleet.getavailabileaircraft;
    aircraftavailforplot{DAY}=aircraftavail;
    
    userfleet.ageaircraft(FLEETFLIGHTHOURSPERDAY)    
    
    
    DAY=DAY+1;
end


fig1=figure
plot(daysforplot,aircraftavailforplot)
