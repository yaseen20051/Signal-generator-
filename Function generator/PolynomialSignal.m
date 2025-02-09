classdef PolynomialSignal < Signal
    properties
      
        coefficients;
        power;
        intercept;
        t;
        y = 0;
    end

    methods
        function polynomialSignal = PolynomialSignal(startPoint,endPoint,coefficients,power,intercept,fs)
            if nargin>0
              
                polynomialSignal.coefficients = coefficients;
                polynomialSignal.intercept = intercept;
                polynomialSignal.t = linspace(startPoint,endPoint,(endPoint-startPoint)*fs);
                polynomialSignal.power = power;
                for i = 1:power
                    polynomialSignal.y = coefficients(i)*(polynomialSignal.t .^(power-i+1) ) + polynomialSignal.y;
                end

               


             
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