classdef Rfunciton < handle
    %RFUNCITON Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        FunctionType
        Mu
        Sigma
        Beta
        Theta
        
    end
    
    methods
        function obj = Rfunction(type,Mu,Sigma,Beta,Theta)
        %1 for exponental, 2 for normal, 3 for lognormal, 4 for weibull
        % 5 for constant zero availability
        % pass zero for any values not needed for that model
            obj.Mu=Mu;
            obj.Sigma=Sigma;
            obj.Beta=Beta;
            obj.Theta=Theta;
            switch type
                case 1
                    obj.FunctionType = 'Exponential'; 
                    if Theta<=0
                        error('Theta must be a positive number')
                    end       
                case 2
                    obj.FunctionType = 'Normal';
                    if Sigma <=0
                        error('Sigma must be a positive number')
                    end
                case 3
                    obj.FunctionType = 'LogNormal';
                    if Sigma <=0
                        error('Sigma must be a positive number') 
                    end
                case 4
                    obj.FunctionType = 'Weibull';
                    if Theta <= 0
                        error('Theta must be a positive number')
                    end  
                    if Beta <= 0
                        error('Beta must be a positive number')
                    end
                case 5
                    obj.FunctionType = 'Zero'
                otherwise
                    error('Value passed to Rfunction out of scope')
            end
        end
        
        function 
    end
    
end

