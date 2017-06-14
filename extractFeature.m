% Extract Features from object array
function res = extractFeature(request, set)
res = [];
n = length(set);
m = size(request,1);
for i=1:n
  row = [];
  obj = set(i);
  for j=1:m
    extract_features = request{j,1};
    raw_features = extract_features(obj);
    num_features = numel(raw_features);
    features = reshape(raw_features,1,num_features);
    row = [row features];
  end
  res = [res; row];
end
