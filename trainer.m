%% load data sets
if exist('.cache', 'file')==2
  load('.cache');
  disp('Data sets loaded from cache');
else
  [trainingSet, testSet] = load_sets();
  save('.cache','trainingSet','testSet');
  disp('Data sets generated and cached');
end
