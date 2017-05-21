% Repeat string n times
function res = repeatstr(val, n)
res = [''];
for i=1:n
  res = [res; val];
end
