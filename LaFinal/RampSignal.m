classdef RampSignal < Signal
    properties
      
        slope;
        intersect;
        t;
        y;
    end

    methods
        function rampSignal = RampSignal(startPoint,endPoint,slope,intersect,fs)
            if nargin>0
              
                rampSignal.slope = slope;
                rampSignal.intersect = intersect;
                rampSignal.t = linspace(startPoint,endPoint,(endPoint-startPoint)*fs);
                rampSignal.y = (slope* rampSignal.t) + intersect;
               
             
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
