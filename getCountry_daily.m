function [timeVector, data] = getCountry_daily(country, type)

% type = 'confirmed','deaths','recovered'
DATA = load(type);
dataMatrix = DATA.dataMatrix;

[dataTable,timeVector,mergedData] = processCoronaData(dataMatrix);

rowNums = contains(mergedData(:,1),country);
data = cell2mat(mergedData(rowNums,2));
data = diff(data,1,2);
timeVector = timeVector(2:end);

end