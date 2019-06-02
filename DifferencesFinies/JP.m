
function Jpattern = JP()

    global D1c D1u n;
    Jpattern = spones(D1u) + spones(D1c*D1c) + eye(n);

end
