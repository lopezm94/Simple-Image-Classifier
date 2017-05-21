% Calculate elongation given a bounding box
function ratio = elongation(obj)
  box = obj.box;
  ratio = abs(box(1,1)-box(1,2))/abs(box(2,1)-box(2,2));
