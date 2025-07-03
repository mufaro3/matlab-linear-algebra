addpath( '../common' );

begin_exercise( '2(b)' );
if false
    t=0:.1:4;
    X=[0 2 2 0];
    Y=[0 2 4 0];
    Z=[0 2 6 0];
    figure
    fill3(X,Y,Z,'yellow')
    hold on
    plot3(2*t, 10*t, 5*t, 'green', t, 2*t, 3*t, 'red', t, t, t, 'blue')
    pause
end
end_exercise();
