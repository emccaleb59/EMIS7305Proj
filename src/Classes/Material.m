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
            obj.PartNumber = partnumber;
            obj.Description = description;
            obj.QtyAtDepot = qty;
            obj.LeadTime = leadtime;
            obj.Cost = cost;
        end
 
        
    end
end