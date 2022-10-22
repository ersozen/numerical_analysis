clear all; clc;
syms s;
fprintf('NÜMERİK TÜREV\n');

X=input('X değerlerini giriniz [a;b;c;d]: ');
Y=input('Y değerlerini giriniz [a;b;c;d]: ');
X1=input('Hangi değeri görmek istersiniz: ');

h=X(2)-X(1);
n=length(X);
Delta=zeros(n,n);
Delta(:,1)=Y;

if X1<(X(1)+X(n))/2
    s1=(X1-X(1))/h;
    for j=2:n
        for i=j:n
            Delta(i,j)=Delta(i,j-1)-Delta(i-1,j-1);
        end
    end
    
    fprintf('\n');    
    disp(Delta);
    fprintf('\n');
    
    sum=0;
    for k=1:n-1
        Ps=(1/h)*diff((comb(s,k)*Delta(k+1,k+1)),s);
        sum=sum+Ps;
    end
    sonuc=subs(sum,s,s1);
    fprintf('f(%.2f)≌ %.4f\n',X1,sonuc);

elseif X1>((X(1)+X(n))/2)
    s1=((X1-X(n))/h);
    for j=2:n
        for i=1:n-j+1
            Delta(i,j)=Delta(i+1,j-1)-Delta(i,j-1);
        end
    end

    fprintf('\n');
    disp(Delta);
    fprintf('\n');

    sum=0;
    for k=1:n-1
        Ps=(1/h)*diff((comb(s+k-1,k)*Delta(n-k,k+1)),s);
        sum=sum+Ps;
    end
    sonuc=subs(sum,s,s1);
    fprintf('f(%.2f)≌ %.4f\n',X1,sonuc);
end