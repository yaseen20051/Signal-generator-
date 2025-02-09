



message = input("Open Function Generator (yes or no) : ", 's');
while (strcmpi(message, 'yes'))
close all;
fs = InputSignal.getSampleFrequency(); 
[startPoint, endPoint, numOfBreakPoints] = InputSignal.getSignalInfo();
breakpoints = InputSignal.getBreakPoints(numOfBreakPoints,startPoint,endPoint);
startingPoints = [startPoint breakpoints]
endingPoints = [breakpoints endPoint]
genertor = GenerateSignal();
[y,t] = genertor.generateSignal(fs,numOfBreakPoints,startingPoints,endingPoints)
message = input("Do you want to perform an operation on the signal? (yes/no): ", 's');
if (strcmpi(message, 'yes'))
    proccessor =  SignalProcessor(startingPoints,endingPoints,fs,t,y);
    fprintf("Choose an operation to perform:\n");
    fprintf("1) Amplitude Scaling\n");
    fprintf("2) Time Reversal\n");
    fprintf("3) Time Shift\n");
    fprintf("4) Expanding the Signal\n");
    fprintf("5) Compressing the Signal\n");
    fprintf("6) None\n");
    message = sprintf('Please choose a signal operation  (1-6): '); 
    signalNumber = input(message);
    if(signalNumber == 1)
        message = sprintf('Amplitude: '); 
          amplitude = input(message);
        proccessor.amplitudeScaling(amplitude);
 
    elseif(signalNumber == 2)
      
        proccessor.timeReversal();
    elseif(signalNumber == 3)
        message = sprintf('Shift: '); 
          shift = input(message);
        proccessor.timeShift(shift);
    elseif(signalNumber == 4)
        
        expandValue = 5;
        while expandValue>1
         message = sprintf('expandValue (less than 1) :'); 
         expandValue = input(message);
        end
        proccessor.expandingSignal(expandValue);
    elseif(signalNumber == 5)
        compressValue = 0.5;
        while compressValue<1
         message = sprintf('compressValue (greater than 1) :'); 
         compressValue = input(message);
        end
        proccessor.expandingSignal(compressValue);
    else
        fprintf("None choice !!");
    end
end 

message = input("Open Function Generator (yes or no) : ", 's');
end
 
    