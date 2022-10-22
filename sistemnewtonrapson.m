clear all; clc;
syms x;
syms y;

fprintf('SİSTEMLER İÇİN NEWTON RAPSON METODU\n')
fprintf('1-Uzun çözüm\n2-Hızlandırılmış çözüm\n');
choose=input('Seçiminizi yapınız(1-2): ');

fprintf('\n');
f=input('İlk denkleminizi girin(ax^2+bx-c): ');
g=input('İkinci denkleminizi girin(ax^2+bx-c):');
fprintf('\n');
x0=input('X0 değerini girin: ');
y0=input('Y0 değerini girin: ');
epsilon=input('Epsilon değerini girin: ');
fprintf('\n');

fx=diff(f,x);
fy=diff(f,y);
gx=diff(g,x);
gy=diff(g,y);

if choose==1
    for i=1:100
        denk=(((f*gy)-(g*fy))/((fx*gy)-(fy*gx)));
        denkx=subs(denk,x,x0);
        denkxy=subs(denkx,y,y0);
        x1=x0-denkxy;

        denk1=(((fx*g)-(gx*f))/((fx*gy)-(fy*gx)));
        denk1x=subs(denk1,x,x0);
        denk1xy=subs(denk1x,y,y0);
        y1=y0-denk1xy;
    
        if max(abs(x1-x0) , abs(y1-y0))<epsilon
            break
        end
        x0=x1;
        y0=y1;
    end
    fprintf('%d adımda x=%f\n',i,x1);
    fprintf('%d adımda y=%f\n',i,y1);
elseif choose==2
    for i=1:100
        denk2=f/fx;
        denk2x=subs(denk2,x,x0);
        denk2xy=subs(denk2x,y,y0);
        x1=x0-denk2xy;

        denk3=g/gy;
        denk3x=subs(denk3,x,x1);
        denk3xy=subs(denk3x,y,y0);
        y1=y0-denk3xy;

        if max(abs(x1-x0) , abs(y1-y0))<epsilon
            break
        end
        x0=x1;
        y0=y1;
    end
    fprintf('%d adımda x=%f\n',i,x1);
    fprintf('%d adımda y=%f\n',i,y1);
end
