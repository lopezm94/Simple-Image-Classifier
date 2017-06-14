% Calculate solidity given a polygon and a bounding box
function ratio = solidity(obj)
  box = obj.box;
  polygon = obj.contour;

  X = polygon(1,:);
  Y = polygon(2,:);

  % Calculate area of polygon
  area1 = polyarea(X,Y);

  % Calculate are of bounding box
  [trash,area2] = convhull(X,Y);
  ratio = area1/area2;