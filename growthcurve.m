function y = growthcurve(x, odmax, odlamb, odmu)
% remember that odzero must be zero.
% y is od
% x is time vector
%logistic...
y = (1+exp(4*odmu/odmax*(odlamb-x)+2)).\odmax;
%y = (1+exp(4*odmu/odmax*(odlamb-x)+2)).\(odmax*exp(-deathlamb*(x)));
%gompetz
%y = odmax*exp(-exp(exp(1)*odmu/odmax*(odlamb-x)+1));
% fit( time, ods, fittype('growthcurve(T, odzero, odmax,tlamb,odmu)'), 'StartPoint', [0, 2, 1, 0.01] )
end

%Comparison...
%slp=rawodslope(20:end,i);
%slp=rawodslope(:,i)-rawodslope(1,i);
%slp(slp<0)=0;
%t=time(:);
%options = fitoptions('growthcurve(x, odmax,tlambda,odmu)');
%options.Robust='Bisquare';
%options.StartPoint=[max(slp), 0, max(slp)/time(end)];
%options.MaxIter=800;
%%options.algorithm='Levenberg-Marquardt';
%options.Lower =[max(slp)*0.80, -Inf, 0];
%options.Upper =[max(slp)*1.20, Inf, Inf];
%[fo,gof]=fit( t, slp, fittype('growthcurve(x, odmax,tlambda,odmu)'), options);
%plot(fo,t,slp);
%hold on;
%[f2,p]=fit_logistic(t, slp);
%plot(t,f2)
%hold off;