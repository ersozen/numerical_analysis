
clear all; clc;

row=input('Matris boyutunu girin: ');

B=[row;row];
V1=[row;1];


for i=1:row
    for j=1:row
        fprintf('Matrisin [%d][%d] elemanı: ',i,j);
        B(i,j)=input('');
    end
end

for i=1:row
    fprintf('Başlangıç vektörünün [%d] elemanı: ',i);
    V1(i)=input('');
end
V2(row,1)=V1(row,1);

step=input('İşlemin kaç basamakta biteceğini giriniz: ');



for i=1:step
    alfa= max(B*V1);
    V1=(B*V1)/alfa;
end

BB=inv(B);

for i=1:step
    alfa2 = max(BB*V2);
    V2=(BB*V2)/alfa2;
end

fprintf('%d adım sonunda B matrisinin en büyük özdeğeri: ',step);
disp(alfa);

fprintf('%d adımda B matrisinin en küçük özdeğeri: ',step);
disp(1/alfa2);








