function[] = sort_tophits(h,a,t,n,m,URL,K)

[x_sort, ix] = sort(a, 'descend');
[y_sort, iy] = sort(h, 'descend');
[z_sort, iz] = sort(t, 'descend');

disp("Prvih deset termova ");
for i = 1:10 %ispisi prvih dvadese termova
  disp(K{iz(i)});
 endfor
 
disp("Prvih deset autoriteta ");
for i = 1:10 %ispisi prvih dvadese autoriteta
  disp(URL{ix(i)});
 endfor
 
 disp("Prvih deset hubovva ");
 for i = 1:10 %ispisi prvih 20 hubova
  disp(URL{iy(i)});
endfor