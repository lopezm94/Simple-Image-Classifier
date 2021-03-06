% Sample metadata into training and test sets
function [trainingSet,trainingLabels,testSet,testLabels] = sampleData(databank)

trainingRatio = 0.8;
trainingLabels =  {};
testLabels = {};

trainingSet =  struct('imfile',{},'annfile',{});
testSet = struct('imfile',{},'annfile',{});
for class_set=databank
  label = class_set.label;
  files = class_set.files;
  n = length(files);
  border = floor(trainingRatio*n);
  testLabels = concatStructArrays(testLabels, repeatstr(label, n-border));
  trainingLabels = concatStructArrays(trainingLabels, ...
      repeatstr(label, border));
  testSet = [testSet files(border+1:end)];
  trainingSet = [trainingSet files(1:border)];
end

testLabels = testLabels;
trainingLabels = trainingLabels;
testSet = loadData(testSet);
trainingSet = loadData(trainingSet);
