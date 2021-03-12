function[] = sort_output(U,V,W,n,m,UR,K, sigma)

q = zeros(m,1);
%q(36)=1; %python
%q(197) = 1; %AI
%q(132) = 1; %ML engineer
%q(120) = 1; %Data science
q(109) = 1; % Markov chain
A=diag(sigma);
s=A*W'*q;
a=U*s;
h=V*s;


[x_sort, ix] = sort(a, 'descend');
[y_sort, iy] = sort(h, 'descend');

%disp(K{36});
%disp(K{197});
%disp(K{132});
%disp(K{120});
disp(K{109});

disp("Prvih deset autoriteta ");
for i = 1:10 %ispisi prvih dvadese autoriteta
  disp(UR{ix(i)});
 endfor
 disp("Prvih deset hubovva ");
 for i = 1:10 %ispisi prvih 20 hubova
  disp(UR{iy(i)});
endfor
