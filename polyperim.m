% Calculate perimeter given the coordinates of a polynomial
function perim = polyperim(X, Y)
  perim = sqrt((X(end)-X(1))^2 + (Y(end)-Y(1))^2);
  for i=1:length(X)-1
    perim += sqrt((X(i+1)-X(i))^2 + (Y(i+1)-Y(i))^2);
  end
