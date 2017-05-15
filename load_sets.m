function [trainingSet, testSet] = load_sets()

testSet = struct('image',{},'label',{}, 'box',{},'contour',{});
trainingSet = struct('image',{},'label',{}, 'box',{},'contour',{});

files_location = 'PrCategories_imatges/'
labels = ['airplanes'; 'barrel'; 'bonsai'; 'brontosaurus'; 'camera'; 'ceiling_fan'; 'anchor'; 'binocular'; 'brain'; 'butterfly'; 'car_side'; 'cellphone'];

for i=1:length(labels)
  class_location = strcat(files_location, labels(i,:), '/');
  n = length(dir([class_location, '*']))/2;
  j = 0;
  for counter=1:n
    j+=1;
    %% load data
    image_file = strcat(class_location,sprintf('image_%04d.jpg',j));
    annotation_file = strcat(class_location,sprintf('annotation_%04d.mat',j));
    while exist(image_file, 'file')!=2
      j+=1;
      %% load data
      image_file = strcat(class_location,sprintf('image_%04d.jpg',j));
      annotation_file = strcat(class_location,sprintf('annotation_%04d.mat',j));
    end
    im = imread(image_file);
    load(annotation_file, 'box_coord', 'obj_contour');

    obj.image = im;
    obj.label = labels(i,:);

    obj.box(1,:) = box_coord(3:4); % x
    obj.box(2,:) = box_coord(1:2); % y

    obj.contour = obj_contour;

    if counter <= floor(0.8*n)
      trainingSet = [obj trainingSet];
    else
      testSet = [obj testSet];
    end
  end
end
