classdef InputSignal
   
    methods (Static) % Declare the method as static


        %% get the sampling frquency of the function 

        function fs = getSampleFrequency()
            flag = 0; % Initialize the flag variable
            while flag == 0
                message = "Please enter sampling frequency: ";
                fs = input(message); % Prompt user for input
                if fs <= 50
                    fprintf("Sampling frequency cannot be less than 50 Hz!!\n");
                else
                    flag = 1; % Exit the loop
                end
            end
            fprintf("\n"); % Print a blank line
        end

        %%% get the signal Information 

        function [startPoint, endPoint, numOfBreakPoints] = getSignalInfo()
           flag = 0;
    
           while flag == 0
        
             startPoint = input("Signal's Starting Point: ");
             
        
             endPoint = input("Signal's Ending Point: ");
        
        
             numOfBreakPoints = input("Number of Break Points: ");
        
        
             if endPoint <= startPoint
                     fprintf("Error: Ending point cannot be less than or equal to the starting point!\n");
             elseif numOfBreakPoints < 0
                     fprintf("Error: Number of break points cannot be negative!\n");
             else
                    flag = 1; 
             end
            
           end
    
             fprintf("\n"); 
             startt = startPoint;
             endd  = endPoint;
        end
      
        %% get the breakPoint of the signal 

        function breakPoints = getBreakPoints(numberOfBreakPoints,startPoint,endPoint)

    
              breakPoints = zeros(1, numberOfBreakPoints);
              flag = 0;
              
    
              for i = 1:numberOfBreakPoints
                      while(flag == 0 )
                       message = sprintf("Break Point %d: ", i); 
                       breakPoints(i) = input(message);
                       flag = InputSignal.validateBreakPoint(breakPoints(i),startPoint,endPoint);
                       if(flag == 0)
                          message = "breakPoint of bounds\n";
                          fprintf(message)
                       end
                      end
                      flag = 0;
                 
              end
        end


        %% validate starting and ending points 

        function flag =  validateBreakPoint(breakPoint1,startPoint,endPoint)

            
            flag = 0;
            if breakPoint1 > startPoint
       
               if breakPoint1<endPoint
                    flag =1
                else
                    flag = 0;
                end
            end
        end




   
    
    
    
    
    end



end



