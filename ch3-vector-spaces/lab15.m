addpath('../common');

begin_exercise('1(a)');
if false
    m=[.05 .7 .46; .75 .2 .12; .2 .1 .42];
    x0=[100; 0; 0];
    loops=40;
    for k=1:loops
        bar(mpower(m,k) * x0);
        drawnow;
        pause(.1);
        F(k) = getframe(gcf);
    end
end
end_exercise();

begin_exercise('1(d)');
if true
    clear x; clear y;
    m = [.05 .7 .46; .75 .2 .12; .2 .1 .42];
    x0 = [100; 0; 0];
    for i = 1:40
        x = linspace(0,i,i+1);
        for k = 1:i+1
            temp = mpower(m,k) * x0;
            y(k) = temp(1);
        end
        scatter(x,y);
        drawnow;
        pause(.1);
        F(k)=getframe(gcf);
    end
end
end_exercise();
