classdef SinusoidalSignal < Signal
    properties
      
        phase;
        amplitude;
        frequency;
        t;
        y;
    end

    methods
        function sineSignal = SinusoidalSignal(startPoint,endPoint,phase,amplitude,frequency,fs)
            if nargin>0
              
                sineSignal.amplitude = amplitude;
                sineSignal.phase = phase;
                sineSignal.t = linspace(startPoint,endPoint,(endPoint-startPoint)*fs);
                sineSignal.y = amplitude*sin(2*pi*frequency*sineSignal.t+phase);
               
             
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