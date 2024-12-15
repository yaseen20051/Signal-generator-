classdef ExponentialSignal < Signal
    properties
      
        exponent;
        amplitude;
        t;
        y;
    end

    methods
        function expSignal = ExponentialSignal(startPoint,endPoint,exponent,amplitude,fs)
            if nargin>0
              
                expSignal.amplitude = amplitude;
                expSignal.exponent = exponent;
                expSignal.t = linspace(startPoint,endPoint,(endPoint-startPoint)*fs);
                expSignal.y = amplitude*exp(expSignal.t*exponent);
               
             
            end
        end
        
        function plot(self)
            figure
            plot(self.t,self.y);
  
        end
        function y = getY(self)
            y = self.y;
        end
        function t = getT(self)
            t = self.t;
        end

   


    end
end