classdef SignalProcessor 
    properties
        t;
        y;
        fs;
        startingPoints = [];
        endingPoints = []
    end

    methods

        function signalProcessor = SignalProcessor(startingPoints,endingPoints,fs,t,y)
            if nargin>0
              
                signalProcessor.startingPoints = startingPoints;
                signalProcessor.endingPoints = endingPoints;
                signalProcessor.fs  = fs;
                signalProcessor.t = t;
                signalProcessor.y = y;

    
            end
        end
        function amplitudeScaling(self,shiftingValue)
            self.y = self.y * shiftingValue;
            self.plotSignal();
        end
        function  timeReversal(self)
            self.t = -fliplr(self.t);
            self.y = fliplr(self.y);
            self.plotSignal();
        end
        function timeShift(self,shiftingValue)
            self.t = self.t + shiftingValue;
            self.plotSignal();
        end
        function expandingSignal(self,expandValue)
            self.t  = self.t * expandValue;
            self.plotSignal();
        end
        function compressingSignal(self,compressValue)
            self.t  = self.t * compressValue;
            self.plotSignal();
        end
       

        function plotSignal(self)
                     %%     figure;
                     subplot(1,2,2);
                          plot(self.t, self.y, 'r', 'LineWidth', 1.5);
                          xlabel('Time (s)');
                          ylabel('Amplitude');
                          title('Modified Signal');
                          grid on;
                          legend('Original Signal', 'Modified Signal'); % Add a legend
                          drawnow;
         end
    end



    


end