% Create {-1,1} array with the result of the comparation of label with labels.
% In the case the strings are equal the value will be 1, otherwise -1.
function res = binarizeLabels(labels,label)
res = [];
for i=1:length(labels)
  res = [res strcmp(labels{i},label)];
  if (res(i) == 0)
    res(i) = -1;
  end
end
