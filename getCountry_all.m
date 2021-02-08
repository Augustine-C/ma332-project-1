function [data, timeVector] = getCountry_all(country,type)
% type = 'confirmed','deaths','recovered'
DATA = load(type);
dataMatrix = DATA.dataMatrix;

[dataTable,timeVector,mergedData] = processCoronaData(dataMatrix);

rowNums = contains(mergedData(:,1),country);
data = cell2mat(mergedData(rowNums,2));

start = find(data > 0, 1, 'first');

data = data(start:end);
timeVector = timeVector(start:end);
data = data';
timeVector = timeVector';
end