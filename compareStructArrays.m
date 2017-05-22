% Compare dos struct arrays
function res = compareStructArrays(a,b)
res = [];
size = length(a);
for i = 1:size
   res(i) = strcmp(a{i}, b{i});
end
