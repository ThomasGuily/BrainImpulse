
function Jpattern = JP()

    global D2 n;
    
    %% Definition de la Jacobienne pour option Jpattern
    jpattern = sparse(spones([eye(n) + spones(D2), eye(n); eye(n),  eye(n)]));

end