% Extract Features from object array
function res = extractFeatures(request, set)
res = [];
n = length(set);
m = size(request,1);
for i=1:n
  row = [];
  obj = set(i);
  for j=1:m
    extract_feature = request{j,1};
    row = [row extract_feature(obj)];
  end
  res = [res; row];
end
