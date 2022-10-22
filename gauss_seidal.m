clc; clear all;

row=input('Bilinmeyen sayısını giriniz: ');
A=[row;row];
B=[row;1];
X0=[row;1];
X1=zeros(row,1);
Y=zeros(row,1);
iterLimit=1000;
%Matrisleri yazdırma

for i=1:row
    for j=1:row
        fprintf('Katsayılar matrisinin [%d][%d] elemanı: ',i,j);
        A(i,j)=input('');
    end
end
fprintf('\n');
for i=1:row
    fprintf('Sağ taraf vekörünün [%d] elemanı: ',i);
    B(i)=input('');
end
fprintf('\n');
for i=1:row
    fprintf('X[%d] nin başlangıç değerleri: ',i);
    X0(i)=input('');
end
fprintf('\n');

epsilon=input('Epsilon değerini girin: ');
fprintf('\n');

for j=1:iterLimit
    for i=1:row
        X1(i)=(1/A(i,i))*(B(i) - (A(i,[1:i-1,i+1:row])*X0([1:i-1,i+1:row])));
        X0(i)=X1(i);
    end
    if abs(Y-X1)<epsilon
       break
    end
    Y=X1;
end
fprintf('%d adımda çözüm aşağıdaki gibidir.\n',j);
disp(X1);

fprintf('Sonucu doğrulamak için A*X1=B \n');
disp(A*X1);