clear all; clc;

%Matris boyutu alınması
boyut=input('Katsayılar matrisinin boyutunu giriniz(n): ');

A=[boyut;boyut+1];
X=zeros(boyut,1);

%Matrisleri yazdırma işlemi
fprintf('\n');
for i=1:1:boyut
    for j=1:1:boyut+1
        fprintf('Birleştirilmiş matrisin [%d][%d] elemanı: ',i,j);
        A(i,j)=input('');
    end    
end

%Matrisi ekrana yazdırma
fprintf('\n');
disp(A);

%Üst üçgen matris üretimi döngüsü
for k=1:1:boyut-1
    for i=k+1:1:boyut
        if A(k,k)~=0
           m=A(i,k)/A(k,k);
           A(i,:)=A(i,:)-m*A(k,:);
        else
            fprintf('Denklemin çözümü yoktur.');
        end
    end
end

%Geriye gitme
X(boyut)=A(boyut,boyut+1)/A(boyut,boyut);
for k=boyut-1:-1:1
    X(k)=(A(k,boyut+1)-A(k,k+1:boyut)*X(k+1:boyut))/A(k,k);
end
fprintf('\nX DEĞERLERİ:\n');
disp(X);