clear; clc;
syms x; syms y;

fprintf('EULER METODU İLE BAŞLANGIÇ DEĞER PROBLEMİ ÇÖZÜMÜ\n')
fxy=input('Denkleminizi giriniz((dy/dx)=f(x,y): ');
a=input('x0=a değerini giriniz: ');
b=input('xN=b değerini giriniz: ');
y0=input('y0 değerini giriniz: ');
h=input('h değerini giriniz: ');
N=(b-a)/h;

for x0=a:h:(b-h)
    y1=y0+h*subs(fxy,{x,y},{x0,y0});
    fprintf('\ny(%.2f)=F(%.2f,%.5f)=%.5f',x0+h,x0,y0,y1);
    y0=y1;
end
%  Y=y0+h*subs(fxy,{x,y},{x0+h,y0});
