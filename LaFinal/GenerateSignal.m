classdef GenerateSignal

    properties
        startingPoints=[];
        endingPoints=[];
        y=[];
        t=[];
    end
    methods 
       
        function [fn,t_mod] = generateSignal(self,fs,numOfBreakPoints,startingPoints,endingPoints)
                            y=[];
                            t=[];
                            self.startingPoints = startingPoints;
                            self.endingPoints = endingPoints;
                          
                            for i = 1 : numOfBreakPoints+1
                                
                                fprintf("1) DC Signal \n2) Ramp Signal \n3) Polynomial Signal \n4) Exponential Signal \n5) Sinusoidal Signal\n");
                                
                                
                                message = sprintf('Please choose a signal type (1-5): '); 
                                signalNumber = input(message); 
                                    if(signalNumber == 1)
                                        message = "Amplitude: ";
                                        amplitude = input(message);
                                        dc = DcSignal(amplitude, fs, startingPoints(i), endingPoints(i));
                                        y1 = dc.getY();
                                        t1 = dc.getT();
                                        y = cat(2, y, y1);
                                        t = cat(2, t, t1);
                                        self.y = cat(2, self.y, y1);
                                        self.t = cat(2, self.t, t1);
                            
                                elseif(signalNumber == 2) % Ramp Signal
                                        message = "Slope: ";
                                        slope = input(message);
                                        message = "Intercept: ";
                                        intercept = input(message);
                                        ramp = RampSignal(startingPoints(i), endingPoints(i), slope, intercept, fs);
                                        y1 = ramp.getY(); % Updated to call ramp, not dc
                                        t1 = ramp.getT();
                                        y = cat(2, y, y1);
                                        t = cat(2, t, t1);
                                        self.y = cat(2, self.y, y1);
                                        self.t = cat(2, self.t, t1);
                            
                                  elseif(signalNumber == 3) % Polynomial Signal
                                        message = "Power: ";
                                        power = input(message);
                                        coefficients = ones(1, power);
                                       for j = 1:power % Avoid overwriting the outer loop variable
                                           coefficients(j) = input(sprintf("Coefficient of t^%d: ", j - 1));
                                       end
                                        message = "Intercept: ";
                                        intercept = input(message);
                                        poly = PolynomialSignal(startingPoints(i), endingPoints(i), coefficients, power, intercept, fs);
                                        y1 = poly.getY(); % Updated to call poly, not dc
                                        t1 = poly.getT();
                                        y = cat(2, y, y1);
                                        t = cat(2, t, t1);
                                        self.y = cat(2, self.y, y1);
                                        self.t = cat(2, self.t, t1);
                                    elseif(signalNumber == 4)
                                        message = "Amplitude: ";
                                        amplitude = input(message);
                                     
                                        message = "Exponent: ";
                                        exponent = input(message);
                                        exp = ExponentialSignal(startingPoints(i),endingPoints(i),exponent,amplitude,fs);
                                        y1 = exp.getY(); % Updated to call poly, not dc
                                        t1 = exp.getT();
                                        y = cat(2, y, y1);
                                        t = cat(2, t, t1);
                                        self.y = cat(2, self.y, y1);
                                        self.t = cat(2, self.t, t1);
                                    elseif(signalNumber == 5)
                                         message = "Amplitude: ";
                                        amplitude = input(message);
                                     
                                        message = "Phase: ";
                                        phase = input(message);
                                        message = "Frequency: ";
                                        frequency = input(message);
                                        sin = SinusoidalSignal(startingPoints(i),endingPoints(i),phase,amplitude,frequency,fs);
                                        y1 = sin.getY(); % Updated to call poly, not dc
                                        t1 = sin.getT();
                                        y = cat(2, y, y1);
                                        t = cat(2, t, t1);
                                        self.y = cat(2, self.y, y1);
                                        self.t = cat(2, self.t, t1);

                                else
                                        fprintf("Invalid signal type. Please enter a number between 1 and 5.\n");
                                end
                                
                            
                            end
                            
                            
                               fn = self.y;
                               t_mod = self.t;
                            
                            
                          %%  figure
                          %%  plot(t,y);
                           %% ylim([-5,5]);
                           %% xlim([-5,5]);
                          %%  grid on 
                          figure;
                          subplot(1,2,1)
                          plot(self.t, self.y, 'b', 'LineWidth', 1.5);
                          hold on;
                          xlabel('Time (s)');
                          ylabel('Amplitude');
                          title('Original Signal');
                          grid on;
                            
        end
        function y2 = getY(self)
            y2 = self.y;
            
        end
        function t2 = getT(self)
      
            t2 = self.t;
        end
        

    
    end
end