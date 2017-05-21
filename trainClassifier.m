% Import svm library
importDependencies();

% Define class labels
class_labels = { 'airplanes'; 'barrel'; 'bonsai'; 'brontosaurus'; 'camera';
  'ceiling_fan'; 'anchor'; 'binocular'; 'brain'; 'butterfly';
  'car_side'; 'cellphone'};

% Load data sets
[trainingSet,trainingLabels,testSet,testLabels] = sampleData(getDatabank(class_labels));

% Features to extract
request = {
  @roundness 'Default';
  @elongation 'Default';
  @rectangularity 'Default'
  };

% Extract Features
testFeatures = extractFeatures(request, testSet);
trainingFeatures = extractFeatures(request, trainingSet);

% Train classifier
classifier = trainsvm(trainingFeatures, trainingLabels, class_labels);

% Predict test
[predLabels, stats] = predictsvm(
  classifier, testFeatures, testLabels, class_labels
  );

% Show statistics
showStatistics(stats, class_labels, predLabels, testLabels);
