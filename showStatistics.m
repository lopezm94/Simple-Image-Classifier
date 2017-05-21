% Show statistics for each class label
function showStatistics(stats, class_labels, predLabels, testLabels)
for i=1:length(class_labels)
  printf('Stats for label: %s\n',class_labels{i});
  disp(stats{i});
  printf('\n\n');
end

printf('General Stats:\n');
nsame = sum(cellfun(@strcmp,predLabels,testLabels));
general_accuracy = nsame/length(predLabels);
printf('\tGeneral accuracy: %d\n\n',general_accuracy);
