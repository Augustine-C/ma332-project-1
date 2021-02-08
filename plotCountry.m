function plotCountry(country,type,method,isAll)
if isAll
    [data,dates] = getCountry_all(country,type);
    s = ' over all';
else 
    [data,dates] = getCountry_daily(country,type);
    s = ' daily changes';
end
dates_val = getDatesVal(dates);
f=fit(dates_val,data,method);
plot(dates,f(dates_val),dates,data);
ylabel("cases");
xlabel("days");
title(strcat(country, '-' , type, " cases ", s, ' with'," ", method, ' fitting'));
end