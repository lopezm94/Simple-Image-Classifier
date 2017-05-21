% Calculate rectangularity given a polygon and a bounding box
function ratio = rectangularity(obj)
  box = obj.box;
  polygon = obj.contour;

  X = polygon(1,:);
  Y = polygon(2,:);

  % Calculate area of polygon
  area1 = polyarea(X,Y);

  % Calculate are of bounding box
  area2 = abs(box(1,1)-box(1,2))*abs(box(2,1)-box(2,2));

  ratio = area1/area2;
