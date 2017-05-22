% Repeat string n times into an array struct
function res = repeatstr(val, n)
res = {};
for i=1:n
  res{i} = val;
end
