clear all; clc;

row=input('Bilinmeyen sayınızı giriniz: ');
fprintf('\n');
A=[row;row];
B=[row;1];
X0=[row;1];
X1=zeros(row,1);
iteration=100;

%Matris A,B,X yazımı

for i=1:row
    for j=1:row
        fprintf('Katsayılar matrisinin [%d][%d] elemanı: ',i,j);
        A(i,j)=input('');
    end
end
R=sum(abs(A),2);
D=abs(diag(A));
W=R-D;
Check=D>=W;
DD=all(Check);
fprintf('\n');
if DD==1
    for i=1:row
        fprintf('Sağ taraf vektörünün [%d] elemanı: ',i);
        B(i,1)=input('');
    end
    fprintf('\n');
    for i=1:row
        fprintf('X[%d] değerinin başlangıç değerini giriniz: ',i);
        X0(i,1)=input('');
    end
    fprintf('\n');

%Epsilon değeri alınması
    epsilon=input('Epsilon (e) değerini giriniz: ');
    fprintf('\n');

% Jacobi iterasyon yöntemi işlemleri
    for k=1:iteration
        for i=1:row
            X1(i)=(B(i)/A(i,i)) - (A(i,[1:i-1,i+1:row])*X0([1:i-1,i+1:row]))/A(i,i);
        end
        if (abs(X1-X0)/abs(X1))<epsilon
            break
        end
        X0=X1;
    end
elseif DD==0
    disp('Matris köşegensel dominant değildir.');
end
fprintf('%d adımda çözüm aşağıdaki gibidir.\n',k);
disp(X1);

fprintf('Sonucu doğrulamak için A*X1=B \n');
disp(A*X1);