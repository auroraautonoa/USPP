function[U, V, W, sigma] = greedy_parafac3(X,n,m, R)

#X - tenzor
#n - broj stranica
#m - broj terma
#R - rang

#U - matrica čiji su stupci vektori vrijednosti hubova
#V - matrica čiji su stupci vektori vrijednosti autoriteta
#W - matrica čiji su stupci vektori vrijednosti termova
#sigma - vektor težina

eps = power(10,-5);

u = zeros(1,n);
v = zeros(1,n);
w = zeros(1,m);

U = zeros(n,R);
V = zeros(n,R);
W = zeros(m,R);

sigma = zeros(1,R);

for k=1:R
  con = 1;
  x = ones(1,n);
  y = ones(1,n);
  z = ones(1,m);
  lambda_old = 0;
  while con
    r = zeros(1,n);
    for i=1:k-1
      up = U(:,i)';
      vp = V(:,i)';
      wp = W(:,i)';
      
      new = (up*(y*vp')*(z*wp'));
      r = r + new;
    endfor
    x = nmodeproduct(nmodeproduct(X,y,2), z,3) - r;
    r = zeros(1,n);
    for i=1:k-1
      up = U(:,i)';
      vp = V(:,i)';
      wp = W(:,i)';
      new = vp*(x*up')*(z*wp');
      r += new;
    endfor
    y = nmodeproduct(nmodeproduct(X,x,1), z,3) - r;
    
    r = zeros(1,m);
    for i=1:k-1
      up = U(:,i)';
      vp = V(:,i)';
      wp = W(:,i)';
      new = wp*(x*up')*(y*vp');
      r += new;
    endfor
    z = nmodeproduct(nmodeproduct(X,x,1), y,2)' - r;

    
    nx = norm(x);
    ny = norm(y);
    nz = norm(z);
    lambda_new = nx*ny*nz;
    x = x/nx;
    y = y/ny;
    z = z/nz;
    if abs(lambda_new-lambda_old) < eps
      con = 0;
       U(:,k) = x';
       V(:,k) = y';
       W(:,k) = z';
       sigma(k) = lambda_new;
       disp(sigma(k));
    else
      lambda_old = lambda_new;
    endif
  endwhile
endfor

%sortiraj
