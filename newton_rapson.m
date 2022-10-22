clear all;clc;
syms x;
fprintf('NEWTON RAPSON METODU\n');
f(x)=input('Denkleminizi girin: ');
fprintf('\n');
aralik1=input('Çözüm aralığınızın en büyük değerini girin: ');
aralik2=input('Çözüm aralığınızın en küçük değerini girin: ');
fprintf('\n');
turev=diff(f(x),x);
sinama=subs(f(x),x,aralik1)*subs(f(x),x,aralik2);

if sinama<0
x0=input('Başlangıç değerinizi girin: ');
epsilon=input('Epsilon değerinizi girin: ');
    for i=1:100
        x1=x0-(subs(f(x),x,x0)/subs(turev,x,x0));
        if (abs(x1-x0)<epsilon)
        break
        end
        x0=x1;
    end
else
fprintf('Bu denklemin [%d , %d] aralağında kökü yoktur.',aralik2,aralik1);
end
fprintf('\n');
fprintf('%d adımda denklemin kökü yaklaşık olarak : %f \n',i,x1);
fprintf('f(%f) ≌ %f\n',x1,subs(f(x),x,x1));