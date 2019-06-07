function D0 = lagrD0_1(h,n)
D0 = diag([2 repmat(4,1,n-2) 2],0) + diag(ones(1,n-1),1) + diag(ones(1,n-1),-1);

D0 = (h/6)*sparse(D0);