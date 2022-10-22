clear all; clc;
syms x;
fprintf('KESEN KÖK METODU\n');
f(x)=input('Denkleminizi girin: ');
fprintf('\n');
max=input('Çözüm aralığının en büyük değerini girin: ');
min=input('Çözüm aralığının en küçük değerini girin: ');
fprintf('\n');
sinama=subs(f(x),x,max)*subs(f(x),x,min);

if sinama<0
   x0=input('x0 başlangıç değerini girin: ');
   x1=input('x1 başlangıç değerini girin: ');
   epsilon=input('Epsilon değerini girin: ');
   fprintf('\n');
    for i=1:100
        x2=(x0*subs(f(x),x,x1)-x1*subs(f(x),x,x0))/(subs(f(x),x,x1)-subs(f(x),x,x0));
        if abs(x2-x1)<epsilon
            break
        end
        x0=x1;
        x1=x2;
    end
else
    fprintf('Bu aralıkta kök yoktur.');
end

fprintf('%d adım sonunda denklemin kökü yaklaşık olarak: %f\n',i,x2);
fprintf('f(%f)≌%f\n',x2,subs(f(x),x,x2));