function M = masseH1(h,n,ne)


M = diag(repmat(([78 8 repmat([156 16],1,n-2) 78 8]),1,ne),0) + ...
    diag([repmat([22 13 repmat([0 13],1,n-2) -22 0],1,ne-1) [22 13 repmat([0 13],1,n-2) -22]],1) + ...
    diag([repmat([22 13 repmat([0 13],1,n-2) -22 0],1,ne-1) [22 13 repmat([0 13],1,n-2) -22]],-1) + ...
    diag([repmat([repmat([27 -6],1,n-1) 0 0],1,ne-1) repmat([27 -6],1,n-1)],2) + ...
    diag([repmat([repmat([27 -6],1,n-1) 0 0],1,ne-1) repmat([27 -6],1,n-1)],-2) + ...
    diag([repmat([repmat([-13 0],1,n-2) -13 0 0 0],1,ne-1) repmat([-13 0],1,n-2) -13],3) + ...
    diag([repmat([repmat([-13 0],1,n-2) -13 0 0 0],1,ne-1) repmat([-13 0],1,n-2) -13],-3);

M = (h/210)*sparse(M);