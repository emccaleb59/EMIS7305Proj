classdef Rfunction < handle
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
                    obj.FunctionType = 'Zero';
                otherwise
                    error('Value passed to Rfunction out of scope')
            end
        end
        
        function out = Rvalue(obj,hours)
            %outputs reliability percent based on hours flows
           switch obj.FunctionType 
               case 'Exponential'
                   out=exp(-(hours/obj.Theta));
               case 'Normal'
                   out = 1 - normcdf(hours,obj.Mu,obj.Sigma);
               case 'LogNormal'
                   out=1 - logncdf(x,obj.Mu,obj.Sigma);
               case 'Weibull'
                   out=exp(-((hours/obj.Theta)^obj.Beta));
               case 'Zero'
                   out = 0.0;
               otherwise
                   error('no rfunction')
                   
           end
        end
    end
    
end

