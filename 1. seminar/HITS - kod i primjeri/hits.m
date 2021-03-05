function[] = hits(L, W,  n)

%L - nxn matrica linkova
%W - popis linkova (vektor dimenzije n)
%n - dimenzija matrice i vektora

C = zeros(n,n);
R = zeros(n,n);
k = 0; %broj iteracija
eps = power (10, -5); 

xp = ones(n, 1); #pocetni x i y
yp = ones(n, 1);
x = zeros(n,1);
y = zeros(n,1);
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
[y_sort, iy] = sort(y, 'descend');

disp("Prvih dvadeset autoriteta ");
for i = 1:20 %ispisi prvih dvadese autoriteta
  disp(W(ix(i)));
 endfor
 disp("Prvih dvadeset hubovva ");
 for i = 1:20 %ispisi prvih 20 hubova
  disp(W(iy(i)));
endfor

#return