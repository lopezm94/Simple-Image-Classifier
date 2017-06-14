% One vs All training using LIBSVM
function classifier = trainsvm(feature_matrix, obj_labels, class_labels)
classifier = {};
for i=1:length(class_labels)
  label_vector = polarizeLabels(obj_labels,class_labels{i});
  classifier{i} = svmtrain( ...
    double(label_vector)', ...
    double(feature_matrix), ...
    '-b 1 -q');
end
