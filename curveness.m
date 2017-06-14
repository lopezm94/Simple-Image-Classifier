% Calculate curveness of polygon
function ratio = curveness(obj)
  polygon = obj.contour;

  X = polygon(1,:);
  Y = polygon(2,:);

  % Calculate perimeter
  perimeter = polyperim(X,Y);
  
  num_changes = 0;
  current_point = 1;
  for i=2:size(X,1)
      u = [X(current_point) Y(current_point) 0];
      v = [X(i) Y(i) 0];
      angle = atan2d(norm(cross(u,v)),dot(u,v));
      if angle > 30
          current_point=i;
          num_changes = num_changes+1;
      end
  end

  % Calculate roundness
  ratio = perimeter/num_changes;
