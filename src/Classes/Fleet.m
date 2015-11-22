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
            n=1;
            while n<=obj.NumAircraft
                obj.AircraftArray{n}=Aircraft(obj.StartHoursPerAircraft,0);
                obj.AircraftArray{n}.AssignAircraftAvail(obj.AircraftRfunction,obj.AircraftRepairTime)
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
               ojb.AircraftArray{n}.ageaircraft(flighthours);
           end
        end
    end
    
end
