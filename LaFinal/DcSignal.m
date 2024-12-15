classdef DcSignal < Signal
    properties
        amplitude;
        fs;
        startt;
        endd;
        t;
        y;
    end

    methods
        function dcsignal = DcSignal(amplitude,fs,startt,endd)
            if nargin>0
                dcsignal.amplitude = amplitude;
                dcsignal.fs = fs;
                dcsignal.startt = startt;
                dcsignal.endd = endd;
                dcsignal.t = linspace(startt,endd,(endd-startt)*fs);
                dcsignal.y =amplitude *  ones(size(dcsignal.t));
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