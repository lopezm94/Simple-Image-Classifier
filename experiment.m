% Import svm library
importDependencies();

% Define class labels
class_labels = { 'airplanes'; 'barrel'; 'bonsai'; 'brontosaurus'; 'camera';
  'ceiling_fan'; 'anchor'; 'binocular'; 'brain'; 'butterfly';
  'car_side'; 'cellphone'};

% Load data sets
[trainingSet,trainingLabels,testSet,testLabels] = ...
    sampleData(getDatabank(class_labels));

requests = {};

% Features to extract
requests{1} = {
  @roundness 'Default';
  };
requests{2} = {
  @elongation 'Default';
  };
requests{3} = {
  @rectangularity 'Default';
  };
requests{4} = {
  @solidity 'Default';
  };
requests{5} = {
  @curveness 'Default'
  };
requests{6} = {
  @HOG 'Default';
  };
requests{7} = {
  @roundness 'Default';
  @elongation 'Default';
  };
requests{7} = {
  @elongation 'Default';
  @rectangularity 'Default';
  };
requests{8} = {
  @roundness 'Default';
  @elongation 'Default';
  @rectangularity 'Default';
  };
requests{9} = {
  @roundness 'Default';
  @elongation 'Default';
  @solidity 'Default';
  };
requests{10} = {
  @roundness 'Default';
  @elongation 'Default';
  @rectangularity 'Default';
  @solidity 'Default';
  };
requests{11} = {
  @roundness 'Default';
  @HOG 'Default';
  }
requests{12} = {
  @elongation 'Default';
  @HOG 'Default';
  }
requests{13} = {
  @rectangularity 'Default';
  @HOG 'Default';
  }
requests{14} = {
  @HOG 'Default';
  @solidity 'Default';
  };
requests{15} = {
  @roundness 'Default';
  @elongation 'Default';
  @rectangularity 'Default';
  @HOG 'Default';
  @solidity 'Default';
  };
requests{16} = {
  @roundness 'Default';
  @elongation 'Default';
  @rectangularity 'Default';
  @HOG 'Default';
  @solidity 'Default';
  @curveness 'Default'
  }


for i=1:numel(requests)
    fprintf('**************************************** EXPERIMENT %d ****************************************\n',i);
    
    request = requests{i};
    disp('Request:');
    disp(request);

    % Extract Features
    testFeatures = extractFeature(request, testSet);
    trainingFeatures = extractFeature(request, trainingSet);

    % Train classifier
    classifier = trainsvm(trainingFeatures, trainingLabels, class_labels);

    % Predict test
    [predLabels, stats] = predictsvm(classifier, testFeatures, ...
        testLabels, class_labels);

    % Show statistics
    showStatistics(stats, class_labels, predLabels, testLabels);
end