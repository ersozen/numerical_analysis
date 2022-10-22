clear; clc;
syms x;
syms y;
fprintf('RUNGE-KUTTA METODU\n');

fxy=input('Denkleminizi giriniz((dy/dx)=f(x,y): ');
a=input('x0=a değerini giriniz: ');
b=input('xN=b değerini giriniz: ');
y0=input('y0 değerini giriniz: ');
h=input('h değerini giriniz: ');
N=(b-a)/h;
x0=a;

fprintf('\n 1- 2.Basamaktan Runge-Kutta\n 2- 4.Basamaktan Runge-Kutta\n' );
choose=input('Seçiminiz(1-2): ');

if choose==1
    for x0=a:h:b-h
        k1=h*subs(fxy,{x,y},{x0,y0});
        k2=h*subs(fxy,{x,y},{(x0+h),(y0+k1)});
        y1=y0+0.5*(k1+k2);
        y0=y1;
    end
%     K1=h*subs(fxy,{x,y},{x1+h,y0});
%     K2=h*subs(fxy,{x,y},{(x1+(2*h)),(y0+K1)});
%     Y=y0+0.5*(K1+K2);
% 
%     fprintf('\ny(%.2f)=F(%.2f,%.5f)=%.5f\n',b,x1+h,y1,Y);
fprintf('%.5f',y1);

elseif choose==2
    for n=0:1:(N-1)
        x1=x0+(n*h);
        k1=h*subs(fxy,{x,y},{x1,y0});
        k2=h*subs(fxy,{x,y},{(x1+0.5*h),(y0+0.5*k1)});
        k3=h*subs(fxy,{x,y},{(x1+0.5*h),(y0+0.5*k2)});
        k4=h*subs(fxy,{x,y},{(x1+0.5*h),(y0+0.5*k3)});
        y1=y0+((1/6)*(k1+(2*k2)+(2*k3)+k4));
        y0=y1;
    end
        K1=h*subs(fxy,{x,y},{x1+h,y0});
        K2=h*subs(fxy,{x,y},{(x1+1.5*h),(y0+0.5*K1)});
        K3=h*subs(fxy,{x,y},{(x1+1.5*h),(y0+0.5*K2)});
        K4=h*subs(fxy,{x,y},{(x1+1.5*h),(y0+0.5*K3)});
        Y=y0+((1/6)*(K1+(2*K2)+(2*K3)+K4));
        fprintf('\ny(%.2f)=F(%.2f,%.5f)=%.5f\n',b,x1+h,y1,Y);
else
    fprintf('Yanlış seçim yaptınız.');
end