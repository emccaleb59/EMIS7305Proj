classdef Aircraft < handle
    %AIRCRAFT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        %bool aircraft is a repair needed or performed aircraft
        IsAfflicted
        
        %if repair has been performed
        IsRepaired
        
        %hours on repair
        HoursSinceRepair
        HoursonDiscrepancy
        
        
        %aircraft currently flight ready
        IsUp
        
        %if aircraft is down is it down due to aircraft reliability,
        %prerepair reliability or post repair reliability.
        ReasonDown
        
        %if aircraft goes down time to complete repair.
        DaysTillRepairComplete
        
        %aircraftHours
        AirframeHours
        
        AircraftAvailfunc
        AircraftRepairtime
        
        PreRepairfunc        
        PostRepairfunc
        
        AfflictedRepairTime
    end
    
    methods
        function obj = Aircraft(hours,afflicted)
            %hours on airframe, if aircraft needs repair afflicted =1, 0
            %otherwise
            if hours<0
                error('airframe hours must be nonnegative')
            end
            obj.AirframeHours=hours;
            switch afflicted
                case 0
                case 1
                otherwise
                    error('afflicted must be either 1 or 0')
            end
            obj.IsUp=1;
                 
            obj.IsAfflicted=afflicted;
            if afflicted ==1
                obj.IsRepaired=0;
                obj.HoursonDiscrepancy=0;
            end
        end
        
        function AssignAircraftavail(obj,func,repairtime)
            obj.AircraftAvailfunc=func;
            obj.AircraftRepairtime=repairtime;
            
        end
        
        function AssignAfflictedFunc(obj,prefunc,postfunc,repairtime)
            obj.PreRepairfunc=prefunc;        
            obj.PostRepairfunc=postfunc;
            obj.AfflictedRepairTime=repairtime;
        end
        
        function ageaircraft(obj,hours)
            if obj.IsUp == 1
                obj.AirframeHours = obj.AirframeHours + hours;
                if obj.IsRepaired ==1
                    obj.HoursSinceRepair = obj.HoursSinceRepair + hours;
                end
            else
                %if aircraft is down advance day and put aircraft back up
                %when days to repair reaches 0
                if obj.IsAfflicted == 1
                    if strcmp(obj.ReasonDown,'postdiscrep')
                        %do nothing aircraft is down from now on.
                    else 
                        %age aircraft repair
                        obj.DaysTillRepairComplete=obj.DaysTillRepairComplete -1;
                        if obj.DaysTillRepairComplete == 0;
                            obj.IsUp = 1;
                            obj.IsRepaired =1;
                            obj.HoursSinceRepair=0;
                        end
                    end
                else
                    %aircraft reliability repair reason
                    obj.DaysTillRepairComplete=obj.DaysTillRepairComplete -1;
                    if obj.DaysTillRepairComplete ==0
                        obj.IsUp = 1;
                    end
                end
            end
        end
        
        function out = AircraftAvail(obj)
            %outputs 1 if aircraft is available 0 if it is not
            %currently assumes aircraft is not afflicted
            
            if obj.IsUp==1
                %aircraft is up at start of day
                if obj.IsAfflicted==0
                    %if aircraft is default reliability curve
                    reliability=obj.AircraftAvailfunc.Rvalue(obj.AirframeHours);
                    randnum=rand;
                    if randnum>reliability
                        %means that baseline aircraft failed Take aircraft
                        % down set reason and set dayst to repair
                        
                        obj.IsUp=0;
                        out=0;
                        obj.ReasonDown='aircraft';
                        obj.DaysTillRepairComplete=obj.AircraftRepairtime;
                    else
                        %airplane is up continue as usual
                        out=1;
                    end
                else
                    %Aircraft is afflicted by discrepancy logic
                    if obj.IsRepaired == 0
                        %Aircraft has not been repaired use prerepair
                        %reliability
                        reliabilityac=obj.AircraftAvailfunc.Rvalue(obj.AirframeHours);
                        reliabilitydisc=obj.PreRepairfunc.Rvalue(obj.HoursonDiscrepancy);
                        randnumac=rand;
                        randnumdisc=rand;
                        if randnumdisc > reliabilitydisc
                            %aircraft out due to discrepancy 
                            %need to further discuss our methodology here
                            %i'm thinking we possibly make the assumption
                            %that if we have a nonzero prerepair
                            %reliability curve we fly till we have a
                            %failure?
                            obj.IsUp=0;
                            out=0;
                            obj.ReasonDown='prediscrep';
                            obj.DaysTillRepairComplete=obj.AfflictedRepairTime; 
                        elseif randnumac>reliabilityac
                            obj.IsUp=0;
                            out=0;
                            obj.ReasonDown='aircraft';
                            obj.DaysTillRepairComplete=obj.AircraftRepairtime;
                        else
                            %aircraft is good continue as usual
                            out=1;
                        end
                    else
                        %aircraft has been repaired use post repair
                        %availability
                        reliabilityac=obj.AircraftAvailfunc.Rvalue(obj.AirframeHours);
                        reliabilitypostdisc=obj.PostRepairfunc.Rvalue(obj.HoursSinceRepair);
                        randnumac=rand;
                        randnumpostdisc=rand;
                        if randnumpostdisc > reliabilitypostdisc
                            %aircraft out due to discrepancy repair failing
                            %need to further discuss our methodology here
                            %i'm thinking we may have to say we just have
                            %to apply the same repair again
                            obj.IsUp=0;
                            out=0;
                            obj.ReasonDown='postdiscrep';
                            obj.DaysTillRepairComplete=obj.AfflictedRepairTime; 
                        elseif randnumac>reliabilityac
                            obj.IsUp=0;
                            out=0;
                            obj.ReasonDown='aircraft';
                            obj.DaysTillRepairComplete=obj.AircraftRepairtime;
                        else
                            %aircraft is good continue as usual
                            out=1;
                        end
                    end
                    
                end
            else
                %aircraft is down at start of day
                out=0;
            end
         
        end
            
            
    end
    
end

