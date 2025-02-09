classdef (Abstract) Signal
    methods(Abstract)
        plot();
        y = getY();
        t = getT();
    end
end