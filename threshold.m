%? = max{t ? [0, ?/2]:??tSUMi=t_b(i; ?, 1/2) ? 1 ? ?}
%where
%{b(i; n, p) = nkp^i(1 ? p)^(n?i);}
function max=threshold(n,a)
p=0.5;
max=0;

for t=0;t < n/2;t++
    m=symsum(((n*i*p)^i)*(1-p)^(n-i),i,t,(n-t))
    if(m>=1-a && max<t)
        max=t;
        break;
    end
end    