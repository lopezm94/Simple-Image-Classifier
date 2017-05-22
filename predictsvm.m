% One vs All predict using LIBSVM
function [predLabels, stats] = predictsvm(classifier, feature_matrix, ...
  obj_labels, class_labels)
predLabels = {};
stats = {};
n = length(classifier);
m = length(obj_labels);
probability_matrix = zeros(n,m,'double');
for i=1:n
  label_vector = polarizeLabels(obj_labels,class_labels{i});
  [trash, stats{i}, probability_matrix(i,:)] = svmpredict( ...
    double(label_vector)', ...
    double(feature_matrix), ...
    classifier{i});
end

[trash, indexes] = max(probability_matrix);
for i=1:m
  predLabels{i} = class_labels{indexes(i)};
end
