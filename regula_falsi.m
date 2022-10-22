clear all;clc;

syms x;
fprintf('REGULA FALSI METODU\n');
f(x)=input('Denkleminizi giriniz: ');
fprintf('\n');
max=input('Çözüm aralığının en büyük değerini giriniz: ');
min=input('Çözüm aralığının en küçük değerini giriniz: ');
fprintf('\n');
sinama=subs(f(x),x,max)*subs(f(x),x,min);

if sinama<0
    x1=input('x1 değerini giriniz: ');
    x0=input('x0 değerini giriniz: ');
    fprintf('\n');
    epsilon=input('Epsilon değerini giriniz: ');
    fprintf('\n');
    for i=1:100
        x2=(x0*subs(f(x),x,x1)-x1*subs(f(x),x,x0))/(subs(f(x),x,x1)-subs(f(x),x,x0));
        if abs(x2-x1)<epsilon || abs(x2-x0)<epsilon
            break
        end
        if subs(f(x),x,x2)*subs(f(x),x,x0)<0
            x1=x2;
        elseif subs(f(x),x,x2)*subs(f(x),x,x1)<0
            x0=x2;
        end
    end
else
    fprintf('Denklemin [%d , %d] aralığında kökü yoktur.',min,max);
end

fprintf('%d adımda denklemin kökü yaklaşık olarak: %f\n',i,x2);
fprintf('f(%f) ≌ %f\n',x1,subs(f(x),x,x2));