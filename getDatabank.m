% Get metadata of the available images
function databank = getDatabank(labels)

databank = struct('files',{},'label',{});
for i=1:length(labels)

  label = labels{i};
  class_location = strcat(pwd() , '/PrCategories_imatges/', label, '/');

  class_set.label = label;
  class_set.files = struct('imfile',{},'annfile',{});

  j = 0;
  n = length(dir([class_location, '\*.mat']));
  for counter=1:n
    j=j+1;
    %% Get next filename
    image_file = [class_location, sprintf('image_%04d.jpg',j)];
    annotation_file = [class_location, sprintf('annotation_%04d.mat',j)];
    while (exist(image_file, 'file')~=2) && (j < n)
      j=j+1;
      image_file = strcat(class_location,sprintf('image_%04d.jpg',j));
      annotation_file = strcat(class_location,sprintf('annotation_%04d.mat',j));
    end

    % Push metada class_set to bank
    file.imfile = image_file;
    file.annfile = annotation_file;
    class_set.files = [class_set.files file];
  end
  databank = [databank class_set];
end
