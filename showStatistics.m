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
disp('Confusion Matrix');
C = confusionmat(testLabels,predLabels);
disp(C);
disp('Class labels');
for i=1:length(class_labels)
  fprintf('Label %d: %s\n',[i,class_labels{i}]);
end
