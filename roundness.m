% Calculate roundness of polygon
function ratio = roundness(obj)
  polygon = obj.contour;

  X = polygon(1,:);
  Y = polygon(2,:);

  % Calculate Area
  area = polyarea(X,Y);

  % Calculate perimeter
  perimeter = polyperim(X,Y);

  % Calculate roundness
  ratio = (4 * pi * area) / ( perimeter^2 );
