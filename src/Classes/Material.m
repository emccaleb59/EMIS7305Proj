classdef Material < handle
    properties
        PartNumber
        Description
        QtyAtDepot
        LeadTime
        Cost
    end
        
    methods
        %class constructor%
        function obj = Material(partnumber,description,qty,leadtime,cost)
            obj.PartNumber = partnumber{1};
            obj.Description = description{1};
            obj.QtyAtDepot = qty;
            obj.LeadTime = leadtime;
            obj.Cost = cost;
        end
 
        function out= GetPartNumber(obj)
            out= obj.PartNumber;
        end
        
        function out = UseParts(obj,qty)
           %outputs 0 if sufficient parts are available 
           %outputs leadtime otherwise
           if obj.QtyAtDepot>= qty
              out =0;
              obj.QtyAtDepot = obj.QtyAtDepot - qty;
           else
               out = obj.LeadTime;
               obj.QtyAtDepot = 0;
           end
        end
    end
end