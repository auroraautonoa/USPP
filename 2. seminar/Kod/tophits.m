function[h,a,t] = tophits(X,n,m)

h_old = ones(1,n);
a_old = ones(1,n);
t_old = ones(1,m);

eps = power(10,-5);

con = 1;

while con
  h_new = nmodeproduct(nmodeproduct(X,a_old,2), t_old ,3);
  h_new = h_new/norm(h_new);
  
  a_new = nmodeproduct(nmodeproduct(X,h_new,1), t_old,3);
  a_new = a_new/norm(a_new);
  
  t_new = nmodeproduct(nmodeproduct(X,h_new,1), a_new,2);
  t_new = t_new/norm(t_new);
  t_new = t_new';
  
  if norm(h_new - h_old) < eps && norm(a_new-a_old) < eps && norm(t_new -t_old) < eps
    con = 0;
  else
    h_old = h_new;
    a_old = a_new;
    t_old = t_new;
  endif
endwhile
h = h_new;
a = a_new;
t = t_new;
