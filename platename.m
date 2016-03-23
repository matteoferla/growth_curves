function y=platename(x)
%two way function:
% If x is str ('A2') it will return the linear index
% value (9).
% If x is a number it will return a str. 

alphabet = {'A','B','C','D','E','F','G','H'};
if isnumeric(x) % asked for a number
    x=mod(x-1,96)+1;
    y=strcat(alphabet{mod(x-1,8)+1},num2str(floor((x-1)/8)+1));
elseif ischar(x)
    y =(str2num(x(2:end))*8-7)+find(strcmp(alphabet,x(1)))-1;
else
    error('Unknown input')
end
end