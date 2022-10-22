clear; clc;
syms x;
fprintf('NÜMERİK İNTEGRAL\n');

fx=input('Denkleminizi giriniz: ');
aralik=input('İntegral sınırlarını giriniz: ');
N=input('N değerini giriniz: ');
fprintf('\n 1-Dikdörtgen Metodu\n 2-Yamuk Metodu\n 3-Simpson Metodu\n');
choose=input('Hangi yöntemle çözmek istersiniz: ');

if choose==1
    h=(aralik(2)-aralik(1))/N;
    sum=0;
    for i=aralik(1):h:aralik(2)
        if i<aralik(2)
            Y=subs(fx,x,i);
            sum=sum+Y;
        end
    end
    I=h*sum;
    fprintf('\nBu metoda göre sonuç: %.5f\n',I);

elseif choose==2
    h=(aralik(2)-aralik(1))/N;
    sum=0;
    sum1=0;
    for i=aralik(1):h:aralik(2)
       if i==aralik(1) || i==aralik(2)
           Y1=(subs(fx,x,i))/2;
           sum1=sum1+Y1;
       else
       Y=subs(fx,x,i);
       sum=sum+Y;
       end
    end
    I=h*(sum+sum1);
    fprintf('\nBu metoda göre sonuç: %.5f\n',I);

elseif choose==3
    h=(aralik(2)-aralik(1))/(2*N);
    sum2=subs(fx,x,aralik(1))+subs(fx,x,aralik(2));
    odd=0;
    even=0;
    for i=2:2:2*N-2
        xi=aralik(1)+(i*h);
        even=even+subs(fx,x,xi);
    end
    for i=1:2:2*N-1
        xi=aralik(1)+(i*h);
        odd=odd+subs(fx,x,xi);
    end
    I=(h/3)*(sum2+4*odd+2*even);
    fprintf('\nBu metoda göre sonuç: %.5f\n',I);
else
    fprintf('Yanlış giriş yaptınız!!');
end
