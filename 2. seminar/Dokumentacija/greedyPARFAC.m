function [u,v,k,L] = greedy(X,R) % X tenzor, R zeljeni rang
  u=ones(size(X)(1),R)
  v=ones(size(X)(2),R)
  k=ones(size(X)(3),R)
  L=ones(R,1)
  
  eps = power (10, -5);
  
  for r=1:R
    v1=ones(size(X)(1),1)
    v2=ones(size(X)(2),1)
    v3=ones(size(X)(3),1)
    
    lambda = 100
    prosla = 0
    while(lambda - prosla > eps) % staviti ovaj uvjet minimalnog
      if(lambda == 100)
        prosla = 0
       else
        prosla = lambda
      endif
      temp=0
      for z=1:r-1
        temp=temp+L(i)*u(:,1)*(v2'*v(:,i))*(v3'*w(:,i))
      endfor
      pomoc1=temp
      temp=0
      for z=1:r-1
        temp=temp+L(i)*v(:,1)*(v1'*u(:,i))*(v3'*w(:,i))
      endfor
      pomoc2=temp
      temp=0
      for z=1:r-1
        temp=temp+L(i)*w(:,1)*(v1'*u(:,i))*(v2'*v(:,i))
      endfor
      pomoc3=temp
    
      
      v1=pomoc(X,size(X)(1),size(X)(2),size(X)(3),v2,v3)-pomoc1
      v2=pomoc(X,size(X)(2),size(X)(1),size(X)(3),v1,v3)-pomoc2
      v3=pomoc(X,size(X)(3),size(X)(1),size(X)(2),v1,v2)-pomoc3
      
      lambda = norm(v1)*norm(v2)*norm(v3)
    endwhile
    for ind=1:size(X)(1)
      u(ind,r)=v1(ind)
      v(ind,r)=v2(ind)
    endfor
    for id=1:size(X)(3)
      w(id,r)=v3(id)
    endfor
    L(r)=lambda
  endfor
endfunction

 function h = pomoc(T,i1,j1,k1,v1,v2) % problem je kad dode do 3ceg poziva
   % T(i,j,k) treba nastimat, poziv kod v3
   %display(i1)
   %display(j1)
   %display(k1)
   h=ones(i1,1)
   for i=1:i1
     temp=0
     for j=1:j1
       for k=1:k1
         temp=temp+T(i,j,k)*v1(j)*v2(k)
       endfor
     endfor
    h(i)=temp
    endfor
 endfunction
 
