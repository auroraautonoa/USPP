function[] = hits_movies(L, W, nuser, nmovies)

k = 0; %broj iteracija
eps = power (10, -8); 

xp = ones(nmovies, 1); #pocetni x i y
yp = ones(nuser, 1);
x = zeros(nmovies,1);
y = zeros(nuser,1);
con = 1;

X = (L')*L; 
Y = L*(L');

%HITS iteracije
while con
 x = X*(xp);
 x/=norm(x);
 y = Y*(yp);
  y/=norm(y);
   if norm(x-xp) < eps && norm(y-yp) < eps
     con = 0;
   else
     xp=x;
     yp=y;
     ++k;
     %disp(k);
   endif
endwhile

[x_sort, ix] = sort(x, 'descend');

disp("Best movies are ")
for i = 1 :30
  disp(x_sort(i));
  disp(W(ix(i)+1,2));
endfor

