classdef Discrepancy < handle
    %PROBLEM Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Name
        Description
        Location
        NumberDamaged
        AvailabilityRequirement
        TotalAircraft
        ServiceDuration
        AircraftDailyFlightHours
        Rfunctionbeforerepair
        %Rfunction is per element for rout of n series etc
        CostRequirement
        ScheduleRequirement
        ReliabilityRequirement
        SeriesTF
        SeriesElements
        RoutofNTF
        RoutofN_R
        RoutofN_N
        ActiveParrallelTF
        ActiveParrallelNumber        
    end
    
    methods
        function object
    end
    
end

