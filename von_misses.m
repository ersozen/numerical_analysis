clear all; clc;
format short;
syms x;
fprintf('VON MISSES METODU\n');
f(x)=input('Denkleminizi girin: ');
fprintf('\n');
max=input('Çözüm aralığının en büyük değerini girin: ');
min=input('Çözüm aralığının en küçük değerini girin: ');
fprintf('\n');
turev=diff(f(x),x);
sinama= subs(f(x),x,max)*subs(f(x),x,min);

if sinama<0
   x0=input('Başlangıç değerini girin: ');
   epsilon=input('Epsilon değerinizi girin: ');
   fprintf('\n');
   payda=subs(turev,x,x0);
    for i=1:100
        x1=x0-(subs(f(x),x,x0)/payda);
        if abs(x1-x0)<epsilon
            break
        end
        x0=x1;
    end
else
    fprintf('Bu denklemin [%d , %d] aralağında kökü yoktur.',min,max);
end

fprintf('\n');
fprintf('%d adımda denklemin kökü yaklaşık olarak: %f \n',i,x1);
fprintf('f(%f) ≌ %f\n',x1,subs(f(x),x,x1));