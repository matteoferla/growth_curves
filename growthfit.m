function logidata = growthfit(data, interval)
%given a 96 vertically linearised 96-well plate returns a (96,4) sized
%matrix, where the first column is max od, second is slope, third is lag
%and fourth is R^2
%this function assumed the data is zeroed!
logidata=zeros(96,4);
spindex = reshape(1:96, 12, 8).';
t=(1:size(data,1))';

figure
hold on
for i=1:96
    subplot(8,12,spindex(i))
    try
    slp=data(:,i);
    options = fitoptions('growthcurve(x, odmax, tlambda, odmu)');
    options.Robust='Bisquare';
    options.MaxIter=800;
    % max set at within 20% error of endpoint. change slp(end) to max(slp) for max 
    options.StartPoint=[slp(end), 0, slp(end)/t(end)];
    options.Lower =[slp(end)*0.90, slp(end)/t(end), 0];
    options.Upper =[slp(end)*1.10, Inf, t(end)]; %say it cannot drop more than to 1/2.
    [fo,gof]=fit( t, slp, fittype('growthcurve(x, odmax,tlambda,odmu)'), options);
    plot(fo,t,slp);
    legend(gca,'off');
    axis off;
    logidata(i,1:3)=coeffvalues(fo);
    logidata(i,2)=logidata(2,i)/interval;
    logidata(i,3)=logidata(3,i)*interval;
    logidata(i,4)=gof.rsquare;
    xlabel('')
    ylabel('')
    catch
        display('FAILED!')
    end
end
end