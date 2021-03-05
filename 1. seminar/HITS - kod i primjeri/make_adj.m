function[L] = make_adj(data, n, m)

L = zeros(n,n);
for i = 1:m
  L(data(i,1)+1, data(i,2)+1) = 1;
endfor
