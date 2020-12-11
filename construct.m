function[L, h] = construct(r, m, nuser, nmovies)

disp("pocetak funkcije");
L = zeros(nuser, nmovies);
n = size(r,1);
disp(n);

h = zeros(cell2mat(m(nmovies+1,1)), 1);
disp("pocinjem raditi hash");
for i = 2 : nmovies+1 %movie_id uparujujemo s brojem između 1 i nmovies
  h(cell2mat(m(i,1))) = (i-1);
endfor
disp("hash gotov");

disp("pocinjem raditi L");
for i = 2 : n
  ind = h(r(i,2));
  L(r(i, 1), ind) = 1;%r(i, 3);  %user r(i,1) ocjenjuje film r(i,2)
endfor
#{
for i = 1:nmovies
  k = 0;
  for j = 1 : nuser
    if L(j,i)!=0
      ++k;
     endif
  endfor
  if k!=0
  L(:,j)/=k;
  endif
endfor
#}