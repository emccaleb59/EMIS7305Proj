classdef Fleet < handle
    %FLEET Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        NumAfflictedAircraft
        NumAircraft
        AircraftArray
        StartHoursPerAircraft
        Day
        AircraftRfunction
        AircraftRepairTime
        
    end
    
    methods
        function obj=Fleet(fleetsize,afflictedaircraft,starthours,AircraftRfunction,AircraftRepairtime)
            %Aircraft repair time is in avg days to repair a standard non
            %discrepancy downed aircraft
            %need to add discrepancy funciton time to repair
            obj.NumAfflictedAircraft=afflictedaircraft;
            obj.NumAircraft=fleetsize;
            obj.Day=0;
            obj.StartHoursPerAircraft=starthours;
            obj.AircraftRfunction=AircraftRfunction;
            obj.AircraftRepairTime=AircraftRepairtime;
        end
        
        function initfleet(obj)
            %CREATES FLEET currently creates all aircraft without
            %discrepancy 
            %Need to add discrepancy handling.
            %currently only handles one discrepancy type but could be
            n=1;
            while n<=obj.NumAircraft
                obj.AircraftArray{n}=Aircraft(obj.StartHoursPerAircraft,0);
                obj.AircraftArray{n}.AssignAircraftavail(obj.AircraftRfunction,obj.AircraftRepairTime)
                n=n+1;
            end
        end
        
        function out = getavailaircraft(obj)
           n=1;
           out=0;
           while n<= obj.NumAircraft
               isavail=obj.AircraftArray{n}.AircraftAvail;
               out= out + isavail;
               n=n+1;
           end
        end
        
        function ageaircraft(obj,flighthours)
           n=1;
           while n<= obj.NumAircraft 
               obj.AircraftArray{n}.ageaircraft(flighthours);
               n=n+1;
           end
        end
    end
    
end

