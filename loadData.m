% Load images from the metadata (image locations)
% Each return object in the array has by fieldnames: image,label,box and contour
function data = loadData(metadata)

data = struct('image',{},'box',{},'contour',{});
for file_metadata=metadata
  imfile = file_metadata.imfile;
  annfile = file_metadata.annfile;
  im = imread(imfile);
  load(annfile, 'box_coord', 'obj_contour');

  obj.image = im;

  obj.box(1,:) = box_coord(3:4); % x
  obj.box(2,:) = box_coord(1:2); % y

  obj.contour = obj_contour;
  data = [data obj];
end
