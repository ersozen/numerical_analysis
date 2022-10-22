clear all; clc;
fprintf('İNTERPOLASYON İLE ARA DEĞERİN BULUNMASI\n');

X=input('X değerlerini giriniz [a;b;c;d]: ');
Y=input('Y değerlerini giriniz [a;b;c;d]: ');
X1=input('Hangi değeri görmek istersiniz: ');

h=X(2)-X(1);
n=length(X);
Delta=zeros(n,n);
Delta(:,1)=Y;

if X1<(X(1)+X(n))/2
    s=(X1-X(1))/h;
    for j=2:n
        for i=j:n
            Delta(i,j)=Delta(i,j-1)-Delta(i-1,j-1);
        end
    end
    
    fprintf('\n');    
    disp(Delta);
    fprintf('\n');
    
    sum=Delta(1,1);
    for k=1:n-1
        Ps=comb(s,k)*Delta(k+1,k+1);
        sum=sum+Ps;
    end
    fprintf('f(%.2f)≌ %.4f\n',X1,sum);

elseif X1>((X(1)+X(n))/2)
    s=((X1-X(n))/h);
    for j=2:n
        for i=1:n-j+1
            Delta(i,j)=Delta(i+1,j-1)-Delta(i,j-1);
        end
    end
    fprintf('\n');
    disp(Delta);
    fprintf('\n');

    sum=Delta(n,1);
    for k=1:n-1
        Ps=comb(s+k-1,k)*Delta(n-k,k+1);
        sum=sum+Ps;
    end
    fprintf('f(%.2f)≌ %.4f\n',X1,sum);
end
