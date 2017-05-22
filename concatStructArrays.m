% Concatenate two struct arrays
function res = concatStructArrays(a, b)

res = {};
n = length(a);
for i=1:n
    res{i} = a{i};
end
m = length(b);
for i=1:m
    res{n+i} = b{i};
end