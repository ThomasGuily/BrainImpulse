function D2 = lagrD2_1(h,n)
D2 = diag([0 -2*ones(1,n-2) 0],0) + diag([0 ones(1,n-2)],1) + diag([ones(1,n-2) 0],-1);

D2 = sparse(D2)/h;