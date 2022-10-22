function y=comb(s,n)
    y=1;
    for i=0:n-1
        komb=(s-i)/(n-i);
        y=y*komb;
    end
end
