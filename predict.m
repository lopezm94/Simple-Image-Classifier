function res = predict(imgfile, annotation_file)

im = imread(imgfile);
load(annotation_file, 'box_coord', 'obj_contour');

obj.image = im;
obj.box(1,:) = box_coord(3:4); % x
obj.box(2,:) = box_coord(1:2); % y
obj.contour = obj_contour;
testSet = [obj];

% Import svm library
importDependencies();

% Define class labels
class_labels = { 'airplanes'; 'barrel'; 'bonsai'; 'brontosaurus'; 'camera';
  'ceiling_fan'; 'anchor'; 'binocular'; 'brain'; 'butterfly';
  'car_side'; 'cellphone'};

% Features to extract
request = {
  @roundness 'Default';
  @elongation 'Default';
  @rectangularity 'Default';
  @HOG 'Default';
  @solidity 'Default';
  %@curveness 'Default'
  };

% Extract Features
testFeatures = extractFeature(request, testSet);

% Predict test
load('cache','classifier');
[predLabels, trash] = predictsvm(classifier, testFeatures, ...
    {'unknown'}, class_labels);

disp(predLabels(1))

