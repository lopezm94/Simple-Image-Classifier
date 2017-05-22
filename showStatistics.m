% Show statistics for each class label
function showStatistics(stats, class_labels, predLabels, testLabels)
for i=1:length(class_labels)
  fprintf('Stats for label: %s\n',class_labels{i});
  disp(stats{i});
  fprintf('\n\n');
end

fprintf('General Stats:\n');
nsame = sum(compareStructArrays(predLabels,testLabels));
general_accuracy = round(100*nsame/length(predLabels));
fprintf('\tGeneral accuracy: %d percent\n\n',general_accuracy);
